#include "..\..\script_macros.hpp"
/*
    File: fn_updateWarrants.sqf
    Author: Arma-Gaming

    Description:
    Update and fill the warrants menu.
*/

disableSerialization;


private _allwarrants = call compile AnzusLife_AllWarrants;
private _display = findDisplay 8005001;
private _ctrlListItems = _display displayCtrl 60;
private _searchFilter = toLower(ctrlText 22);

// Clear items of listnbox
lnbClear _ctrlListItems;

{
    _x params ["_id", "_playerUID", "_crimeID", "_warrantIssueDate"];

    private _player = [_playerUID] call AnzusLife_Lib_GetPlayerByUID;
    if (!isNull _player) then {
        if (((tolower (name _player)) find _searchFilter) > -1 || _searchFilter == "") then {
            private _class = ("true" configClasses (missionConfigFile >> "CfgJail" >> "Crimes")) select {getNumber (_x >> "crimeID") isEqualTo _crimeID};
            _class = _class param [0, configNull, [configNull]];
            _issuedate = format ["%1-%2-%3 at %4:%5",_warrantIssueDate select 1, _warrantIssueDate select 2, _warrantIssueDate select 0, _warrantIssueDate select 3, _warrantIssueDate select 4];

            
            private _index = _ctrlListItems lnbAddRow [str _id, name _player, getText (_class >> "title"), _issuedate];

            _ctrlListItems lnbSetData [[_index, 0], str _id];
        };
    };
} forEach _allwarrants;
