#include "..\..\script_macros.hpp"

params [
    ["_display", displayNull, [displayNull]],
    ["_ctrlTree", controlNull, [controlNull]]
];
tvClear _ctrlTree;
_path = AnzusLife_currentActiveShop;

if (count (getArray(_path >> "items")) > 0) then {
    {
        _x params [
            ["_classname", "", [""]],
            ["_description", "", [""]],
            ["_purchaseprice", 0, [0]],
            ["_condition", "", [""]],
            ["_overrideDisplayname", "", [""]]
        ];

        if ([_condition] call ANZUS_fnc_levelCheck) then {
            private _itemClass = [
                (configFile >> "CfgWeapons" >> _classname),
                (configFile >> "CfgMagazines" >> _classname)
            ] select (isClass (configFile >> "CfgMagazines" >> _classname));

            private _displayName = getText (_itemClass >> "displayName");
            private _picture = getText (_itemClass >> "picture");

            private _tvEntryName = [
                _displayName,
                _overrideDisplayname
            ] select !(_overrideDisplayname isEqualTo "");

            private _index = _ctrlTree tvAdd [[], _tvEntryName];
            _ctrlTree tvSetPicture [[_index], _picture];

            private _data = format ["[""%1"",""%2"",""%3"",%4,""%5"",""%6""]", _classname, _displayName, _picture, _purchasePrice, _condition, _description];
            _ctrlTree tvSetData [[_index], _data];

            private _dlc = _itemClass >> "dlc";
            if (isText _dlc) then {
                private _logo = getText (configFile >> "CfgMods" >> getText _dlc >> "logo");
                _ctrlTree tvSetPictureRight [[_index], _logo];
                _ctrlTree tvSetTooltip [[_index], format ["This item is part of the %1 DLC.", getText _dlc]]
            };
        };
    } count getArray(_path >> "items");
};

if (count (getArray(_path >> "weapons")) > 0) then {
    {
        _x params [
            ["_classname", "", [""]],
            ["_description", "", [""]],
            ["_purchaseprice", 0, [0]],
            ["_condition", "", [""]],
            ["_overrideDisplayname", "", [""]]
        ];

        if ([_condition] call ANZUS_fnc_levelCheck) then {
            private _itemClass = [
                (configFile >> "CfgWeapons" >> _classname),
                (configFile >> "CfgMagazines" >> _classname)
            ] select (isClass (configFile >> "CfgMagazines" >> _classname));
            
            private _displayName = getText (_itemClass >> "displayName");
            private _picture = getText (_itemClass >> "picture");

            private _tvEntryName = [
                _displayName,
                _overrideDisplayname
            ] select !(_overrideDisplayname isEqualTo "");

            private _weaponIndex = _ctrlTree tvAdd [[], _tvEntryName];
            _ctrlTree tvSetPicture [[_weaponIndex], _picture];

            private _data = format ["[""%1"",""%2"",""%3"",%4,""%5"",""%6""]", _classname, _tvEntryName, _picture, _purchasePrice, _condition, _description];
            _ctrlTree tvSetData [[_weaponIndex], _data];

            private _aComp = [_classname, true] call ANZUS_fnc_weaponShopCompatible;
            {
                _x params ["_comp", "_compT"];
                private _array = getArray (_path >> _comp);
                private _arrayComp = (_array apply {private _lower = toLower (_x param [0]); _lower}) arrayIntersect _aComp;
                if !(_arrayComp isEqualTo []) then {
                    private _compIndex = _ctrlTree tvAdd [[_weaponIndex], _compT];

                    {
                        private _compItem = _x;
                        private _index = [_compItem, _array apply {[toLower (_x param [0]), _x param [1], _x param [2], _x param [3], _x param [4]]}] call ANZUS_fnc_weaponShopIndex;
                        (_array select _index) params ["_subClass", "_subDescription", "_subPrice", "_subCondition", "_subDisplay"];

                        if ([_subCondition] call ANZUS_fnc_levelCheck) then {
                            private _compClass = [(configFile >> "CfgWeapons" >> _compItem),(configFile >> "CfgMagazines" >> _compItem)] select (isClass (configFile >> "CfgMagazines" >> _compItem));
                            private _compDisplayName = getText (_compClass >> "displayName");
                            private _compPicture = getText (_compClass >> "picture");

				            private _tvEntryCompName = [
				                _compDisplayName,
				                _subDisplay
				            ] select !(_subDisplay isEqualTo "");

                            private _compWeaponIndex = _ctrlTree tvAdd [[_weaponIndex, _compIndex], _tvEntryCompName];
                            _ctrlTree tvSetPicture [[_weaponIndex, _compIndex, _compWeaponIndex], _compPicture];
                            private _compdata = format ["[""%1"",""%2"",""%3"",%4,""%5"",""%6""]", _subClass, _tvEntryCompName, _compPicture, _subPrice, _subCondition, _subDescription];
                            _ctrlTree tvSetData [[_weaponIndex, _compIndex, _compWeaponIndex], _compdata];
                        };
                    } forEach _arrayComp;
                };
            } forEach [["magazines", "Magazines"], ["attachments", "Attachments"]];
        };
    } count getArray(_path >> "weapons");
};

_ctrlTree tvSetCurSel [0];