#include "..\..\script_macros.hpp"
/*
    File: fn_dropItems.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called on death, player drops any 'virtual' items they may be carrying.
*/
private ["_obj","_unit","_item","_value"];
params [["_unit",objNull,[objNull]],["_onlyDropIllegal",false,[false]]];

{
    if (_x isEqualType "") then {_item = _x;} else {_item = configName _x};
    _value = ITEM_VALUE(_item);
    _itemName = ITEM_VARNAME(_item);
    _illegal = ITEM_ILLEGAL(_item);
    _weight = ITEM_WEIGHT(_item) * _value;

    switch (_item) do { 
        case "alcash": {
            private _cash = missionNamespace getVariable ["alcash",0];
            if (_cash > 0) then {
                _pos = ASLToATL (AGLToASL (_unit modelToWorld[0,0,0]));
                if !(isTouchingGround player) then {_pos set[2,0];};
                [_cash, _pos] call ANZUS_fnc_dropCash;
            };
        };
        
        default {
            if (_value > 0) then {
                _pos = ASLToATL (AGLToASL (_unit modelToWorld[0,1,0]));
                if !(isTouchingGround player) then {_pos set[2,0];};
                if ((_onlyDropIllegal && (_illegal isEqualTo 1)) || !_onlyDropIllegal) then {
                    _obj = createSimpleObject ["Land_suitcase_F", [0,0,0]];
                    [_obj] remoteExecCall ["ANZUS_fnc_simDisable",RANY];
                    _obj setPosATL _pos;
                    _obj setVariable ["AnzusLife_DroppedItem",[_item,_value],true];
                    missionNamespace setVariable [_itemName,0];
                    life_carryWeight = life_carryWeight - _weight;
                };
            };
        };
    };
} forEach (("true" configClasses (missionConfigFile >> "VirtualItems")) + ["alcash"]);

if !(_onlyDropIllegal) then {
    player setVariable ["copLevel",0,true];
};
if (life_carryWeight < 0) then {life_carryWeight = 0;};