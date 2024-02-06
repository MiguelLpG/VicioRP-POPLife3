#include "\life_server\script_macros.hpp"

["AnzusLife_SpawnTransport",{
	if (isNil "truckMissionVeh") then {truckMissionVeh = objNull;};
	if !(isNull truckMissionVeh) exitWith {};
	if ((count allPlayers) < 70) exitWith {};

	_mainCFG = missionConfigFile >> "CfgMaster" >> "Events" >> "WeaponTransport";
	_marker = selectRandom (getArray (_mainCFG >> "spawn_points"));
	_truckClass = selectRandom (getArray (_mainCFG >> "truck_class"));
	_broken = getNumber (_mainCFG >> "truck_startBroken");

	_vehicle = _truckClass createVehicle [0,0,200];
	_vehicle allowDamage false;

	_vehicle setDir (markerDir _marker);
	_vehicle setPosATL (getMarkerPos _marker);

	_vehicle allowDamage true;
	_vehicle setVehicleAmmo 0;
	_vehicle setAmmoCargo 0;
	
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;

	[_vehicle,0] remoteExecCall ["ANZUS_fnc_setFuel",_vehicle];

	if (_broken isEqualTo 1) then {
		[_vehicle] remoteExec ["ANZUS_fnc_spikeStripEffect",_vehicle];
	};

	_vehicle lock true;
	_vehicle setVariable ["transportMission",true,true];
	_vehicle setVariable ["inCapture",false,true];
	_vehicle setVariable ["startTime",time,true];
	_vehicle addEventHandler ["HandleDamage",{((_this select 2) / 2);}];

	truckMissionVeh = _vehicle;
	publicVariable "truckMissionVeh";

	["The Illegal Supply Truck has broken down and has been marked on your map!",false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
}] call AnzusLife_ServerCompile;

["AnzusLife_AddItemToCrate",{
	params [["_crate",objNull,[objNull]],["_item","",[""]],["_num",0,[0]]];
	if (_item isEqualTo "") exitWith {};
	if (_num isEqualTo 0) exitWith {};
	if (_crate isEqualTo objNull) exitWith {};

	_totalWeight = [_crate] call ANZUS_fnc_vehicleWeight;
	_itemWeight = ([_item] call ANZUS_fnc_itemWeight) * _num;
	_veh_data = _crate getVariable ["Trunk",[[],0]];
	_inv = _veh_data select 0;
	if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {[localize "STR_NOTF_VehicleFullOrInsufCap",true,"slow"] call ANZUS_fnc_notificationSystem;};
	_index = [_item,_inv] call TON_fnc_index;
	if (_index isEqualTo -1) then {
	    _inv pushBack [_item,_num];
	} else {
	    _val = _inv select _index select 1;
	    _inv set[_index,[_item,_val + _num]];
	};
	_crate setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];

}] call AnzusLife_ClientCompile;

