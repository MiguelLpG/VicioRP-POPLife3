scriptName "fn_init";

[] spawn {
	sleep 5;
	if (isServer && !hasInterface) exitWith {};

	life_perksInitialized = false;
	life_currentExpPerks = (0 call mav_ttm_fnc_generateBasePerks);
	life_currentExpLevel = 0;
	life_currentExp = 0;
	life_currentPerkPoints = 0;

	waitUntil {player isEqualTo player};	
	[player] remoteExecCall ["mav_ttm_fnc_loadFromDatabase", 2];	
	[] spawn {
		while {!life_perksInitialized} do
		{
			sleep 5;
			if (life_perksInitialized) exitWith {};
			[player] remoteExecCall ["mav_ttm_fnc_loadFromDatabase", 2];
		};
	};
};