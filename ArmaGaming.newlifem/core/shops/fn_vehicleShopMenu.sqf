#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah
*/

params [
    ["_shop","",[""]],
    ["_shopFlag","",[""]],
    ["_shopTitle","",[""]],
    ["_disableBuy",false,[true]]
];

disableSerialization;

//Long boring series of checks
if (dialog) exitWith {};
if (_shop isEqualTo "") exitWith {};

private _conditions = M_CONFIG(getText,"CarShops",_shop,"conditions");
if !([_conditions] call ANZUS_fnc_levelCheck) exitWith {[localize "STR_Shop_Veh_NotAllowed",true,"slow"] call ANZUS_fnc_notificationSystem;};

createDialog "AnzusLife_VehicleShop";

_gay = [];
switch (_shop) do { 
    case "civ_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "rebel_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_motorbike" : {_gay = getArray (missionConfigFile >> "CfgMaster" >> "CarShopSpawns")};
    case "civ_suv" : {_gay = getArray (missionConfigFile >> "CfgMaster" >> "CarShopSpawns")};  
    case "civ_sports" : {_gay = getArray (missionConfigFile >> "CfgMaster" >> "CarShopSpawns")}; 
    case "civ_muscle" : {_gay = getArray (missionConfigFile >> "CfgMaster" >> "CarShopSpawns")}; 
    case "civ_exotic" : {_gay = getArray (missionConfigFile >> "CfgMaster" >> "CarShopSpawns")}; 
    case "civ_truck" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")}; 
    case "civ_ship" : {_gay = LIFE_SETTINGS(getArray,"BoatShopSpawns")}; 
    case "civ_air" : {_gay = LIFE_SETTINGS(getArray,"AirShopSpawns")}; 
    case "med_shop" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")}; 
    case "med_air_hs" : {_gay = LIFE_SETTINGS(getArray,"AirShopSpawns")}; 
    case "med_ship" : {_gay = LIFE_SETTINGS(getArray,"BoatShopSpawns")}; 
    case "cop_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")}; 
    case "swat_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "uc_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "cop_air" : {_gay = LIFE_SETTINGS(getArray,"AirShopSpawns")}; 
    case "cop_boat" : {_gay = LIFE_SETTINGS(getArray,"BoatShopSpawns")}; 
};

_markerName = [];
{
    if ((player distance (getMarkerPos _x)) <= 50) then {
        _markerName pushBack _x;
    };
} forEach _gay;

