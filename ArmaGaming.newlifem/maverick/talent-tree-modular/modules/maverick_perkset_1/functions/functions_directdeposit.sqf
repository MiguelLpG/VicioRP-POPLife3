
_ownsDependency1 = [life_currentExpPerks, "perk_paycheck_5"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_directDeposit = true;
};