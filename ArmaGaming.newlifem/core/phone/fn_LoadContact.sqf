
params [
  ["_index", -1, [-1]]
];

if (_index isEqualTo -1) exitWith {};


private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];

if (isNull _display) exitWith {};

private _handle = ["AnzusLife_ContactView"] spawn ANZUS_fnc_changeMenu;
waitUntil {AnzusLife_Phone_CurrentlyOpen == "AnzusLife_ContactView"};
private _serverTag = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "ServerTag");
private _serverContacts = profileNamespace getVariable [format ["%1_contacts",_serverTag],[]];

_index = _index - 1;

private _thisContactInfo = _serverContacts select _index;
_thisContactInfo params ["_first","_last","_phone","_company","_email"];
private _nameCtrl = _display displayCtrl 210004;

_nameCtrl ctrlSetStructuredText parseText format ["<t size= '%3'>%1 %2</t>", _first, _last, (((pixelH * 5) * ((getResolution select 1) / 1080)) * 130)];

private _phoneControl = _display displayCtrl 210005;
private _numberPrefix = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "phoneNumberPrefix");
_phoneControl ctrlSetText format ["%1%2",_numberPrefix,_phone];
_phoneControl ctrlSetTextColor [0, 0, 0, 1];
private _emailControl = _display displayCtrl 210006;
_emailControl ctrlSetText _email;
_emailControl ctrlSetTextColor [0, 0, 0, 1];

private _buttonEdit = _display displayCtrl 210009;
private _buttonSendMessage = _display displayCtrl 210002;
private _buttonSendMessage2 = _display displayCtrl 210007;
private _buttonDeleteContact = _display displayCtrl 210011;

private _format = format ["[%1] spawn ANZUS_fnc_EditContact",_index];
private _SendMessageformat = format ["['%1'] spawn ANZUS_fnc_LoadMessages",_phone];
private _deleteContactFormat = format ["[%1] call ANZUS_fnc_DeleteContact", _index];

_buttonDeleteContact ctrlSetEventHandler ["buttonClick", _deleteContactFormat];
_buttonEdit ctrlSetEventHandler ["buttonClick", _format];
_buttonSendMessage ctrlSetEventHandler ["buttonClick", _SendMessageformat];
_buttonSendMessage2 ctrlSetEventHandler ["buttonClick", _SendMessageformat];
