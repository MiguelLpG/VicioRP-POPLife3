scriptName "functions_impoundSpeed_1";

_ownsDependency1 = [life_currentExpPerks, "perk_impoundspeed_1"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_impoundspeed_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_impoundMultiplier = 2;
};