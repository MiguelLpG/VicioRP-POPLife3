params [
	["_number", "", [""]]
];

if (isNil "AnzusLife_Phone_MessageLastSent") then {
	AnzusLife_Phone_MessageLastSent = 0;
};

if (_number isEqualTo "") exitWith {};

if (serverTime <= (AnzusLife_Phone_MessageLastSent + 1)) exitWith {
	["You can't messages that quickly.",true,"slow"] call ANZUS_fnc_notificationSystem;
};

private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];

if (isNull _display) exitWith {};

private _messageToObject = objNull;
{
	if ((_x getVariable ["AnzusLife_PhoneNumber", ""]) isEqualTo _number) exitWith {
		_messageToObject = _x;
	};
} forEach playableUnits;

if (isNull _messageToObject) exitWith {
	["The number you are trying to send a message to is currently unavailable.",true,"slow"] call ANZUS_fnc_notificationSystem;
};

private _messageBox = _display displayCtrl 230005;
private _message = ctrlText _messageBox;

private _temp = _message splitString "";
private _newArr = [];
{
	if !(_x isEqualTo '"') then {
		_newArr pushBack _x;
	};
} forEach _temp;

private _message = _newArr joinString "";
private _messageToLowerTemp = toLower (ctrlText _messageBox);

if (_messageToLowerTemp isEqualTo "message sent!") exitWith {};
if (_messageToLowerTemp isEqualTo "") exitWith {};
if (([_messageToLowerTemp] call ANZUS_fnc_bannedWords)) exitWith {
	["You have some banned words in your message, please check and try again.",true,"slow"] call ANZUS_fnc_notificationSystem;
};

private _messageIndex = AnzusLife_Phone_Messages findIf {((_x select 0) isEqualTo _number)};
if (_messageIndex isEqualTo -1) then {
	AnzusLife_Phone_Messages pushBack [_number, [[_message, (AnzusLife_Phone_profileSettings select 2)]],0]; 
} else {
	((AnzusLife_Phone_Messages select _messageIndex) select 1) pushBack [_message, (AnzusLife_Phone_profileSettings select 2)];
};

_messageBox ctrlSetText "";
AnzusLife_Phone_MessageLastSent = serverTime;
[player, _messageToObject, _message, (AnzusLife_Phone_profileSettings select 2)] remoteExec ["ANZUS_fnc_Server_MessageRelay", 2];
[_number] call ANZUS_fnc_LoadMessages;
