#include "..\..\script_macros.hpp"
	
private ["_unitID ","_members"];
if (getPlayerUID player isEqualTo (group player getVariable "gang_owner")) exitWith {[localize "STR_GNOTF_LeaderLeave",true,"slow"] call ANZUS_fnc_notificationSystem;};

_unitID = getPlayerUID player;
_members = group player getVariable "gang_members";
_group = group player;

if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_index = [getPlayerUID player,_members] call TON_fnc_index;
_updated = _members - [_members select _index]; 
_group setVariable ["gang_members",_updated,true]; 

[player,group player] remoteExec ["TON_fnc_clientGangLeft",player];
[4,group player] remoteExec ["TON_fnc_updateGang",RSERV];	
[format["%1 has left your gang!",name player],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_group];
closeDialog 0;