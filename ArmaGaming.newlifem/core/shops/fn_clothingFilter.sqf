#include "..\..\script_macros.hpp"
/*
    File: fn_clothingFilter.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Functionality for filtering clothing types in the menu.
*/

disableSerialization;

params [
    "", //Control
    ["_selection", 0, [0]]
];

life_clothing_filter = _selection;

switch (_selection) do {
    case 4: {
        life_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
        life_shop_cam camSetPos (player modelToWorld [1,-4,2]);
        life_shop_cam camCommit 1;
    };

    case 0: {
        life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
        life_shop_cam camSetPos (player modelToWorld [1,4,2]);
        life_shop_cam camCommit 1;
    };

    case 3: {
        life_shop_cam camSetTarget (player modelToWorld [0,0,1.4]);
        life_shop_cam camSetPos (player modelToWorld [-.1,2,1.4]);
        life_shop_cam camCommit 1;
    };

    default {
        life_shop_cam camSetTarget (player modelToWorld [0,0,1.6]);
        life_shop_cam camSetPos (player modelToWorld [-.5,1,1.6]);
        life_shop_cam camCommit 1;
    };
};

if (isNull (findDisplay 3100)) exitWith {};

private _list = CONTROL(3100,4);
tvClear _list;

private _configArray = switch (_selection) do {
    case 0: {M_CONFIG(getArray,"Clothing",life_clothing_store,"uniforms");};
    case 1: {M_CONFIG(getArray,"Clothing",life_clothing_store,"headgear");};
    case 2: {M_CONFIG(getArray,"Clothing",life_clothing_store,"goggles");};
    case 3: {M_CONFIG(getArray,"Clothing",life_clothing_store,"vests");};
    case 4: {M_CONFIG(getArray,"Clothing",life_clothing_store,"backpacks");};
};

private "_pic";
private "_details";

{
    _x params [
        ["_className", "NONE", [""]],
        ["_displayName", "", [""]],
        ["_price", 1000, [0]]
    ];

    if (isNil "_list") then {};

    if !(_className isEqualTo "NONE") then {
        _details = [_className] call ANZUS_fnc_fetchCfgDetails;
        _pic = (_details select 2);
    };

    if ([_x] call ANZUS_fnc_levelCheck) then {
        if (isNil "_details") then {
            private _index = _list tvAdd [[], _displayName];
            _list tvSetData [[_index],_className];
        } else {
            private _index = [0,0];
            if (_displayName isEqualTo "") then {
                _index = _list tvAdd [[],(_details select 1)];
            } else {
                _index = _list tvAdd [[], _displayName];
            };

            _list tvSetData [[_index],_className];
            _list tvSetValue [[_index],_price];

            if (_pic != "" || !(isNil "_pic")) then {
                _list tvSetPicture [[_index],_pic];
            };
        };
    };
    
    true
} count _configArray;

tvExpandAll _list;