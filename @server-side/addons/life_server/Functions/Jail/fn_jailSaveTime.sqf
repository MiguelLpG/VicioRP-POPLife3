
private["_ret","_time","_pid","_query"];
params [
	["_unit",objNull,[objNull]]
];



_pid = getPlayerUID _unit;
_query = format["SELECT jail_time FROM players WHERE pid='%1'", _pid];
_ret = [_query,2] call ANZUS_fnc_asyncCall;
_ret = (_ret select 0);
_time = _ret;

if((_time - 5) <= 0) exitWith {};


 _query = format["UPDATE players SET jail_time='%1' WHERE pid='%2'", _time - 5, _pid];

[_query,1] call ANZUS_fnc_asyncCall;
