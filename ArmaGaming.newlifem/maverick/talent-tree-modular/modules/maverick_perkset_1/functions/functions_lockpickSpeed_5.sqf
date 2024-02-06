scriptName "functions_lockpickSpeed_5";

_ownsDependency1 = [life_currentExpPerks, "perk_locksmith_5"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_lockpickMultiplier = 1.75;
};