["AnzusLife_HandIn",{
	params [["_type","",[""]], ["_crate",objNull,[objNull]]];
	_mainCFG = missionConfigFile >> "CfgMaster" >> "Events" >> "WeaponTransport";

	if (isNull _crate) exitWith {};
	if (_type isEqualTo "") exitWith {};
	if (isNull truckMissionVeh) exitWith {};
	if !(truckMissionVeh getVariable ["transportMission",false]) exitWith {};
	if (truckMissionVeh getVariable ["inCapture",false]) exitWith {["Someone is already unloading the truck!",true,"slow"] call ANZUS_fnc_notificationSystem};
	if (truckMissionVeh distance _crate > 40) exitWith {["The transport truck must be within 40m of the crate.",true,"slow"] call ANZUS_fnc_notificationSystem};

	_allowed = false;
	_group = grpNull;
	if ((playerSide isEqualTo west) && _type isEqualTo "Cop") then {
		_allowed = true;
		_group = (group player);
	} else {
		_group = [_type] call AnzusLife_Lib_GetGroup;
		if (_group isEqualTo (group player) && (playerSide isEqualTo civilian)) then {
			_allowed = true;
		};
	};

	private _marker = "";
	private _zone = "";
	switch (_type) do { 
		case "Cartel": { 
			_marker = "gang_area_5";
			_zone = "marker_24";
		}; 
		case "Mafia": {
			_marker = "gang_area_4";
			_zone = "marker_25";
		}; 
	};

	if (!_allowed) exitWith {};

	//Setup the progress bar
	_title = format[localize "STR_GNOTF_Transport"];
	_icon = "\ArmaGamingCore\images\displays\displayCommunicationTargets\organizations.paa";

	disableSerialization;
	"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
	_ui = uiNamespace getVariable "AnzusLife_Progress";
	_controlsGroup = _ui displayCtrl 1;
	_progress = _controlsGroup controlsGroupCtrl 3;
	_pgText = _controlsGroup controlsGroupCtrl 2;
	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	_cpRate = 0.008;
	if (_type isEqualTo "Cop") then {
		["The Illegal Supply Truck has started to be unloaded at DOC!",false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	} else {
		[format["The Illegal Supply Truck has started to be unloaded at %1 Base!", _type],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	};
	[format["Keep the truck within 40m of the container!"],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_group];
	if !(_zone isEqualTo "") then {[_zone,_type,"ColorRed"] remoteExec ["AnzusLife_Lib_ChangeGangMarkerColor",2]};

	_fail = false;
	truckMissionVeh setVariable ["inCapture",true,true];
	for "_i" from 0 to 1 step 0 do {
		uiSleep 1.50;
		_cP = _cP + _cpRate;	
		_progress progressSetPosition _cP;
		_precentage = str round(_cP * 100) + "%";
		_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

		if (_cP >= 1) exitWith {};
		if (player getVariable ["inHostage",false]) exitWith {truckMissionVeh setVariable ["inCapture",false,true]; _fail = true;};
		if (!alive player || life_istazed || life_isknocked) exitWith {truckMissionVeh setVariable ["inCapture",false,true]; _fail = true;};
		if (truckMissionVeh distance2D _crate > 40) exitWith {truckMissionVeh setVariable ["inCapture",false,true]; _fail = True;};
	};
	if !(_zone isEqualTo "") then {[_zone,_type,"ColorGreen"] remoteExec ["AnzusLife_Lib_ChangeGangMarkerColor",2]};

	if(_fail) then {
		if (_type isEqualTo "Cop") then {
			["The Illegal Supply Truck at DOC has stopped being unloaded!",false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
		} else {
			[format["The Illegal Supply Truck at %1 base has stopped being unloaded!", _type],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
		};
	};

	"progressBar" cutText ["","PLAIN"];
	if (!alive player || life_istazed || life_isknocked) exitWith {truckMissionVeh setVariable ["inCapture",false,true]; };
	if (truckMissionVeh distance2D _crate > 40) exitWith {truckMissionVeh setVariable ["inCapture",false,true]; };
	if (player getVariable ["inHostage",false]) exitWith {truckMissionVeh setVariable ["inCapture",false,true]; };

	_rewardName = format ["%1_reward",_type];
	_rewardArray = getArray (_mainCFG >> _rewardName);

	deleteVehicle truckMissionVeh;

	if (isNull _crate) exitWith {};

	_time = truckMissionVeh getVariable ["startTime",0];
	_time = _time + (getNumber (_mainCFG >> "special_rewardtime"));


	_rewardAmt = (getNumber (_mainCFG >> "reward_amount"));
	if (_time > time) then {_rewardAmt = (getNumber (_mainCFG >> "special_rewardamount"));};


	_cashReward = 0;
	_rewards = [];
	for "_i" from 1 to _rewardAmt do {
		_display = "";
		_reward = (selectRandom _rewardArray) params ["_rewardType","_rewardCnt"];
		if (_rewardType isEqualTo "money") then {
			_cashReward = _cashReward + _rewardCnt;
			_display = "Cash";
		} else {
			_vItem = missionConfigFile >> "VirtualItems" >> _rewardType;
			if ( isClass _vItem ) then {
				[_crate,_rewardType,_rewardCnt] call AnzusLife_AddItemToCrate;
				_display = localize (ITEM_NAME(_rewardType))
			} else {
				_weapon = configFile >> "CfgWeapons" >> _rewardType;
				if ( isClass _weapon) then {
					_crate addWeaponCargoGlobal [_rewardType, _rewardCnt];
					_mag = (getArray (_weapon >> "magazines")) select 0;
					_crate addMagazineCargoGlobal [_mag,6 * _rewardCnt ];
					_display = getText (_weapon >> "displayName");
				};
			};
		};

		_index = [_display,_rewards] call TON_fnc_index;
		if (_index isEqualTo -1) then {
			_rewards pushBack [_display,_rewardCnt];
		} else {
			_val = _rewards select _index select 1;
			_rewards set[_index,[_display,_val + _rewardCnt]];
		};
	};

	if (_cashReward > 0) then {
		if (playerSide isEqualTo civilian) then {
			[_cashReward,_group,"Truck"] remoteExec ["AnzusLife_ReciveGangProfit",2];
		} else {
			[_cashReward] call AnzusLife_AC_Cash;
		};
	};

	_rewardTxt = "";
	{
		_amt = _x select 1;
		_name = _x select 0;
		_rewardTxt = _rewardTxt + format ["%1 x %2<br/>",[_amt] call ANZUS_fnc_numberText,_name];
	} forEach _rewards;

	

	[parseText format["<t color='#FF0000'><t size='2'>Unloaded Contents!</t></t><br/>%1",_rewardTxt],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_group];
	[format["The truck mission has been unloaded!", _type],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
}] call AnzusLife_ClientCompile;

