#include "..\..\script_macros.hpp"
scriptName "fn_addExp";

params [
    ["_action", "", [""]],
    ["_count", 1, [1]]
];

scopeName "main";

_eventSetting = MAIN_SETTINGS("Events","Maverick");
if ((getNumber (_eventSetting >> "enable_doubleXP")) isEqualTo 1) then {
    _count = _count * 2;
};

private _baseConfig = missionConfigFile >> "Maverick_TTM";
private _actionConfig = _baseConfig >> "Actions" >> _action;
private _expGained = getNumber (_actionConfig >> "expToAdd");
private _messageEntry = _actionConfig >> "message";
private _message = getText _messageEntry;
private _level = life_currentExpLevel;
private _levelConfigBase = _baseConfig >> "Levels";
private _currentExpLevelConfig = _levelConfigBase >> format["Level_%1", life_currentExpLevel];
private _nextLevelConfig = _levelConfigBase >> format["Level_%1", _level + 1];

	
if (!isClass _nextLevelConfig) exitWith {};

private _nextLevelExp =  getNumber (_nextLevelConfig >> "expRequired");
private _nextLevelPerkPoints =  getNumber (_nextLevelConfig >> "perkPointsOnUnlock");

_expGained = _expGained * _count;

private _dif = _expGained;
private _gainedPerkPoints = 0;
private _iteratedExp = life_currentExp;
private _progressData = [];

while {_dif > 0} do {

    scopeName "iteration";

    private "_iteratedLevelExp";
    private "_iteratedPerkPoints";
    private "_iteratedLevelConfig";
    private "_iteratedCurrentConfig";
    if !(_level isEqualTo life_currentExpLevel) then {
        _iteratedLevelConfig = _levelConfigBase >> format["Level_%1", (_level + 1)];
        if (!isClass _iteratedLevelConfig) then {	
            ["Trying to break out..",false,"slow"] call ANZUS_fnc_notificationSystem;
            breakOut "iteration";
        };
        _iteratedLevelExp =  getNumber (_iteratedLevelConfig >> "expRequired");
        _iteratedPerkPoints =  getNumber (_iteratedLevelConfig >> "perkPointsOnUnlock");
        _iteratedCurrentConfig = _levelConfigBase >> format["Level_%1", _level];
    } else {
        _iteratedLevelConfig = _nextLevelConfig;
        _iteratedLevelExp = _nextLevelExp;
        _iteratedPerkPoints = _nextLevelPerkPoints;
        _iteratedCurrentConfig = _currentExpLevelConfig;
    };

    private _expGap = _iteratedLevelExp - _iteratedExp;
    _dif = _dif - _expGap;

    if (_dif < 0) exitWith {
        _progressData pushBack [_iteratedCurrentConfig, _iteratedLevelConfig, _iteratedExp, _dif + _expGap, false];
    };

    _level = _level + 1;
    _gainedPerkPoints = _gainedPerkPoints + _iteratedPerkPoints;

    _progressData pushBack [_iteratedCurrentConfig, _iteratedLevelConfig, _iteratedExp, _expGap, true];

    if (_dif isEqualTo 0) exitWith {};

    _iteratedExp = _iteratedLevelExp;
};

life_currentExpLevel = _level;
life_currentExp = life_currentExp + _expGained;
life_currentPerkPoints = life_currentPerkPoints + _gainedPerkPoints;

	
[0] call mav_ttm_fnc_clientSendUpdateToServer;
[1] call mav_ttm_fnc_clientSendUpdateToServer;
[2] call mav_ttm_fnc_clientSendUpdateToServer;
[3] call mav_ttm_fnc_clientSendUpdateToServer;

	
[_progressData, _message] spawn TTM_GUI_function_experienceAdded;