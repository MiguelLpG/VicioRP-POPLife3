#include "..\..\script_macros.hpp"
/*
    File: fn_pickupMoney.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Picks up money
*/
private "_value";
if ((time - life_action_delay) < 1.5) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call ANZUS_fnc_notificationSystem; _this setVariable ["inUse",false,true];};
if (isNull _this || {player distance _this > 3}) exitWith {_this setVariable ["inUse",false,true];};

_list = player nearEntities ['Man', 8];
_list = _list select {isPlayer _x && getPlayerUID _x != getPlayerUID player};
if(count _list > 0) exitWith {["Too close to a player to take this.",true,"slow"] call ANZUS_fnc_notificationSystem; _this setVariable ["inUse",false,true];}; 

_var = ((_this getVariable "AnzusLife_DroppedItem") select 0);
if (_var != "AnzusLife_DroppedMoney") exitWith {};

_value = ((_this getVariable "AnzusLife_DroppedItem") select 1);
_owner = (_this getVariable ["AnzusLife_ItemOwner", nil]);

if (isNil "_owner") exitWith {
    deleteVehicle _this;
    [format["%1/%2 picked up $%3 (OWNED BY NO ONE, WAS REMOVED!)",(name player),(getPlayerUID player),_value], "money.log"] remoteExec ["AH_LogInterface",2];
    ["This money seems to belong to no one and was taken by the government!",true,"slow"] call ANZUS_fnc_notificationSystem;
};

if (!isNil "_value") exitWith {
    deleteVehicle _this;

    switch (true) do {
        case (_value > 20000000) : {_value = 100000;}; //VAL>20mil->100k
        case (_value > 5000000) : {_value = 250000;}; //VAL>5mil->250k
        default {};
    };

    player playMove "AinvPknlMstpSlayWrflDnon";
    titleText[format [localize "STR_NOTF_PickedMoney",[_value] call ANZUS_fnc_numberText],"PLAIN"];
    [_value] call AnzusLife_AC_Cash;

    [format["%1/%2 picked up $%3 (owned by: %4 (%5))",(name player),(getPlayerUID player),_value, (_owner select 0), (_owner select 1)], "money.log"] remoteExec ["AH_LogInterface",2];

    [0] call ANZUS_fnc_updatePartial;
    life_action_delay = time;
};