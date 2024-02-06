params [["_warrantsID", 0, [0]],["_deleteAll",false,[false]]];

if (_deleteAll) then {
	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	_query = format ["DELETE FROM warrants WHERE pid = %1",getPlayerUID _newplayer];
	[_query,1] call ANZUS_fnc_asyncCall;
} else {
	_query = format ["DELETE FROM warrants WHERE id = %1",_warrantsID];
	[_query,1] call ANZUS_fnc_asyncCall;
};