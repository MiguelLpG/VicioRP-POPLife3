#include "..\..\script_macros.hpp"

/*
    File: fn_vehTakeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
    if the player has room.
*/
private ["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if (isNull life_trunk_vehicle || !alive life_trunk_vehicle) exitWith {[localize "STR_MISC_VehDoesntExist",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!alive player) exitWith {closeDialog 0;};
if !((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) isEqualTo player) exitWith {  closeDialog 0; [localize "STR_MISC_VehInvUse",true,"slow"] call ANZUS_fnc_notificationSystem; };
if ((time - life_action_delay) < 0.2) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call ANZUS_fnc_notificationSystem;};

_display = findDisplay 8005003;
_ctrlListVehicleInventory = _display displayCtrl 45;

_selRow = lnbCurSelRow _ctrlListVehicleInventory;
_ctrl = _ctrlListVehicleInventory lnbData [_selRow, 0];

_num = ctrlText 39;
if (!([_num] call ANZUS_fnc_isNumber)) exitWith {[localize "STR_MISC_WrongNumFormat",true,"slow"] call ANZUS_fnc_notificationSystem;};
_num = parseNumber(_num);
if (_num < 1) exitWith {[localize "STR_MISC_Under1",true,"slow"] call ANZUS_fnc_notificationSystem;};

_index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if (_index isEqualTo -1) exitWith {};
_value = _data select _index select 1;
if (_num > _value) exitWith {[localize "STR_MISC_NotEnough",true,"slow"] call ANZUS_fnc_notificationSystem;};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call ANZUS_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {[localize "STR_NOTF_InvFull",true,"slow"] call ANZUS_fnc_notificationSystem;};
_weight = ([_ctrl] call ANZUS_fnc_itemWeight) * _num;
if (_ctrl == "AnzusLife_DroppedMoney") then {
    if (_num == _value) then {
        _data deleteAt _index;
    } else {
        _data set[_index,[_ctrl,(_value - _num)]];
    };

    [_num] call AnzusLife_AC_Cash;
    [0] call ANZUS_fnc_updatePartial;
    life_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
    [life_trunk_vehicle] call ANZUS_fnc_vehInventory;
} else {
    if ([true,_ctrl,_num,"shop"] call ANZUS_fnc_handleInv) then {
        if (_num == _value) then {
            _data deleteAt _index;
        } else {
            _data set[_index,[_ctrl,(_value - _num)]];
        };
        life_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
        [life_trunk_vehicle] call ANZUS_fnc_vehInventory;

        if (typeOf life_trunk_vehicle isEqualTo "Land_WoodenCrate_01_F" && life_trunk_vehicle getVariable ["AnzusLife_HouseRobberyOpened",false] isEqualTo false) then {
            life_trunk_vehicle setVariable ["AnzusLife_HouseRobberyOpened",true,true];
            ["This chest will be taken from you in 3 minutes.",false,"slow"] call ANZUS_fnc_notificationSystem;
        };
    } else {
        [localize "STR_NOTF_InvFull",true,"slow"] call ANZUS_fnc_notificationSystem;
    };
};

life_action_delay = time;