	
private["_unit"];
_unit = cursorTarget;

if((life_action_inUse) || (player getVariable ["restrained", false])) exitWith { 
	["You cannot do that!",true,"slow"] call ANZUS_fnc_notificationSystem;
}; 

if(isNull _unit || !(_unit getVariable ["blindfolded", false])) exitWith {};

_unit setVariable["blindfolded", nil, true];
