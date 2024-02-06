/*
    File: fn_licensesRead.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Outprints the licenses.
*/
params [
    ["_civ","",[""]],
    ["_licenses",(localize "STR_Cop_NoLicenses"),[""]],
    ["_unit", objNull, [objNull]]
];

_allwarrants = call compile AnzusLife_AllWarrants;
_arrestInfo = "";
{
    _x params ["_id", "_playerUID", "_crimeID", "_warrantIssueDate"];

    if (_playerUID == getPlayerUID _unit) then {
        _class = ("true" configClasses (missionConfigFile >> "CfgJail" >> "Crimes")) select {getNumber (_x >> "crimeID") isEqualTo _crimeID};
        _class = _class param [0, configNull, [configNull]];
        _issuedate = format ["%1-%2-%3 at %4:%5",_warrantIssueDate select 1, _warrantIssueDate select 2, _warrantIssueDate select 0, _warrantIssueDate select 3, _warrantIssueDate select 4];
        _arrestInfo = _arrestInfo + (getText(_class >> "title")) + " on " + _issuedate;
    };

} forEach _allwarrants;

if (_arrestInfo != "") then {
    _arrestInfo = "<t color='#FFD700'><t size='1.5'>Warrents:</t></t><br/>" + _arrestInfo;
};

[parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>" +(localize "STR_Cop_Licenses")+ "</t></t><br/>%2<br/><br/>%3",_civ,_licenses,_arrestInfo],true,"slow"] call ANZUS_fnc_notificationSystem;