AnzusLife_Phone_SetupReady = false;
AnzusLife_Phone_NameSetupComplete = false;
AnzusLife_Phone_NumberSetupComplete = false;

ANZUS_fnc_openSetups = {
  params ["_type"];
  private _configContainers = getArray (missionConfigFile >> _type >> "controls");
  private _warningControls = [];
  private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];
  {
    _x params ["_type", "_idc"];
    private _ctrl = _display ctrlCreate [_type, _idc];
    _ctrl ctrlsetFade 1;
    _ctrl ctrlCommit 0;
    ctrlSetFocus _ctrl;
    _warningControls pushBack _ctrl;
  } forEach _configContainers;
  _warningControls;
};

ANZUS_fnc_fadeInSetups = {
  params ["_arr"];
  {
    _x ctrlSetFade 0;
    _x ctrlCommit 2;
  } forEach _arr;
};

ANZUS_fnc_fadeOutSetups = {
  params ["_arr"];
  {
    _x ctrlSetFade 1;
    _x ctrlCommit 2;
  } forEach _arr;
  waitUntil {(ctrlCommitted ( _arr select ((count _arr) - 1)))};
  {ctrlDelete _x} forEach _arr;
};

[] spawn {
  AnzusLife_Phone_NameSetupComplete = false;
  AnzusLife_Phone_NumberSetupComplete = false;
  private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];
  private _plainWhite = _display ctrlCreate ["AnzusLife_PhoneSetupPlain_Background", -1];
  private _screen1Controls = ["AnzusLife_PhoneSetup1"] call ANZUS_fnc_openSetups;
  [_screen1Controls] call ANZUS_fnc_fadeInSetups;
  sleep 1;
  [_screen1Controls] call ANZUS_fnc_fadeOutSetups;
  private _screen2Controls = ["AnzusLife_PhoneSetup2"] call ANZUS_fnc_openSetups;
  [_screen2Controls] call ANZUS_fnc_fadeInSetups;
  waitUntil {AnzusLife_Phone_NameSetupComplete};
  [_screen2Controls] call ANZUS_fnc_fadeOutSetups;
  private _screen3Controls = ["AnzusLife_PhoneSetup3"] call ANZUS_fnc_openSetups;
  [] spawn ANZUS_fnc_SetupGetNumbers;
  [_screen3Controls] call ANZUS_fnc_fadeInSetups;
  waitUntil {AnzusLife_Phone_NumberSetupComplete};
  [_screen3Controls] call ANZUS_fnc_fadeOutSetups;
  ['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;
  ctrlSetFocus _plainWhite;
  _plainWhite ctrlSetFade 1;
  _plainWhite ctrlCommit 2;

  waitUntil {ctrlCommitted _plainWhite};
  ctrlDelete _plainWhite;

};
