params [
	["_vid",-1,[0]]
];

_newplayer = call AnzusLife_Lib_GetREPlayer;	
if (isNull _newplayer) exitWith {};
if (_vid isEqualTo -1) exitWith {};

_query = format ["SELECT insured FROM vehicles WHERE id = '%1' AND pid = '%2'",_vid,getPlayerUID _newplayer];

_queryResult = [_query,2] call ANZUS_fnc_asyncCall;

if (_queryResult isEqualTo []) exitWith {};

if ((_queryResult select 0) isEqualTo 1) exitWith {};

_query = format ["UPDATE vehicles SET insured='1' WHERE id='%1' AND pid='%2'",_vid,getPlayerUID _newplayer];
_queryResult = [_query,1] call ANZUS_fnc_asyncCall;