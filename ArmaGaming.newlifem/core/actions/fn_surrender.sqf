#include "..\..\script_macros.hpp"
/*
    File: fn_surrender.sqf
    Author:

    Description: Causes player to put their hands on their head.
*/	
if (player getVariable ["restrained",false]) exitWith {};
if (player getVariable ["Escorting",false]) exitWith {};
if (vehicle player != player) exitWith {};

if (player getVariable ["playerSurrender",false]) then {
    player setVariable ["playerSurrender",false,true];
    player setVariable ["tf_unable_to_use_radio", false];
} else {
    player setVariable ["playerSurrender",true,true];
    player setVariable ["tf_unable_to_use_radio", true];
};

if (player getVariable "playerSurrender" isEqualTo false) exitWith {
	player playActionNow "Foski_StopSurrendering";
};

player playAction "The_Programmer_Surrender";