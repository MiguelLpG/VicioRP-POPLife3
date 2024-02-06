#include "..\..\script_macros.hpp"
/*
    File: fn_vehInvSearch.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Searches the vehicle for illegal items.
*/
private ["_vehicle","_vehicleInfo","_value","_list"];
_vehicle = cursorObject;
_list = ["Air","Ship","LandVehicle"];
if (isNull _vehicle || {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if (count _vehicleInfo isEqualTo 0) exitWith {[localize "STR_Cop_VehEmpty",true,"slow"] call ANZUS_fnc_notificationSystem;};

_value = 0;
_illegalValue = 0;
_illegalItems = [];
{
    _var = _x select 0;
    _val = _x select 1;
    _isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
    if (_isIllegalItem isEqualTo 1 ) then {
        _illegalItems pushBack [_var, _val];

        _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
        if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
            _illegalItemProcessed = M_CONFIG(getText,"VirtualItems",_var,"processedItem");
            _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_illegalItemProcessed,"sellPrice");
        };

        _illegalValue = _illegalValue + (round(_val * _illegalPrice));
    };
} forEach (_vehicleInfo select 0);

_value = _illegalValue;
if (_value > 0) then {
    [0,"STR_NOTF_VehContraband",true,[[_value] call ANZUS_fnc_numberText]] remoteExecCall ["ANZUS_fnc_broadcast",RCLIENT];
    [(_value / 4)] call AnzusLife_AC_Bank;
    [1] call ANZUS_fnc_updatePartial;

    _contrabandInfo = "";
    {
        _amt = _x select 1;
        _name = _x select 0;
        _contrabandInfo = _contrabandInfo + format ["%1 x %2<br/>",[_amt] call ANZUS_fnc_numberText,_name];
    } forEach _illegalItems;
    [parseText format["<t color='#FF0000'><t size='2'>This vehicle contains contraband!</t></t><br/>%1",_contrabandInfo],false,"slow"] call ANZUS_fnc_notificationSystem;


    _vehicle setVariable ["Trunk",[[],0],true];
} else {
    [localize "STR_Cop_NoIllegalVeh",true,"slow"] call ANZUS_fnc_notificationSystem;
};
