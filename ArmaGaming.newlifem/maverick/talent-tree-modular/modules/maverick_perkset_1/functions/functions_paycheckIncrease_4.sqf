scriptName "functions_paycheckIncrease_4";

_ownsDependency = [life_currentExpPerks, "perk_paycheck_4"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency) then {
	mav_ttm_var_paycheckMultiplier = 1.75;
};