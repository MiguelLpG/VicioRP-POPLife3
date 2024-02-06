#include "..\..\script_macros.hpp"
/*
    File: fn_containerInvSearch.sqf
    Author: NiiRoZz
    Inspired : Bryan "Tonic" Boardwine

    Description:
    Searches the container for illegal items.
*/
private ["_container","_containerInfo","_value"];
params[["_container", objNull, [objNull]]];

if (isNull _container) exitWith {};

_containerInfo = _container getVariable ["Trunk",[]];
if (count _containerInfo isEqualTo 0) exitWith {[localize "STR_Cop_ContainerEmpty",true,"slow"] call ANZUS_fnc_notificationSystem;};

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
} forEach (_containerInfo select 0);
_value = _illegalValue;
if (_value > 0) then {

    [0,"STR_NOTF_ContainerContraband",true,[[_value] call ANZUS_fnc_numberText]] remoteExecCall ["ANZUS_fnc_broadcast",RCLIENT];
    [(_value / 4)] call AnzusLife_AC_Bank;

    [1] call ANZUS_fnc_updatePartial;
    _contrabandInfo = "";
    {
        _amt = _x select 1;
        _name = _x select 0;
        _contrabandInfo = _contrabandInfo + format ["%1 x %2<br/>",[_amt] call ANZUS_fnc_numberText,_name];
    } forEach _illegalItems;
    [parseText format["<t color='#FF0000'><t size='2'>This container contains contraband!</t></t><br/>%1",_contrabandInfo],false,"slow"] call ANZUS_fnc_notificationSystem;

    _container setVariable ["Trunk",[[],0],true];
    [_container] remoteExecCall ["TON_fnc_updateHouseTrunk",2];
} else {
    ["This vehicle contains no illegal items",false,"slow"] call ANZUS_fnc_notificationSystem;
    [localize "STR_Cop_NoIllegalContainer",true,"slow"] call ANZUS_fnc_notificationSystem;
};
