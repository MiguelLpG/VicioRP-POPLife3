#include "..\..\script_macros.hpp"
/*
    File: fn_knockedOut.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts and monitors the knocked out state.
*/
params [
    ["_target",objNull,[objNull]],
    ["_shanked",false,[false]]
];

if (!isRemoteExecuted) exitWith {};
if (isNull _target) exitWith {};
if ((name _target) isEqualTo "") exitWith {};

if (_shanked) then {
	[format ["%1 has shanked you, and has harmed your legs.",name _target],false,"slow"] call ANZUS_fnc_notificationSystem;
	player setHit ["legs",0.6];
} else {
	[format [localize "STR_Civ_KnockedOut",name _target],false,"slow"] call ANZUS_fnc_notificationSystem;
};

life_isknocked = true;
player switchMove "";
[] call ANZUS_fnc_ragdoll;
player setVariable ["tf_unable_to_use_radio", true];
_talk = player getVariable ["tf_voiceVolume",1];
player setVariable ["tf_voiceVolume",0,true];
sleep 9;
life_isknocked = false;
player setVariable ["robbed",false,true];
player setVariable ["tf_unable_to_use_radio", false];
player setVariable ["tf_voiceVolume",_talk,true];
