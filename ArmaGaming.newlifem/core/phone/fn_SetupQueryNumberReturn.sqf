params ["_number"];

player setVariable ["AnzusLife_PhoneNumber", _number, true];
AnzusLife_TempPhoneData set [2, _number];
AnzusLife_Phone_profileSettings = AnzusLife_TempPhoneData;
private _serverTag = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "ServerTag");
profileNamespace setVariable [format ["%1_AnzusLife_Phone_profileSettings", _serverTag], AnzusLife_Phone_profileSettings];
AnzusLife_Phone_NumberSetupComplete = true;
