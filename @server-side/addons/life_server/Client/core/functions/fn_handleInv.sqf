#include "..\..\script_macros.hpp"
/*
    File: fn_handleInv.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Do I really need one?
*/
private ["_return","_var","_weight","_value","_diff"];
params[["_math", false], ["_item", ""], ["_num", 0], ["_use", ""]];

//_math = [_this,0,false,[false]] call BIS_fnc_param; //true = add; false = SUB;
//_item = [_this,1,"",[""]] call BIS_fnc_param; //The item we are using to add or remove.
//_num = [_this,2,0,[0]] call BIS_fnc_param; //Number of items to add or remove.

if (_item isEqualTo "" || _num isEqualTo 0) exitWith {false};

if (_use isEqualTo "") exitWith {
    [format["%1/%2 obtained v-items with no use: %3 x %4 (%5)",name player,getPlayerUID player,_item,_num,_math], "vitem_surveilance.log"] remoteExec ["AH_LogInterface",2];
};

if !(_use in ["res","house","jail","misc","police","fish","gather","gps","money","lockpick","mine","spike","pickup","process","container","search","give","load","heal","use","shop","ah"]) then {
    [format["%1/%2 obtained v-items with invalid use (%6): %3 x %4 (%5)",name player,getPlayerUID player,_item,_num,_math,_use], "vitem_surveilance.log"] remoteExec ["AH_LogInterface",2];
} else {
    _what = "obtained";
    if (!_math) then {
        _what = "removed";
    };
    [format["%1/%2 %3 %4 x %5 (%6)",name player,getPlayerUID player,_what,_num,_item,_use], "vitem_log.log"] remoteExec ["AH_LogInterface",2];
};

if (life_carryWeight < 0) then {life_carryWeight = 0;};
_var = ITEM_VARNAME(_item);
if (_math) then {
    _diff = [_item,_num,life_carryWeight,life_maxWeight] call ANZUS_fnc_calWeightDiff;
    _num = _diff;
    if (_num <= 0) exitWith {false};
};
_weight = ([_item] call ANZUS_fnc_itemWeight) * _num;
_value = ITEM_VALUE(_item);

if (_math) then {
    //Lets add!
    if ((life_carryWeight + _weight) <= life_maxWeight) then {
        missionNamespace setVariable [_var,(_value + _num)];

        if ((missionNamespace getVariable _var) > _value) then {
            life_carryWeight = life_carryWeight + _weight;
            _return = true;
        } else {
            _return = false;
        };
    } else {
        _return = false;
    };
} else {
    //Lets SUB!
    if ((_value - _num) < 0) then { _return = false;} else {
        missionNamespace setVariable [_var,(_value - _num)];

        if ((missionNamespace getVariable _var) < _value) then {
            life_carryWeight = life_carryWeight - _weight;
            _return = true;
        } else {_return = false;};
    };
};

switch (_item) do { 
    case "keyCard" : { player setVariable ["copLevel",ITEM_VALUE("keycard") ,true];}; 
};

_return;
