scriptName "functions_rebel_1";
_ownsDependency = [life_currentExpPerks, "perk_rebel_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency) then {
	mav_ttm_var_advrebel = 1;
};
