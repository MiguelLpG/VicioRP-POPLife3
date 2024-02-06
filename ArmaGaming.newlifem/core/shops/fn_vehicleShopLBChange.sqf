#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopLBChange.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Called when a new selection is made in the list box and
    displays various bits of information about the vehicle.
*/
disableSerialization;
private ["_className","_classNameLife","_initalPrice","_buyMultiplier","_rentMultiplier","_vehicleInfo","_colorArray","_ctrl","_trunkSpace","_maxspeed","_horsepower","_passengerseats","_fuel","_armor"];

//Fetch some information.
_className = (_this select 0) lbData (_this select 1);
_classNameLife = _className;
_initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");

_shopSettings = MAIN_SETTINGS("Shops","Vehicle");
if (isNil "AnzusLife_GovSubsidization") then {
    AnzusLife_GovSubsidization = {[getNumber(_shopSettings >> "vehicle_purchase_multiplier_COP"), getNumber(_shopSettings >> "vehicle_purchase_multiplier_MEDIC")]};
};

switch (playerSide) do {
    case civilian: {
        _buyMultiplier = getNumber(_shopSettings >> "vehicle_purchase_multiplier_CIVILIAN");
        _rentMultiplier = getNumber(_shopSettings >> "vehicle_rental_multiplier_CIVILIAN");
    };
    case west: {
        _buyMultiplier = ((call AnzusLife_GovSubsidization) select 0);
        _rentMultiplier = _buyMultiplier * 0.75;
    };
    case independent: {
        _buyMultiplier = ((call AnzusLife_GovSubsidization) select 1);
        _rentMultiplier = _buyMultiplier * 0.75;
    };
};

_vehicleInfo = [_className] call ANZUS_fnc_fetchVehInfo;
_trunkSpace = [_className] call ANZUS_fnc_vehicleWeightCfg;
_maxspeed = (_vehicleInfo select 8);
_horsepower = (_vehicleInfo select 11);
_passengerseats = (_vehicleInfo select 10);
_fuel = (_vehicleInfo select 12);
_armor = (_vehicleInfo select 9);

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format [
    (localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>" +
    (localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%2</t><br/>" +
    (localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +
    (localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +
    (localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +
    (localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>" +
    (localize "STR_Shop_Veh_UI_Fuel")+ " %7<br/>" +
    (localize "STR_Shop_Veh_UI_Armor")+ " %8",
    [round(_initalPrice * _rentMultiplier)] call ANZUS_fnc_numberText,
    [round(_initalPrice * _buyMultiplier)] call ANZUS_fnc_numberText,
    _maxspeed,
    _horsepower,
    _passengerseats,
    if (_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
    _fuel,
    _armor
];

_ctrl = CONTROL(2300,2304);
lbClear _ctrl;

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; 
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
};

private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");


if !((lbSize _ctrl)-1 isEqualTo -1) then {
    ctrlShow[2304,true];
} else {
    ctrlShow[2304,false];
};

true;
