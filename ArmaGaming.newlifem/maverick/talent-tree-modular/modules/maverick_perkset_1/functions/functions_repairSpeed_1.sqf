scriptName "functions_repairSpeed_1";

_ownsDependency1 = [life_currentExpPerks, "functions_repairSpeed_1"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "functions_repairSpeed_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_repairMultiplier = 1.8;
};