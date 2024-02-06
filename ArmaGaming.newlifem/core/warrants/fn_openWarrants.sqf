createDialog "AnzusLife_Warrents";

_display = findDisplay 8005001;
private _ctrlSearch = _display displayCtrl 22;
private _ctrlButtonSearch = _display displayCtrl 32;

private _ctrlGroupAddWarrantBackground = _display displayCtrl 54;
private _ctrlGroupAddWarrant = _display displayCtrl 66;

private _ctrlGroupFooter = _display displayCtrl 43;
private _ctrlButtonIssueWarrant = _ctrlGroupFooter controlsGroupCtrl 25;
private _ctrlButtonDestroyWarrant = _ctrlGroupFooter controlsGroupCtrl 26;

_ctrlButtonDestroyWarrant ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlButtonDestroyWarrant ctrlAddEventHandler ["ButtonClick", {
    private _display = findDisplay 8005001;
    private _ctrlListHere = _display displayCtrl 60;
    private _lnbData = _ctrlListHere lnbData [lnbCurSelRow _ctrlListHere, 0];
    private _warrantsIDDestroy = parseNumber _lnbData;
    systemChat str (_warrantsIDDestroy);

    [_warrantsIDDestroy] remoteExec ["ANZUS_fnc_delWarrantsServ",2];
    
    _warrants = call compile (missionNamespace getVariable "AnzusLife_AllWarrants");
    
    {
        if ((_x select 0) isEqualTo _warrantsIDDestroy) then {
            _warrants deleteAt _forEachIndex;
        };
    } forEach _warrants;

    missionNamespace setVariable ["AnzusLife_AllWarrants", str _warrants, true];
    ["The warrant you selected to be destroyed has now been deleted.",false,"slow"] call ANZUS_fnc_notificationSystem;

    closeDialog 0;
}];

_ctrlButtonIssueWarrant ctrlEnable (playerSide isEqualTo west && call(life_coplevel) > 1);
_ctrlButtonDestroyWarrant ctrlEnable (playerSide isEqualTo west && call(life_coplevel) > 3);

private _ctrlList = _display displayCtrl 60;
private _ctrlFilter = _display displayCtrl 40;
[_ctrlFilter, _ctrlList] call BIS_fnc_initListNBoxSorting;


_allwarrants = call compile AnzusLife_AllWarrants;
lbClear _ctrlList;
{
    _x params ["_id", "_playerUID", "_crimeID", "_warrantIssueDate"];

    private _player = [_playerUID] call AnzusLife_Lib_GetPlayerByUID;
    private _class = ("true" configClasses (missionConfigFile >> "CfgJail" >> "Crimes")) select {getNumber (_x >> "crimeID") isEqualTo _crimeID};
    _class = _class param [0, configNull, [configNull]];
    _issuedate = format ["%1-%2-%3 at %4:%5",_warrantIssueDate select 1, _warrantIssueDate select 2, _warrantIssueDate select 0, _warrantIssueDate select 3, _warrantIssueDate select 4];

    if (!isNull _player) then {
        private _index = _ctrlList lnbAddRow [str _id, name _player, getText (_class >> "title"), _issuedate];

        _ctrlList lnbSetData [[_index, 0], str _id];
    };
} forEach _allwarrants;

_ctrlGroupAddWarrantBackground ctrlShow false;
_ctrlGroupAddWarrant ctrlShow false;

_ctrlSearch ctrlRemoveAllEventHandlers "KeyUp";
_ctrlSearch ctrlAddEventHandler ["KeyUp", {
    params [["_ctrl", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrl;
    private _ctrlButtonSearch = _display displayCtrl 32;
    private _iconPath = [
        "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa",
        "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa"
    ] select !(ctrlText _ctrl isEqualTo "");

    _ctrlButtonSearch ctrlSetText _iconPath;
    [] call ANZUS_fnc_updateWarrants;
}];

// Handle search button
_ctrlButtonSearch ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlButtonSearch ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrl;
    private _ctrlSearch = _display displayCtrl 22;

    if !(ctrlText _ctrlSearch isEqualTo "") then {
        _ctrl ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
        _ctrlSearch ctrlSetText ""
    }
}];

// Handle add warrant button
_ctrlButtonIssueWarrant ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlButtonIssueWarrant ctrlAddEventHandler ["ButtonClick", {[] spawn ANZUS_fnc_issueWarrant;}];