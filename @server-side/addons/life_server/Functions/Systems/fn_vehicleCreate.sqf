#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleCreate.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Answers the query request to create the vehicle in the database.
*/
private ["_uid","_side","_type","_classname","_color","_plate"];
params [
    ["_uid","",[""]],
    ["_side",sideUnknown,[west]],
    ["_vehicle",objNull,[objNull]],
    ["_color",[[1,1,1],[1,1,1],0.5],[[],0]],
    ["_insured",0,[0]]
];
	
if (_uid isEqualTo "" || _side isEqualTo sideUnknown || isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
_type = switch (true) do {
    case (_vehicle isKindOf "Car"): {"Car"};
    case (_vehicle isKindOf "Air"): {"Air"};
    case (_vehicle isKindOf "Ship"): {"Ship"};
};

_side = switch (_side) do {
    case west:{"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    default {"Error"};
};

_plate = round(random(1000000));
[_uid,_side,_type,_classname,_color,_plate,_insured] call ANZUS_fnc_insertVehicle;

_vehicle setVariable ["dbInfo",[_uid,_plate,_insured],true];
_vehicle setVariable ["tf_isolatedAmount",0,true];
_vehicle setVariable ["tf_hasRadio", false, true];

if (_vehicle isKindOf "Air") then {
    _vehicle addEventHandler ["IncomingMissile", { 
        params ["_target", "_ammo", "_vehicle", "_instigator"]; 
        [_target,0.01] remoteExecCall ["ANZUS_fnc_setFuel",_target];
        ["Your vehicle has been hit by a fuel tapping rocket!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",crew _target];
        _smoke = "SmokeShellOrange" createVehicle [0,0,0];
        _smoke attachTo [_target, (_target selectionPosition "hitfuel"),"hitfuel"];
    }];
};
