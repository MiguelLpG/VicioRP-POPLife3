scriptName "functions_north";

_ownsDependency1 = [life_currentExpPerks, "functions_north"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_north = 1;
};