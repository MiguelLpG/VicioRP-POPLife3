#include "..\..\script_macros.hpp"

private _display = uiNamespace getVariable ["AL_Hud",displayNull];
if (isNull _display) exitWith {};
private _display2 = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

private _itemList = _display2 displayCtrl 130002;
private _itemSelection = lbCurSel _itemList;
private _item = _itemList lbData _itemSelection;


private _param = param [0];
private _key = param [1];

if (_param isEqualTo "set") exitWith {

	switch (_key) do
	{
		case 4: {
		_display displayCtrl 9561 ctrlSetText (getText (missionconfigFile >> 'VirtualItems' >> _item >> 'icon'));
		_button = _display displayCtrl 9561;
		_button setvariable ["ITEM", _item];
		};
		case 5: {
		_display displayCtrl 9562 ctrlSetText (getText (missionconfigFile >> 'VirtualItems' >> _item >> 'icon'));
		_button = _display displayCtrl 9562;
		_button setvariable ["ITEM", _item];
		};
		case 6: {
		_display displayCtrl 9563 ctrlSetText (getText (missionconfigFile >> 'VirtualItems' >> _item >> 'icon'));
		_button = _display displayCtrl 9563;
		_button setvariable ["ITEM", _item];
		};
		case 7: {
		_display displayCtrl 9564 ctrlSetText (getText (missionconfigFile >> 'VirtualItems' >> _item >> 'icon'));
		_button = _display displayCtrl 9564;
		_button setvariable ["ITEM", _item];
		};
		case 8: {
		_display displayCtrl 9565 ctrlSetText (getText (missionconfigFile >> 'VirtualItems' >> _item >> 'icon'));
		_button = _display displayCtrl 9565;
		_button setvariable ["ITEM", _item];
		};
		case 9: {
		_display displayCtrl 9566 ctrlSetText (getText (missionconfigFile >> 'VirtualItems' >> _item >> 'icon'));
		_button = _display displayCtrl 9566;
		_button setvariable ["ITEM", _item];
		};
		case 10: {
		_display displayCtrl 9567 ctrlSetText (getText (missionconfigFile >> 'VirtualItems' >> _item >> 'icon'));
		_button = _display displayCtrl 9567;
		_button setvariable ["ITEM", _item];
		};
		default { hint "error quickbar" };
	};

};

if (_param isEqualTo "usar") exitWith {

	switch (_key) do
	{
		case 4: {
		_button = _display displayCtrl 9561;
		_objeto = _button getvariable "ITEM";
		[_objeto] call ANZUS_fnc_useItem;
		};
		case 5: {
		_button = _display displayCtrl 9562;
		_objeto = _button getvariable "ITEM";
		[_objeto] call ANZUS_fnc_useItem;
		};
		case 6: {
		_button = _display displayCtrl 9563;
		_objeto = _button getvariable "ITEM";
		[_objeto] call ANZUS_fnc_useItem;
		};
		case 7: {
		_button = _display displayCtrl 9564;
		_objeto = _button getvariable "ITEM";
		[_objeto] call ANZUS_fnc_useItem;
		};
		case 8: {
		_button = _display displayCtrl 9565;
		_objeto = _button getvariable "ITEM";
		[_objeto] call ANZUS_fnc_useItem;
		};
		case 9: {
		_button = _display displayCtrl 9566;
		_objeto = _button getvariable "ITEM";
		[_objeto] call ANZUS_fnc_useItem;
		};
		case 10: {
		_button = _display displayCtrl 9567;
		_objeto = _button getvariable "ITEM";
		[_objeto] call ANZUS_fnc_useItem;
		};
		default { hint "error quickbar" };
	};

};
