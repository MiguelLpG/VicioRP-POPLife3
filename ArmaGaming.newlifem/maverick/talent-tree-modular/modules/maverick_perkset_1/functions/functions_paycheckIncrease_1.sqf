scriptName "functions_paycheckIncrease_1";

_ownsDependency1 = [life_currentExpPerks, "perk_paycheck_1"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_paycheck_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_paycheckMultiplier = 1.20;
};