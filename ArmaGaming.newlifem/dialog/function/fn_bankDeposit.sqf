#include "..\..\script_macros.hpp"
/*
    File: fn_bankDeposit.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out.
*/
private ["_value"];
_value = parseNumber (ctrlText 123);

//Series of stupid checks
if (_value > 999999) exitWith {[localize "STR_ATM_GreaterThan",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_value < 0) exitWith {};
if (!([str(_value)] call ANZUS_fnc_isNumber)) exitWith {[localize "STR_ATM_notnumeric",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_value > CASH) exitWith {[localize "STR_ATM_NotEnoughCash",true,"slow"] call ANZUS_fnc_notificationSystem;};

[_value,true] call AnzusLife_AC_Cash;
[_value] call AnzusLife_AC_Bank;

[format[localize "STR_ATM_DepositSuccess",[_value] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
[] call ANZUS_fnc_atmMenu;
[] spawn ANZUS_fnc_hudUpdate;
[6] call ANZUS_fnc_updatePartial;