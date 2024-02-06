/*
    File: fn_medicRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies the medics that someone has requested emergency and prompts them
    if they want to take the request or not.
*/
params [["_caller",objNull,[objNull]]];
if (isNull _caller) exitWith {};

_player = _caller getVariable ["CorpsePlayer",objNull];
_deleteTime = [_this,1,60,[0]] call bis_fnc_param;

if (isNull _player) exitWith {};

_backupmsg = createMarkerLocal [("_medicmsg" + (name _player)), getPos _player];
_backupmsg setMarkerTypeLocal "mil_warning";
_backupmsg setMarkerColorLocal "colorGreen";
_backupmsg setMarkerTextLocal format ["%1 is in need of medical assistance!", name _player];

[format["%1 is in need of you medical assistance, please check the map to find them.",name _player],false,"slow"] call ANZUS_fnc_notificationSystem;

uiSleep _deleteTime;
deleteMarkerLocal _backupmsg;

