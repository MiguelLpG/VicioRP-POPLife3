
private ["_vid","_sp","_pid","_query","_type","_thread"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,2500,[0]] call BIS_fnc_param;
_unit = [_this,3,objNull,[objNull]] call BIS_fnc_param;
_type = [_this,4,"",[""]] call BIS_fnc_param;

if (_vid isEqualTo -1 || _pid isEqualTo "" || _sp isEqualTo 0 || isNull _unit || _type isEqualTo "") exitWith {};
_unit = owner _unit;

_query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND id='%2'",_pid,_vid];

_thread = [_query,1] call ANZUS_fnc_asyncCall;