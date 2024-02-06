#include "\life_server\script_macros.hpp"
["AnzusLife_AddonCheck",{  
  _currentVersion = MAIN_SETTINGS_TYPE(getNumber,"Branch","serverVersion");
  _bypassAddonCheck = MAIN_SETTINGS_TYPE(getArray,"Security","bypassAddonCheck");
  _patchesToVerify = MAIN_SETTINGS_TYPE(getArray,"Security","patchesToVerify");

  if (getPlayerUID player IN _bypassAddonCheck) exitWith {AnzusLife_AddonVerify = true};

  if (!(AnzusLife_ClientVersion isEqualto _currentVersion)) then {
  	
  } else {
		_binConfigPatches = configFile >> "CfgPatches";
    _count = 0;
		for "_i" from 0 to count (_binConfigPatches)-1 do {
			_patchEntry = _binConfigPatches select _i;
			if (isClass _patchEntry) then {
				if (configName _patchEntry IN _patchesToVerify) then {
          _count = _count + 1;
				};
			};
	  };

    if (_count isEqualTo (count _patchesToVerify)) then {
      AnzusLife_AddonVerify = true;
    } else {
      
    };
  };

  AnzusLife_AddonCheck = nil;
},false] call AnzusLife_ClientCompile;

["AnzusLife_Paychecks", {
  private _ServerName = tolower(MAIN_SETTINGS_TYPE(getText,"GameSettings","paycheck_serverName"));
  private _nameCheck = (tolower profileNameSteam) find _ServerName;

  AnzusLife_PayCheckTimer = AnzusLife_PayCheckTimer - 1;
  if (AnzusLife_PayCheckTimer isEqualTo 0) then
  {
    [(call AnzusLife_PayCheckAdd)] call AnzusLife_BudgetSub;
    _amount = AnzusLife_PaycheckAmount * (missionNamespace getVariable ["mav_ttm_var_paycheckMultiplier", 1]);
    _directDeposit = missionNamespace getVariable ["mav_ttm_var_directDeposit", false];
    if (_nameCheck != -1 && MAIN_SETTINGS_TYPE(getNumber,"GameSettings","paycheck_bonus") isEqualTo 1) then {
      _amount = _amount + 500;
      if (!_directDeposit) then {
        ["My paycheck has come in and recived a bonus for promoting, go to the paycheck centre to pick it up.",true,"slow"] call ANZUS_fnc_notificationSystem;
      };
    } else {
      if (!_directDeposit) then {
        ["My paycheck has come in, go to the paycheck centre to pick it up.",true,"slow"] call ANZUS_fnc_notificationSystem;
      };
    };
    
    if (_directDeposit) then {
      [format["My paycheck has been direct deposited with a total of $%1 due to having the perk.",[_amount] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
      [_amount] call AnzusLife_AC_Bank;
    } else {
      AnzusLife_Paycheck = AnzusLife_Paycheck + _amount;
    };
    
    ["playtime"] call mav_ttm_fnc_addExp;
    AnzusLife_PayCheckTimer = 10;
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_PickupPaycheck", {
  private ["_paycheckAmount"];
  _paycheckAmount = AnzusLife_Paycheck;
  if (_paycheckAmount < 1) exitWith{["You have no paycheck's waiting for you.",true,"slow"] call ANZUS_fnc_notificationSystem;};

  AnzusLife_Paycheck = 0;
  [_paycheckAmount] call AnzusLife_AC_Cash;
  [format["You have just signed your paycheck and have recived $%1.", [_paycheckAmount] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
}] call AnzusLife_ClientCompile;

["AnzusLife_GenLoop", {
  if (playerSide isEqualTo civilian) then {
    if (ITEM_VALUE("keyCard") > 0) then {
      if (isNil "AnzusLife_RemoveCardTime") then {
        AnzusLife_RemoveCardTime = (time + ((random 1200) + 600));
      };

      if (AnzusLife_RemoveCardTime - time < 0) then {
        [false,"keyCard",1,"misc"] call ANZUS_fnc_handleInv;
        ["The cops noticed a missing key card and deactivated it!",true,"slow"] call ANZUS_fnc_notificationSystem;

        AnzusLife_RemoveCardTime = (time + ((random 1200) + 600));
      };
    };
  };

}] call AnzusLife_ClientCompile;

["AnzusLife_Loops", {
  ["itemAdd", ["Paycheck_Loop", {[] spawn AnzusLife_Paychecks;}, 60, 'seconds']] call BIS_fnc_loop;
  ["itemAdd", ["VehicleTags_Loop", {[] call ANZUS_fnc_vehicleTags;}, 0.5, 'seconds']] call BIS_fnc_loop;
  ["itemAdd", ["NameTags_Loop", {[] call ANZUS_fnc_nameTags;}, 0.5, 'seconds']] call BIS_fnc_loop;
  ["itemAdd", ["GeneralStuff_Loop", {[] call AnzusLife_GenLoop;}, 1, 'seconds']] call BIS_fnc_loop;

  AnzusLife_Loops = nil;
},false] call AnzusLife_ClientCompile;

["AnzusLife_BuyTicket", {
  _tickets = param[0];
  _uid = getplayeruid player;
  _price = 5000;
  
  if (CASH < _price) exitWith {["You do not have enough money to buy a lottery tickets, it cost $5,000",true,"slow"] call ANZUS_fnc_notificationSystem};

  _result = false;
  {
    _result = _uid in _x;
  } forEach _tickets;

  if (_result) then {
    ["You already have a lottery ticket, good luck!",true,"slow"] call ANZUS_fnc_notificationSystem;
  } else {
    ["You have purchased a lottery ticket, good luck and we hope you win!",true,"slow"] call ANZUS_fnc_notificationSystem;
    
    [_price,true] call AnzusLife_AC_Cash;
    [player] remoteExec ["AnzusLife_BuyTicketServ",2];
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_CheckTick",{
  _player = param [0];
  _xD = Tickets;

  _result = false;
  {
    _result = _uid in _x;
  } forEach _xD;
  
  if (_result) exitWith {["You already have bought the max amount of tickets, sorry!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_player];};

  [_xD] remoteExec ["AnzusLife_BuyTicket",_player];
}] call AnzusLife_ServerCompile;

["AnzusLife_BuyTicketServ",{
  _player = param[0];
  _name = name _player;
  _uid = getplayeruid _player;

  _result = false;
  {
    _result = _uid in (Tickets select _forEachIndex);
  } forEach Tickets;

  if (_result) exitWith {};

  Tickets pushback [_name,_uid];
}] call AnzusLife_ServerCompile;

["AnzusLife_LottoTickets",{
  if(count Tickets isequalto 0) exitwith {Tickets = []; ["A new lottery has started and the winner will be picked in 30 mins. The more people that enter, the more the prize goes up!",true,"slow"] remoteexec ["ANZUS_fnc_notificationSystem",-2];};

  [] call AnzusLife_SelectTicket;
}] call AnzusLife_ServerCompile;

["AnzusLife_ItemBought",{
  params["_amount"];

  if (isNil "AnzusLife_itemPrices") then {
    AnzusLife_itemPrices = 0;
  };

  AnzusLife_itemPrices = AnzusLife_itemPrices + _amount;
}] call AnzusLife_ServerCompile;

["AnzusLife_TotalItems",{
  
  if (isNil "AnzusLife_itemPrices") then {
    AnzusLife_itemPrices = 0;
  };

  _amt = 1;
  _amt = _amt + (round (AnzusLife_itemPrices / 300000));

  if (_amt > 5) then {
    _amt = 5;
  };

  _cops = west countSide allPlayers;
  if (_cops > 25) then {
    _amt = _amt + 3;
  } else {
    if (_cops > 20) then {
      _amt = _amt + 2;
    } else {
      if (_cops > 15) then {
        _amt = _amt + 1;
      };
    };
  };
  

  if (count allPlayers > 100) then {
    _amt = _amt + 1;
  };
  
  if (_amt > 9) then {
    _amt = 9;
  };

  if (_amt > 1) then {
    _amt = _amt - 1;
  };

  [format["major crime, amount: %1", _amt], "major_amount.log"] call AH_LogInterface;

  life_major_amount = _amt;
  remoteExecutedOwner publicVariableClient "life_major_amount";

  AnzusLife_itemPrices = 0;
}] call AnzusLife_ServerCompile;

["AnzusLife_SelectTicket",{
  _result = selectrandom Tickets;
  _prize = 0;
 
  {
    _prize = _prize + 5000;
  } forEach Tickets;

  [format["%1 has won The lottery with a prize of $%2",_result select 0,[_prize] call ANZUS_fnc_numberText],true,"slow"] remoteexec ["ANZUS_fnc_notificationSystem",-2];

  sleep 3;

  ["A new lottery has started and the winner will be picked in 30 mins. The more people that enter, the more the prize goes up!",true,"slow"] remoteexec ["ANZUS_fnc_notificationSystem",-2];
  Tickets = [];
}] call AnzusLife_ServerCompile;

["AnzusLife_Garage", {
  _mode = param [0];
  closeDialog 0;
  
  _gay = '';
  _type = '';

  switch (_mode) do {
    case "Car": {_type = 'Car'; _gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "Boat": {_type = 'Ship'; _gay = LIFE_SETTINGS(getArray,"BoatShopSpawns")};
    case "Air": {_type = 'Air'; _gay = LIFE_SETTINGS(getArray,"AirShopSpawns")};
    case "Impound": {_type = 'Car'; _gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
  };

  if (_mode isEqualTo "Impound") then {
    [getPlayerUID player,playerSide,"Car",player,true] remoteExecCall ["TON_fnc_getVehicles",2];
    life_garage_type = _type;
    createDialog "AnzusLife_ImpoundMenu";
  } else {
    [getPlayerUID player,playerSide,_type,player] remoteExecCall ["TON_fnc_getVehicles",2];
    life_garage_type = _type;
    createDialog "AnzusLife_Garage";
  };

  _markerName = [];
  {
    if ((player distance (getMarkerPos _x)) <= 50) then {
      _markerName pushBack _x;
    };
  } forEach _gay;

  if (_type isEqualTo "Car" || _type isEqualTo "Impound") then {
    life_garage_sp = "player_garage";
  } else {
    if (count _markerName isEqualTo 0) then {
      life_garage_sp = "NONE";
    } else {
      life_garage_sp = _markerName select 0;
    };
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_PlayerVoice",{
  params [
    ["_type","",[""]],
    ["_player",objNull,[objNull]]
  ];

  if (_type isEqualTo "") exitWith {};
  if (isNull _player) exitWith {["Player does not exist!",true,"fast"] call ANZUS_fnc_notificationSystem;};
  if (player isEqualTo _player) exitWith {["You can not mute/unmute yourself!",true,"fast"] call ANZUS_fnc_notificationSystem;};
  if (player distance _player > 6) exitWith {["You are too far from that player!",true,"fast"] call ANZUS_fnc_notificationSystem;};

  switch (_type) do { 
    case "Mute": {
      _player setVariable ["tf_voiceVolume", 0];
      _player setVariable ["AnzusLife_Muted",true];
      [format["You have just muted %1.",(getPlayerUID _player) select [7, 10]],false,"slow"] call ANZUS_fnc_notificationSystem;
      [format["%1 has just muted you.",(getPlayerUID player) select [7, 10]],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_player];
    }; 
    case "Unmute": {
      _player setVariable ["tf_voiceVolume", 1];
      _player setVariable ["AnzusLife_Muted",false];
      [format["You have just unmuted %1.",(getPlayerUID _player) select [7, 10]],false,"slow"] call ANZUS_fnc_notificationSystem;
      [format["%1 has just unmuted you.",(getPlayerUID player) select [7, 10]],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_player];
    }; 
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_SetName", {
  if (dialog) then {closeDialog 0};
  createDialog "AnzusLife_SetName";
  _player = cursorObject;
  if (!(_player in allPlayers)) exitWith {};

  buttonSetAction [25, format["[ctrlText 22,player] remoteExec ['AnzusLife_GetSetName',%1]; closeDialog 0; ['Name request sent!',false,'slow'] call ANZUS_fnc_notificationSystem;",_player]];
}] call AnzusLife_ClientCompile;

["AnzusLife_GetSetName", {
  _newname = param[0,"",[""]];
  _player = param[1,objNull,[objNull]];

  if (dialog) exitWith {["Player has menu open wait for them to close!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_player];};

  private _params = [];
  if (isStreamFriendlyUIEnabled) then {
    _params = ["Name Change", format["%1 wants to set your name as *CENSORED*, would you like them to have your name as this? If you accept this, they will see you name as this and you will be added to thier contacts.",name _player], "YES", "NO", findDisplay 46, true];
  } else {
    _params = ["Name Change", format["%1 wants to set your name as %2, would you like them to have your name as this? If you accept this, they will see you name as this and you will be added to thier contacts.",name _player,_newname], "YES", "NO", findDisplay 46, true];
  };
  
  private _action = (_params call ANZUS_fnc_guiPrompt);

  if (_action) then {
    [format["Your name is now %1 for %2!",_newname,name _player],true,"slow"] call ANZUS_fnc_notificationSystem;
    [player,_newname] remoteExec ["AnzusLife_SaveName",_player];
    [player,_newname] remoteExec ["ANZUS_fnc_contactCheck",_player];
  } else {
    ["Player has denied that name to be set on them!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_player];
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_SaveName", {
  private ["_target", "_targetUID", "_saved", "_name", "_id", "_sUID"];
  params [["_target",objNull,[objNull]],["_name","",[""]]];

  private _targetUID = getPlayerUID _target;
  private _saved = profileNamespace getVariable ["AnzusLife_NameTags",[]];

  closedialog 0;
  _id = -1;

  {
    _sUID = _x select 0;

    if(_sUID isEqualTo _targetUID) exitWith {
      _id = _forEachIndex;
    }
  } forEach _saved;

  if(_id > -1) then {
    _saved set [_id,[_targetUID,_name]];
  } else {
    _saved pushBack [_targetUID,_name];
  };

  profileNamespace setVariable ["AnzusLife_NameTags",_saved];
  [format["You have changed %1's name to %2",name _target,_name],false,"slow"] call ANZUS_fnc_notificationSystem;
}] call AnzusLife_ClientCompile;

["AnzusLife_StabilizePlayer", {
  params [["_unit",objNull,[objNull]]];

  _corpseplayer = _unit getVariable ["CorpsePlayer",objNull];
  if (isNull _corpseplayer) exitWith {};
  
  _playerid = getPlayerUID _corpseplayer;
  if (_playerid isEqualTo 0) exitWith {};

  _player = [_playerid] call AnzusLife_Lib_GetPlayerByUID;
  if (isNull _player) exitWith {}; 

  if ((missionNamespace getVariable [format['life_inv_stabilizer_%1', uiNamespace getVariable ['Life_Rnd', 0]], 0]) isEqualTo 0) exitWith {["You do not have a stabilizer.",true,"slow"] call ANZUS_fnc_notificationSystem;};
  if (isNull _player) exitWith {};
  if (_player getVariable ["AnzusLife_Stabilized",0] > 0) exitWith {["Player is already stabilized.",true,"slow"] call ANZUS_fnc_notificationSystem;};
  if (_player getVariable ["AnzusLife_Stabilizing",false]) exitWith {["Player is already being stabilized.",true,"slow"] call ANZUS_fnc_notificationSystem;};
  _player setVariable ["AnzusLife_Stabilizing",true,true];

  closeDialog 0;
  life_action_inUse = true;

  _title = "Stabilizing Player";
  _icon = "\ArmaGamingCore\images\displays\displayCommunicationTargets\medical.paa";

  disableSerialization;
  "progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
  _ui = uiNamespace getVariable "AnzusLife_Progress";
  _controlsGroup = _ui displayCtrl 1;
  _progress = _controlsGroup controlsGroupCtrl 3;
  _pgText = _controlsGroup controlsGroupCtrl 2;
  _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
  _progress progressSetPosition 0.01;
  _cP = 0.01;

  for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
      [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
      player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
      player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
      player disableAI "anim"; 
    };

    sleep 0.50;
    _cP = _cP + 0.2;
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

    if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
    if (!alive player) exitWith {};
    if !(isNull objectParent player) exitWith {};
    if (life_interrupted) exitWith {};
  };

  life_action_inUse = false;
  "progressBar" cutText ["","PLAIN"];
  player playActionNow "stop";
  _player setVariable ["AnzusLife_Stabilizing",false,true];

  if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
  if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
  if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

  [false,"stabilizer",1,"misc"] call ANZUS_fnc_handleInv;
  ["You have stabilized the player.",false,"slow"] call ANZUS_fnc_notificationSystem;
  ["Stabalize"] spawn mav_ttm_fnc_addExp;

  private _length = (missionNamespace getVariable ["mav_ttm_var_stabalizeLength", 60]);
  _player setVariable ["AnzusLife_Stabilized",_length,true];
  [player] remoteExec ["AnzusLife_PlayerStabilized",_player];
}] call AnzusLife_ClientCompile;

["AnzusLife_PlayerStabilized", {
  params [["_player",objNull,[objNull]]];

  if (!isRemoteExecuted) exitWith {};
  if (isNull _player) exitWith {};
  if (!(_player in allPlayers)) exitWith {};
  if (player getVariable ["AnzusLife_Stabilized",0] isEqualTo 0) exitWith {};
  if (isNil {AnzusLife_BleedoutDuration}) exitWith {};

  AnzusLife_BleedoutDuration = AnzusLife_BleedoutDuration + (player getVariable ["AnzusLife_Stabilized",0]);
  [format["You have been stabilized by %1.",name _player],false,"slow"] call ANZUS_fnc_notificationSystem;
}] call AnzusLife_ClientCompile;

["AnzusLife_BudgetAdd", {
  params [["_amount",0,[0]]];

  [_amount, player] remoteExecCall ["AnzusLife_ChangeBudget", 2];

}] call AnzusLife_ClientCompile;

["AnzusLife_BudgetSub", {
  params [["_amount",0,[0]]];
  if (_amount > 0) then {
    _amount = _amount * -1;
  };

  [_amount, player] remoteExecCall ["AnzusLife_ChangeBudget", 2];
}] call AnzusLife_ClientCompile;

["AnzusLife_ChangeBudget", {
  params [["_amount",0,[0]], ["_player", objNull, [objNull]]];

  if (isNull _player) exitWith {};
  if (_amount == 0) exitWith {};
  if (owner _player != remoteExecutedOwner) exitWith {};

  _budget = profileNamespace getVariable ["AnzusLife_Budget", 0];
  _budget = _budget + _amount;
  profileNamespace setVariable ["AnzusLife_Budget", _budget];
  if (isNil "AnzusLife_LastSave") then {
    AnzusLife_LastSave = 0;
  };

  if (time - AnzusLife_LastSave > 60) then {
    saveProfileNamespace;
    AnzusLife_LastSave = time;
  };

  [format["%1/%2 added $%3 to budget, total now: %4", name _player, getPlayerUID _player, _amount, _budget], "gov_budget.log"] call AH_LogInterface;
    
}] call AnzusLife_ServerCompile;

