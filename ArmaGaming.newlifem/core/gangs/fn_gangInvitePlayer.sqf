#include "..\..\script_macros.hpp"
params [["_ctrlPlayerList", controlNull, [controlNull]]];

private _unitUID = _ctrlPlayerList lbData (lbCurSel _ctrlPlayerList);
if (_unitUID isEqualTo "" || {isNil "_unitUID"} || {!(_unitUID isEqualType "")}) exitWith {
    diag_log format ["No data for listbox entry (%1)", _unitUID];
};

private _player = [_unitUID] call AnzusLife_Lib_GetPlayerByUID;
if (isNull _player) exitWith {};

private _groupUnit = group _player;

// Make sure player is not already in a group
if (!isNil {_groupUnit getVariable "gang_name"}) exitWith {["The player you tried inviting is already in another gang.",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (count(group player getVariable ["gang_members",8]) isEqualTo (group player getVariable ["gang_maxMembers",50])) exitWith {[localize "STR_GNOTF_MaxSlot",true,"slow"] call ANZUS_fnc_notificationSystem;};

private _gangMembers = group player getVariable ["gang_members", []];
private _unitName = name _player;
private _unitUID = getPlayerUID _player;

private _memberIndex = _gangMembers pushbackUnique [_unitName, _unitUID, 0];
if (_memberIndex isEqualTo -1) exitWith {};

group player setVariable ["gang_members",_gangMembers,true];
[profileName,group player] remoteExec ["ANZUS_fnc_gangInvite",_player];
[format[localize "STR_GNOTF_InviteSent",name _player],true,"slow"] call ANZUS_fnc_notificationSystem;