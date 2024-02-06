private _display = uiNamespace getVariable ['AnzusLife_Phone', displayNull];
if (isNull _display) exitWith {};
waitUntil {AnzusLife_Phone_CurrentlyOpen == "AnzusLife_MessagesEmergency"};
private _controlsGroup = _display displayCtrl 900002;
private _baseBackgroundPos = [0,0,0.180449 * safezoneW,0.155 * safezoneH];
private _idcStart = 34234;
if (isNil "AnzusLife_EMS_Messages") then {AnzusLife_EMS_Messages = []};
private _messages = AnzusLife_EMS_Messages;
reverse _messages;
AnzusLife_EMS_Messages_controls = [];

{
  _x params ["_to", "_from", "_name", "_message", "_pos", "_timeSent"];

  private _group = _display ctrlCreate ["EmerMessageGroup", _idcStart, _controlsGroup];

  _idcStart = _idcStart + 1;

  private _background = (_group controlsGroupctrl 1);
  private _title = (_group controlsGroupctrl 2);
  private _messageBox = (_group controlsGroupctrl 3);
  private _timeBox = (_group controlsGroupCtrl 4);

  private _agoSentTime = round (serverTime - _timeSent);
  private _arr = if (_agoSentTime > 60) then {if (_agoSentTime > 3600) then {[((_agoSentTime / 60) / 60), "hours"]} else {[(_agoSentTime / 60), "minutes"]}} else {[_agoSentTime, "seconds"]};
  private _baseSize = ((pixelH * 5) * ((getResolution select 1) / 1080));
  _timeBox ctrlSetStructuredText parseText format ["<t align='center' font='PuristaLight' color='#000000' shadow='0' size='%3'> Sent %1 %2 ago!</t>", round(_arr select 0), (_arr select 1), (_baseSize * 80)];
  _messageBox ctrlSetStructuredText parseText format ["<t align='left' font='PuristaLight' color='#000000' shadow='0' size='%2'>%1</t>", _message, (_baseSize * 90)];
  _title ctrlSetStructuredText parseText format ["<t align='left' font='PuristaLight' color='#000000' shadow='0' size='%4'>%1</t><t align='right' font='PuristaLight' color='#000000' shadow='0' size='%4'>%2 (%3)</t>", _to, _from, _name, (_baseSize * 90)];
  _background ctrlSetText "\ArmaGamingCore\images\phone\dialogImages\emerMessageBackground.paa";

  if ((count AnzusLife_EMS_Messages_controls) > 0) then {
    private _lastControl = AnzusLife_EMS_Messages_controls select ((count AnzusLife_EMS_Messages_controls) - 1);
    (ctrlPosition _lastControl) params ["_xPos", "_yPos", "_wPos", "_hPos"];
    _baseBackgroundPos set [1, (_yPos + _hPos)];
  };

  _showPosFunction = {
    params ["_pos", "_name"];

    if (isNil "AnzusLife_Phone_LastEMarker") then {AnzusLife_Phone_LastEMarker = 0};
    if (serverTime <= (AnzusLife_Phone_LastEMarker + 30)) exitWith {
      ["You cant do that this often!",true,"slow"] call ANZUS_fnc_notificationSystem;
    };

    AnzusLife_Phone_LastEMarker = serverTime;
    _marker2 = createMarkerLocal [str _pos + "_Name", _pos];
    _marker2 setMarkerColorLocal "ColorRed";
    _marker2 setMarkerTypeLocal "mil_warning";
    _marker2 setMarkerShapeLocal "ICON";
    _marker2 setMarkerSizeLocal [1,1];
    _marker2 setMarkerTextLocal _name;
    ["There is now a marker on your map for this callout, it will dissapear in 30 seconds!",true,"slow"] call ANZUS_fnc_notificationSystem;
    sleep 30;
    deleteMarkerLocal _marker2;
  };

  private _posFunction = format ["[%1,'%3'] spawn %2", _pos, _showPosFunction,_name];
  (_group controlsGroupCtrl 7) setVariable ["ems_message_index", _forEachIndex];
  (_group controlsGroupCtrl 7) ctrlAddEventHandler ["ButtonClick" , {
    private _index = (_this select 0) getVariable ["ems_message_index", -1];
    AnzusLife_EMS_Messages deleteAt _index;
    0 spawn {
        {
          ctrlDelete _x;
        } forEach AnzusLife_EMS_Messages_controls;
        [] spawn ANZUS_fnc_OpenEmergencyMessage;
      };
  }];

  (_group controlsGroupCtrl 6) ctrlSetEventHandler ["ButtonClick" , _posFunction];
  (_group controlsGroupCtrl 5) ctrlSetEventHandler ["ButtonClick" , format ["['%1'] spawn ANZUS_fnc_LoadMessages", _from]];

  _group ctrlSetPosition _baseBackgroundPos;
  _group ctrlCommit 0;
  AnzusLife_EMS_Messages_controls pushBack _group;
} forEach _messages;
