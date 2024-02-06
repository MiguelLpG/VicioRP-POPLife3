#include "..\..\script_macros.hpp"
/*
    File: fn_pickupItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master handling for picking up an item.
*/
params [["_obj",objNull,[objNull]]];

if ((time - life_action_delay) < 2) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call ANZUS_fnc_notificationSystem; _obj setVariable ["inUse",false,true];};
if (isNull _obj || {player distance _obj > 6}) exitWith {_obj setVariable ["inUse",false,true]; [] spawn ANZUS_fnc_pickupItems;};

_itemInfo = _obj getVariable ["AnzusLife_DroppedItem",[]]; 
if (count _itemInfo isEqualTo 0) exitWith {deleteVehicle _obj; [] spawn ANZUS_fnc_pickupItems;};

_illegal = ITEM_ILLEGAL(_itemInfo select 0);
_itemName = ITEM_NAME(_itemInfo select 0);
if (isLocalized _itemName) then {
    _itemName = (localize _itemName);
};

if (playerSide isEqualTo west && _illegal isEqualTo 1) exitWith {
    _value = round(ITEM_SELLPRICE(_itemInfo select 0) / 2);
    [format [localize "STR_NOTF_PickedEvidence",_itemName,[_value] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
    [_value] call AnzusLife_AC_Bank;
    
    ["PickupEvidence"] spawn mav_ttm_fnc_addExp;
    deleteVehicle _obj;
    [1] call ANZUS_fnc_updatePartial;
    life_action_delay = time;

    [] spawn ANZUS_fnc_pickupItems;    
};

life_action_delay = time;
_diff = [(_itemInfo select 0),(_itemInfo select 1),life_carryWeight,life_maxWeight] call ANZUS_fnc_calWeightDiff;
if (_diff <= 0) exitWith {[localize "STR_NOTF_InvFull",true,"slow"] call ANZUS_fnc_notificationSystem; _obj setVariable ["inUse",false,true]; [] spawn ANZUS_fnc_pickupItems;};

if (!(_diff isEqualTo (_itemInfo select 1))) then {
    if ([true,(_itemInfo select 0),_diff,"pickup"] call ANZUS_fnc_handleInv) then {
        player playMove "AinvPknlMstpSlayWrflDnon";

        _obj setVariable ["AnzusLife_DroppedItem",[(_itemInfo select 0),(_itemInfo select 1) - _diff],true];
        [format [localize "STR_NOTF_Picked",_diff,_itemName],false,"slow"] call ANZUS_fnc_notificationSystem;
        _obj setVariable ["inUse",false,true];
        [] spawn ANZUS_fnc_pickupItems;
    } else {
        _obj setVariable ["inUse",false,true];
    };
} else {
    if ([true,(_itemInfo select 0),(_itemInfo select 1),"pickup"] call ANZUS_fnc_handleInv) then {
        deleteVehicle _obj;
        player playMove "AinvPknlMstpSlayWrflDnon";
        [format [localize "STR_NOTF_Picked",_diff,_itemName],false,"slow"] call ANZUS_fnc_notificationSystem;

        [] spawn ANZUS_fnc_pickupItems;
    } else {
        _obj setVariable ["inUse",false,true];
    };
};

switch (_itemVar) do { 
    case "keyCard": { player setVariable ["copLevel",1,true]; }; 
};