#include "..\..\script_macros.hpp"
/*
    File: fn_buyClothes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Buys the current set of clothes and closes out of the shop interface.
*/
private ["_price"];
if ((tvCurSel 4) isEqualTo []) exitWith {[localize "STR_Shop_NoClothes",true,"slow"] call ANZUS_fnc_notificationSystem;};

_price = 0;
{
    if (!(_x isEqualTo -1)) then {
        _price = _price + _x;
    };
} forEach life_clothing_purchase;

_hasCheated = call AnzusLife_AC_CheckMoney;
if (_hasCheated) exitWith {};

[_price] spawn {
	params [["_price",0,[0]]];
	
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
        if (_gfunds < _price) exitWith {["You do not have enough money in your gang bank account.",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
        group player setVariable ["gang_bank",round(_gfunds - (_price)),true];

        [format["You successfully purchased your clothes for $%1 in gang funds, enjoy!", [_price] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
        life_clothesPurchased = true;
        closeDialog 0;

        if (!isNil {(group player) getVariable ["gang_name",""]} && _isAllowedToBuy) then {
            [1,group player] remoteExec ["TON_fnc_updateGang",2];
        };
    }
    else
    {
        if (CASH < _price) exitWith {["You do not have enough money in cash.",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
        
        [_price,true] call AnzusLife_AC_Cash;

        if (playerSide isEqualTo civilian) then {
            [_price/10] call AnzusLife_BudgetAdd;
        };
        if (playerSide in [west, independent]) then {
            [_price] call AnzusLife_BudgetSub;
        };
        
        [0] call ANZUS_fnc_updatePartial;

        [format["You successfully purchased your clothes for $%1!", [_price] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
        life_clothesPurchased = true;
        closeDialog 0;
    };
};