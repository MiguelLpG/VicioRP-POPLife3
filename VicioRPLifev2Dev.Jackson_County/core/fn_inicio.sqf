#include <macro.h>

switch (playerSide) do {

    // Policias
    case west: {
		if ((__GETC__(life_coplevel) == 0)) then {endMission "NotWhitelisted";};

		[] spawn life_fnc_copMarkers;
		player setVariable ["rank", (__GETC__(life_coplevel)), true];
		player setVariable ["copLevel",1,true];
		[] spawn ica_fnc_NPCNames;
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
		[] spawn ica_fnc_NPCNames;
		
	};

	// Médicos
	case independent: {
		if ((__GETC__(life_medicLevel)) == 0) exitWith {endMission "NotWhitelisted";};
		player setVariable ["copLevel",1,true];
		[] spawn ica_fnc_NPCNames;
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
