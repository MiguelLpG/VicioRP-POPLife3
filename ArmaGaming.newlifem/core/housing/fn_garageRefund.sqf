#include "..\..\script_macros.hpp"
/*
    File: fn_garageRefund.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    I don't know?
*/
_price = _this select 0;
if !(isRemoteExecuted) exitWith {};
if !(remoteExecutedOwner isEqualTo 2) exitWith {};

[_price] call AnzusLife_AC_Bank;
[1] call ANZUS_fnc_updatePartial;
