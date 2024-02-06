#include "..\..\script_macros.hpp"
/*
    File: fn_vehInventory.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used a refresher for the vehicle inventory / trunk menu items.
*/
private ["_veh","_tInv","_pInv","_veh_data"];
_veh = param [0,objNull,[objNull]];
if (isNull _veh || !alive _veh) exitWith {closeDialog 0;}; //If null / dead exit menu
disableSerialization;

_display = findDisplay 8005003;
_ctrlProgressMyInventory = _display displayCtrl 35;
_ctrlTextMyInventory = _display displayCtrl 47;
_ctrlProgressVehicleInventory = _display displayCtrl 42;
_ctrlTextVehicleInventory = _display displayCtrl 43;
_ctrlAmountButtonPlus = _display displayCtrl 40;
_ctrlAmountButtonMinus = _display displayCtrl 41;

_ctrlListFilterMyInventory = _display displayCtrl 36;
_ctrlListMyInventory = _display displayCtrl 37;

_ctrlListFilterVehicleInventory = _display displayCtrl 44;
_ctrlListVehicleInventory = _display displayCtrl 45;

lnbClear _ctrlListVehicleInventory;
lnbClear _ctrlListMyInventory;

_veh_data = [_veh] call ANZUS_fnc_vehicleWeight;
if ((_veh_data select 0) isEqualTo -1) exitWith {closeDialog 0};

_vehicleVirtualInventorySpace = _veh_data select 0;
_vehicleInventoryUsedSpace = _veh_data select 1;

[_ctrlListFilterVehicleInventory, _ctrlListVehicleInventory] call BIS_fnc_initListNBoxSorting;
[_ctrlListFilterMyInventory, _ctrlListMyInventory] call BIS_fnc_initListNBoxSorting;

_ctrlTextVehicleInventory ctrlSetText format ["%1 / %2", _vehicleInventoryUsedSpace, _vehicleVirtualInventorySpace];
_ctrlProgressVehicleInventory progressSetPosition (_vehicleInventoryUsedSpace / _vehicleVirtualInventorySpace);

_ctrlTextMyInventory ctrlSetText format ["%1 / %2", life_carryWeight, life_maxWeight]; 
_ctrlProgressMyInventory progressSetPosition (life_carryWeight / life_maxWeight);

trunkEditValue = compileFinal "
    params [[""_plus"", false, [false]]];
    
    private _display = findDisplay 8005003;
    private _ctrlEditAmount = _display displayCtrl 39;
    private _ctrlText = ctrlText _ctrlEditAmount;
    private _currentAmount = parseNumber _ctrlText;
    private _newAmount = 0;

    _newAmount = [(_currentAmount - 1), (_currentAmount + 1)] select _plus;
    if (_newAmount < 1) then { _newAmount = 1; };

    _ctrlEditAmount ctrlSetText str _newAmount;
";

_ctrlAmountButtonPlus ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlAmountButtonMinus ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlAmountButtonPlus ctrlAddEventHandler ["ButtonClick", {[true] call trunkEditValue;}];
_ctrlAmountButtonMinus ctrlAddEventHandler ["ButtonClick", {[false] call trunkEditValue;}];

_data = _veh getVariable ["Trunk",[]];
if (count _data isEqualTo 0) then {_veh setVariable ["Trunk",[[],0],true]; _data = [];} else {_data = (_data select 0);};
//Player Inventory Items
{
    _val = ITEM_VALUE(configName _x);
    _weight = ITEM_WEIGHT(configName _x);

    if (_val > 0) then {
        private _totalWeight = _val * _weight;
        private _index = _ctrlListMyInventory lnbAddRow ["",localize (getText(_x >> "displayName")), str _totalWeight, str _val];
        
        _icon = (getText(_x >> "icon"));
        if (!(_icon isEqualTo "")) then {
            _ctrlListMyInventory lnbSetPicture [[_index, 0],_icon];
        };
        
        _ctrlListMyInventory lnbSetData [[_index,0],configName _x];
    };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

//Trunk Inventory Items
{
    _name = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
    _val = (_x select 1);
    _weight = ITEM_WEIGHT(_x select 0);

    if (_val > 0) then {
        private _totalWeight = _val * _weight;
        private _index = _ctrlListVehicleInventory lnbAddRow ["",localize _name,str _totalWeight,str _val];
        
        _icon = M_CONFIG(getText,"VirtualItems",(_x select 0),"icon");
        if (!(_icon isEqualTo "")) then {
            _ctrlListVehicleInventory lnbSetPicture [[_index, 0],_icon];
        };
        
        _ctrlListVehicleInventory lnbSetData [[_index,0],_x select 0];
    };
} forEach _data;