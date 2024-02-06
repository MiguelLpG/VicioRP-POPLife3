scriptName "functions_uranium_1";

_ownsDependency1 = [life_currentExpPerks, "functions_uranium_1"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_uranium = 1;
};