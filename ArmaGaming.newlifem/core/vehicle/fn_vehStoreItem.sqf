#include "..\..\script_macros.hpp"

/*
    File: fn_vehStoreItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
    if the vehicle has room for the item.
*/
private ["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;
if !((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) isEqualTo player) exitWith { closeDialog 0; [localize "STR_MISC_VehInvUse",true,"slow"] call ANZUS_fnc_notificationSystem; };
if ((time - life_action_delay) < 0.2) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (typeOf life_trunk_vehicle isEqualTo "Land_WoodenCrate_01_F") exitWith {["You can not store items in this chest!",true,"slow"] call ANZUS_fnc_notificationSystem};

_display = findDisplay 8005003;
_ctrlListMyInventory = _display displayCtrl 37;
_ctrlListVehicleInventory = _display displayCtrl 45;

_selRow = lnbCurSelRow _ctrlListMyInventory;
_ctrl = _ctrlListMyInventory lnbData [_selRow, 0];

_num = ctrlText 39;
if (!([_num] call ANZUS_fnc_isNumber)) exitWith {[localize "STR_MISC_WrongNumFormat",true,"slow"] call ANZUS_fnc_notificationSystem;};
_num = parseNumber(_num);
if (_num < 1) exitWith {[localize "STR_MISC_Under1",true,"slow"] call ANZUS_fnc_notificationSystem;};

_totalWeight = [life_trunk_vehicle] call ANZUS_fnc_vehicleWeight;

_itemWeight = ([_ctrl] call ANZUS_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if (!(life_trunk_vehicle isKindOf "LandVehicle") && !(life_trunk_vehicle isKindOf "Ship") && !((typeOf life_trunk_vehicle) in ["Box_IND_Grenades_F","B_supplyCrate_F"])) exitWith {[localize "STR_NOTF_canOnlyStoreInLandVeh",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_ctrl IN ["relic1","relic2","relic3","relic4","relicFed","excavator","unknown","Satellite","markedmoney"]) exitWith {["You are not allowed to store this item.",true,"slow"] call ANZUS_fnc_notificationSystem;};

if (_ctrl isEqualTo "AnzusLife_DroppedMoney") then {
    _index = [_ctrl,_inv] call TON_fnc_index;
    if (CASH < _num) exitWith {[localize "STR_NOTF_notEnoughCashToStoreInVeh",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    [_num,true] call AnzusLife_AC_Cash;
    [0] call ANZUS_fnc_updatePartial;
    life_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [life_trunk_vehicle] call ANZUS_fnc_vehInventory;
} else {
    if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {[localize "STR_NOTF_VehicleFullOrInsufCap",true,"slow"] call ANZUS_fnc_notificationSystem;};

    if (!([false,_ctrl,_num,"shop"] call ANZUS_fnc_handleInv)) exitWith {[localize "STR_CouldNotRemoveItemsToPutInVeh",true,"slow"] call ANZUS_fnc_notificationSystem;};
    _index = [_ctrl,_inv] call TON_fnc_index;
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    life_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [life_trunk_vehicle] call ANZUS_fnc_vehInventory;
};

life_action_delay = time;