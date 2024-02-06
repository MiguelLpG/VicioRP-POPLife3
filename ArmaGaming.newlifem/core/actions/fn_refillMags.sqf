#include "..\..\script_macros.hpp"

private ["_loadout","_count","_price","_amt"];

_price = 0;
_amt = 0;
{
	_x params [["_class","",[""]],["_curcount",-1,[0]]];
	_count = getNumber (configFile >> "CfgMagazines" >> _class >> "count");
	if !(_count isEqualTo _curcount) then {
		_count = 1 - (_curcount / _count);
		_price = _price + (_count * 100);
		_amt = _amt + 1;
	};
} forEach magazinesAmmo player;

_price = (round _price);

if (_price > 0 && ((BANK - _price) >= 0) ) then {
	[_price,true] call AnzusLife_AC_Bank;

	_loadout = getUnitLoadout player;
	player setUnitLoadout [_loadout,true];
	[format ["Refilled %1 mags for $%2",_amt,_price],true,"slow"] call ANZUS_fnc_notificationSystem;
} else {
	if (_amt isEqualTo 0) then {
		["No mags need refilling!",true,"slow"] call ANZUS_fnc_notificationSystem;
	} else {
		["You are too poor.",true,"slow"] call ANZUS_fnc_notificationSystem;
	};

};