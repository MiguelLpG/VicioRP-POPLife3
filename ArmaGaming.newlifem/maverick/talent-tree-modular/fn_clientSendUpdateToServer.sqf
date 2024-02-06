scriptName "fn_clientSendUpdateToServer";

params [
	["_which", -1, [0]]
];

if (_which isEqualTo -1) exitWith {};

private _toSend = switch (_which) do {
	case 0: {life_currentExpLevel};
	case 1: {life_currentExp};
	case 2: {life_currentPerkPoints};
	case 3: {life_currentExpPerks};
};

[_which, _toSend] remoteExecCall ["mav_ttm_fnc_updateDatabaseEntry", 2];