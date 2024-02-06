params [
	["_send", objNull, [objNull]],
	["_receive", objNull, [objNull]],
	["_message", "", [""]]
];

if (isNull _send || isNull _receive || _message isEqualTo "") exitWith {};

private _senderNumber = _send getVariable ["AnzusLife_PhoneNumber", ""];
if (_senderNumber isEqualto "") exitWith {};// sender has no number

private _senderNumber = [_senderNumber] call ANZUS_fnc_mresString;
private _message = [_message] call ANZUS_fnc_mresString;

[_message, _senderNumber] remoteExec ["ANZUS_fnc_ReceiveMessage", _receive];
