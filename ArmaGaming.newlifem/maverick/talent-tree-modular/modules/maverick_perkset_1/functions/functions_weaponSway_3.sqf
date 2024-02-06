scriptName "functions_weaponSway_3";
	
_ownsDependency1 = [life_currentExpPerks, "perk_weaponSway_3"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_weaponSway_4"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	player setCustomAimCoef 0.70;

	player addEventHandler ["Respawn", {
		player setCustomAimCoef 0.70;
	}];
};