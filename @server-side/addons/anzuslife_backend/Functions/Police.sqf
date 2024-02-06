#include "\life_server\script_macros.hpp"
["AnzusLife_CreateEvidence",{
	params [
		["_ply",objNull,[objNull]],
		["_crimeid",0,[0]],
		["_obj",objNull,[objNull]]
	];

	if (isNull _ply) exitWith {};
	if !(isPlayer _ply) exitWith {};
	if (_crimeid isEqualTo "") exitWith {};
  if (!(side _ply isEqualTo civilian)) exitWith {};

	if (isNull _obj) then {
		_pos = [0,0,0];
		if (isTouchingGround _ply) then {
			_pos = getPosASL _ply;
		} else {
			_pos = getPos _ply;
			_pos set [2,0];
			_pos = AGLToASL _pos;
		};

		_obj = createSimpleObject ["Land_Sleeping_bag_blue_folded_F", _pos]; 
	};

	_obj setVariable ["isEvidence",true,true];
	_obj setVariable ["eviPID",getPlayerUID _ply,true];
	_obj setVariable ["eviName",name _ply,true];
	_obj setVariable ["eviCrime",_crimeid,true];
}] call AnzusLife_ClientCompile;

["AnzusLife_SearchEvidence",{
	private ["_ui","_progress","_pgText","_cP","_upp"];

	params [
		["_obj",objNull,[objNull]]
	];

	if (isNull _obj) exitWith {};
	if !(_obj getVariable ["isEvidence",false]) exitWith {};
	if (playerSide isEqualTo independent) exitWith {["You are a neutral party.",false,"slow"] call ANZUS_fnc_notificationSystem; };
	if (life_action_inUse) exitWith {};
	private _pid = _obj getVariable ["eviPID",""];
	private _name = _obj getVariable ["eviName",""];
	private _crime = _obj getVariable ["eviCrime",""];

	if (_pid isEqualTo "") exitWith {};
	if (_name isEqualTo "") exitWith {};
	if (_crime isEqualTo "") exitWith {};
	life_action_inUse = true;
	life_interrupted = false;
	_upp = "";

	if (playerSide isEqualTo west) then {
		_upp = "Searching through Evidence";
	} else {
		_upp = "Destroying Evidence";
	};

	closeDialog 0;
	//Setup the progress bar
	_title = _upp;
	_icon = "\ArmaGamingCore\images\displays\displayMenu\warrants.paa";

	disableSerialization;
	"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
	_ui = uiNamespace getVariable "AnzusLife_Progress";
	_controlsGroup = _ui displayCtrl 1;
	_progress = _controlsGroup controlsGroupCtrl 3;
	_pgText = _controlsGroup controlsGroupCtrl 2;
	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_add = 0.01;
	_cP = _add;

	for "_i" from 0 to 1 step 0 do {
		if ((animationState player) != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
			player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};

		sleep 0.35;
		_cP = _cP + (_add * (missionNamespace getVariable ["mav_ttm_var_evidenceSpeed", 1]));
		_progress progressSetPosition _cP;
	    _precentage = str round(_cP * 100) + "%";
	    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
	    
		if (_cP >= 1) exitWith {};
		if (player getVariable ["inHostage",false]) exitWith {};
		if (!alive player) exitWith {};
		if !(isNull objectParent player) exitWith {};
		if (isNull _obj) exitWith {};
		if (life_interrupted) exitWith {};
	};
	life_action_inUse = false;
	"progressBar" cutText ["","PLAIN"];
	if (!alive player) exitWith {["You have died!",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if !(isNull objectParent player) exitWith {["You got in car.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (isNull _obj) exitWith {["The evidence has been collected.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (life_interrupted) exitWith {["You have canceled.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; call ANZUS_fnc_hudUpdate;};
		
	switch (playerSide) do { 
		case west : { 
			_player = [_pid] call AnzusLife_Lib_GetPlayerByUID;
			if (isNull _player) exitWith {};

			[_player, _crime] remoteExec ["ANZUS_fnc_addWarrantsServ",2];
			[format ["You have found evidence that %1 has commited a crime.",_name],false,"slow"] call ANZUS_fnc_notificationSystem; 
			[3250] call AnzusLife_AC_Cash;
			["PickupEvidence"] spawn mav_ttm_fnc_addExp;
		}; 
		case civilian : {
			[format ["You have removed evidence for %1",_name],false,"slow"] call ANZUS_fnc_notificationSystem;
		}; 
		default {}; 
	};
	if (typeOf _obj isEqualTo "Land_Sleeping_bag_blue_folded_F") then {
		deleteVehicle _obj
	} else {
		_obj setVariable ["isEvidence",false,true];
	};
}] call AnzusLife_ClientCompile;

["AnzusLife_CheckpointBuilder", {
  createDialog "AnzusLife_CheckpointBuilder";
  {
    lbAdd [1500, format ["%1 ($%2)",_x select 1,_x select 2]];
  } foreach AnzusLife_CB_Items;
  buttonSetAction [2410, "[] call AnzusLife_AttachLocal;"] 
}] call AnzusLife_ClientCompile;

["AnzusLife_AttachLocal", {
  if (lbCurSel 1500 == -1) exitWith {
    ["Please select somthing from the list.", true, "slow"] call ANZUS_fnc_notificationSystem;
  };

  cbgetselected = AnzusLife_CB_Items select(lbCurSel 1500);
  _item = cbgetselected select 0;
  _itemprice = cbgetselected select 2;

  if (BANK < _itemprice) exitWith {
    ["You do not have enough for this item in your bank.", true, "slow"] call ANZUS_fnc_notificationSystem;
  };

  if (CB) exitWith {
    ["You already have a item in your hands.", true, "slow"] call ANZUS_fnc_notificationSystem;
  };

  _nearest = nearestObjects[getPos player, ["Land_BarGate_F", "RoadCone_F", "RoadBarrier_long", "RoadBarrier_small_F", "Land_PlasticBarrier_03_F", "TapeSign_F", "ArrowDesk_L_F", "ArrowDesk_R_F", "ArrowMarker_R_F", "ArrowMarker_L_F", "Sign_Checkpoint_EP", "Land_PortableLight_single_f", "Land_PortableLight_double_f"], 100];

  if (_nearest isEqualTo[]) then {
    [player] remoteExec["AnzusLife_NotifyCheckpoint", 0];
  };


  CB = true;
  cbitem = _item createVehicleLocal (getPosATL player);

  _bbr = boundingBoxReal cbitem;
  _p1 = _bbr select 0;
  _p2 = _bbr select 1;
  _maxLength = abs ((_p2 select 1) - (_p1 select 1));
  _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

  cbitem attachTo [player, [0, _maxLength*2, _maxHeight / 2]];
  closedialog 0;
  ["You have successfully bought the item and it is in your hands. Press your interaction key and hit 'Place Item' when its where you want it.", true, "slow"] call ANZUS_fnc_notificationSystem;
  [_itemprice, true] call AnzusLife_AC_Bank;
}] call AnzusLife_ClientCompile;

["AnzusLife_PlaceItem", {
  params [
    ["_pos",[],[[]]],
    ["_up",[],[[]]],
    ["_dir",[],[[]]],
    ["_class","",[""]]
  ];

  if (_pos isEqualTo []) exitWith {};
  if (_up isEqualTo []) exitWith {};
  if (_dir isEqualTo []) exitWith {};
  if (_class isEqualTo "") exitWith {};

  _player = call AnzusLife_Lib_GetREPlayer;

  if !((vehicle _player) isEqualTo _player) exitWith {};

  _uid = getPlayerUID _player;

  _place = _class createVehicle [0,0,300];
  _place setVectorUp _up;
  _place setVectorDir _dir;
  _place setPosATL _pos;
  if ([_place] call ANZUS_fnc_playerInBuilding) exitWith {deleteVehicle _place};
  if !(isTouchingGround _place) then { _pos set[2,0];_place setPosATL _pos;};
  _place setVariable ["CB_Item_Owner",_uid,true];

  if (_class in ['Land_PortableLight_single_f','Land_PortableLight_double_f','RoadBarrier_small_F','RoadCone_F','Land_BarGate_F']) then {
    _place enableSimulationGlobal true;
  } else {
    _place enableSimulationGlobal false;
  };

  _place addEventHandler ["HandleDamage",{0.01}]; 

}] call AnzusLife_ServerCompile;

["AnzusLife_CheckpointBuilderRemove", {
  params [["_object",objNull,[objNull]]]; 

  _return = false;
  {  	
  	if (toLower(typeOf _object) isEqualTo (toLower(_x select 0))) then {
  		_return = true;
  		breakOut "";
  	};
  } foreach AnzusLife_CB_Items;
  _return;

  if (_return) then {
  	deleteVehicle cursorObject;
  	["You have removed this item.",true,"slow"] call ANZUS_fnc_notificationSystem;
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_NotifyCheckpoint", {
	_player = param [0,objNull,[objNull]];
	_hasPerk = [life_currentExpPerks, "perk_policecheck_1"] call mav_ttm_fnc_hasPerk;
	if (!_hasPerk) exitWith {};
	if (side _player != civilian) exitWith {};

	_getlocation = [_player] call AnzusLife_Lib_GetNearestLocation;
	[format["%1 has setup a checkpoint near %2, watch out.",name _player,_getlocation],true,"slow"] call ANZUS_fnc_notificationSystem;
}] call AnzusLife_ClientCompile;

["AnzusLife_ImpoundVehicle",{
  params [
    ["_vehicle",objNull,[objNull]],
    ["_player",objNull,[objNull]]
  ];

  closeDialog 0;
  private _vehicleName = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
  private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");

  private _impoundMultiplier = getNumber(_shopSettings >> "vehicle_cop_impound_multiplier");
  private _value = _price * _impoundMultiplier;
  private _vehData = _vehicle getVariable ["vehicle_info_owners",[]];
  _player = [((_vehData select 0) select 0)] call AnzusLife_Lib_GetPlayerByUID;
  if (!isNull _player) then {
    if (side _player isEqualTo west) then {
      [_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",2];
      [format["Your %1 has been impounded by %2, you can retrieve it from the garage as you are police.",_vehicleName,name player],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_player];
    } else {
      [_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",2];
      [_vehicle,player,true] remoteExec ["AnzusLife_ImpoundVehicleServ",2];
      [format["Your %1 has been impounded by %2, you can retrieve it from the impound lot.",_vehicleName,name player],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_player];
    };
  } else {
    [_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",2];
    [_vehicle,player,true] remoteExec ["AnzusLife_ImpoundVehicleServ",2];
  };

  if (_vehicle in life_vehicles) then {
    [format[localize "STR_NOTF_OwnImpounded",[_value] call ANZUS_fnc_numberText,_type],true,"slow"] call ANZUS_fnc_notificationSystem;
    [_value,true] call AnzusLife_AC_Bank;
  } else {
    [format[localize "STR_NOTF_Impounded",_type,[_value] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
    [_value] call AnzusLife_AC_Bank;
    ["VehicleImpounded"] spawn mav_ttm_fnc_addExp;
  };

  [1] call ANZUS_fnc_updatePartial;
}] call AnzusLife_ClientCompile;

["AnzusLife_ImpoundVehicleServ",{
  params [
    ["_vehicle",objNull,[objNull]],
    ["_player",objNull,[objNull]],
    ["_impound",false,[false]],
    ["_vid",0,[0]]
  ];
  	
  private _query = "";
  if (_impound) then {
  	if (isNull _vehicle) exitWith {};
    _vehicleplate = _vehicle getVariable ["dbinfo",[]] select 1;
    _query = format["UPDATE vehicles SET impound='1' WHERE plate='%1'",_vehicleplate];
  } else {
    _query = format["UPDATE vehicles SET impound='0' WHERE id='%1'",_vid];
  };
  
  [_query,1] call ANZUS_fnc_asyncCall;
}] call AnzusLife_ServerCompile;

["AnzusLife_ImpoundLotMenu",{
  disableSerialization;
  _vehicles = param [0,[],[[]]];
  AL_ILM = [];
  _toptext = CONTROL(1562,1002);
  _control = CONTROL(1562,1500);
  _button = CONTROL(1562,1512);
  _toptext ctrlSetText "Impound Lot - Retrieve Vehicles";
  _button ctrlSetText "Retreive";
  lbClear _control;
  _control ctrlSetEventHandler ["LBSelChanged", "[] call AnzusLife_ImpoundLotMenuChanged"];

  {
    _fade = ((findDisplay 1562) displayCtrl _x);
    _fade ctrlSetFade 1; 
    _fade ctrlCommit 0; 
  } forEach [1004,1005,1512,1007,1008,1009,1010];

  waitUntil {!isNull (findDisplay 1562)};

  if (count _vehicles isEqualTo 0) exitWith {
    ["You have no vehicles in the impound lot.",true,"slow"] call ANZUS_fnc_notificationSystem;
  };

  {
  	_vehicleInfo = [(_x select 2)] call ANZUS_fnc_fetchVehInfo;
    _index = lbAdd [1500, format["%1",_vehicleInfo select 3]];
    lbSetPicture [1500,_index,(_vehicleInfo select 2)];
    lbSetValue [1500,_index,(_x select 0)];
    AL_ILM pushBack _x;
  } forEach _vehicles;

  buttonSetAction [1512, "_vehicle = lbCurSel 1500; [_vehicle,player] call AnzusLife_RetreiveVehicle;"];
}] call AnzusLife_ClientCompile;

["AnzusLife_ImpoundLotMenuChanged",{
  {
    _fade = ((findDisplay 1562) displayCtrl _x);
    _fade ctrlSetFade 0; 
    _fade ctrlCommit 1.3; 
  } forEach [1004,1005,1512,1007,1008,1009,1010];
  
  _vehicle = AL_ILM select (lbCurSel 1500);
  _class = _vehicle select 2;

  _retrievePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_class,"price");
  _retrievePrice = _retrievePrice / 10;

  ((findDisplay 1562) displayCtrl 1005) ctrlSetText format["Retrive Price: $%1",[_retrievePrice] call ANZUS_fnc_numberText];
  ((findDisplay 1562) displayCtrl 1010) ctrlSetStructuredText parseText format["<t size='0.9'>Impounded By: %1<br/><br/>Impounded At: %2</t>","Metropolis Towing Services","Unknown"];
}] call AnzusLife_ClientCompile;


["AnzusLife_RetreiveVehicle",{
	_vehicle = param [0];
	_player = param [1];

	_vehicleObject = AL_ILM select _vehicle;
	_vehicleclass = _vehicleObject select 2;
	_vehicleName = getText(configFile >> "CfgVehicles" >> _vehicleclass >> "displayName");
	_retrievePrice = M_CONFIG(getNumber,'LifeCfgVehicles',_vehicleclass,'price'); 
	_retrievePrice = _retrievePrice / 10; 
	_vid = lbValue[1500,(lbCurSel 1500)];

  if (BANK < _retrievePrice) exitWith {['You do not have enough money in your bank to retrieve this vehicle.',true,'slow'] call ANZUS_fnc_notificationSystem; closeDialog 0; AL_ILM = [];};
	if (life_garage_sp isEqualTo "NONE") exitWith {["No spawnpoint available, please let a developer know this shop has no spawn.",true,"slow"] call ANZUS_fnc_notificationSystem;};
  if (life_garage_sp isEqualTo "player_garage") then {
  	closeDialog 0;
  	AL_ILM = [];

    [_vehicleclass,_vendor,_retrievePrice,_vid] spawn {
      params["_className","_vendor","_retrievePrice","_vid"];
      droppedVehicle = false;
      ["To place your vehicle please press space, to cancel this press F1",true,"slow"] call ANZUS_fnc_notificationSystem;
      _startposition = getPos player;

      garageTmpVehicle = _className createVehicleLocal (position player);
      garageVehicleType = _className;

      _bbr = boundingBoxReal garageTmpVehicle;
      _p1 = _bbr select 0;
      _p2 = _bbr select 1;
      _maxLength = abs ((_p2 select 1) - (_p1 select 1));
      _maxHeight = abs ((_p2 select 2) - (_p1 select 2));


      switch (_className) do { 
        case "Fox_ArrowXTLadder" : {
          _maxHeight = 2.5;
          _maxLength = 15;
        };
        case "Jonzie_Ambulance" : {
            _maxHeight = 2.5;
            _maxLength = 15;
        };
      };



      garageTmpVehicle attachTo [player, [0, _maxLength, _maxHeight / 2]];

      garageSpawnEh = (findDisplay 46) displayAddEventHandler['KeyUp', {
          if (_this select 1 == 0x39) then {
              droppedVehicle = true;
          } else {
              if (_this select 1 == 0x3B) then {
                  deleteVehicle garageTmpVehicle;
                  (findDisplay 46) displayRemoveEventHandler['KeyUp', garageSpawnEh];
                  garageExited = true;
                  [0] call AnzusLife_finishVehSpawn;
              };
          };
      }];

      

      private _distance = 10;
      if ((typeOf _vendor) isEqualTo "Land_pop_mansion_deluxe" || (typeOf _vendor) isEqualTo "Land_InfoStand_V1_F") then {_distance = 35};
      _distance = _distance + _maxLength;
      waitUntil {(garageTmpVehicle distance _startposition) > _distance || droppedVehicle isEqualTo true};
      if (garageExited) exitWith {garageExited = false};
      _pos = getPos garageTmpVehicle;

      _class = garageVehicleType;
      _pos set[2, (_pos select 2) + 1];
      _dir = getDir garageTmpVehicle;

      [_vid, _pos, _dir, _retrievePrice] call AnzusLife_spawnVehicle;
      [objNull,player,false,_vid] remoteExec ["AnzusLife_ImpoundVehicleServ",2];

      deleteVehicle garageTmpVehicle;
      (findDisplay 46) displayRemoveEventHandler['KeyUp', garageSpawnEh];

      if (player distance _startposition > _distance) then {
          ["You have walked to far, dropping vehicle.",true,"slow"] call ANZUS_fnc_notificationSystem;
      };
    };
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_SWATRaid",{
   params [
    ["_obj",objNull,[objNull]]
  ];

  _door = [_obj] call AnzusLife_GetDoor;

  if (isNull _obj) exitWith {};
  if (_obj getVariable [format ['%1c4charge',_door],false]) exitWith {["C4 already on door!",true,"slow"] call ANZUS_fnc_notificationSystem;};
  if !([false,"doorc4",1,"police"] call ANZUS_fnc_handleInv) exitWith {["You don't have a C4 Charge!",true,"slow"] call ANZUS_fnc_notificationSystem;};
  
  _obj setVariable [format ['%1c4charge',_door],true,true]; 

  if (((tolower _door) find "door") isEqualTo -1) exitWith {[true,"doorc4",1,"police"] call ANZUS_fnc_handleInv;_obj setVariable [format ['%1c4charge',_door],false,true]; ["This isn't a door.",true,"slow"] call ANZUS_fnc_notificationSystem;};

  _pos = _obj modelToWorld (_obj selectionPosition _door);

  _ins = (lineIntersectsSurfaces [
    AGLToASL positionCameraToWorld [0,0,0], 
    AGLToASL positionCameraToWorld [0,0,5], 
    player,
    objNull,
    true,
    1,
    "GEOM",
    "NONE"
  ] select 0) params ["_pos","_sur",["_bobj",objNull,[objNull]],["_pbobj",objNull,[objNull]]];

  if (isNull _bobj) exitWith {_obj setVariable [format ['%1c4charge',_door],false,true];[true,"doorc4",1,"police"] call ANZUS_fnc_handleInv;};
  if ((currentWeapon player) isEqualTo "") then {
    player playMoveNow "amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown";
  } else {
    player playMoveNow "amovpercmstpsraswpstdnon_ainvpercmstpsraswpstdnon_putdown";    
  };
  uisleep 0.4;
  _exp = "APERSMine_Range_Ammo" createVehicle [0,0,0];
  _exp setVectorUp _sur;
  _dir = getDir _exp;
  _exp setPosASL _pos;
  uisleep 5;

  _obj allowDamage false;
  
  _men = [_obj,_door] call AnzusLife_Lib_OpenDoor;
  if (_men) then {
    _exp setDamage 1;
  } else {
    deleteVehicle _exp;
    [true,"doorc4",1,"police"] call ANZUS_fnc_handleInv;
  };
  _obj setVariable [format ['%1c4charge',_door],nil,true]; 
  _obj setVariable [format ['%1boltLocked',_door],nil,true]; 
  if ((_door find "door_") isEqualTo -1) then {
    _door = [_door,"door","door_"] call AnzusLife_Lib_ReplaceString;
  };
  _obj setVariable [format["BIS_Disabled_%1",_door],0,true];

}] call AnzusLife_ClientCompile;