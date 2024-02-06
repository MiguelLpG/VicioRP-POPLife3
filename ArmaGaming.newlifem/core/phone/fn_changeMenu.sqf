params [
  ["_menuToOpen", "", [""]]
];

private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];
if (isNull _display) exitWith {};
private _lastOpenDisplay = "";
if (isNil "AnzusLife_Phone_CurrentlyOpen") then {AnzusLife_Phone_CurrentlyOpen = ""};
if (isNil "AnzusLife_Phone_LastOpenDisplays") then {AnzusLife_Phone_LastOpenDisplays = []};
if (isNil "AnzusLife_Phone_OldDisplayCtrls") then {AnzusLife_Phone_OldDisplayCtrls = []};

if (_menuToOpen isEqualTo "last") then {
  _menuToOpen = AnzusLife_Phone_LastOpenDisplays select ((count AnzusLife_Phone_LastOpenDisplays) - 2);
  if (_menuToOpen isEqualTo "AnzusLife_ContactEdit") then {_menuToOpen = "AnzusLife_Buttons"};
  if (_menuToOpen isEqualTo "AnzusLife_ContactAdd") then {_menuToOpen = "AnzusLife_Buttons"};
  AnzusLife_Phone_LastOpenDisplays deleteAt ((count AnzusLife_Phone_LastOpenDisplays) - 1);
  AnzusLife_Phone_LastOpenDisplays deleteAt ((count AnzusLife_Phone_LastOpenDisplays) - 1);
  private _lastOpenDisplay = if !(AnzusLife_Phone_LastOpenDisplays isEqualto []) then {AnzusLife_Phone_LastOpenDisplays select ((count AnzusLife_Phone_LastOpenDisplays) - 1)} else {""};
} else {
  private _lastOpenDisplay = if !(AnzusLife_Phone_LastOpenDisplays isEqualto []) then {AnzusLife_Phone_LastOpenDisplays select ((count AnzusLife_Phone_LastOpenDisplays) - 1)} else {""};
};

if (_menuToOpen isEqualTo "AnzusLife_Buttons") then {AnzusLife_Phone_LastOpenDisplays = []};

private _newControls = [_menuToOpen] call ANZUS_fnc_LoadNewMenu;

[_menuToOpen] spawn {
  params ["_menuToOpen"];
  waitUntil {AnzusLife_Phone_CurrentlyOpen isEqualTo _menuToOpen};
  private _onload = getText (missionconfigfile >> "AnzusLife_onLoads" >> _menuToOpen >> "onload");
  if !(_onload isEqualTo "") then {
    call (compile _onload);
  };
};

AnzusLife_Phone_CurrentlyOpen = _menuToOpen;
AnzusLife_Phone_LastOpenDisplays pushBack AnzusLife_Phone_CurrentlyOpen;

private _handle = [AnzusLife_Phone_OldDisplayCtrls] spawn ANZUS_fnc_DeleteOldMenu;
waitUntil {scriptDone _handle};
AnzusLife_Phone_OldDisplayCtrls = _newControls;
