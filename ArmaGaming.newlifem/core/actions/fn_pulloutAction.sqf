#include "..\..\script_macros.hpp"
	
params [
	["_veh", objNull, [objNull]]
];
private ["_crew"];
_crew = crew _veh;

if((player distance _veh) > 8) exitWith {["Too far away from the vehicle to pull out!",true,"slow"] call ANZUS_fnc_notificationSystem;};

switch playerSide do {
	case civilian : {
			if (_veh in life_vehicles) then {
				{
					if (isPlayer _x || !(_x getVariable ["life_is_alive",true])) then {
						_x setVariable ["Escorting",false,true];
						[player] remoteExecCall ["ANZUS_fnc_pulloutVeh",_x];
					};
				} forEach _crew;			
			} else {
				["You cannot pull players out, this is not your vehicle!",true,"slow"] call ANZUS_fnc_notificationSystem;
			};
	};

	default {
		{
			if (isPlayer _x || !(_x getVariable ["life_is_alive",true])) then {
				_x setVariable ["Escorting",false,true];
				[player] remoteExecCall ["ANZUS_fnc_pulloutVeh",_x];
			};
		} forEach _crew;
	};
};