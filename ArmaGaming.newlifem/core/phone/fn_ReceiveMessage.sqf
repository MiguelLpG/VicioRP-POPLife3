
params [
	["_message", "", [""]],
	["_sender", "", [""]]
];

if (_message isEqualTo "" || _sender isEqualTo "") exitWith {};

private _messageIndex = AnzusLife_Phone_Messages findIf {((_x select 0) == _sender)};

diag_log str _messageIndex;

if (_messageIndex isEqualTo -1) then {
	AnzusLife_Phone_Messages pushBack [
		_sender,
		[
			[_message, _sender]
		],
		0
	];
} else {
	((AnzusLife_Phone_Messages select _messageIndex) select 1) pushBack [_message, _sender];
};

private _prefix = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "phoneNumberPrefix");
private _tag = getText(missionConfigFile >> "AnzusLife_Core_Settings" >> "ServerTag");
private _contacts = (profileNamespace getVariable [format ["%1_contacts",_tag], []]);


private _contactIndex = _contacts findIf {((_x select 2) == _sender)};
private _contactArr = if (_contactIndex isEqualto -1) then {[]} else {(_contacts select _contactIndex)};


private _contactHeader = if (_contactArr isEqualto []) then {format ["%1%2", _prefix, _sender]} else {format ["%1 %2", (_contactArr select 0), (_contactArr select 1)]};

[format["You have a new message from %1",_contactHeader],true,"slow"] call ANZUS_fnc_notificationSystem;

if !(isNull (uiNamespace getVariable ["AnzusLife_Phone", displayNull])) then {
	if (AnzusLife_Phone_CurrentlyOpen == "AnzusLife_MessagesView") then {
		[_sender] call ANZUS_fnc_LoadMessages;
	};
};