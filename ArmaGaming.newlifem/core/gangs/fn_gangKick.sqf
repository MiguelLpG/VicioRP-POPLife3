#include "..\..\script_macros.hpp"
	
private ["_unit","_unitID","_members"];
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {[localize "STR_GNOTF_SelectKick",true,"slow"] call ANZUS_fnc_notificationSystem;};
_unit = call compile format ["%1",CONTROL_DATA(2621)];

if (isNull _unit) exitWith {};	
if (_unit == player) exitWith {[localize "STR_GNOTF_KickSelf",true,"slow"] call ANZUS_fnc_notificationSystem;};

_unitID = getPlayerUID _unit;
_members = group player getVariable "gang_members";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_index = [_unitID,_members] call TON_fnc_index;
_updated = _members - [_members select _index]; 
_group setVariable ["gang_members",_updated,true]; 

[_unit,group player] remoteExec ["TON_fnc_clientGangKick",_unit];	

[4,group player] remoteExec ["TON_fnc_updateGang",RSERV];
closeDialog 0;
