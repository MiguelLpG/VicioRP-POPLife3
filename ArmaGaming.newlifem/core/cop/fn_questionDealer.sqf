#include "..\..\script_macros.hpp"
/*
    File: fn_questionDealer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Questions the drug dealer and sets the sellers wanted.
*/
private ["_sellers","_crimes","_names"];
_sellers = (_this select 0) getVariable ["sellers",[]];
if (count _sellers isEqualTo 0) exitWith {[localize "STR_Cop_DealerQuestion",true,"slow"] call ANZUS_fnc_notificationSystem;}; //No data.
life_action_inUse = true;
_crimes = LIFE_SETTINGS(getArray,"crimes");

_names = "";
{
    _val = 0;
    if ((_x select 2) > 150000) then {
        _val = round((_x select 2) / 16);
    } else {
        _val = ["483",_crimes] call TON_fnc_index;
        _val = ((_crimes select _val) select 1);
        if (_val isEqualType "") then {
            _val = parseNumber _val;
        };
    };  
    //Add Warrant
    _names = _names + format ["%1<br/>",(_x select 1)];
} forEach _sellers;

[parseText format[(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names],true,"slow"] call ANZUS_fnc_notificationSystem;
(_this select 0) setVariable ["sellers",[],true];
life_action_inUse = false;
