#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMenu.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Something
*/

params [
	["_shopClass","",[""]]
];

if (dialog) then {closeDialog 0};

private _shopDir = missionConfigFile >> "WeaponShops" >> (_shopClass);
if !(isClass _shopDir) exitWith {};

private _shopTitle =  getText(_shopDir >> "name");
private _shopSide = getText(_shopDir >> "side");
private _conditions = getText(_shopDir >> "conditions");
AnzusLife_currentActiveShop = _shopDir;

private _exit = false;
if !(_shopSide isEqualTo "") then {
    private _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};
if (_exit) exitWith {};

_exit = [_conditions] call ANZUS_fnc_levelCheck;
if !(_exit) exitWith {[localize "STR_Shop_Veh_NotAllowed",true,"slow"] call ANZUS_fnc_notificationSystem;};

if !(createDialog "AnzusLife_EquipmentShop") exitWith {};

private _display = findDisplay 8000340;
private _ctrlButtonCancel = _display displayCtrl 8000348;
_ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {closeDialog 0}];

private _ctrlTitle = _display displayCtrl 8000351;
_ctrlTitle ctrlSetText _shopTitle;

private _ctrlEquipmentTree = _display displayCtrl 8000343;
_ctrlEquipmentTree ctrlAddEventHandler ["TreeSelChanged", {
    params [
        ["_ctrl", controlNull, [controlNull]],
        ["_selectionPath", [], [[]]]
    ];
    private _display = ctrlParent _ctrl;

    private _tvData = _ctrl tvData _selectionPath;
    if (_tvData isEqualTo "") exitWith {};

    private _dataArray = parseSimpleArray _tvData;
    _dataArray params [
        ["_itemClassname", "", [""]],
        ["_displayName", "", [""]],
        ["_picture", "", [""]],
        ["_purchasePrice", 0, [0]],
        ["_conditions", "", [""]],
        ["_description", "", [""]]
    ];

    private _ctrlTextDisplayname = _display displayCtrl 8000345;
    _ctrlTextDisplayname ctrlSetText _displayName;

    if !(_picture isEqualTo "") then {
        private _ctrlItemPicture = _display displayCtrl 8000344;
        _ctrlItemPicture ctrlSetStructuredText parseText format ["<br/><img align='center' size='%1' image='%2' />", 3.3 * safezoneH, _picture];
    };

    private _ctrlPurchasePrice = _display displayCtrl 8000346;
    _ctrlPurchasePrice ctrlSetText ("$" + ([_purchasePrice] call ANZUS_fnc_numberText));

    private _ctrlDescripionText = _display displayCtrl 8000347;
    if (_description != "") then {_ctrlDescripionText ctrlSetText _description;} else {_ctrlDescripionText ctrlSetText "Description Not Available"};
}];

[_display, _ctrlEquipmentTree] spawn ANZUS_fnc_weaponShopFill;

private _ctrlButtonRefreshSearch = _display displayCtrl 8000342;
_ctrlButtonRefreshSearch ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _display = ctrlParent _ctrl;

    private _ctrlInput = _display displayCtrl 8000341;
    _ctrlInput ctrlSetText "";

    private _ctrlTree = _display displayCtrl 8000343;
   [_display, _ctrlTree] spawn ANZUS_fnc_weaponShopFill;
}];

private _ctrlButtonPurchase = _display displayCtrl 8000349;
_ctrlButtonPurchase ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _display = ctrlParent _ctrl;

    _hasCheated = call AnzusLife_AC_CheckMoney;
    if (_hasCheated) exitWith {};

    private _ctrlTree = _display displayCtrl 8000343;
    private _tvData = _ctrlTree tvData (tvCurSel _ctrlTree);
    if (_tvData isEqualTo "") exitWith {};

    private _dataArray = parseSimpleArray _tvData;
    _dataArray params [
        ["_itemClassname", "", [""]],
        ["_displayName", "", [""]],
        ["_picture", "", [""]],
        ["_purchasePrice", 0, [0]]
    ];

    [_itemClassname,_displayName,_purchasePrice] spawn {
    	_payFromCash = false;  

    	private _requiredBuyRank = getNumber (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Needed_Rank_UseBank");
        private _playerRank = [player] call ANZUS_fnc_gangGetRank;
        private _isAllowedToBuy = _playerRank >= _requiredBuyRank;

		if (!isNil {(group player) getVariable ["gang_name",""]} && _isAllowedToBuy) then {
		    _payFromCash = ["Payment Alternatives", "Choose payment option. Pressing escape will automatically select cash.", "GANG BANK", "YOUR CASH", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
		} else {
		    _payFromCash = false;
		};

		if (_payFromCash) then
	    {	
	    	_gfunds = group player getVariable ["gang_bank",0];
	        if (_gfunds < _this select 2) exitWith {["You do not have enough money in your gang bank account.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	        group player setVariable ["gang_bank",round(_gfunds - (_this select 2)),true];

	        [format["You successfully purchased a %1 for $%2 in gang funds, enjoy!", _this select 1, [_this select 2] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
            [_this select 0,true] call ANZUS_fnc_handleItem;
	    }
	    else
	    {
	        if (CASH < _this select 2) exitWith {["You do not have enough money in cash.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	        [_this select 2,true] call AnzusLife_AC_Cash;

            if (AnzusLife_currentActiveShop in ["genstore", "gun", "hunting"]) then {
                [_this select 2/5] call AnzusLife_BudgetAdd;
            };
            if (playerSide in [west, independent]) then {
                [_this select 2] call AnzusLife_BudgetSub;
            };

	        [0] call ANZUS_fnc_updatePartial;

	        [format["You successfully purchased a %1 for $%2, enjoy!", _this select 1, [_this select 2] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
            [_this select 0,true] call ANZUS_fnc_handleItem;
	    };
	};
}];

waitUntil {isNull (findDisplay 8000340)};

private _requiredBuyRank = getNumber (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Needed_Rank_UseBank");
private _playerRank = [player] call ANZUS_fnc_gangGetRank;
private _isAllowedToBuy = _playerRank >= _requiredBuyRank;

if (!isNil {(group player) getVariable ["gang_name",""]} && _isAllowedToBuy) then {
    [1,group player] remoteExec ["TON_fnc_updateGang",2];
};