scriptName "functions_stamina_1";

_ownsDependency1 = [life_currentExpPerks, "functions_stamina_1"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
    mav_ttm_var_stamina = 1;
    player enableFatigue false;
    player addEventHandler ["Respawn", {
		player enableFatigue false;
	}];
};