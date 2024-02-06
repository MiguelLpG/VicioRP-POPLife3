_display = findDisplay 8005001;
private _ctrlGroupAddWarrantBackground = _display displayCtrl 54;
private _ctrlGroupAddWarrant = _display displayCtrl 66;
private _ctrlButtonCancel = _ctrlGroupAddWarrant controlsGroupCtrl 20;
private _ctrlButtonAddWarrant = _ctrlGroupAddWarrant controlsGroupCtrl 21;
private _ctrlListCrimes = _ctrlGroupAddWarrant controlsGroupCtrl 1004;
private _ctrlListPlayers = _ctrlGroupAddWarrant controlsGroupCtrl 1005;

_ctrlButtonCancel ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];

    private _ctrlsGroup = ctrlParentControlsGroup _ctrl;
    private _display = ctrlParent _ctrlsGroup;
    private _ctrlGroupAddWarrantBackground = _display displayCtrl 54;
    private _ctrlGroupAddWarrant = _display displayCtrl 66;

    _ctrlGroupAddWarrantBackground ctrlShow false;
    _ctrlGroupAddWarrant ctrlShow false;
}];

_ctrlButtonAddWarrant ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];

    private _ctrlsGroup = ctrlParentControlsGroup _ctrl;
    private _display = ctrlParent _ctrlsGroup;
    private _ctrlGroupAddWarrantBackground = _display displayCtrl 54;
    private _ctrlGroupAddWarrant = _display displayCtrl 66;

    private _ctrlListPlayers = _ctrlGroupAddWarrant controlsGroupCtrl 1005;
    private _ctrlListCrimes = _ctrlGroupAddWarrant controlsGroupCtrl 1004;

    private _ctrlSelPlayerUID = _ctrlListPlayers lbData (lbCurSel _ctrlListPlayers);
    private _ctrlSelCrimeID = _ctrlListCrimes lbData (lbCurSel _ctrlListCrimes);

    if (_ctrlSelPlayerUID isEqualTo "") exitWith {};
    if (_ctrlSelCrimeID isEqualTo "") exitWith {};

    private _classname = "";
    ("true" configClasses (missionConfigFile >> "CfgJail" >> "Crimes")) select {
        private _id = parseNumber _ctrlSelCrimeID;
        if (getNumber (_x >> "crimeID") isEqualTo _id) then {
            _classname = configName _x
        };
    };

    private _player = [_ctrlSelPlayerUID] call AnzusLife_Lib_GetPlayerByUID;
    if (isNull _player) exitWith {};

    [_player, _classname] call ANZUS_fnc_addWarrants;

    _ctrlGroupAddWarrantBackground ctrlShow false;
    _ctrlGroupAddWarrant ctrlShow false;
    closeDialog 0;
}];

_ctrlGroupAddWarrantBackground ctrlShow true;
_ctrlGroupAddWarrant ctrlShow true;

lbClear _ctrlListPlayers;
{
    if (side _x != west) then {
        private _name = name _x;
        private _uid = getPlayerUID _x;

        _index = _ctrlListPlayers lbAdd _name;
        _ctrlListPlayers lbSetData [_index, _uid];
        _ctrlListPlayers lbSetPicture [_index, "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"];
    };
} forEach (allPlayers - [player]);
_ctrlListPlayers lbSetCurSel 0;

lbClear _ctrlListCrimes;
{
    private _title = getText (_x >> "title");
    private _crimeID = getNumber (_x >> "crimeID");

    _ctrlListCrimes lbAdd _title;
    _ctrlListCrimes lbSetData [_forEachIndex, str _crimeID]
} forEach ("true" configClasses (missionConfigFile >> "CfgJail" >> "Crimes"));

_ctrlListCrimes ctrlRemoveAllEventHandlers "LBSelChanged";
_ctrlListCrimes ctrlAddEventHandler ["LBSelChanged", {
    params [["_ctrl", controlNull, [controlNull]], ["_index", 0, [0]]];

    private _ctrlsGroup = ctrlParentControlsGroup _ctrl;
    private _ctrlTextTitle = _ctrlsGroup controlsGroupCtrl 67;
    private _ctrlTextPenalty = _ctrlsGroup controlsGroupCtrl 68;
    private _ctrlTextTicketValue = _ctrlsGroup controlsGroupCtrl 69;
    private _ctrlTextPrisonTime = _ctrlsGroup controlsGroupCtrl 70;

    private _crimeID = parseNumber (_ctrl lbData _index);
    private _class = ("true" configClasses (missionConfigFile >> "CfgJail" >> "Crimes")) select {getNumber (_x >> "crimeID") isEqualTo _crimeID};
    _class = _class param [0, configNull, [configNull]];

    _priceformatted = [(getNumber (_class >> "ticketValue"))] call ANZUS_fnc_numberText;
    _ctrlTextTitle ctrlSetText "Crime: " + getText (_class >> "title");
    _ctrlTextPenalty ctrlSetText "Penalty: " + getText (_class >> "penalty");
    _ctrlTextTicketValue ctrlSetText "Ticket Price: $" + _priceformatted;
    _ctrlTextPrisonTime ctrlSetText "Prison Time: " + str(getNumber (_class >> "prisonTime")) + " min(s)";
}];
_ctrlListCrimes lbSetCurSel 0;