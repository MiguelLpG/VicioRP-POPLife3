/*
    File: fn_searchAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the searching process.
*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
[localize "STR_NOTF_Searching",true,"slow"] call ANZUS_fnc_notificationSystem;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {[localize "STR_NOTF_CannotSearchPerson",true,"slow"] call ANZUS_fnc_notificationSystem;};
[] remoteExecCall ["ANZUS_fnc_removeWeaponAction",_unit];
[player] remoteExec ["ANZUS_fnc_searchClient",_unit];
life_action_inUse = true;