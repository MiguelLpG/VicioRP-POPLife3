#include "..\..\script_macros.hpp"
/*
    File: fn_onPlayerKilled.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    When the player dies collect various information about that player
    and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
params [
    ["_unit",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];
disableSerialization;

if  !((vehicle _unit) isEqualTo _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

//Set some vars
_unit setVariable ["restrained",false,true];
_unit setVariable ["Revive",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["life_is_alive",false,true];
_unit setVariable ["taxTime",0,true];
life_disable_getIn = false;
life_disable_getOut = false;
_unit setVariable ["tf_unable_to_use_radio", true];
_unit setVariable ["isEscorting",false];

{
  detach _x;
} forEach attachedObjects player;

if (dialog) then {
    closeDialog 0;
};

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder false;
life_deathCamera cameraEffect ["Internal","Back"];
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

if(FETCH_CONST(life_adminlevel) isEqualTo 0) then {(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"];} else {};
[_killer,_unit] call ANZUS_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
    private ["_unit"];
    _unit = _this select 0;
    waitUntil {if (speed _unit isEqualTo 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

if (!isNull _killer && {!(_killer isEqualTo _unit)} && {_killer getVariable ["killFeed",false]}) then {
    [name player] remoteExec ["ANZUS_fnc_killfeed",_killer];
};

if (side _unit isEqualTo west) then {
    if ((player distance (getMarkerPos "jail_marker")) < 850) then {
        _var = missionNamespace getVariable ["AnzusLife_MajorCrime",time];
        if ((time - _var) > 1800) then {
            ["If you were killed as a part of a major crime you can press Shift+P to declare it as one.",true,"slow"] call ANZUS_fnc_notificationSystem;
        };
    };
};

life_save_gear = getUnitLoadout player;
_unit removeWeapon (primaryWeapon _unit);
_unit removeWeapon (handgunWeapon _unit);
_unit removeWeapon (secondaryWeapon _unit);
{_unit removeMagazine _x;} forEach magazines _unit;

TF_max_voice_volume = 60;

_combatLogCheck = MAIN_SETTINGS_TYPE(getNumber,"Security","combatLogFix");
if (_combatLogCheck isEqualTo 1) then {
    life_gear = [];
    [3] call ANZUS_fnc_updatePartial;
};

//Killed by cop stuff...
if (side _killer isEqualTo west && !(playerSide isEqualTo west)) then {
    life_copRecieve = _killer;
    //Did I rob the federal reserve?
    if (!life_use_atm && {CASH > 0}) then {
        [CASH,true] call AnzusLife_AC_Cash;
    };
};

life_action_inUse = false;
life_hunger = 100;
life_thirst = 100;
[_unit,true] call ANZUS_fnc_dropItems;

private _cash = missionNamespace getVariable ["alcash",0];
if (_cash > 0) then {
    _pos = ASLToATL (AGLToASL (_unit modelToWorld[0,0,0]));
    if !(isTouchingGround player) then {_pos set[2,0];};
    [_cash, _pos] call ANZUS_fnc_dropCash;
};

player setVariable ["taxTime",0,true];

[] call ANZUS_fnc_hudUpdate;
[0] call ANZUS_fnc_updatePartial;

if (playerSide isEqualTo civilian) then {
    [4] call ANZUS_fnc_updatePartial;
};

life_corpse = objNull;
[_killer,_unit] spawn {
    params [["_killer",objNull,[objNull]],["_unit",objNull,[objNull]]];
    waitUntil {!isNull life_corpse};
    if (!isNull _killer && {!(_killer isEqualTo _unit)} && {!(side _killer isEqualTo west)} && {alive _killer}) then {
        if (vehicle _killer isKindOf "LandVehicle") then {
            [_killer,7,life_corpse] spawn AnzusLife_CREATEEVIDENCE;
        } else {
            [_killer,7,life_corpse] spawn AnzusLife_CREATEEVIDENCE;            
        };
    };
};