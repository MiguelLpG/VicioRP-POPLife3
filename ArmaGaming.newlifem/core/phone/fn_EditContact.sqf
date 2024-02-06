
params [
  ["_index", -1, [-1]]
];

if (_index isEqualTo -1) exitWith {
  ["AnzusLife_ContactsMain"] spawn ANZUS_fnc_changeMenu;
  AnzusLife_Phone_LastOpenDisplays = ["", "AnzusLife_Buttons"];
};

private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];
if (isNull _display) exitWith {};

private _handle = ["AnzusLife_ContactEdit"] spawn ANZUS_fnc_changeMenu;
waitUntil {AnzusLife_Phone_CurrentlyOpen == "AnzusLife_ContactEdit"};
private _serverTag = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "ServerTag");
private _serverContacts = profileNamespace getVariable [format ["%1_contacts",_serverTag],[]];
private _numberPrefix = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "phoneNumberPrefix");

private _thisContactInfo = _serverContacts select _index;
_thisContactInfo params ["_first","_last","_phone","_company","_email"];

private _firstNameCtrl = _display displayCtrl 200002;
private _lastNameCtrl = _display displayCtrl 200003;
private _companyCtrl = _display displayCtrl 200004;
private _numberCtrl = _display displayCtrl 200005;
private _emailCtrl = _display displayCtrl 200006;
private _btnCancel = _display displayCtrl 200008;
private _btnEdit = _display displayCtrl 200009;

_firstNameCtrl ctrlSetText _first;
_lastNameCtrl ctrlSetText _last;
_numberCtrl ctrlSetText format ["%1%2",_numberPrefix,_phone];
_companyCtrl ctrlSetText _company;
_emailCtrl ctrlSetText _email;

private _format = format ["[%1] spawn ANZUS_fnc_LoadContact", (_index + 1)];
_btnCancel ctrlSetEventHandler ["buttonClick", _format];
private _format = format ["[%1] call ANZUS_fnc_ContactChange", _index];
_btnEdit ctrlSetEventHandler ["ButtonClick", _format];
