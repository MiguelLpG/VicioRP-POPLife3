#include "..\..\script_macros.hpp"
params [
	["_player", objNull, [objNull]],
	["_amount", 0, [0]]
];

if ((isNull _player) || (_amount isEqualTo 0)) exitWith {};
[format["%1 has given you $%2",name _player,([_amount] call ANZUS_fnc_numberText)],true,"slow"] call ANZUS_fnc_notificationSystem;

[_amount] call AnzusLife_AC_Cash;

[6] call ANZUS_fnc_updatePartial;