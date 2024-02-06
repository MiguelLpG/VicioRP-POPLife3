#include "..\..\script_macros.hpp"
/*
    File: fn_atmMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and manages the bank menu.
*/
private ["_units","_type"];

if (!life_use_atm) exitWith {
    [format[localize "STR_Shop_ATMRobbed",(LIFE_SETTINGS(getNumber,"noatm_timer"))],true,"slow"] call ANZUS_fnc_notificationSystem;
};

if (!dialog) then {
    if (!(createDialog "AnzusLife_Bank")) exitWith {};
};

//_hasCheated = call AnzusLife_AC_CheckMoney;
//if (_hasCheated) exitWith {};

disableSerialization;
_units = CONTROL(8999520,122);

lbClear _units;
CONTROL(8999520,120) ctrlSetText format ["%1%2","$",[BANK] call ANZUS_fnc_numberText];
CONTROL(8999520,121) ctrlSetText format ["%1%2","$",[CASH] call ANZUS_fnc_numberText]; 

private _playersToCount = [playableUnits, [], { name _x }, "ASCEND"] call BIS_fnc_sortBy;


{
    _name = name _x;
    if (alive _x && (!(_name isEqualTo profileName))) then {
        private _index = _units lbAdd format ["%1",name _x];
        _units lbSetData [_index,str(_x)];
    };
} forEach _playersToCount;

lbSetCurSel [122,0];