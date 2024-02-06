#include "..\..\script_macros.hpp"
/*
    File: fn_restrain.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Restrains the client.
*/
private ["_cop","_player","_vehicle"];
params[["_object",objNull,[objNull]]];
if (isNull _object) exitWith {};
_player = player;
_vehicle = vehicle player;

//Monitor excessive restrainment
[side _object] spawn {
    params ["_side"];
    private "_time";
    for "_i" from 0 to 1 step 0 do {
        _time = time;
        waitUntil {(time - _time) > (5 * 60)};

        if (!(player getVariable ["restrained",false])) exitWith {};
        if (!([_side,getPos player,30] call ANZUS_fnc_nearUnits) && (player getVariable ["restrained",false]) && isNull objectParent player) exitWith {
            player setVariable ["restrained",false,true];
            player setVariable ["Escorting",false,true];
            player setVariable ["transporting",false,true];
            detach player;
			[localize "STR_Cop_ExcessiveRestrain",false,"slow"] call ANZUS_fnc_notificationSystem;        
		};
    };
};

[format[localize "STR_Cop_Restrained",name _object],false,"slow"] call ANZUS_fnc_notificationSystem;

player addMagazine [(currentMagazine player), player ammo (currentWeapon player)];
player setAmmo [currentWeapon player, 0];
player action ["SwitchWeapon", player, player, 100];
player setVariable ["tf_unable_to_use_radio", true];
player setVariable ["restrained",true,true];
player setVariable ["restrainType",side _object,true];
EM_enable = [false,false];
EM_heightsOn = [0,0,0,0,0];
life_disable_getIn = true;
life_disable_getOut = false;

[player] spawn {
    params ["_player"];
    while {_player getVariable ["restrained",false]} do {
        if (isNull (objectParent _player)) then {
            _player playAction "The_Programmer_Restrain";
            _player forceWalk true;
            _player allowSprint false;
        };
        uiSleep 0.05;
    };

};


while {player getVariable "restrained"} do {
    if (isNull objectParent player) then {
        player playAction "The_Programmer_Restrain";
        player forceWalk true;
        player allowSprint false;
    };

    if ((currentWeapon player) != "") then {
        player action ["SwitchWeapon", player, player, 100];
    };

    _state = vehicle player;
    waitUntil {!(player getVariable "restrained") || vehicle player != _state};

    if (!alive player) exitWith {
        player setVariable ["restrained",false,true];
        player setVariable ["Escorting",false,true];
        player setVariable ["transporting",false,true];
        detach _player;
    };

    if (!alive _object) then {
        player setVariable ["Escorting",false,true];
        detach player;
    };

    if (!(isNull objectParent player) && life_disable_getIn) then {
        player action["eject",vehicle player];
    };

    if (!(isNull objectParent player) && !(vehicle player isEqualTo _vehicle)) then {
        _vehicle = vehicle player;
    };

    if (isNull objectParent player && life_disable_getOut) then {
        player moveInCargo _vehicle;
    };

    if (!(isNull objectParent player) && life_disable_getOut && (driver (vehicle player) isEqualTo player)) then {
        player action["eject",vehicle player];
        player moveInCargo _vehicle;
    };

    if (!(isNull objectParent player) && life_disable_getOut) then {
        _turrets = [[-1]] + allTurrets _vehicle;
        {
            if (_vehicle turretUnit [_x select 0] isEqualTo player) then {
                player action["eject",vehicle player];
                sleep 1;
                player moveInCargo _vehicle;
            };
        }forEach _turrets;
    };

    uiSleep 0.1;
};

if (alive player) then {
    player playAction "Foski_UnCuff_Back";
    player forceWalk false;
    player allowSprint true;
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    detach player;
};
player setVariable ["restrainType",nil,true];
EM_enable = [true, true];
EM_heightsOn = [0.25,1,2,2.25,3];