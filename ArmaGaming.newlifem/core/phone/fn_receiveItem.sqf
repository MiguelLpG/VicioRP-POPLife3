params [
	["_item", "", [""]],
	["_amount", 0, [0]],
	["_player", objNull, [objNull]]
];

if (isNull _player) exitWith {};
if (_amount isEqualto 0) exitWith {};
if (_item isEqualTo "") exitWith {};

private _displayName = localize(getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName"));

private _diff = [_item, _amount, life_carryWeight, life_maxWeight] call ANZUS_fnc_calWeightDiff;
if (_diff isEqualTo _amount) then {
	[true, _item, _amount,"give"] call ANZUS_fnc_handleInv;
	[format["%1 has given you %2 %3(s)",name _player, _amount, _displayName],true,"slow"] call ANZUS_fnc_notificationSystem;
} else {
	if (_diff <= 0) then {
		["none", _amount, _item, player] remoteExec ["ANZUS_fnc_giveItemReturn", _player];
	} else {
		if ([true, _item, _diff,"give"] call ANZUS_fnc_handleInv) then {
			[format["%1 has given you %2 %3s but you only had space for %4 the rest has been returned",name _player, _amount, _displayName, _diff],true,"slow"] call ANZUS_fnc_notificationSystem;
			["some", (_amount - _diff), _item, player] remoteExec ["ANZUS_fnc_giveItemReturn", _player];
		};
	};
};
[3] call ANZUS_fnc_updatePartial;