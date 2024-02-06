#include "..\..\script_macros.hpp"
/*
    File: fn_postBail.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when the player attempts to post bail.
    Needs to be revised.
*/
if (life_bail_paid) exitWith {};
if (isNil "life_bail_amount") then {life_bail_amount = 3500;};
if (!life_canpay_bail) exitWith {[localize "STR_NOTF_Bail_Post",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (BANK < life_bail_amount) exitWith {[format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount],true,"slow"] call ANZUS_fnc_notificationSystem;};

[life_bail_amount,true] call AnzusLife_AC_Bank;
life_bail_paid = true;
[1] call ANZUS_fnc_updatePartial;
[0,"STR_NOTF_Bail_Bailed",true,[profileName]] remoteExecCall ["ANZUS_fnc_broadcast",RCLIENT];