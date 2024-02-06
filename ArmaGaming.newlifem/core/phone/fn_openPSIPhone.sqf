private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];
if (life_antispam isEqualTo 1) exitWith {["You must wait 1 second before pulling your phone out again.",true,"slow"] call ANZUS_fnc_notificationSystem};

if (isNull _display) then {
  createDialog "AnzusLife_Phone";
  _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];
};

if (isNil "AnzusLife_Phone_CurrentlyOpen") then {AnzusLife_Phone_CurrentlyOpen = ""};

if (isNil "AnzusLife_EMS_Messages") then {
  AnzusLife_EMS_Messages = [];
};

private _backgroundConfig = "true" configClasses (missionconfigfile >> "AnzusLife_Backgrounds");
private _curBackground = profileNamespace getVariable ["AnzusLife_Phone_Background",""];

if (_curBackground isEqualto "") then {
  _curBackground = configName (_backgroundConfig select 0);
  profileNamespace setVariable ["AnzusLife_Phone_Background", _curBackground];
};

AnzusLife_OldDisplays = [];
if (isNil "AnzusLife_Phone_eMessages") then {
  AnzusLife_Phone_eMessages = [];
};

private _backgroundConfig = (missionconfigfile >> "AnzusLife_Backgrounds");
private _thisConfig = (_backgroundConfig >> _curBackground);
private _backgroundImage = getText(_thisConfig >> "image");
private _imagePath = format ["%1",_backgroundImage];

private _backgroundImage = _display displayCtrl 987;
private _background2Image = _display displayCtrl 988;

_background2Image ctrlSetText _imagePath;
_backgroundImage ctrlSetText _imagePath;

AnzusLife_Phone_BackgroundControlMouseup = false;

private _serverTag = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "ServerTag");
AnzusLife_Phone_profileSettings = profileNamespace getVariable [format ["%1_AnzusLife_Phone_profileSettings", _serverTag], []];

if (AnzusLife_Phone_profileSettings isEqualto []) exitWith {
  [] spawn ANZUS_fnc_StartSetup;
};

player setVariable ["AnzusLife_PhoneNumber", (AnzusLife_Phone_profileSettings select 2), true];

['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;
playSound "openphone";

// life_antispam = 1;

// [] spawn {
//     _phone = "The_Programmer_Iphone_Model" createVehicle (position player);
//     _phone attachTo [player,[-0.034,0.02,0.075],"righthandmiddle1"];
//     _phone setVectorDirAndUp [[0,0.66,-0.33],[0,0.33,0.66]];
//     player playAction "The_Programmer_Holdphone";
//     waituntil {uisleep 1; ((isNull (findDisplay 19931)));};
//     deleteVehicle _phone;
//     player playAction "gesturenod";
//     sleep 1; 
//     life_antispam = 0;
// };