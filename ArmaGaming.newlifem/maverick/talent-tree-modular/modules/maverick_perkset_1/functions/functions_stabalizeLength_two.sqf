scriptName "functions_stabalizeLength_two";
_ownsDependency = [life_currentExpPerks, "perk_stabalizeLength_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency) then {
	mav_ttm_var_stabalizeLength = 180;
};