scriptName "functions_weaponSway_4";

_ownsDependency1 = [life_currentExpPerks, "perk_weaponSway_4"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	player setCustomAimCoef 0.60;

	player addEventHandler ["Respawn", {
		player setCustomAimCoef 0.60;
	}];
};