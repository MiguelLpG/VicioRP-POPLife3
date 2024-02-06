params [
  ["_type", -1, [0]]
];


private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];

if (isNull _display) exitWith {};

private _title = "";
private _text = "";

private _firstNameCtrl = if (_type isEqualTo -1) then {_display displayCtrl 190002} else {_display displayCtrl 200002};
private _lastNameCtrl = if (_type isEqualTo -1) then {_display displayCtrl 190003} else {_display displayCtrl 200003};
private _companyCtrl = if (_type isEqualTo -1) then {_display displayCtrl 190004} else {_display displayCtrl 200004};
private _numberCtrl = if (_type isEqualTo -1) then {_display displayCtrl 190005} else {_display displayCtrl 200005};
private _emailCtrl = if (_type isEqualTo -1) then {_display displayCtrl 190006} else {_display displayCtrl 200006};

private _firstName = ctrlText _firstNameCtrl;
private _lastName = ctrlText _lastNameCtrl;
private _company = ctrlText _companyCtrl;
private _number = ctrlText _numberCtrl;
private _email = ctrlText _emailCtrl;

if (_number isEqualTo "" || _firstName isEqualTo "" || _lastName isEqualTo "") exitWith {
  ["Your contact must have a number, first and last name, please check the information and try again",true,"slow"] call ANZUS_fnc_notificationSystem;
};

private _prefix = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "phoneNumberPrefix");

if (((_number find _prefix) isEqualTo -1) || (!((_number find _prefix) isEqualTo 0))) exitWith {
  [format["Please make sure the number you have edited starts with the prefix (%1)",_prefix],true,"slow"] call ANZUS_fnc_notificationSystem;
};

private _numberTemp = _number splitString "";

_numberTemp deleteAt 2;
_numberTemp deleteAt 1;
_numberTemp deleteAt 0;

private _number = _numberTemp joinString "";

private _serverTag = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "ServerTag");
private _serverContacts = profileNamespace getVariable [format ["%1_contacts",_serverTag],[]];
private _tempContacts = +_serverContacts;
_tempContacts sort true;
_serverContacts = _tempContacts;

switch (_type) do {	
  case (-1) : {
    _serverContacts pushBack [_firstName, _lastName, _number, _company, _email];
    [format["You have added %1 %2 to your contacts",_firstName, _lastName],true,"slow"] call ANZUS_fnc_notificationSystem;
  };	
  default {
    _serverContacts set [_type, [_firstName, _lastName, _number, _company, _email]];
    [format["You have edited contact details for %1 %2",_firstName, _lastName],true,"slow"] call ANZUS_fnc_notificationSystem;
  };
};

profileNamespace setVariable [format ["%1_contacts",_serverTag], _serverContacts];
saveProfileNamespace;
['AnzusLife_ContactsMain'] spawn ANZUS_fnc_changeMenu;
