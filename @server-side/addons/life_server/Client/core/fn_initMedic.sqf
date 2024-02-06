#include "..\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the medic..
*/
waitUntil {!(isNull (findDisplay 46))};
waitUntil {isNull(findDisplay 999210)};

if ((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

[] call ANZUS_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 8999720)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 8999720)}; //Wait for the spawn selection to be done.

player setUnitTrait ["Medic",true];
player setVariable ["life_is_alive", true, true];
player setVariable ["medLevel",1,true];