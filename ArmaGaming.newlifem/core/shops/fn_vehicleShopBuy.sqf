#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopBuy.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Does something with vehicle purchasing.
*/

params [
    ["_mode",true,[true]]
];

if(life_lastvehiclepurchase > time) exitWith {["You must wait 1 minute before purchasing a new vehicle!",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((tvCurSel 8000243) isEqualTo []) exitWith {[localize "STR_Shop_Veh_DidntPick",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};

private _tvData = tvData[8000243,(tvCurSel 8000243)];
if (_tvData isEqualTo "") exitWith {};


private _vehicleData = parseSimpleArray _tvData;
_vehicleData params
[
    ["_vehicleDisplayName", "", [""]],
    ["_vehiclePreview", "", [""]],
    ["_maxSpeed", 0, [0]],
    ["_armor", 0, [0]],
    ["_seats", 0, [0]],
    ["_hp", 0, [0]],
    ["_fuel", 0, [0]],
    ["_purchasePrice", 0, [0]],
    ["_trunkSpace", 0, [0]],
    ["_className", "", [""]]
];

private _vehicleList = M_CONFIG(getArray,"CarShops",(life_veh_shop select 0),"vehicles");
private _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");

private _display = findDisplay 8000240;
private _ctrlInsuranceCheckbox = _display displayCtrl 8000256;
private _insured = [0,1] select (cbChecked _ctrlInsuranceCheckbox);

private "_buyMultiplier";
private "_rentMultiplier";

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

private _insureMultiplier = (getNumber((MAIN_SETTINGS("Shops","Vehicle")) >> "vehicle_insurnace_price_l1")) + 1;


_hasCheated = call AnzusLife_AC_CheckMoney;
if (_hasCheated) exitWith {};

private "_purchasePrice";
if (_mode) then {
    _purchasePrice = round(_initalPrice * _buyMultiplier);
} else {
    _purchasePrice = round(_initalPrice * _rentMultiplier);
};

if (_insured isEqualTo 1) then {
    _purchasePrice = round (_purchasePrice * _insureMultiplier );
};

private _conditions = M_CONFIG(getText,"LifeCfgVehicles",_className,"conditions");
if !([_conditions] call ANZUS_fnc_levelCheck) exitWith {[localize "STR_Shop_Veh_NoLicense",true,"slow"] call ANZUS_fnc_notificationSystem;};

if (_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if (CASH < _purchasePrice) exitWith {[format[localize "STR_Shop_Veh_NotEnough",[_purchasePrice - CASH] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};

private _spawnPoints = life_veh_shop select 1;
private _spawnPoint = "";

//Check if there is multiple spawn points and find a suitable spawnpoint.
if (_spawnPoints isEqualType []) then {
    //Find an available spawn point.
    {
        if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x};
        true
    } count _spawnPoints;
} else {
    if (nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
};


if (_spawnPoint isEqualTo "") exitWith {[localize "STR_Shop_Veh_Block",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};

[_purchasePrice,true] call AnzusLife_AC_Cash;

if (playerSide isEqualTo civilian) then {
    [_purchasePrice/10] call AnzusLife_BudgetAdd;
};
if (playerSide in [west, independent]) then {
    [_purchasePrice] call AnzusLife_BudgetSub;
};
[0] call ANZUS_fnc_updatePartial;

[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
//Spawn the vehicle and prep it.

private "_vehicle";

_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle setPos (getMarkerPos _spawnPoint);
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);

_vehicle lock 2;

private _colorIndex = -1;
[_vehicle,_colorIndex] call ANZUS_fnc_colorVehicle;
_vehicle setVariable ["trunk_in_use",false,true];
_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
[_vehicle] call ANZUS_fnc_clearVehicleAmmo;
_vehicle disableTIEquipment true;

//Side Specific actions.
switch (playerSide) do {
    case west: {
        [_vehicle,"cop_offroad",true] spawn ANZUS_fnc_vehicleAnimate;
    };
    case civilian: {
        if ((life_veh_shop select 2) isEqualTo "civ" && {_className == "B_Heli_Light_01_F"}) then {
            [_vehicle,"civ_littlebird",true] spawn ANZUS_fnc_vehicleAnimate;
        };
    };
    case independent: {
        [_vehicle,"med_offroad",true] spawn ANZUS_fnc_vehicleAnimate;
    };
};
_vehicle allowDamage true;
life_vehicles pushBack _vehicle;

//Always handle key management by the server
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");
if (_mode) then {
    if !(_className in (getArray(_shopSettings >> "vehicleShop_rentalOnly"))) then {
        if (life_HC_isActive) then {
            [(getPlayerUID player),playerSide,_vehicle,_colorIndex,_insured] remoteExecCall ["HC_fnc_vehicleCreate",HC_Life];
        } else {
            [(getPlayerUID player),playerSide,_vehicle,_colorIndex,_insured] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
        };
    };
};

[_purchasePrice] remoteExecCall ["AnzusLife_ItemBought", 2];

["VehiclePurchased"] spawn mav_ttm_fnc_addExp;
life_lastvehiclepurchase = time + 60;
closeDialog 0; //Exit the menu.
player moveInDriver _vehicle;
true;
