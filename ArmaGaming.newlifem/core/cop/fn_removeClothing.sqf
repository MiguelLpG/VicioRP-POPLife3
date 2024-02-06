#include "..\..\script_macros.hpp"


if (!(player getVariable ["restrained",false])) exitWith {};
if !(isNull (objectParent player)) exitWith {};

_holder = createVehicle ["GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE" ];
{
	if !(_x isEqualTo "") then {
		switch (_forEachIndex) do { 
			case 0 : { removeUniform player; _holder addItemCargoGlobal [_x,1]; }; 
			case 1 : {  removeVest player; _holder addItemCargoGlobal [_x,1];  }; 
			case 2 : {removeBackpackGlobal player; };
		};
	};
}forEach [uniform player,vest player,backpack player];

[3] call ANZUS_fnc_updatePartial;