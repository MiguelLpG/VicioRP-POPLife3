#include "..\script_macros.hpp"
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Cop Initialization file.
*/
waitUntil {!(isNull (findDisplay 46))};
waitUntil {isNull(findDisplay 999210)};

if (life_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
    sleep 30;
};

if ((FETCH_CONST(life_coplevel) isEqualTo 0) && (FETCH_CONST(life_adminlevel) isEqualTo 0)) then {
    ["NotWhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

if((str(player) in ["cop_29","cop_30","cop_31"])) then {
	if(FETCH_CONST(life_coplevel) < 6 && !(FETCH_CONST(life_copdept) in [8])) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		Sleep 35;
	};
};


player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];
[] call ANZUS_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 8999720)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 8999720)}; //Wait for the spawn selection to be done.

if (ITEM_VALUE("keyCard") isEqualTo 0) then {
    [true,"keycard",1,"police"] call ANZUS_fnc_handleInv;
};

player setVariable ["copLevel",1,true];

life_belt_storedWeapon = "";
life_belt_lastSwitched = time;

call ANZUS_fnc_setFreq;
player setVariable ["life_is_alive", true, true];
