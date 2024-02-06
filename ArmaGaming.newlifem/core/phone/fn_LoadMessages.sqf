
  params [
      ["_number", "", [""]]
  ];

  if (_number isEqualTo "") exitWith {};


  if (AnzusLife_Phone_CurrentlyOpen != "AnzusLife_MessagesView") then {
      ["AnzusLife_MessagesView"] spawn ANZUS_fnc_changeMenu;
  };
  waitUntil {AnzusLife_Phone_CurrentlyOpen == "AnzusLife_MessagesView"};

  private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];

  private _controlGroup = _display displayCtrl 230002;
  _controlGroup ctrlSetAutoScrollRewind false;
  _controlGroup ctrlSetAutoScrollSpeed 0.00001;
  _controlGroup ctrlSetAutoScrollDelay 0;

  _controlGroup ctrlAddEventHandler [
      "SetFocus",
      {
          params ["_controlGroup"];
          _controlGroup ctrlSetAutoScrollSpeed -1;
      }
  ];


  if (isNull _display) exitWith {};

  if (isNil "AnzusLife_MessageControls") then {
      AnzusLife_MessageControls = [];
  } else {
      if !(AnzusLife_MessageControls isEqualTo []) then {
          {
              ctrlDelete _x;
          } forEach AnzusLife_MessageControls;
      };
  };

  private _messageArrIndex = AnzusLife_Phone_Messages findIf {(_x select 0) isEqualTo _number};
  private _messageArr = if (_messageArrIndex isEqualTo -1) then {[_number,[],0]} else {(AnzusLife_Phone_Messages select _messageArrIndex)};

  if (_messageArr isEqualTo []) exitWith {};

  private _prefix = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "phoneNumberPrefix");

  private _someIDC = 999999;

  _messageArr params ["_contactNumber", "_messages",  "_unreadMessages"];

  if (_unreadMessages > 0) then {
      (AnzusLife_Phone_Messages select _messageArrIndex) set [2, 0];
  };

  private _tag = getText(missionConfigFile >> "AnzusLife_Core_Settings" >> "ServerTag");
  private _contacts = (profileNamespace getVariable [format ["%1_contacts",_tag], []]);

  private _contactIndex = _contacts findIf {((_x select 2) == _contactNumber)};
  private _contactArr = if (_contactIndex isEqualto -1) then {[]} else {(_contacts select _contactIndex)};

  private _contactHeader = if (_contactArr isEqualto []) then {format ["%1%2", _prefix, (_messageArr select 0)]} else {format ["%1 %2", (_contactArr select 0), (_contactArr select 1)]};
  diag_log str _contactHeader;
  private _contactInfoCtrl = _display displayCtrl 230006;
  _contactInfoCtrl ctrlSetStructuredText parseText format ["<t align='center' color='#000000' shadow='0' size='%2'>%1</t>",_contactHeader,(((pixelH * 5) * ((getResolution select 1) / 1080)) * 120)];

  private _contactInfoBtn = _display displayCtrl 230007;
  _contactInfoBtn ctrlSetEventHandler ["ButtonClick", format ["['%1'] spawn ANZUS_fnc_CheckSender", _number]];
  if ((_this select 1) isEqualTo 28) then {[]};
  private _btnSendMessage = _display displayCtrl 230008;
  _btnSendMessage ctrlSetEventHandler ["ButtonClick", format ["['%1'] call ANZUS_fnc_SendMessage", _number]];
  private _messageBox = _display displayCtrl 230005;
  _messageBox ctrlSetEventHandler ["KeyDown",format ["if ((_this select 1) isEqualTo 28) then {['%1'] call ANZUS_fnc_SendMessage}", _number]];
  {
      _x params ["_message", "_number"];

      private _imageFormat = if (_number isEqualTo (AnzusLife_Phone_profileSettings select 2)) then {"MessageTo"} else {"MessageFrom"};


      private _topCtrl = _display ctrlCreate ["AnzusLife_PhoneRscPicture", _someIDC, _controlGroup];                _someIDC = _someIDC + 1;
      private _midCtrl = _display ctrlCreate ["AnzusLife_PhoneRscPicture", _someIDC, _controlGroup];                _someIDC = _someIDC + 1;
      private _bottomCtrl = _display ctrlCreate ["AnzusLife_PhoneRscPicture", _someIDC, _controlGroup];             _someIDC = _someIDC + 1;
      private _structuredText =  _display ctrlCreate ["Life_RscStructuredText", _someIDC, _controlGroup];       _someIDC = _someIDC + 1;

      private _color = if (_number isEqualTo (AnzusLife_Phone_profileSettings select 2)) then {"#FFFFFF"} else {"#000000"};
      private _struct =  format ["<t align='left' color='%2' shadow='0' size='%3'>%1</t>", _message, _color,(((pixelH * 5) * ((getResolution select 1) / 1080)) * 100)];

      _bottomCtrl ctrlSetText format ["\ArmaGamingCore\images\phone\ui\%1Bottom.paa",_imageFormat];
      _midCtrl ctrlSetText format ["\ArmaGamingCore\images\phone\ui\%1Middle.paa",_imageFormat];
      _topCtrl ctrlSetText format ["\ArmaGamingCore\images\phone\ui\%1Top.paa",_imageFormat];

      _structuredText ctrlSetPosition [0,0, ((0.1517 * safezoneW) * 0.65) ,(1 * safezoneH)];
      _structuredText ctrlCommit 0;

      _structuredText ctrlSetStructuredText parseText _struct;

      private _baseImageSize = [0, 0, (0.1517 * safezoneW), (0.011 * safezoneH)];

      {
          _x ctrlSetPosition _baseImageSize;
          _x ctrlCommit 0;
      } forEach [_bottomCtrl, _midCtrl, _topCtrl];

      if ((count AnzusLife_MessageControls) > 0) then {
          private _lastControl = AnzusLife_MessageControls select ((count AnzusLife_MessageControls) - 1);
          private _newY = ((ctrlPosition _lastControl) select 1) + (((ctrlPosition _lastControl) select 3)) + (0.011 * safezoneH);
          {
              private _thisCtrlPos = ctrlPosition _x;
              _thisCtrlPos set [1, _newY];
              _x ctrlSetPosition _thisCtrlPos;
              _x ctrlCommit 0;
          } forEach [_bottomCtrl, _midCtrl, _topCtrl];
      };

      private _topCtrlPos = ctrlPosition _topCtrl;
      _topCtrlPos params ["", "_topY", "", "_topH"];

      private _midStartPos = _topY + _topH;

      private _textHeight = ctrlTextHeight _structuredText;
      private _midCtrlPos = [ ((ctrlPosition _midCtrl) select 0),_midStartPos,(0.1517 * safezoneW),_textHeight];
      private _structuredTextPos = [((ctrlPosition _midCtrl) select 0),_midStartPos,((_midCtrlPos select 2) * 0.65),_textHeight];


      _structuredTextPos set [
          0,
          if !(_number isEqualTo (AnzusLife_Phone_profileSettings select 2)) then {((_midCtrlPos select 2) * 0.035)} else {((_midCtrlPos select 2) * 0.315)}
      ];
      _structuredText ctrlSetPosition _structuredTextPos;

      _structuredText ctrlCommit 0;
      _midCtrl ctrlSetPosition _midCtrlPos;
      _midCtrl ctrlCommit 0;

      _midCtrlPos = ctrlPosition _midCtrl;
      _botCtrlPos = ctrlPosition _bottomCtrl;

      private _midBotDifference = (_midCtrlPos select 1) + (_midCtrlPos select 3);

      _botCtrlPos set [1, _midBotDifference];

      _bottomCtrl ctrlSetPosition _botCtrlPos;
      _bottomCtrl ctrlCommit 0;

      {AnzusLife_MessageControls pushBack _x} forEach [_structuredText, _topCtrl, _midCtrl, _bottomCtrl];
  } forEach _messages;
