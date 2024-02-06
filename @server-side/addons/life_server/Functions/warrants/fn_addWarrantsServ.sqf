params [["_unit", objNull, [objNull]], ["_crimeID", -1, [1]]];

if (isNull _unit) exitWith {};
if (_crimeID < 0) exitWith {};
private _playerUID = getPlayerUID _unit;

_query = format ["INSERT INTO warrants (pid, crime_id) VALUES('%1','%2')",_playerUID,_crimeID];
[_query,1] call ANZUS_fnc_asyncCall;

[] spawn {
	sleep 1;
	[] call AnzusLife_FetchWarrants;
};