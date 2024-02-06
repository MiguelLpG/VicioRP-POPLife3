scriptName "functions_repairSpeed_2";

_ownsDependency1 = [life_currentExpPerks, "functions_repairSpeed_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_repairMultiplier = 2.3;
};