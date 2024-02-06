#include "..\..\script_macros.hpp"
/*
    File: fn_virt_update.sqf
    Author: Arma-Gaming

    Description:
    Update and fill the virtual shop menu.
*/

disableSerialization;
if (!isClass(missionConfigFile >> "VirtualShops" >> life_shop_type)) exitWith {closeDialog 0; [localize "STR_NOTF_ConfigDoesNotExist",true,"slow"] call ANZUS_fnc_notificationSystem;}; //Make sure the entry exists..

private _availableItems = M_CONFIG(getArray,"VirtualShops",life_shop_type,"items");
private _display = findDisplay 889922;
private _ctrlListItems = _display displayCtrl 83;
private _searchFilter = toLower(ctrlText 80);

private _multiplier = getNumber(missionConfigFile >> "VirtualShops" >> "priceMultiplier");
if (playerSide in [west, independent]) then {
    _multiplier = 1;
};

// Clear items of listnbox
lnbClear _ctrlListItems;

// Loop through available items
{
    private _configClass = missionConfigFile >> "VirtualItems" >> _x;
    private _displayName = localize (getText (_configClass >> "displayName"));
    private _check = localize (getText (_configClass >> "check"));

    if (_check isEqualTo "") then {
        _check = true;
    } else {
        _check = (call ( compile _check));
    };

    if (((toLower _displayName) find _searchFilter > -1 || (toLower (configname _configClass)) find _searchFilter > -1 || _searchFilter isEqualTo "") && _check) then {
        private _buyPrice = ceil (getNumber (_configClass >> "buyPrice") * _multiplier);
        if (_buyPrice < 0) then {
            _buyPrice = 0;
        };
        private _sellPrice = getNumber (_configClass >> "sellPrice");
        private _weight = getNumber (_configClass >> "weight");
        private _illegal = getNumber (_configClass >> "illegal");
        private _edible = getNumber (_configClass >> "edible");
        private _iconPath = getText (_configClass >> "icon");
        private _myQuantity = ITEM_VALUE(_x);
        private _illegalText = ["No", "Yes"] select _illegal;
        private _edibleText = ["Yes", "No"] select (_edible isEqualTo -1);
        private _buyText = ["$" + ([_buyPrice] call ANZUS_fnc_numberText), "None"] select (_buyPrice isEqualTo -1);
        private _sellText = ["$" + ([_sellPrice] call ANZUS_fnc_numberText), "None"] select (_sellPrice isEqualTo -1);

        private _index = _ctrlListItems lnbAddRow [
            _displayName,
            _buyText,
            _sellText,
            str _myQuantity,
            str _weight,
            _illegalText,
            _edibleText
        ];

        // Set data
        _ctrlListItems lnbSetData [[_index, 0], _x];

        // Set icon
        if (_iconPath != "") then { _ctrlListItems lnbSetPicture [[_index, 0], _iconPath]; };
    }; 
} forEach _availableItems;

// Update inventory progress bar
private _ctrlInventoryProgressBar = _display displayCtrl 87;
private _ctrlInventoryProgressText = _display displayCtrl 88;
private _space = life_carryWeight;
private _usedSpace = life_maxWeight;

_ctrlInventoryProgressText ctrlSetText format ["%1 / %2", _space, _usedSpace];
_ctrlInventoryProgressBar progressSetPosition (_space / _usedSpace);

