scriptName "functions_stabalizeLength_one";
_ownsDependency1 = [life_currentExpPerks, "perk_stabalizeLength_1"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_stabalizeLength_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_stabalizeLength = 120;
};