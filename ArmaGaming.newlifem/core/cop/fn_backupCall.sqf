_player = [_this,0,objnull,[objnull]] call bis_fnc_param;
_deleteTime = [_this,1,60,[0]] call bis_fnc_param;

if(isNull _player) exitWith {};
if(playerSide != west) exitWith {};

if (player getVariable ["life_is_alive",false]) then {
	_backupmsg = createMarkerLocal [("_backupmsg" + (name _player)), getPos _player];
	_backupmsg setMarkerTypeLocal "mil_warning";
	_backupmsg setMarkerColorLocal "colorRed";
	_backupmsg setMarkerTextLocal format ["%1 is requesting backup here!", name _player];
	[format["%1 is in need of backup!",name _player],true,"slow"] call ANZUS_fnc_notificationSystem;

	playSound "panic";

	uiSleep _deleteTime;
	deleteMarkerLocal _backupmsg;
};