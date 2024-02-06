#include "..\..\script_macros.hpp"

private ["_time"];

if (isNil "life_ArrestedPlayer") exitWith {};
if (!isPlayer life_ArrestedPlayer || isNull life_ArrestedPlayer) exitWith {};
if(playerSide != west) exitWith {};

_time = ctrlText 23;
_officerName = lbText[22, (lbCurSel 22)];

if (_officerName isEqualTo "") exitWith {
	["You must select the officer who arrested the suspect",true,"slow"] call ANZUS_fnc_notificationSystem;
};

if(! ([_time] call ANZUS_fnc_isNumber)) exitWith {
	[localize "STR_ATM_notnumeric",true,"slow"] call ANZUS_fnc_notificationSystem;
};

_time = parseNumber _time;
_time = round _time;

_jailSettings = MAIN_SETTINGS("Jail","Settings");
_minTime = getNumber(_jailSettings >> "minTime");
_maxTime = getNumber(_jailSettings >> "maxTime");

if(_time < _minTime || _time > _maxTime) exitWith {[format["You can only send to jail between %1-%2 months!",_minTime,_maxTime],true,"slow"] call ANZUS_fnc_notificationSystem;};
closeDialog 0;
[life_ArrestedPlayer, _time] call ANZUS_fnc_arrestAction;

_officer = allPlayers select {name _x == _officerName && side _x == west};
if (_officer isEqualTo []) exitWith {};

_officer = _officer select 0;
_reward = _time * 100;

[format["A player you arrested has been jailed for %1 months and you've received $%2 as a reward.", _time, ([_reward] call ANZUS_fnc_numberText)],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_officer];
[_reward] remoteExec ["AnzusLife_AC_Bank",_officer];