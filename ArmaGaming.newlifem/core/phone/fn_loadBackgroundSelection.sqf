private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

AnzusLife_Phone_BackgroundPositions = [];
AnzusLife_Phone_BackgroundControls = [];
AnzusLife_Phone_BackgroundControlsButtons = [];

private _controlGroup = _display displayCtrl 100005;
private _controlsGroupPos = ctrlPosition _controlGroup;
private _backgroundConfig = "true" configClasses (missionconfigfile >> "AnzusLife_Backgrounds");
{
  private _newControl = _display ctrlCreate ["AnzusLife_PhoneIconControlImage", -1, _controlGroup];
  private _newButton = _display ctrlCreate ["AnzusLife_PhoneIconControlButton", -1, _controlGroup];
  _newControl ctrlSetText format ["%1",(getText (_x >> "preview"))];

  private _newPos = [
    0,
    0,
    _controlsGroupPos select 2,
    _controlsGroupPos select 3
  ];

  if ((count AnzusLife_Phone_BackgroundPositions) > 0) then {
    _newPos set [
      1,
      (((AnzusLife_Phone_BackgroundPositions select ((count AnzusLife_Phone_BackgroundPositions) - 1)) select 1) +
      ((AnzusLife_Phone_BackgroundPositions select ((count AnzusLife_Phone_BackgroundPositions) - 1)) select 3))
    ];
  };

  _newControl ctrlSetPosition _newPos;
  _newButton ctrlSetPosition _newPos;
  private _function = format ["[%1] spawn ANZUS_fnc_SettingsChangeBackground",str (configName _x)];
  _newButton ctrlAddEventHandler ["MouseButtonDblClick", _function];

  AnzusLife_Phone_BackgroundControls pushBack _newControl;
  AnzusLife_Phone_BackgroundControlsButtons pushBack _newButton;
  AnzusLife_Phone_BackgroundPositions pushBack _newPos;

  _newControl ctrlCommit 0;
  _newButton ctrlCommit 0;
} forEach _backgroundConfig;
