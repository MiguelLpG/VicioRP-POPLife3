#include "..\..\script_macros.hpp"
private ["_value"];

_value = CASH;
if (_value <= 0) exitWith {["Nothing to deposit.",true,"slow"] call ANZUS_fnc_notificationSystem;};

[_value,true] call AnzusLife_AC_Cash;
[_value] call AnzusLife_AC_Bank;

[format[localize "STR_ATM_DepositSuccess",[_value] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
[] call ANZUS_fnc_atmMenu;
[] spawn ANZUS_fnc_hudUpdate;
[6] call ANZUS_fnc_updatePartial;