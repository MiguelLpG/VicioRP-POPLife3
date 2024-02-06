params [
  ["_index", -1, [-1]]
];

if (_index isEqualTo -1) exitWith {};

private _serverTag = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "ServerTag");
private _serverContacts = profileNamespace getVariable [format ["%1_contacts",_serverTag],[]];
private _thisContactInfo = _serverContacts select _index;
_thisContactInfo params ["_first","_last","_phone","_company","_email"];
_serverContacts deleteAt _index;
private _tempContacts = +_serverContacts;
_tempContacts sort true;
private _serverContacts = _tempContacts;
profileNamespace setVariable [format ["%1_contacts",_serverTag], _serverContacts];
saveProfileNamespace;
[format["You have successfully removed %1 %2 from your contacts.",_firstName,_lastName],true,"slow"] call ANZUS_fnc_notificationSystem;
["AnzusLife_ContactsMain"] spawn ANZUS_fnc_changeMenu;
AnzusLife_Phone_LastOpenDisplays = ["", "AnzusLife_Buttons"];
