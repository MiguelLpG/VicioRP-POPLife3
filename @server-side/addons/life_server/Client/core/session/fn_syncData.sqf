#include "..\..\script_macros.hpp"
/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
if (isNil "life_session_time") then {life_session_time = false;};
if (life_session_time) exitWith {[localize "STR_Session_SyncdAlready",true,"slow"] call ANZUS_fnc_notificationSystem;};

_players = (allPlayers select {_x != player && player distance _x < 30});
{
    if ((unitBackpack player) isEqualTo (unitBackpack _x)) then {
        removeBackpack player;
    };
} foreach _players;

if (!life_is_arrested && !(player getVariable ["restrained",false])) then {
    EM_Climbing = false;
    EM_enable = [true, true];
    EM_heightsOn = [0.25,1,2,2.25,3];
    player setVariable ["babe_em_vars", [false, false, true]];
};

_data = getUnitLoadout player;
player setUnitLoadout _data;
[] call ANZUS_fnc_saveGear;
[6] call ANZUS_fnc_updatePartial;

["Data has been saved to the server.",false,"slow"] call ANZUS_fnc_notificationSystem;

[] spawn {
    life_session_time = true;
    sleep (5 * 60);
    life_session_time = false;
};