#include "..\..\script_macros.hpp"
/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka

    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private ["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_return = [];
_yItems = [];

_return pushBack (getUnitLoadout player);
if (MAIN_SETTINGS_TYPE(getNumber,"Saving","save_virtualItems") isEqualTo 1) then {
    if (MAIN_SETTINGS_TYPE(getNumber,"Saving","save_illeagalItems") isEqualTo 0) then {
        {
            _var = configName(_x);
            _val = ITEM_VALUE(_var);
            
            if (_val > 0) then {
                _yItems pushBack [_var,floor _val];
            };
        } forEach ("getNumber(_x >> 'illegal') isEqualTo 0" configClasses (missionConfigFile >> "VirtualItems"));
    };

    _return pushBack _yItems;
} else {
    _return pushBack [];
};

life_gear = _return;
