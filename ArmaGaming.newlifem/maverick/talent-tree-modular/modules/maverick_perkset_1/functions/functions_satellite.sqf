scriptName "functions_satellite";
	
_ownsDependency1 = [life_currentExpPerks, "functions_satellite"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
    mav_ttm_var_satellite = 1;
};
