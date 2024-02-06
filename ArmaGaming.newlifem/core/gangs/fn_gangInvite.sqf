#include "..\..\script_macros.hpp"
	
private ["_action","_grpMembers"];
params [
    ["_name","",[""]],
    ["_group",grpNull,[grpNull]]
];

if (_name isEqualTo "" || isNull _group) exitWith {};	
if (!isNil {(group player) getVariable "gang_name"}) exitWith {[localize "STR_GNOTF_AlreadyInGang",true,"slow"] call ANZUS_fnc_notificationSystem;};
_gangName = _group getVariable "gang_name";

private _action = [localize "STR_Gang_Invitation", format[localize "STR_GNOTF_InviteMSG",_name,_gangName], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
if (_action) then {
    [player] join _group;

    [4,_group] remoteExecCall ["TON_fnc_updateGang",RSERV];
    [format["%1 has joined your gang!",name player],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_group];
} else {
    _grpMembers = _group getVariable "gang_members";
    _index = [getPlayerUID player,_grpMembers] call TON_fnc_index;

    _updated = _grpMembers - [_grpMembers select _index]; 
    _group setVariable ["gang_members",_updated,true]; 

    [4,_group] remoteExecCall ["TON_fnc_updateGang",RSERV];
};

closeDialog 0;