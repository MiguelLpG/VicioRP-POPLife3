private _display = findDisplay 1520;
private _ctrlListItems = _display displayCtrl 83;
private _searchFilter = toLower(ctrlText 80);
lnbClear _ctrlListItems;

private _items = nearestObjects [player, [], 6];
{
    private _iteminfo = _x getVariable ["AnzusLife_DroppedItem",[]];
    if !(_iteminfo isEqualTo []) then {
        private _configClass = missionConfigFile >> "VirtualItems" >> (_iteminfo select 0);
        private _displayName = localize (getText (_configClass >> "displayName"));
        private _iconPath = getText (_configClass >> "icon");

        if ((toLower _displayName) find _searchFilter > -1 || (toLower (configname _configClass)) find _searchFilter > -1 || _searchFilter isEqualTo "") then {
            if (!(_iteminfo select 0 == "AnzusLife_DroppedMoney") && (_iteminfo select 1) > 0) then {
                private _itemvalue = (_iteminfo select 1);
                private _index = _ctrlListItems lnbAddRow [
                    _displayName,
                    str _itemvalue
                ];

                // Set data
                _ctrlListItems lnbSetData [[_index, 0],netID _x];

                // Set icon
                if (_iconPath != "") then { _ctrlListItems lnbSetPicture [[_index, 0], _iconPath]; };
            };
        };
    };
} forEach _items;