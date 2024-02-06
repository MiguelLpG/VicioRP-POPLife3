#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sells the selected vehicle off.
*/
disableSerialization;
private ["_control","_price","_vehicle","_nearVehicles","_price2","_chopable"];
_control = CONTROL(39400,39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format ["%1", _vehicle];
_chopable = ["Car", "Air"];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,_chopable,25];
_vehicle = (_nearVehicles select _vehicle);
if (isNull _vehicle) exitWith {};
	
if ((time - life_action_delay) < 0.2) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;}; 
life_action_delay = time;
closeDialog 0;

_hasCheated = call AnzusLife_AC_CheckMoney;
if (_hasCheated) exitWith {};

[localize "STR_Shop_ChopShopSelling",true,"slow"] call ANZUS_fnc_notificationSystem;
if (missionNamespace getVariable ["life_action_inUse", false]) exitWith {};
life_action_inUse = true;

[_price] call AnzusLife_AC_Cash;
[0] call ANZUS_fnc_updatePartial;

if (life_HC_isActive) then {
    [player,_vehicle,_price,_price2] remoteExecCall ["HC_fnc_chopShopSell",HC_Life];
} else {
    [player,_vehicle,_price,_price2] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
};

if (!isNil {(group player) getVariable ["gang_name",""]}) then {
    _oldamm = (group player) getVariable ["AnzusLife_ChoppedVehicles",0];
    _ammedit = _oldamm + 1;
    (group player) setVariable ["AnzusLife_ChoppedVehicles",_ammedit,true];
    
    if ((group player) getVariable ["AnzusLife_ChoppedVehicles",0] >= 9) then {
        _gangrole = (group player) getVariable ["gang_role",[]];
        if (_gangrole isEqualTo []) exitWith {};
            
        _gangselect = _gangrole select 0;
        if (_gangselect != 0) then {
            _task = "Boosting the Blue";
            _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
            if (!_check) then {
                [_task] remoteExec ["AnzusLife_UnlockTask",2];
                (group player) setVariable ["AnzusLife_ChoppedVehicles",nil,true];
            };
        };
    };
};