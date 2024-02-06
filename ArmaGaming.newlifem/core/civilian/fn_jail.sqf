#include "..\..\script_macros.hpp"
/*
    File: fn_jail.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the initial process of jailing.
*/
private ["_illegalItems"];
params [
    ["_unit",objNull,[objNull]],
    ["_bad",false,[false]],    
    ["_time",15,[0]],  
    ["_cop",objNull,[objNull]],
    ["_parole",false,[false]]
];

if (isNull _unit) exitWith {}; //Dafuq?
if (isNull _cop) exitWith {};
if ( !((side _cop) isEqualTo west) && isRemoteExecuted ) exitWith {};
if !(_unit isEqualTo player) exitWith {}; //Dafuq?

if (life_HC_isActive) then {
    [player,_bad,_time,_cop,_parole] remoteExecCall ["HC_fnc_jailSys",HC_Life];    
} else {
    [player,_bad,_time,_cop,_parole] remoteExecCall ["ANZUS_fnc_jailSys",RSERV];    
};

player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];

_jailLocation = "CarcelAlcatraz";
_allJails = MAIN_SETTINGS("Jail","Locations");
_jailSettings = MAIN_SETTINGS("Jail","Settings");

_myJail = _allJails >> _jailLocation;
_prisonerSpawns = getArray(_myJail >> "JailCellLocations" >> "jailPositions");
_illegalItems = getArray(_jailSettings >> "jail_seize_vItems");

[0,true] remoteExec ["ANZUS_fnc_delWarrantsServ",2];


if (_parole || life_arrest_parole) exitWith {
    life_arrest_parole = true;
    player setVariable ["parole", true, true];
    [5] call ANZUS_fnc_updatePartial;
    [8] call ANZUS_fnc_updatePartial;
};

if (life_is_arrested) exitWith {
    if (isNil "life_releaseTime") exitWith {
        life_releaseTime = time;
    };
    _time = (_time * 60);
    _timeLeft = life_releaseTime - time;
    
    _jailSettings = MAIN_SETTINGS("Jail","Settings");
    _max = getNumber(_jailSettings >> "maxTime");
    if ((_time + _timeLeft) > (_max * 60)) exitWith {
        ["The total time given to the prisoner exceeds the max time",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_cop];
    };
    life_releaseTime = (time + _timeLeft + _time);

    [format["The prisoner now has a total of %1 months in their sentence",round((life_releaseTime - time) / 60)],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_cop];
}; // stack arrest times for crimes in jail

if (getNumber(_myJail >> "JailCellLocations" >> "useModelToWorld") isEqualTo 1) then {
    if (isNil "AL_Jail") then {
        ["THE JAIL VARIABLE IS NIL, TELL A DEV",true,"slow"] call ANZUS_fnc_notificationSystem;
        player setPosATL [7864.13,8670.91,0.455685];
    } else {
        if (isNull AL_Jail) then {
            ["THE JAIL VARIABLE IS NULL, TELL A DEV",true,"slow"] call ANZUS_fnc_notificationSystem;
            player setPosATL [7864.13,8670.91,0.455685];
        } else {
            player setPosATL (AL_Jail modelToWorld (selectRandom _prisonerSpawns));
        };  
    };
} else {
    player setPosATL (selectRandom _prisonerSpawns);
};

player allowDamage false;
uiSleep 3; 
player allowDamage true;

[CASH,true] call AnzusLife_AC_Cash;
[0] call ANZUS_fnc_updatePartial;

if (_bad) then {
    waitUntil {alive player};
    sleep 1;
};

if (player distance (getMarkerPos "jail_marker") > 90) then {
    if (getNumber(_myJail >> "JailCellLocations" >> "useModelToWorld") isEqualTo 1) then {
        player setPosATL (AL_Jail modelToWorld (selectRandom _prisonerSpawns));
    } else {
        player setPosATL (selectRandom _prisonerSpawns);
    };
    
    player allowDamage false;
    uiSleep 3; 
    player allowDamage true;
};

if ((getNumber(_jailSettings >> "jail_autoSeizeInv")) isEqualTo 1) then {
    [] spawn ANZUS_fnc_seizeClient;
    removeAllWeapons player;
    {player removeMagazine _x} forEach (magazines player);
}; 

{
    _amount = ITEM_VALUE(_x);
    if (_amount > 0) then {
        [false,_x,_amount,"jail"] call ANZUS_fnc_handleInv;
    };
} forEach _illegalItems;

call ANZUS_fnc_stripDownPlayer;

_jailSettings = MAIN_SETTINGS("Jail","Settings");
_jailLoadout = _jailSettings >> "Loadout";

private _uniform = getText(_jailLoadout >> "uniform");
private _backpack = getText(_jailLoadout >> "backpack");
private _headgear = getText(_jailLoadout >> "headgear");
private _goggles = getText(_jailLoadout >> "goggles");
private _vest = getText(_jailLoadout >> "vest");

if (_uniform != "") then {player forceAddUniform _uniform};
if (_backpack != "") then {player addBackpack _backpack};
if (_headgear != "") then {player addHeadgear _backpack};
if (_goggles != "") then {player addHeadgear _goggles};
if (_vest != "") then {player addVest _vest};

[] call ANZUS_fnc_saveGear;

life_is_arrested = true;
player setVariable ["arrested", true, true];


[5] call ANZUS_fnc_updatePartial;
