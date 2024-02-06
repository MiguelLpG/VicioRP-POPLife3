scriptName "fn_updateDatabaseEntry";
scopeName "main";
params [
	["_which", -1, [0]],
	["_toUpdate", [], [0, []]]
];

if (_toUpdate isEqualTo [] || {_which isEqualTo -1}) exitWith {};

_newplayer = call AnzusLife_Lib_GetREPlayer;	
if (isNull _newplayer) exitWith {};

_pid = getPlayerUID _newplayer;

private _query = "";
switch (_which) do {
	case 0: {
		if (_toUpdate isEqualType []) then {breakOut "main"};
		_query = format ["UPDATE players SET exp_level = '%1' WHERE pid = '%2'", _toUpdate, _pid];
	};

	case 1: {
		if (_toUpdate isEqualType []) then {breakOut "main"};
		_query = format ["UPDATE players SET exp_total = '%1' WHERE pid = '%2'", _toUpdate, _pid];
	};

	case 2: {
		if (_toUpdate isEqualType []) then {breakOut "main"};
		_query = format ["UPDATE players SET exp_perkPoints = '%1' WHERE pid = '%2'", _toUpdate, _pid];
	};

	case 3: {
		if (_toUpdate isEqualType 0) then {breakOut "main"};
		_toUpdate call mav_ttm_fnc_tinyIntConverter;
		_query = format ["UPDATE players SET exp_perks = '%1' WHERE pid = '%2'", _toUpdate, _pid];
	};
};

if (_query isEqualTo "") exitWith {};
[_query, 1] call ANZUS_fnc_asyncCall;