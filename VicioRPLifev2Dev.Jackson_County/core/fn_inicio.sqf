#include <macro.h>
if !(isNil "The_programmer_initialised") exitWith {};
switch (playerSide) do {

    // Policias
    case west: {
		if ((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
			//["NotWhitelisted", false, true] call BIS_fnc_endMission;
		endMission "NotWhitelisted";

			sleep 35;
		};

		player setVariable ["rank", (__GETC__(life_coplevel)), true];
		player setVariable ["copLevel",1,true];
<<<<<<< HEAD
		[] spawn life_fnc_copMarkers;
		[] spawn ica_fnc_NPCNames;
=======
>>>>>>> parent of ed2be50 (Añadido mecánico, fix mineria, sistema logs, etc)
	};

	// Civiles
	case civilian: {
		if (life_is_arrested) then {
			noSpawn = true;
			life_is_arrested = false;
			[player, true] spawn life_fnc_jail;
			[] spawn climent_fnc_nevcarcel;
			
		};
		[] spawn life_fnc_civMarkers;
		[] call life_fnc_zoneCreator;
		
	};

	// Médicos
	case independent: {
		if ((__GETC__(life_medicLevel)) < 1) exitWith {
			//["Notwhitelisted", FALSE, TRUE] call BIS_fnc_endMission;
			endMission "NotWhitelisted";

			sleep 35;
		};
		player setVariable ["copLevel",1,true];
	};

	// Servicios pubicos
	case opfor: {
		if ((__GETC__(life_oplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
			//["NotWhitelisted", false, true] call BIS_fnc_endMission;
			endMission "NotWhitelisted";
			sleep 35;
		};
	};
};

private ["_value"];

_value = parseNumber(ctrlText 9922);
if (_value < 0) exitWith {};
if (_value > 999999) exitWith {};
waitUntil {!(isNull (findDisplay 46))};

if (isNil {noSpawn}) then {
	[] call life_fnc_spawnMenu;
	waitUntil {!isNull (findDisplay 38500)};
    waitUntil {isNull (findDisplay 38500)};
};

player addRating 9999999;
