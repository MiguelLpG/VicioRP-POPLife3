#include "..\..\script_macros.hpp"
/*
    File: fn_robPerson.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Robs a person.
*/
params [
    ["_robber",objNull,[objNull]]
];
if (isNull _robber) exitWith {}; //No one to return it to?
    
if (CASH > 0) then {
    [CASH,player,_robber] remoteExecCall ["ANZUS_fnc_robReceive",_robber];

    [_robber,13] spawn AnzusLife_CREATEEVIDENCE;

    [CASH,true] call AnzusLife_AC_Cash;
    [0] call ANZUS_fnc_updatePartial;
} else {
    [localize "STR_Civ_RobFail",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_robber];
};
