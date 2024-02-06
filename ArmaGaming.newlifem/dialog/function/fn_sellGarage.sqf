#include "..\..\script_macros.hpp"
/*
    File: fn_sellGarage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sells a vehicle from the garage.
*/
private ["_sellPrice","_multiplier","_price","_purchasePrice"];
disableSerialization;

private _display = findDisplay 98123;
private _ctrlList = _display displayCtrl 26;
private _selRow = lnbCurSelRow _ctrlList;
private _data = _ctrlList lnbData [_selRow, 0];
private _vid = _ctrlList lnbValue [_selRow, 0];

_data params [["_className", "", [""]], ["_color", "", [""]]];
if (_selRow isEqualTo -1) exitWith {[localize "STR_Global_NoSelection",true,"slow"] call ANZUS_fnc_notificationSystem;};

if (isNil "_className") exitWith {[localize "STR_Garage_Selection_Error",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((time - life_action_delay) < 1.5) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call ANZUS_fnc_notificationSystem;};

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");
_shopSettings = MAIN_SETTINGS("Shops","Vehicle");
switch (playerSide) do {
    case civilian: {
        _multiplier = getNumber(_shopSettings >> "vehicle_sell_multiplier_CIVILIAN");
        _purchasePrice = _price * getNumber(_shopSettings >> "vehicle_purchase_multiplier_CIVILIAN");
    };
    case west: {
        _multiplier = getNumber(_shopSettings >> "vehicle_sell_multiplier_COP");
        _purchasePrice = _price * ((call AnzusLife_GovSubsidization) select 0);
    };
    case independent: {
        _multiplier = getNumber(_shopSettings >> "vehicle_sell_multiplier_MEDIC");
        _purchasePrice = _price * ((call AnzusLife_GovSubsidization) select 1);
    };
};

_sellPrice = _purchasePrice * _multiplier;
if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};

if (isNil "life_sellVehicle") then {
    life_sellVehicle = scriptNull;
};

if (!scriptDone life_sellVehicle) exitWith {};

life_sellVehicle = [_sellPrice,_vid] spawn {
    params [["_sellPrice",0,[0]],["_vid",0,[0]]];

    private _action = ["Sell Vehicle", format["Are you sure you want to sell this vehicle for $%1? You can not undo this, it is permanent.",[_sellPrice] call ANZUS_fnc_numberText], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
    closeDialog 0;

    if (_action) then {
        if ((time - life_action_delay) < 1.5) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
        life_action_delay = time;

        [_vid,getPlayerUID player,_sellPrice,player,life_garage_type] remoteExecCall ["TON_fnc_vehicleDelete",RSERV];

        [format[localize "STR_Garage_SoldCar",[_sellPrice] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
        [_sellPrice] call AnzusLife_AC_Bank;
        [1] call ANZUS_fnc_updatePartial;
    };
};
