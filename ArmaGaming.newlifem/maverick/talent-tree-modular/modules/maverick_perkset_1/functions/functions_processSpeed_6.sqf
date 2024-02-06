scriptName "functions_processSpeed_6";
	
_ownsDependency1 = [life_currentExpPerks, "perk_processing_6"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_processMultiplier = 1.75;
};