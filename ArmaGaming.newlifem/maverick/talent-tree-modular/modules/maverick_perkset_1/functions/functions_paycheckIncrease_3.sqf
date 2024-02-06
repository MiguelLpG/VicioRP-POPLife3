scriptName "functions_paycheckIncrease_3";

_ownsDependency1 = [life_currentExpPerks, "perk_paycheck_3"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_paycheck_4"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_paycheckMultiplier = 1.45;
};