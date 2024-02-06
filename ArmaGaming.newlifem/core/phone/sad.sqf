private _serverTag = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "ServerTag");
private _serverContacts = profileNamespace getVariable [format ["%1_contacts",_serverTag],[]];
private _tempContacts = +_serverContacts;
_tempContacts sort true;
profileNamespace setVariable [format ["%1_contacts",_serverTag],_tempContacts];