params ["_title","_text"];


private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};


private _configContainers = getArray (missionConfigFile >> "AnzusLife_PhoneWarning" >> "controls");
private _warningControls = [];

{
  _x params ["_type", "_idc"];
  private _ctrl = _display ctrlCreate [_type, _idc];
  _ctrl ctrlsetFade 1;
  _ctrl ctrlCommit 0;
  _ctrl ctrlsetFade 0;
  _ctrl ctrlCommit 0.1;
  ctrlSetFocus _ctrl;
  _warningControls pushBack _ctrl;
} forEach _configContainers;

_warningControls params ["_background", "_textCtrl", "_btnCancel", "_btnOk"];

uiNamespace setVariable ["AnzusLife_Phone_Warning_Answer",nil];

private _struct = "";
private _scaleFactorCtrlH = (getResolution select 1) / 1080;
private _scaleFactorCtrlW = (getResolution select 0) / 1920;
private _pW = (pixelW * 5) * _scaleFactorCtrlW;
private _pH = (pixelH * 5) * _scaleFactorCtrlH;
_struct = _struct + format ["<t align='center' font='RobotoCondensedLight' color='#4C4C4C' shadow='0' size='%2'>%1</t>",_title, (_pH * 120)];
_struct = _struct + "<br/>";
_struct = _struct + format ["<t align='center' font='RobotoCondensedLight' color='#4C4C4C' shadow='0' size='%2'>%1</t>",_text, (_pH * 100)];

private _structuredText = _textCtrl controlsGroupCtrl 1;
_structuredText ctrlSetStructuredText parseText format["<t size='%2'>%1</t>", _struct,(_pH * 120)];
private _structuredTextCtrlPos = ctrlPosition _structuredText;
private _textHeight = ctrlTextHeight _structuredText;
_structuredTextCtrlPos set [3,_textHeight];
_structuredText ctrlSetPosition _structuredTextCtrlPos;
_structuredText ctrlCommit 0;


_btnOk ctrlseteventhandler ["buttonclick","uinamespace setvariable ['AnzusLife_Phone_Warning_Answer',true]; true"];
_btnCancel ctrlseteventhandler ["buttonclick","uinamespace setvariable ['AnzusLife_Phone_Warning_Answer',false]; true"];
_display displayaddeventhandler ["unload","uinamespace setvariable ['AnzusLife_Phone_Warning_Answer',false];"];
private _ehKeyDown = _display displayaddeventhandler ["keydown","if ((_this select 1) == 1) then {uinamespace setvariable ['AnzusLife_Phone_Warning_Answer',false]; true} else {false}"];

waitUntil {!isNil {uinamespace getvariable ["AnzusLife_Phone_Warning_Answer",nil]}};

{
  _x ctrlSetFade 1;
  _x ctrlCommit 0.1;
} forEach _warningControls;

_display displayremoveeventhandler ["keydown",_ehKeyDown];
_status = uinamespace getvariable "AnzusLife_Phone_Warning_Answer";

uinamespace setvariable ["AnzusLife_Phone_Warning_Answer",nil];
waitUntil {ctrlCommitted _btnOk};

{ctrlDelete _x} forEach _warningControls;

_status;
