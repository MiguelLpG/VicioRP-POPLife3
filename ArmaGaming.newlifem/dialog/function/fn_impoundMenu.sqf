#include "..\..\script_macros.hpp"
/*
	File: fn_impoundMenu.sqf
	Author: Arma-Gaming
*/
private ["_vehicles","_control"];
disableSerialization;
_vehicles = param [0,[],[[]]];

private _display = findDisplay 98123;
private _ctrlFooter = _display displayCtrl 27;
private _ctrlFooterRetrieveVehicle = _ctrlFooter controlsGroupCtrl 1;
private _ctrlFooterSellVehicle = _ctrlFooter controlsGroupCtrl 2;
private _ctrlFooterInsureVehicle = _ctrlFooter controlsGroupCtrl 3;

_ctrlFooterRetrieveVehicle ctrlEnable false;
_ctrlFooterSellVehicle ctrlEnable false;
_ctrlFooterInsureVehicle ctrlEnable false;

waitUntil {!isNull (findDisplay 98123)};

if (_vehicles isEqualTo []) exitWith {
	["You do not have any vehicles in the garage.",true,"slow"] call ANZUS_fnc_notificationSystem;
	closeDialog 0;
};

private _ctrlFilter = _display displayCtrl 25;
private _ctrlList = _display displayCtrl 26;

_ctrlFooterRetrieveVehicle ctrlAddEventHandler ["ButtonClick", {[] call ANZUS_fnc_unimpound;}];
_ctrlFooterSellVehicle ctrlAddEventHandler ["ButtonClick", {closeDialog 0; [] call ANZUS_fnc_sellGarage;}];
_ctrlFooterInsureVehicle ctrlAddEventHandler ["ButtonClick", {_this spawn ANZUS_fnc_insureVehicle;}];

[_ctrlFilter, _ctrlList] call BIS_fnc_initListNBoxSorting;

{
	private _vehicleID = _x select 0;
	private _vehicleClass = _x select 2;
	if (isClass (configFile >> "CfgVehicles" >> _vehicleClass)) then {
		private _insured = _x select 9;
		private _insuredText = ["No","Yes"] select (_insured isEqualTo 1);
		private _vehicleInfo = [_vehicleClass] call ANZUS_fnc_fetchVehInfo;
		private _picturePath = _vehicleInfo select 2;
		private _displayName = _vehicleInfo select 3;
		private _vehicleCategory = _vehicleInfo select 4;
		private _maxspeed = _vehicleInfo select 8;
		private _numberOfSeats = _vehicleInfo select 10;
		private _horsepower = _vehicleInfo select 11;

		private _index = _ctrlList lnbAddRow [_displayName, _vehicleCategory, str(_numberOfSeats), str(_horsepower), str(_maxspeed),_insuredText];
		_ctrlList lnbSetPicture [[_index, 0], _picturePath];
		_ctrlList lnbSetData [[_index, 0], _vehicleClass];
		_ctrlList lnbSetValue [[_index, 0],_vehicleID];
	};
	true
} count _vehicles;

_ctrlList ctrlAddEventHandler ["LBSelChanged",{
    params ["_control", "_selectedIndex"];
    _insured = _control lnbText [ _selectedIndex,5];
    private _display = ctrlParent _control;
    private _ctrlFooter = _display displayCtrl 27;

    private _ctrlFooterInsureVehicle = _ctrlFooter controlsGroupCtrl 3; 
    _ctrlFooterInsureVehicle ctrlEnable (_insured isEqualTo "No");  

}];

_ctrlList lnbSetCurSelRow 0;
_ctrlFooterRetrieveVehicle ctrlEnable true;
_ctrlFooterSellVehicle ctrlEnable true;
