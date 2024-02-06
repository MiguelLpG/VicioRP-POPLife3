scriptName "functions_processSpeed_4";

_ownsDependency1 = [life_currentExpPerks, "perk_processing_4"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_processing_5"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_processMultiplier = 1.4;
};