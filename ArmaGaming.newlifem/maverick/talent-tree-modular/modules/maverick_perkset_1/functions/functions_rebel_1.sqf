scriptName "functions_rebel_1";
_ownsDependency = [life_currentExpPerks, "perk_rebel_1"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency) then {
	mav_ttm_var_rebel = 1;
};
