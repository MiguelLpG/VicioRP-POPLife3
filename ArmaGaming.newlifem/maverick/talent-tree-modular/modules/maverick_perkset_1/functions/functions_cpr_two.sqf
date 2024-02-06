scriptName "functions_cpr_two";
_ownsDependency1 = [life_currentExpPerks, "perk_cpr_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_cprChance = 50;
};