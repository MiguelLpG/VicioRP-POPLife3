params [
  ["_background","",[""]]
];

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

diag_log format ["%1",_background];

if (_background isEqualto "") exitWith {};

private _backgroundConfig = (missionconfigfile >> "AnzusLife_Backgrounds");
private _thisConfig = (_backgroundConfig >> _background);
private _backgroundImage = getText(_thisConfig >> "image");
private _imagePath = format ["%1",_backgroundImage];

diag_log format ["%1",_imagePath];

private _backgroundImage = _display displayCtrl 987;
private _background2Image = _display displayCtrl 988;

	
_background2Image ctrlSetFade 1;
_background2Image ctrlCommit 0;

	
_background2Image ctrlSetText _imagePath;
_background2Image ctrlSetFade 0;
_background2Image ctrlCommit 0.2;

	
waitUntil {ctrlCommitted _background2Image};
	
_backgroundImage ctrlSetText _imagePath;
profileNamespace setVariable ["AnzusLife_Phone_Background", _background];
saveprofileNamespace;
