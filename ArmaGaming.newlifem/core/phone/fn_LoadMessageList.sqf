	
private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];

	
if (isNull _display) exitWith {};
waitUntil {AnzusLife_Phone_CurrentlyOpen isEqualTo "AnzusLife_MessagesMain"};
	
private _controlGroup = _display displayCtrl 250002;

	
private _prefix = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "phoneNumberPrefix");
private _tag = getText(missionConfigFile >> "AnzusLife_Core_Settings" >> "ServerTag");

	
private _someIDC = 999999;

	
private _allMessageBackgrounds = [];
private _allMessageControls = [];

	
private _contacts = (profileNamespace getVariable [format ["%1_contacts",_tag], []]);

	
{

  _x params ["_number", "_messageArr", "_unread"];	
  private _messagePreviewArr = [];	
  private _lastConvoMessage = (_messageArr select ((count _messageArr) - 1)) select 0;	
  private _lastMessageSplitString = _lastConvoMessage splitString "";//we split the message into an array to count the characters.
  private _lastMessageLength = if ((count _lastMessageSplitString) > 30) then {30} else {(count _lastMessageSplitString)};		
  for "_i" from 0 to _lastMessageLength step 1 do {
    _messagePreviewArr pushBack (_lastMessageSplitString select _i);
  };	
  if ((count _lastMessageSplitString) > 30) then {
    _messagePreviewArr = _messagePreviewArr + [".",".",".",".",".","."];
  };

  private _messagePreview = _messagePreviewArr joinString "";// turn the array, back into a string.	
  private _messageListBackgroundControl = _display ctrlCreate ["AnzusLife_PhoneRscPicture", _someIDC, _controlGroup];   _someIDC = _someIDC + 1;
  _messageListBackgroundControl ctrlEnable false;
  private _messageTextControl = _display ctrlCreate ["AnzusLife_PhoneStructuredText", _someIDC, _controlGroup];              _someIDC = _someIDC + 1;
  _messageTextControl ctrlEnable false;
  private _messageListButton = _display ctrlCreate ["AnzusLife_PhoneIconControlButton", _someIDC, _controlGroup];            _someIDC = _someIDC + 1;
  _messageListButton ctrlAddEventHandler ["ButtonClick", format ["['%1'] spawn ANZUS_fnc_LoadMessages", _number]];	
  private _contactIndex = _contacts findIf {(_x select 2) == _number};	
  private _contactName = if (_contactIndex isEqualTo -1) then {
    format [
      "%1%2",
      _prefix,
      _number
    ];
  } else {
    format [
      "%1 %2",
      ((_contacts select _contactIndex) select 0),
      ((_contacts select _contactIndex) select 1)
    ];
  };	
  private _struct = "";
  _struct = _struct + format ["<t align='left' font='puristaMedium' shadow='0' size='%2'>%1</t>", _contactName, (((pixelH * 5) * ((getResolution select 1) / 1080)) * 110)];
  _struct = _struct + "<br/>";
  _struct = _struct + format ["<t align='left' color='#A9A9A9' font='puristaMedium' shadow='0' size='%2'>%1</t>", _messagePreview, (((pixelH * 5) * ((getResolution select 1) / 1080)) * 90)];	
  _messageTextControl ctrlSetStructuredText parseText format["<t>%1</t>",_struct];	
  _messageTextControl ctrlSetTextColor [0, 0, 0, 1];	
   _messageListBackgroundControl ctrlSetText "\ArmaGamingCore\images\phone\dialogImages\MessageListBackground.paa";	
   private _ctrlPos = [-0.0186 * safezoneH,0,0.180464 * safezoneW,0.0418 * safezoneH];	
   if ((count _allMessageBackgrounds) > 0) then {
     private _lastControl = _allMessageBackgrounds select ((count _allMessageBackgrounds) - 1);
     private _lastControlPos = ctrlPosition _lastControl;
     _ctrlPos set [1, (_lastControlPos select 1) + (_lastControlPos select 3)];
   };	
   private _textPos = [
     (_ctrlPos select 0) + ((_ctrlPos select 3) / 2),
     (_ctrlPos select 1) + ((ctrlTextHeight _messageTextControl) / 30),
     (ctrlTextWidth _messageTextControl) + ((ctrlTextWidth _messageTextControl) / 20),
     (ctrlTextHeight _messageTextControl)
   ];	

  private _ctrlGroupPos = ctrlPosition _controlGroup;
  _messageTextControl ctrlSetPosition _textPos;
  _messageListButton ctrlSetPosition _ctrlPos;
  _messageListBackgroundControl ctrlSetPosition _ctrlPos;
  _ctrlGroupPos set [2, (_ctrlPos select 2)];
  _controlGroup ctrlSetPosition _ctrlGroupPos;

  {_x ctrlCommit 0} forEach [_messageListBackgroundControl, _messageTextControl, _messageListButton,_controlGroup];	
  {
    _x ctrlSetFade 1;
    _x ctrlCommit 0;
    _x ctrlSetFade 0;
    _x ctrlCommit 0.5;
  } forEach [_messageListBackgroundControl, _messageTextControl, _messageListButton];	
  _allMessageBackgrounds pushBack _messageListBackgroundControl;
  {_allMessageControls pushBack _x} forEach [_messageListBackgroundControl, _messageTextControl, _messageListButton];
} forEach AnzusLife_Phone_Messages;

[_allMessageControls] spawn {
  params ["_allMessageControls"];

  waitUntil {AnzusLife_Phone_CurrentlyOpen != "AnzusLife_MessagesMain"};


  {ctrlDelete _x} forEach _allMessageControls;
};
