#include "..\..\script_macros.hpp"
/*
    File: fn_spikeStrip.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Creates a spike strip and preps it.
*/
private ["_spikeStrip"];
if !(isNull(objectParent player)) exitWith {["You cannot deploy spike strips in a vehicle!",false,"slow"] call ANZUS_fnc_notificationSystem;};
_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable ["AnzusLife_DroppedItem","spikeDeployed",true];

life_spikestrip = _spikeStrip;
waitUntil {isNull life_spikeStrip};
if (isNull _spikeStrip) exitWith {life_spikestrip = objNull;};

_pos = getPosWorld _spikeStrip;
_ins = lineIntersectsSurfaces [_pos , _pos vectorAdd [0,0,-300] ,_spikeStrip,objNull,true,1,"GEOM","NONE"];
if ((count _ins) isEqualTo 0) then {
	_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
} else {
	_spikeStrip setPosASL (_ins select 0 select 0); 
	_spikeStrip setVectorUp (_ins select 0 select 1);
};
_spikeStrip setDamage 1;

if (life_HC_isActive) then {
    [_spikeStrip] remoteExec ["HC_fnc_spikeStrip",HC_Life];
} else {
    [_spikeStrip] remoteExec ["TON_fnc_spikeStrip",RSERV];
};
