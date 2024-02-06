#include "..\..\script_macros.hpp"
	
private "_group";
life_action_gangInUse = nil;
private _gangSettings = MAIN_SETTINGS("GameSettings","Gangs");
private _value = getNumber(_gangSettings >> "gang_price");

if (BANK < _value) exitWith {
    [format[localize "STR_GNOTF_NotEnoughMoney",[(_value - BANK)] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
    {group player setVariable [_x,nil,true];} forEach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

[_value,true] call AnzusLife_AC_Bank;
[1] call ANZUS_fnc_updatePartial;

[format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[_value] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;