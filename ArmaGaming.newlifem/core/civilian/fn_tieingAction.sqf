#include "..\..\script_macros.hpp"

private["_unit"];
_unit = cursorTarget;

_value = ITEM_VALUE("zipties");
if(_value isEqualTo 0) exitWith {["You need to buy zipties from the market to do this..",true,"slow"] call ANZUS_fnc_notificationSystem;};
if((life_action_inUse) || (player getVariable ["restrained", false])) exitWith {["You can not do that.",true,"slow"] call ANZUS_fnc_notificationSystem;};
if(isNull _unit) exitWith {};	
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

[false,"zipties",1,"jail"] call ANZUS_fnc_handleInv;

life_action_inUse = true;
[_unit,"zipties"] remoteexeccall ["say3D",-2];

_randycunt = 3;
_num = 1;
_myposy = getPos player;
while {_randycunt > _num} do {
	_randycunt = _randycunt - 1;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 1;
};

[player] remoteExec ["ANZUS_fnc_restrain", _unit];

life_action_inUse = false;

