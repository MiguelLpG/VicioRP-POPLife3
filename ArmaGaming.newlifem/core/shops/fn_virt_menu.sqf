#include "..\..\script_macros.hpp"
/*
    File: fn_virt_menu.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Initialize the virtual shop menu.
*/

params [
    ["_shopNPC", objNull, [objNull]],"","",["_shopType", "", [""]]
];

if (dialog) then {closeDialog 0};
if (isNull _shopNPC || {_shopType isEqualTo ""}) exitWith {};
private _shopSide = M_CONFIG(getText,"VirtualShops",_shopType,"side");

life_shop_type = _shopType;
life_shop_npc = _shopNPC;

private _exit = false;
private _group = ["Cartel"] call AnzusLife_Lib_GetGroup;
if ((vehicleVarName _shopNPC) find 'CartelDealer' > -1) then {
    if (!((missionNamespace getVariable ["AnzusLife_Cartel",0]) > 0) || isNull _group) exitWith {["There is no cartel which means this vendor does not work, come back when there is a active cartel.",true,"slow"] call ANZUS_fnc_notificationSystem; _exit = true;};
};

if !(_shopSide isEqualTo "") then {
    private _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};
if (_exit) exitWith {};

private _conditions = M_CONFIG(getText,"VirtualShops",_shopType,"conditions");
if !([_conditions] call ANZUS_fnc_levelCheck) exitWith {["You are unauthorized and you cannot access this shop.",true,"slow"] call ANZUS_fnc_notificationSystem;};

createDialog "AnzusLife_ItemShop";

private _display = findDisplay 889922;
private _ctrlTitle = _display displayCtrl 92;
_ctrlTitle ctrlSetText localize (M_CONFIG(getText,"VirtualShops",_shopType,"name"));

private _ctrlSearchEdit = _display displayCtrl 80;
private _ctrlSearchButton = _display displayCtrl 81;

private _ctrlListItemsFilter = _display displayCtrl 82;
private _ctrlListItems = _display displayCtrl 83;

// Init listbox sorting (adds arrows and allows sorting)
[_ctrlListItemsFilter, _ctrlListItems] call BIS_fnc_initListNBoxSorting;

private _ctrlAmountEditInput = _display displayCtrl 84;
private _ctrlAmountButtonPlus = _display displayCtrl 85;
private _ctrlAmountButtonMinus = _display displayCtrl 86;

vamountEditValue = compileFinal "
    params [[""_plus"", false, [false]]];
    
    private _display = findDisplay 889922;
    private _ctrlEditAmount = _display displayCtrl 84;
    private _ctrlText = ctrlText _ctrlEditAmount;
    private _currentAmount = parseNumber _ctrlText;
    private _newAmount = 0;

    _newAmount = [(_currentAmount - 1), (_currentAmount + 1)] select _plus;
    if (_newAmount < 1) then { _newAmount = 1; };

    _ctrlEditAmount ctrlSetText str _newAmount;
";

_ctrlAmountButtonPlus ctrlAddEventHandler ["ButtonClick", {[true] call vamountEditValue;}];
_ctrlAmountButtonMinus ctrlAddEventHandler ["ButtonClick", {[false] call vamountEditValue;}];

private _ctrlInventoryProgressBar = _display displayCtrl 87;
private _ctrlInventoryProgressText = _display displayCtrl 88;

private _ctrlFooter = _display displayCtrl 89;
private _ctrlFooterButtonBuy = _ctrlFooter controlsGroupCtrl 90;
private _ctrlFooterButtonSell = _ctrlFooter controlsGroupCtrl 91;
private _ctrlFooterButtonSellAll = _ctrlFooter controlsGroupCtrl 93;

_ctrlFooterButtonBuy ctrlAddEventHandler ["ButtonClick", {[] call ANZUS_fnc_virt_buy;}];
_ctrlFooterButtonSell ctrlAddEventHandler ["ButtonClick", {[] call ANZUS_fnc_virt_sell;}];
_ctrlFooterButtonSellAll ctrlAddEventHandler ["ButtonClick", {[true] call ANZUS_fnc_virt_sell;}];
_ctrlSearchEdit ctrlAddEventHandler ["KeyUp", {[] call ANZUS_fnc_virt_update}];


//Load
[] call ANZUS_fnc_virt_update;
_ctrlListItems lnbSetCurSelRow 0;

waitUntil {isNull (findDisplay 889922)};
private _amount = AnzusLife_CartelDrugSell;

if (!(isNil "_amount") && _amount > 0) then {
	[_amount,_group,"DrugDealer"] remoteExec ["AnzusLife_ReciveGangProfit",2];
	AnzusLife_CartelDrugSell = 0;
};