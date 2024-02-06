#include "..\..\script_macros.hpp"
/*
    File: fn_openInventory.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the initialization of vehicle virtual inventory menu.
*/
private ["_vehicle","_veh_data"];
if (dialog || !isRemoteExecuted) exitWith {};
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNil "life_trunkTimer") exitWith {
    [format["%1/%2 has a nilled trunk timer??? %3",(name player),(getPlayerUID player), mapGridPosition player], "v-inv.log"] remoteExec ["AH_LogInterface",2];
};

_dif = time - life_trunkTimer;
if (_dif > 6) exitWith {
    [format["%1/%2 v-inv lag switching? Dif: %3 at %4 with %5 (%6)",(name player),(getPlayerUID player), _dif, mapGridPosition player, typeOf _vehicle, _vehicle getVariable ["Trunk",[]]], "v-inv.log"] remoteExec ["AH_LogInterface",2];
};

if (isNull _vehicle || !(_vehicle isKindOf "Car" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship" || _vehicle isKindOf "Box_IND_Grenades_F" || _vehicle isKindOf "B_supplyCrate_F" || _vehicle isKindOf "Land_WoodenCrate_01_F" || _vehicle isKindOf "B_CargoNet_01_ammo_F" || _vehicle isKindOf "Land_CargoBox_V1_F")) exitWith {}; //Either a null or invalid vehicle type.
if (life_is_processing) exitWith {["You cannot access a vehicle while processing.",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((_vehicle getVariable ["trunk_in_use",false])) exitWith {[localize "STR_MISC_VehInvUse",true,"slow"] call ANZUS_fnc_notificationSystem;};
    
_unitsnear = (nearestObjects[_vehicle, ["Man"], 15]) arrayIntersect playableUnits;
if(count _unitsnear > 1) exitWith {["Sorry, you cannot open your inventory to your vehicle when players are nearby!",true,"slow"] call ANZUS_fnc_notificationSystem;};

if (_vehicle isKindOf "Land_CargoBox_V1_F" && !(_vehicle getVariable ["bankOpen",false])) exitWith {
    ["Safe is locked, you must open this with a blasting charge",true,"slow"] call ANZUS_fnc_notificationSystem;
};

_vehicle setVariable ["trunk_in_use",true,true];
_vehicle setVariable ["trunk_in_use_by",player,true];
if (!createDialog "AnzusLife_VehicleInventory") exitWith {[localize "STR_MISC_DialogError",true,"slow"] call ANZUS_fnc_notificationSystem;};
disableSerialization;

if (_vehicle isKindOf "Box_IND_Grenades_F" || _vehicle isKindOf "B_supplyCrate_F") then {
    ctrlSetText[32,format [(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
    ctrlSetText[32,format [(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

_veh_data = [_vehicle] call ANZUS_fnc_vehicleWeight;
if (_veh_data select 0 isEqualTo -1) exitWith {
    [_vehicle, player] remoteExecCall ["AnzusLife_AC_CloseTrunk", 2];
    closeDialog 0;
    _vehicle setVariable ["trunk_in_use",false,true];
    [localize "STR_MISC_NoStorageVeh",true,"slow"] call ANZUS_fnc_notificationSystem;
};

_display = findDisplay 8005003;
_ctrlProgressMyInventory = _display displayCtrl 35;
_ctrlTextMyInventory = _display displayCtrl 47;
_ctrlProgressVehicleInventory = _display displayCtrl 42;
_ctrlTextVehicleInventory = _display displayCtrl 43;
_ctrlListVehicleInventory = _display displayCtrl 45;
_ctrlListMyInventory = _display displayCtrl 37;

_vehicleVirtualInventorySpace = _veh_data select 0;
_vehicleInventoryUsedSpace = _veh_data select 1;

_ctrlTextVehicleInventory ctrlSetText format ["%1 / %2", _vehicleInventoryUsedSpace, _vehicleVirtualInventorySpace];
_ctrlProgressVehicleInventory progressSetPosition (_vehicleInventoryUsedSpace / _vehicleVirtualInventorySpace);

_ctrlTextMyInventory ctrlSetText format ["%1 / %2", life_carryWeight, life_maxWeight]; 
_ctrlProgressMyInventory progressSetPosition (life_carryWeight / life_maxWeight);

_ctrlListMyInventory lnbSetCurSelRow 0;
_ctrlListVehicleInventory lnbSetCurSelRow 0;

[_vehicle] call ANZUS_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn {
    waitUntil {isNull (findDisplay 3500)};
    _this setVariable ["trunk_in_use",false,true];
    [_this, player] remoteExecCall ["AnzusLife_AC_CloseTrunk", 2];
    if (_this isKindOf "Box_IND_Grenades_F" || _this isKindOf "B_supplyCrate_F") then {
        [_this] remoteExecCall ["TON_fnc_updateHouseTrunk",2];
    };
};

if (MAIN_SETTINGS_TYPE(getNumber,"Saving","save_vehicle_virtualItems") isEqualTo 1) then {
    _vehicle spawn {
        waitUntil {isNull (findDisplay 3500)};
        _this setVariable ["trunk_in_use",false,true];
        [_this, player] remoteExecCall ["AnzusLife_AC_CloseTrunk", 2];
        if ((_this isKindOf "Car") || (_this isKindOf "Air") || (_this isKindOf "Ship")) then {
            [] call ANZUS_fnc_updateRequest;
            [_this,2] remoteExecCall ["TON_fnc_vehicleUpdate",2];
        };
    };
};
