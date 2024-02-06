#include "..\..\script_macros.hpp"
private["_time","_bail","_esc","_countDown"];

params [
    ["_ret",[],[[]]],
    ["_bad",false,[false]],
    ["_time",15,[0]],
    ["_cop",objNull,[objNull]]
];

if (isNull _cop) exitWith {};
if !((isRemoteExecuted && (remoteExecutedOwner isEqualTo 2))) exitWith {};

_minutes = _time;
life_releaseTime = time + (_time * 60);

if(life_releaseTime <= 0) then { 
    life_releaseTime = time + (15 * 60);
};

private _copName = "an unknown cop";
if (!(_cop isEqualTo player)) then {_copName = "officer " + (name _cop)}; 

[format["You have been paroled by %1 for %2 month(s)", name _cop, _time],true,"slow"] call ANZUS_fnc_notificationSystem;


[] spawn {
    _count = 0;
    while {life_arrest_parole} do {
        _count = _count + 1;

        if !(player getVariable ["parole", false]) then {
            player setVariable ["parole", true, true];
        };

        _left = life_releaseTime - time;
        _left = round (_left / 60);

        player setVariable ["parole_time",_left, true];

        if (time > life_releaseTime) then {
            life_arrest_parole = false;
            [format["Your parole has ended. Visit the DoC to have your ankle monitor taken off.", _left],true,"slow"] call ANZUS_fnc_notificationSystem;
        } else {
            if (_count % 5 == 0) then {
                
                [format["You have %1 month(s) left on your parole sentence", _left],true,"slow"] call ANZUS_fnc_notificationSystem;
            };
        };
        
        uiSleep 60;
    };
    [8] call ANZUS_fnc_updatePartial;
};
