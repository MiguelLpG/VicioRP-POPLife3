#include "..\..\script_macros.hpp"
/*
    File: fn_healHospital.sqf
    Author: Bryan "Tonic" Boardwine
    Reworked: Jesse "TKCJesse" Schultz

    Description:
    Prompts user with a confirmation dialog to heal themselves.
    Used at the hospitals to restore health to full.
    Note: Dialog helps stop a few issues regarding money loss.
*/
private ["_healCost","_action"];
_doctor = param [0,objNull,[objNull]];

if (dialog) then {closeDialog 0};
waitUntil {!dialog};

if (life_action_inUse) exitWith {};
if ((damage player) < 0.01) exitWith {[localize "STR_NOTF_HS_FullHealth",true,"slow"] call ANZUS_fnc_notificationSystem;};
_healCost = MAIN_SETTINGS_TYPE(getNumber,"Medical","hospitalFee");
if (CASH < _healCost) exitWith {[format [localize "STR_NOTF_HS_NoCash",[_healCost] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;};

life_action_inUse = true;
private _action = [localize "STR_NOTF_HS_TITLE", format[localize "STR_NOTF_HS_PopUp",[_healCost] call ANZUS_fnc_numberText], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

if (_action) then {
    [localize "STR_NOTF_HS_Healing",true,"slow"] call ANZUS_fnc_notificationSystem;
    closeDialog 0;
	uiSleep 8;
    if (player distance _doctor > 5) exitWith {life_action_inUse = false; [localize "STR_NOTF_HS_ToFar",true,"slow"] call ANZUS_fnc_notificationSystem;};
    [localize "STR_NOTF_HS_Healed",true,"slow"] call ANZUS_fnc_notificationSystem;
    [_healCost,true] call AnzusLife_AC_Cash;
    life_action_inUse = false;
    player setDamage 0;
} else {
    [localize "STR_NOTF_ActionCancel",true,"slow"] call ANZUS_fnc_notificationSystem;
    closeDialog 0;
    life_action_inUse = false;
};
