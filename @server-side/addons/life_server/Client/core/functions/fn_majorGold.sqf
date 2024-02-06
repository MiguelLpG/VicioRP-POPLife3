#include "..\..\script_macros.hpp"
private ["_uiDisp","_time","_timer","_amt","_item","_cash","_cashRand","_bomb","_reqItem","_perkTime"];

params [["_obj",objNull,[objNull]], ["_ply",objNull,[objNull]], "", ["_type","",[""]]];

_var = missionNamespace getVariable ["AnzusLife_MajorCrime",time];
_formatTime = [(1800 - (ceil(serverTime - _var))), "MM", false] call BIS_fnc_secondsToString; 
if ((time - _var) < 1800) exitWith {[format["There has been a recent major crime, you must wait %1 more minutes.",_formatTime],true,"slow"] call ANZUS_fnc_notificationSystem;};

if (isNull _obj) exitWith {};
if (isNull _ply) exitWith {};
if (_obj getVariable ["bankOpen",false]) exitWith {["Safe is already open!",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_obj getVariable ["chargeplaced",false]) exitWith {["Charge already placed.!",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_type isEqualTo "") exitWith {["A dev has been dumb, tell them it is the Action.",true,"slow"] call ANZUS_fnc_notificationSystem;};
if !(_ply isEqualTo player) exitWith {["You are not equal to yourself.",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((_ply distance _obj) > 50) exitWith {["Too far away",true,"slow"] call ANZUS_fnc_notificationSystem;};
if !(playerSide isEqualTo civilian) exitWith {["You need to be a civ?",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((west countSide playableUnits) < 2) exitWith {[ format ["There are %1 cop(s) online, 2 cops are needed." , (west countSide playableUnits)],true,"slow"] call ANZUS_fnc_notificationSystem;};

_class = MAIN_SETTINGS("MajorCrimes",_type);
if !(isClass _class) exitWith {["A dev has been dumb, tell them it is the config.",true,"slow"] call ANZUS_fnc_notificationSystem;};

_reqItem = getText (_class >> "requiredItem");
if(!([false,_reqItem,1,"major"] call ANZUS_fnc_handleInv)) exitWith { [format ["You dont have a %1", localize (getText (missionConfigFile >> "VirtualItems" >> _reqItem >> "displayName"))],false,"slow"] call ANZUS_fnc_notificationSystem; };

//_amt = getNumber (_class >> "amount");

life_major_amount = nil;
[] remoteExecCall ["AnzusLife_TotalItems", 2];
_time = time;
waitUntil {!isNil "life_major_amount" || (time - _time) > 5};

if ((time - _time) > 5) then {
	life_major_amount = 6;
} ;

_amt = life_major_amount;
if (_amt > 9) then {
	_amt = 9;
};

if (configName _class == "bank") then {
	_amt = ceil (_amt / 2);
};
_item = selectRandom (getArray (_class >> "items"));

_time = ((getNumber (_class >> "time") ));
_perkTime = ((missionNamespace getVariable ["mav_ttm_var_robbingMultiplier", 1]) - 1);
_time = _time - (_time * _perkTime);
_time = _time + time;

[_type] remoteExec ['ANZUS_fnc_AANBank',-2];
missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];

disableSerialization;
"lifeTimer" cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_obj setVariable ["chargeplaced",true,true];

for "_i" from 0 to 1 step 0 do {
	if (isNull _uiDisp) then {
		"lifeTimer" cutRsc ["life_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if (round(_time - time) < 1) exitWith {};
	if (!(_obj getVariable ["chargeplaced",false])) exitWith {};
	_timer ctrlSetText format ["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
"lifeTimer" cutText["","PLAIN"];
if (!(_obj getVariable ["chargeplaced",false])) exitWith {};
_weight = ITEM_WEIGHT(_item);
_totalweight = _weight * _amt;

_obj setVariable ["chargeplaced",false,true];
_obj setVariable ["Trunk",[[[_item,_amt]],_totalweight],true]; 
_obj setVariable ["bankOpen",true,true];
_obj setVariable ["openInv",false,true];
_obj setVariable ["openInvPID",nil,true];
missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL _obj select 0, getPosATL _obj select 1, (getPosATL _obj select 2)+0.5];
["The safe has been opened got to it and press T to collect your earnings!",true,"slow"] call ANZUS_fnc_notificationSystem;

switch (_type) do { 
	case "Fed": {
		[true,"relicFed",1,"major"] call ANZUS_fnc_handleInv;

		if (!isNil {(group player) getVariable ["gang_name",""]}) then {
	        _gangrole = (group player) getVariable ["gang_role",[]];
	        if (_gangrole isEqualTo []) exitWith {};
	        	
	        _gangselect = _gangrole select 0;
	        if (_gangselect != 0) then {
	            _task = "Defunding the Cartel";
	            _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
	            if (!_check) then {[_task] remoteExec ["AnzusLife_UnlockTask",2];};
	        };
	    };
	}; 

	case "Bank": {
		if (!isNil {(group player) getVariable ["gang_name",""]}) then {
	        _gangrole = (group player) getVariable ["gang_role",[]];
	        if (_gangrole isEqualTo []) exitWith {};
	        	
	        _gangselect = _gangrole select 0;
	        if (_gangselect != 0) then {
	            _task = "Defunding the Mafia";
	            _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
	            if (!_check) then {[_task] remoteExec ["AnzusLife_UnlockTask",2];};
	        };
	    };
	}; 

	case "Casino": {};
};
