	

private["_unit"];
_unit = cursorObject;
if(isNull _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "gagged")) exitWith {};
if(player isEqualTo _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_unit setVariable["gagged",true,true];
[player] remoteExec ["ANZUS_fnc_gagged",_unit]; 

[format["You gagged %1.", name _unit],true,"slow"] call ANZUS_fnc_notificationSystem;