private _new = _markerName;
if (count _new isEqualTo 0) exitWith {["No spawnpoint available, please let a developer know this shop has no spawn.",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};

private _spawnPoints = _new;
life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.
ctrlSetText [8000241,_shopTitle];

if (_disableBuy) then {
    //Disable the buy button and insurance.
    ctrlEnable [8000256,false];
    ctrlEnable [8000254,false];
};
private _display = findDisplay 8000240;
private _ctrlInsuranceCheckbox = _display displayCtrl 8000256;
_ctrlInsuranceCheckbox cbSetChecked false;

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");

private _vehicleTree = CONTROL(8000240,8000243);
tvClear _vehicleTree;

//Loop through
{
    _x params["_className"];

    private _toShow = [_x] call ANZUS_fnc_levelCheck;

    if (_toShow) then {
        _vehicleInfo = [_className] call ANZUS_fnc_fetchVehInfo;
        private _vehicleDisplayPicture = _vehicleInfo select 2;
        private _vehicleDisplayName = _vehicleInfo select 3;

        private _index = _vehicleTree tvAdd [[], _vehicleDisplayName];
        _vehicleTree tvSetPicture [[_index], _vehicleDisplayPicture];

        private _maxSpeed = _vehicleInfo select 8;
        private _armor = _vehicleInfo select 9;
        private _seats = _vehicleInfo select 10;
        private _hp = _vehicleInfo select 11;
        private _fuel = _vehicleInfo select 12;
        private _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");

        private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");
        private _buyMultiplier = 0;
        if (isNil "AnzusLife_GovSubsidization") then {
            AnzusLife_GovSubsidization = {[getNumber(_shopSettings >> "vehicle_purchase_multiplier_COP"), getNumber(_shopSettings >> "vehicle_purchase_multiplier_MEDIC")]};
        };

        switch (playerSide) do {
            case civilian: {
                _buyMultiplier = getNumber(_shopSettings >> "vehicle_purchase_multiplier_CIVILIAN");
            };
            case west: {
                _buyMultiplier = ((call AnzusLife_GovSubsidization) select 0);
            };
            case independent: {
                _buyMultiplier = ((call AnzusLife_GovSubsidization) select 1);
            };
        };



        private _purchasePrice = round(_initalPrice * _buyMultiplier);
        private _trunkSpace = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");

        // Set data
        private _data = format
        [
            "[""%1"",""%2"",%3,%4,%5,%6,%7,%8,%9,""%10""]",
            _vehicleDisplayName,
            _vehicleDisplayPicture,
            _maxSpeed,
            _armor,
            _seats,
            _hp,
            _fuel,
            _purchasePrice,
            _trunkSpace,
            _className
        ];
        _vehicleTree tvSetData [[_index], _data];
    };
} forEach _vehicleList;

_vehicleTree ctrlAddEventHandler ["TreeSelChanged", {
    params [["_ctrl",controlNull,[controlNull]], ["_selectionPath", [], [[]]]];
    private _display = ctrlParent _ctrl;

    private _tvData = _ctrl tvData _selectionPath;
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

    private _ctrlTextName = _display displayCtrl 8000245;
    private _ctrlTextNameSecond = _display displayCtrl 8000242;
    private _ctrlTextPrice = _display displayCtrl 8000246;
    private _ctrlTextMaxSpeed = _display displayCtrl 8000247;
    private _ctrlTextHorsePower = _display displayCtrl 8000248;
    private _ctrlTextPassengerSeats = _display displayCtrl 8000249;
    private _ctrlTextTrunkSpace = _display displayCtrl 8000250;
    private _ctrlTextFuel = _display displayCtrl 8000251;
    private _ctrlTextArmor = _display displayCtrl 8000252;
    private _ctrlStructuredTextPreview = _display displayCtrl 8000244;
    private _ctrlInsuranceCheckbox = _display displayCtrl 8000256;
    private _insured = [0,1] select (cbChecked _ctrlInsuranceCheckbox);
    private _insureMultiplier = (getNumber((MAIN_SETTINGS("Shops","Vehicle")) >> "vehicle_insurnace_price_l1")) + 1;

    if(_insured isEqualTo 1) then {
        _purchasePrice = round(_purchasePrice * _insureMultiplier);
    };

    private _formattedPricePurchase = [_purchasePrice] call ANZUS_fnc_numberText;

    _ctrlTextName ctrlSetText _vehicleDisplayName;
    _ctrlTextNameSecond ctrlSetText _vehicleDisplayName;
    _ctrlTextPrice ctrlSetText ("$" + _formattedPricePurchase);
    _ctrlTextMaxSpeed ctrlSetText (str _maxSpeed + " km/h");
    _ctrlTextHorsePower ctrlSetText str _hp;
    _ctrlTextPassengerSeats ctrlSetText str _seats;
    _ctrlTextTrunkSpace ctrlSetText str _trunkSpace;
    _ctrlTextFuel ctrlSetText (str _fuel + " litres");
    _ctrlTextArmor ctrlSetText str _armor;
    _ctrlStructuredTextPreview ctrlSetStructuredText parseText format ["<br/><img image='%1' size='%2' align='center' />", _vehiclePreview, 2.5 * safezoneH];

    private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");
    if (_className in (getArray(_shopSettings >> "vehicleShop_rentalOnly"))) then {
        ctrlEnable [8000254,false];
    } else {
        if (!(life_veh_shop select 3)) then {
            ctrlEnable [8000254,true];
        };
    };
}];

_vehicleTree tvSetCurSel [0];
tvExpandAll _vehicleTree;


_ctrlInsuranceCheckbox ctrlAddEventHandler ["CheckedChanged",{
    params ["_control", "_checked"];
    _display = ctrlParent _control;
    _tree = _display displayCtrl 8000243;

    _selectionPath = tvCurSel _tree;

    private _tvData = _tree tvData _selectionPath;
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
    private _insureMultiplier = (getNumber((MAIN_SETTINGS("Shops","Vehicle")) >> "vehicle_insurnace_price_l1")) + 1;

    if(_checked isEqualTo 1) then {
        _purchasePrice = round(_purchasePrice * _insureMultiplier);
    };
    
    private _ctrlTextPrice = _display displayCtrl 8000246;
    private _formattedPricePurchase = [_purchasePrice] call ANZUS_fnc_numberText;

    _ctrlTextPrice ctrlSetText ("$" + _formattedPricePurchase);

}];

private _ctrlButtonRentVehicle = _display displayCtrl 8000253;
_ctrlButtonRentVehicle ctrlEnable false;
_ctrlButtonRentVehicle ctrlAddEventHandler ["ButtonClick", {[false] spawn ANZUS_fnc_vehicleShopBuy;}];

private _ctrlButtonPurchaseVehicle = _display displayCtrl 8000254;
_ctrlButtonPurchaseVehicle ctrlAddEventHandler ["ButtonClick", {[true] spawn ANZUS_fnc_vehicleShopBuy;}];