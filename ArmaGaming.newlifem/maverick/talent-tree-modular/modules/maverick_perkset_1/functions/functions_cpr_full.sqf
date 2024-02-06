scriptName "functions_cpr_full";

_ownsDependency1 = [life_currentExpPerks, "perk_cpr_full"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	player setVariable ["mav_ttm_var_cprFull",0.5,true];
};