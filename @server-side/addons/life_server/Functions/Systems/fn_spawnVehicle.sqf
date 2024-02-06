#include "\life_server\script_macros.hpp"
/*
    File: fn_spawnVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Sends the query request to the database, if an array is returned then it creates
    the vehicle if it's not in use or dead.
*/
params [
    ["_vid", -1, [0]],
    ["_pid", "", [""]],
    ["_sp", [], [[],""]],
    ["_unit", objNull, [objNull]],
    ["_price", 0, [0]],
    ["_dir", 0, [0]],
    "_spawntext"
];

private _unit_return = _unit;
private _name = name _unit;
private _side = side _unit;
private _unitID = owner _unit;

if (_vid isEqualTo -1 || {_pid isEqualTo ""}) exitWith {};
if (_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;

private _servIndex = serv_sv_use find _vid;

private _query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory, gear, fuel, damage, blacklist,insured FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];

private _tickTime = diag_tickTime;
private _queryResult = [_query,2] call ANZUS_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {};

private _vInfo = _queryResult;
if (isNil "_vInfo") exitWith {serv_sv_use deleteAt _servIndex;};
if (count _vInfo isEqualTo 0) exitWith {serv_sv_use deleteAt _servIndex;};

if ((_vInfo select 5) isEqualTo 0) exitWith {
    serv_sv_use deleteAt _servIndex;
    [1,"STR_Garage_SQLError_Destroyed",true,[_vInfo select 2]] remoteExecCall ["ANZUS_fnc_broadcast",_unitID];
};

if ((_vInfo select 6) isEqualTo 1) exitWith {
    serv_sv_use deleteAt _servIndex;
    [1,"STR_Garage_SQLError_Active",true,[_vInfo select 2]] remoteExecCall ["ANZUS_fnc_broadcast",_unitID];
};

private "_nearVehicles";

private _vehSize = 10;
private _class = (configFile >> "CfgVehicles" >> (_vInfo select 2) >> "mapSize");

if (isClass _class && isNumber _class && (getNumber _class) < 10) then {
    _vehSize = (getNumber _class) + 1;
};

if !(_sp isEqualType "") then {
    _nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],_vehSize];
} else {
    _nearVehicles = [];
};

if (count _nearVehicles > 0) exitWith {
    serv_sv_use deleteAt _servIndex;
    [_price,_unitID] remoteExecCall ["ANZUS_fnc_garageRefund",_unitID];
    [1,"STR_Garage_SpawnPointError",true] remoteExecCall ["ANZUS_fnc_broadcast",_unitID];
};

_query = format ["UPDATE vehicles SET active='1', damage='""[]""' WHERE pid='%1' AND id='%2'",_pid,_vid];

private _wasIllegal = _vInfo select 13;
_wasIllegal = if (_wasIllegal isEqualTo 1) then { true } else { false };

[_query,1] call ANZUS_fnc_asyncCall;

private "_vehicle";
if (_sp isEqualType "") then {
    _vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"];
    //waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
    _vehicle allowDamage false;
    _position = (getPosATL player) findEmptyPosition [0,50];
    _vehicle setPosATL _position;
} else {
    _vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
    //waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
    _vehicle allowDamage false;
    _vehicle setPos _sp;
    _vehicle setVectorUp (surfaceNormal _sp);
    _vehicle setDir _dir;
};
_vehicle allowDamage true;
	
[_vehicle] remoteExecCall ["ANZUS_fnc_addVehicle2Chain",_unitID];
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;
_vehicle lock 2;
_vehicle setVariable ["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable ["dbInfo",[(_vInfo select 4),(_vInfo select 7),(_vInfo select 14)],true];
_className = typeOf _vehicle;

_vehicle disableTIEquipment true;
[_vehicle] call ANZUS_fnc_clearVehicleAmmo;

    _vehicle setVariable ["Trunk",[[],0],true];
//};

if (MAIN_SETTINGS_TYPE(getNumber,"Saving","save_vehicle_fuel") isEqualTo 1) then {
    _vehicle setFuel (_vInfo select 11);
}else{
    _vehicle setFuel 1;
};

	
if ((_vInfo select 1) isEqualTo "civ" && (_vInfo select 2) isEqualTo "B_Heli_Light_01_F" && !((_vInfo select 8) isEqualTo 13)) then {
    [_vehicle,"civ_littlebird",true] remoteExecCall ["ANZUS_fnc_vehicleAnimate",_unitID];
};

["Your vehicle has spawned!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_unitID];

serv_sv_use deleteAt _servIndex;

if!(isNull _unit) then {
    _unit moveInDriver _vehicle;
};
_vehicle addEventHandler ["HandleDamage",{((_this select 2) / 2);}];

if (_vehicle isKindOf "Air") then {
    _vehicle addEventHandler ["IncomingMissile", { 
        params ["_target", "_ammo", "_vehicle", "_instigator"]; 
        [_target,0.01] remoteExecCall ["ANZUS_fnc_setFuel",_target];
        ["Your vehicle has been hit by a fuel tapping rocket!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",crew _target];
        _smoke = "SmokeShellOrange" createVehicle [0,0,0];
        _smoke attachTo [_target, (_target selectionPosition "hitfuel"),"hitfuel"];

    }];
};

_vehicle setVariable ["tf_isolatedAmount",0,true];
_vehicle setVariable ["tf_hasRadio", false, true]; 
[_vid, _vehicle, 3] spawn mav_tuning_fnc_getTuningFromDB; 