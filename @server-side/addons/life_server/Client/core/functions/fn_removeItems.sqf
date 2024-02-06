#include "..\..\script_macros.hpp"
	
private ["_unit","_item","_value"];
_unit = _this select 0;

{
    if (_x isEqualType "") then {_item = _x;} else {_item = configName _x};
    _value = ITEM_VALUE(_item);
    _itemName = ITEM_VARNAME(_item);

    switch (_item) do {	
        case "alcash": {
            if (CASH > 0) then {
                missionNamespace setVariable ["alcash",0];
            };
        };

        default {
            if (_value > 0) then {
                missionNamespace setVariable [_itemName,0];
            };
        };
    };
} forEach (("true" configClasses (missionConfigFile >> "VirtualItems")) + ["alcash"]);

life_carryWeight = 0;
[CASH,true] call AnzusLife_AC_Cash;
[0] call ANZUS_fnc_updatePartial;