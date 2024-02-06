
  private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];
  if (isNull _display) exitWith {};

  waitUntil {AnzusLife_Phone_CurrentlyOpen == "AnzusLife_Buttons"};
  private _controlGroup = _display displayCtrl 1800;

  _PSIPhoneBottomControls = [];
  _PSIPhoneTopControls = [];
  _PSIPhoneIconPositions = [];
  _PSIPhoneLastRow = [];
  _PSIPhoneBottomIconPositions = [];


  private _mainButtons = "true" configClasses(missionconfigFile >> "AnzusLife_Apps");
  private _bottomButtons = "true" configClasses(missionconfigFile >> "AnzusLife_BottomIcons");

  private _bottomidc1 = 32409;
  private _bottomidc2 = 34534;
  private _bottomidc3 = 12334;
  private _idc1 = 45987;
  private _idc2 = 4544;
  private _idc3 = 3425;
  private _indent = (safeZoneW * 0.00545);
  private _heightSpacer = ((safeZoneW * 0.0105)*2);
  {
    private _condition = (getText (_x >> "conditions"));
    if (_condition isEqualto "") then {_condition = "true"};
    if ((_condition isEqualto "") || (call compile _condition)) then {

      private _newControl = _display ctrlCreate ["AnzusLife_PhoneIconControlImage", _idc1, _controlGroup];
      private _newButton = _display ctrlCreate ["AnzusLife_PhoneIconControlButton", _idc2, _controlGroup];
      private _newText = _display ctrlCreate ["Life_RscStructuredText", _idc3, _controlGroup];

      _idc1 = _idc1 + 1;
      _idc2 = _idc2 + 1;
      _idc3 = _idc3 + 1;
      _newControl ctrlSetText format ["\ArmaGamingCore\images\phone\icons\%1",(getText(_x >> "image"))];
      _newText ctrlsetStructuredText parseText format ["<t align='center' font='puristaMedium' size='%2'>%1</t>",(getText(_x >> "displayName")), (((pixelH * 5) * ((getResolution select 1) / 1080)) * 65)];
      _newButton ctrlAddEventHandler ["buttonClick", (getText(_x >> "onCall"))];
      {
        _x ctrlSetFade 1;
        _x ctrlCommit 0;
      } forEach [_newControl,_newButton,_newText];

      private _newControlPositon = ctrlPosition _newControl;

      _newControlPositon params ["_xPos", "_yPos","_ctrlWidth","_ctrlHeight"];

      private _newControlPositonNew = [(_xPos + _indent), _yPos, _ctrlWidth, _ctrlHeight];

      private _currentRowCount = (count _PSIPhoneLastRow);

      private _currentCtrlCount = (count _PSIPhoneIconPositions);

      if (_currentCtrlCount > 0) then {
        private _lastControlPos  = _PSIPhoneIconPositions select ((count _PSIPhoneIconPositions) - 1);
        _lastControlPos params ["_lastX","_lastY","",""];
        _newControlPositonNew = [(_lastX + (_indent * 2) +  _ctrlWidth), _lastY, _ctrlWidth, _ctrlHeight];
      };

      if (_currentRowCount isEqualto 4) then {
        private _lastRowYPos = ((_PSIPhoneLastRow select 0) select 1);
        private _newY = ((_lastRowYPos + _ctrlHeight) + _heightSpacer);
        _newControlPositonNew set [1,_newY];
        _newControlPositonNew set [0,(_xPos + _indent)];
        _PSIPhoneLastRow = [];
      };

      _newControlPositonNew params ["_newXPos", "_newYPos", "_newCtrlWidth", "_newCtrlHeight"];

      _PSIPhoneIconPositions pushBack _newControlPositonNew;
      _PSIPhoneLastRow pushBack _newControlPositonNew;

      private _newTextPosition = [(_newXPos - (_ctrlWidth / 4)), (_newYPos + _ctrlHeight), (_ctrlWidth * 1.5), (_ctrlHeight / 3)];

      _newText ctrlSetPosition _newTextPosition;
      _newControl ctrlSetPosition _newControlPositonNew;
      _newButton ctrlSetPosition _newControlPositonNew;
      {
        _x ctrlSetFade 0;
        _x ctrlCommit 0.3;
        _PSIPhoneTopControls pushBack _x;
      } forEach [_newText,_newControl,_newButton];
    };
  } forEach _mainButtons;

  private _bottomControlsGroup = _display displayCtrl 1801;
  {
    private _buttonsPos = _PSIPhoneIconPositions select 0;
    private _newControl = _display ctrlCreate ["AnzusLife_PhoneIconControlImage", _bottomidc1, _bottomControlsGroup];
    private _newButton = _display ctrlCreate ["AnzusLife_PhoneIconControlButton", _bottomidc2, _bottomControlsGroup];
    private _newText = _display ctrlCreate ["Life_RscStructuredText", _bottomidc3, _bottomControlsGroup];
    _newControl ctrlSetText format ["\ArmaGamingCore\images\phone\icons\%1",(getText(_x >> "image"))];
    _newText ctrlsetStructuredText parseText format ["<t align='center' font='puristaMedium' size='%2'>%1</t>",(getText(_x >> "displayName")),(((pixelH * 5) * ((getResolution select 1) / 1080)) * 60)];
    _newButton ctrlAddEventHandler ["buttonClick", (getText(_x >> "onCall"))];
    _bottomidc1 = _bottomidc1 + 1;
    _bottomidc2 = _bottomidc2 + 1;
    _bottomidc3 = _bottomidc3 + 1;
    private _newControlPositon = ctrlPosition _newControl;
    _newControlPositon params ["_xPos", "_yPos","_ctrlWidth","_ctrlHeight"];
    if ((count _PSIPhoneBottomIconPositions) > 0) then {
      _buttonsPos = _PSIPhoneBottomIconPositions select ((count _PSIPhoneBottomIconPositions) - 1);
      private _oldX = _buttonsPos select 0;
      private _newX = (_buttonsPos select 0) + (_indent * 2) + _ctrlWidth;
      _buttonsPos = [ _newX, _buttonsPos select 1, _buttonsPos select 2, _buttonsPos select 3];
    };


    private _xPos = _buttonsPos select 0;

    private _newTextPosition = [
      (_xPos - (_ctrlWidth / 4)), ((_yPos + _ctrlHeight) + _indent * 1.25), (_ctrlWidth * 1.5), (_ctrlHeight / 3)
    ];
    private _tempTextPosition = [
      (_xPos - (_ctrlWidth / 4)), ((_yPos + _ctrlHeight) + _indent * 1.25), (_ctrlWidth * 1.5), 0
    ];
    private _tempPos = [_xPos, (_yPos + _ctrlHeight), _ctrlWidth, 0];
    _newControl ctrlSetFade 1;
    _newControl ctrlSetPosition _tempPos;
    _newControl ctrlCommit 0;
    _newText ctrlSetFade 1;
    _newText ctrlSetPosition _tempTextPosition;
    _newText ctrlCommit 0;

    private _newPosition = [_xPos, (_yPos + (safeZoneW * 0.009)), _ctrlWidth, _ctrlHeight];
    _newButton  ctrlSetPosition _newPosition;
    _newButton ctrlCommit 0.3;
    _newControl ctrlSetPosition _newPosition;
    _newControl ctrlSetFade 0;
    _newControl ctrlCommit 0.3;
    _newText ctrlSetPosition _newTextPosition;
    _newText ctrlSetFade 0;
    _newText ctrlCommit 0.3;
    _PSIPhoneBottomIconPositions pushBack _newPosition;
    {_PSIPhoneBottomControls pushBack _x} forEach [_newButton,_newControl,_newText];

  } forEach _bottomButtons;

  waitUntil {AnzusLife_Phone_CurrentlyOpen != "AnzusLife_Buttons"};

  {ctrlDelete _x} forEach (_PSIPhoneBottomControls + _PSIPhoneTopControls);

  _PSIPhoneTopControls = [];
  _PSIPhoneBottomControls = [];
  _PSIPhoneIconPositions = [];
  _PSIPhoneLastRow = [];
  _PSIPhoneBottomIconPositions = [];
