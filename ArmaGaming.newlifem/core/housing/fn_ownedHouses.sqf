params[["_cop", objNull]];
if (isNull _cop) exitWith {};

[player, life_houses] remoteExecCall ["ANZUS_fnc_ownedHousesResponse", _cop];
