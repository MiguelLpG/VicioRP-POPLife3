#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens & initializes the chop shop menu.
*/
private ["_control","_price","_nearVehicles","_chopMultiplier","_chopable","_nearUnits"];
if (life_action_inUse) exitWith {[localize "STR_NOTF_ActionInProc",true,"slow"] call ANZUS_fnc_notificationSystem;};
if !(playerSide isEqualTo civilian) exitWith {[localize "STR_NOTF_notAllowed",true,"slow"] call ANZUS_fnc_notificationSystem;};
disableSerialization;
_chopable = ["Car", "Air"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),_chopable,25];
_nearUnits = (nearestObjects[player,["Man"],5]) arrayIntersect playableUnits;
if (count _nearUnits > 1) exitWith {[localize "STR_NOTF_PlayerNear",true,"slow"] call ANZUS_fnc_notificationSystem;};

life_chopShop = _this select 3;
//Error check
if (count _nearVehicles isEqualTo 0) exitWith {titleText[localize "STR_Shop_NoVehNear","PLAIN"];};
if (!(createDialog "Chop_Shop")) exitWith {[localize "STR_Shop_ChopShopError",true,"slow"] call ANZUS_fnc_notificationSystem;};

_control = CONTROL(39400,39402);
{
    if (alive _x) then {
        _className = typeOf _x;
        _classNameLife = _className;
        _displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
        _picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");

        if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
            _classNameLife = "Default"; //Use Default class if it doesn't exist
            diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
        };

        _price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
        _shopSettings = MAIN_SETTINGS("Shops","Vehicle");

        _price = _price * getNumber(_shopSettings >> "vehicle_chopShop_multiplier");
        if (!isNil "_price" && count crew _x isEqualTo 0) then {
            _control lbAdd _displayName;
            _control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
            _control lbSetPicture [(lbSize _control)-1,_picture];
            _control lbSetValue [(lbSize _control)-1,_price];
        };
    };
} forEach _nearVehicles;
