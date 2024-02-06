scriptName "functions_impoundSpeed_2";

_ownsDependency1 = [life_currentExpPerks, "perk_impoundspeed_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_impoundMultiplier = 3;
};