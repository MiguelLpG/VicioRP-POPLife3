#include "\life_server\script_macros.hpp"

private["_unit","_bad","_id","_ret","_time"];




params[["_unit", objNull], ["_bad", false], ["_time", 15], ["_cop", objNull], ["_parole", false]];
if (isNull _unit) exitWith {};
if (isNull _cop) exitWith {};


if(_bad) then {//Load time from database
 _query = format["SELECT jail_time FROM players WHERE pid='%2'", _time, getPlayerUID _unit];
 _result = [_query,2] call ANZUS_fnc_asyncCall;
 _result = (_result select 0);
 _time = _result;
} else {
 _query = format["UPDATE players SET jail_time='%1',parole='%2' WHERE pid='%3'", _time, _parole, getPlayerUID _unit];
 _result = [_query,1] call ANZUS_fnc_asyncCall;
};
_id = owner _unit;

//_ret = [_unit] call ANZUS_fnc_wantedPerson;
if (_parole) then {
	diag_log format["%1 is on parole for %2", name _unit, _time];
	[_ret,_bad,_time,_cop] remoteExec ["ANZUS_fnc_ParoleMe",_id];
} else {
	[_ret,_bad,_time,_cop] remoteExec ["ANZUS_fnc_jailMe",_id];
};