params [["_player",objNull,[objNull]], ["_parole", false]];

if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

if (_parole) then {
    createDialog "AnzusLife_Parole";
} else {
    createDialog "AnzusLife_Jail";
};


_display = findDisplay 19921;

if (_parole) then {
    _display = findDisplay 19922;
};  

_selectCtrl = _display displayCtrl 22;

_cops = [allPlayers - [player], [], { name _x }, "ASCEND",{(side _x) isEqualTo west}] call BIS_fnc_sortBy;
_cops = [player] + _cops;
{
    _selectCtrl lbAdd (name _x);
} foreach _cops;

life_ArrestedPlayer = _player;
_selectCtrl lbSetSelected [0, true];

/*
private _ctrlComboJailList = _display displayCtrl 50;
private _ctrlControlsGroupFooter = _display displayCtrl 51;
private _ctrlInputTime = _display displayCtrl 54;
private _ctrlButtonSendToJail = _ctrlControlsGroupFooter controlsGroupCtrl 52;

private _sentenceTimes = [0];
private _warrants = [displayNull, false] call ANZUS_fnc_requestWarrants;
private _arrestedUID = getPlayerUID _player;
private _defaultSentenceTime = 0;
{
    _x params ["_id", "_uid", "_crimeID"];

    if (_uid isEqualTo _arrestedUID) then {
        private _classes = ARRAY_CRIMES select {getNumber (_x >> "crimeID") isEqualTo _crimeID};
        private _crimeClass = _classes param [0, configNull, [configNull]];

        private _sentenceTime = getNumber (_crimeClass >> "prisonTime");
        _sentenceTimes pushback _sentenceTime;
    };
} forEach _warrants;

_defaultSentenceTime = selectMax _sentenceTimes;
_ctrlInputTime ctrlSetText str _defaultSentenceTime;

_ctrlComboJailList ctrlAddEventHandler ["LBSelChanged", {
    params [["_ctrlList", controlNull, [controlNull]], ["_selIndex", 0, [0]]];

    private _display = ctrlParent _ctrlList;
    private _ctrlTextInformation = _display displayCtrl 53;
    private _jailClassname = _ctrlList lbData _selIndex;

    {
        if (configName _x isEqualTo _jailClassname) exitWith {
            _ctrlTextInformation ctrlSetText getText (_x >> "description");
        };
    } forEach ("true" configClasses (missionConfigFile >> "CfgJail" >> "Jails" >> worldName));
}];

{
    private _name = getText (_x >> "name");
    private _description = getText (_x >> "description");
    private _iconPath = getText (_x >> "icon");

    // Add and set data
    _ctrlComboJailList lbAdd _name;
    _ctrlComboJailList lbSetData [_forEachIndex, configName _x];

    // Set icon
    if (_iconPath != "") then {
        _ctrlComboJailList lbSetPicture [_forEachIndex, _iconPath];
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgJail" >> "Jails" >> worldName));

_ctrlComboJailList lbSetCurSel 0;

_ctrlButtonSendToJail ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrlButton", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButton;
    private _ctrlComboJailList = _display displayCtrl 50;
    private _ctrlInputTime = _display displayCtrl 54;
    private _jailClassname = _ctrlComboJailList lbData (lbCurSel _ctrlComboJailList);
    private _sentenceTime = round ((parseNumber ctrlText _ctrlInputTime) * 60);

    if (_warrants isEqualTo []) exitWith {
    	["This player does not have any warants out for their arrest.",true,"slow"] call ANZUS_fnc_notificationSystem;
    };

    //[TARGET_UNIT, _jailClassname, _sentenceTime, ARREST_REASON] call GW_client_fnc_jailSendToJail;
    _display closeDisplay 2;
}];
*/