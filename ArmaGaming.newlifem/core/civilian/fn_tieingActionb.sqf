#include "..\..\script_macros.hpp"	

private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};	
if((_unit getVariable ["blindfolded", false])) exitWith {};

if((life_action_inUse) || (player getVariable ["restrained", false])) exitWith { 
	["You can not do that.",true,"slow"] call ANZUS_fnc_notificationSystem;
}; 

if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
	
_value = ITEM_VALUE("blindfold");
if(_value isEqualTo 0) exitWith {
	["You need to buy a blindfold from the market to do this..",true,"slow"] call ANZUS_fnc_notificationSystem;
};

[false,"blindfold",1,"jail"] call ANZUS_fnc_handleInv;

_cme = 1;
_myposy = getPos player;

while {true} do {
life_action_inUse = true;
	if( player distance _myposy > 2.5 ) exitwith { 
		["Too far away!",true,"slow"] call ANZUS_fnc_notificationSystem;
	};
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	_cme = _cme + 1;
	if(_cme > 3) exitwith {
		cursorTarget setVariable["blindfolded", true, true];
		[player] remoteExecCall ["ANZUS_fnc_tieingb", cursorTarget];
	};
};
life_action_inUse = false;

