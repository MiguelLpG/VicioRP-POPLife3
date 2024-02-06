#include "..\..\script_macros.hpp"
/*
    File: fn_virt_sell.sqf
    Author: Arma-Gaming

    Description:
    Sell a virtual item to the store / shop
*/
params [["_all",false,[false]]];

private _display = findDisplay 889922;
private _ctrlListItems = _display displayCtrl 83;
private _itemData = _ctrlListItems lnbData [lnbCurSelRow _ctrlListItems, 0];
private _group = ["Cartel"] call AnzusLife_Lib_GetGroup;
private _sellPrice = M_CONFIG(getNumber,"VirtualItems",_itemData,"sellPrice");

if (_itemData isEqualTo "") exitWith {["Item has no data, send this to a developer.",true,"slow"] call ANZUS_fnc_notificationSystem};

if ((time - life_action_delay) < 0.2) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call ANZUS_fnc_notificationSystem;};
life_action_delay = time;

// Make sure they cannot buy if the price is nothing
if (_sellPrice isEqualTo -1) exitWith {["You cannot sell this item",true,"slow"] call ANZUS_fnc_notificationSystem;};

private _amount = ctrlText 84;
_amount = parseNumber(_amount);
if (_amount > (ITEM_VALUE(_itemData))) exitWith {[localize "STR_Shop_Virt_NotEnough",true,"slow"] call ANZUS_fnc_notificationSystem;};

if (_all) then {_amount = (ITEM_VALUE(_itemData))};

private _successes = 0;
for "_i" from 1 to _amount do
{
    _successes = _successes + 1;
};

if (_successes >= 1) then
{
    private _displayName = localize (ITEM_NAME(_itemData));
    private _totalSellPrice = _sellPrice * _successes;
    private _illegal = ITEM_ILLEGAL(_itemData);

    if ((vehicleVarName life_shop_npc) find 'CartelDealer' > -1) then {
        if (!((missionNamespace getVariable ["AnzusLife_Cartel",0]) > 0) || isNull _group) then {
            ["There is no cartel which means this vendor does not work, come back when there is a active cartel.",true,"slow"] call ANZUS_fnc_notificationSystem;
            closeDialog 0;
        } else {
            private _newamm = ceil(_totalSellPrice / 5);
            private _playerrecived = (_totalSellPrice - _newamm);

            if (_group isEqualTo group player) then {
                [format["You sold %1x %2 for $%3 and were not taxed as you are the cartel.",_successes,_displayName,[_totalSellPrice] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
                [_totalSellPrice] call AnzusLife_AC_Cash;
                [format["%1/%2 has sold %3x %4 for $%5",profileName,(getPlayerUID player),_successes,_displayName,[_totalSellPrice] call ANZUS_fnc_numberText], "sell.log"] remoteExec ["AH_LogInterface",2];
            } else {
                [format["You sold %1x %2 for $%3, as the cartel has took $%4 in a cut for using there dealer.",_successes,_displayName,[_playerrecived] call ANZUS_fnc_numberText,[_newamm] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
                [_playerrecived] call AnzusLife_AC_Cash;
                AnzusLife_CartelDrugSell = AnzusLife_CartelDrugSell + _newamm;
                [format["%1/%2 has sold %3x %4 for $%5",profileName,(getPlayerUID player),_successes,_displayName,[_playerrecived] call ANZUS_fnc_numberText], "sell.log"] remoteExec ["AH_LogInterface",2];
            };
        };
    } else {
        [_totalSellPrice] call AnzusLife_AC_Cash;
        [format["You sold %1x %3 for $%2",_successes,[_totalSellPrice] call ANZUS_fnc_numberText,_displayName],false,"slow"] call ANZUS_fnc_notificationSystem;
        [format["%1/%2 has sold %3x %4 for $%5",profileName,(getPlayerUID player),_successes,_displayName,[_totalSellPrice] call ANZUS_fnc_numberText], "sell.log"] remoteExec ["AH_LogInterface",2];
    };

    [false,_itemData,_successes,"shop"] call ANZUS_fnc_handleInv;
    [0] call ANZUS_fnc_updatePartial;
} else {
    ["You failed to sell the item(s)",true,"slow"] call ANZUS_fnc_notificationSystem;
};


[] call ANZUS_fnc_virt_update;
[0] call ANZUS_fnc_updatePartial;
[3] call ANZUS_fnc_updatePartial;

