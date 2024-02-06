scriptName "functions_weaponSway_1";

_ownsDependency1 = [life_currentExpPerks, "perk_weaponSway_1"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_weaponSway_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	player setCustomAimCoef 0.85;

	player addEventHandler ["Respawn", {
		player setCustomAimCoef 0.85;
	}];
};