#include "..\..\script_macros.hpp"
/*
    File: fn_ticketPrompt
    Author: Bryan "Tonic" Boardwine

    Description:
    Prompts the player that he is being ticketed.
*/
private ["_cop","_val"];
if (!isNull (findDisplay 2600)) exitWith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if (isNull _cop) exitWith {};
_amount = _this select 1;

private _ticketAccepted = ["Ticket Received", format ["You have received a ticket of $%1. Do you accept paying this ticket?", [_amount] call ANZUS_fnc_numberText], "PAY", "DECLINE", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

if (_ticketAccepted) then
{
    private _payFromBank = ["Payment Alternatives", format ["Choose payment option. Pressing escape will automatically select cash.",_amount], "BANK", "CASH", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

    if (_payFromBank) then
    {
        if (BANK < _amount) exitWith {["You do not have enough money in your bank account.",true,"slow"] call ANZUS_fnc_notificationSystem; ["Person does not have enough money in their bank.",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];};
        [_amount,true] call AnzusLife_AC_Bank;
        [1] call ANZUS_fnc_updatePartial;

        ["You paid your ticket by money from your bank account.",false,"slow"] call ANZUS_fnc_notificationSystem;
        ["Person has paid the ticket, half of the ticket has gone into your bank.",false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];
    }
    else
    {
        if (CASH < _amount) exitWith {["You do not have enough money in cash.",true,"slow"] call ANZUS_fnc_notificationSystem; ["Person does not have enough cash.",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];};
        [_amount,true] call AnzusLife_AC_Cash;
        [0] call ANZUS_fnc_updatePartial;

        ["You paid your ticket by cash.",false,"slow"] call ANZUS_fnc_notificationSystem;
        ["Person has paid the ticket, half of the ticket has gone into your bank.",false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];
    };

    _newamount = round (_amount / 2);
    [_newamount] remoteExec ["AnzusLife_AC_Bank",remoteExecutedOwner];
    [_newamount] call AnzusLife_BudgetAdd;
}
else
{
    ["You declined paying the ticket.",false,"slow"] call ANZUS_fnc_notificationSystem;
    ["The person chose to decline their ticket payment.",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];
};

closeDialog 0;