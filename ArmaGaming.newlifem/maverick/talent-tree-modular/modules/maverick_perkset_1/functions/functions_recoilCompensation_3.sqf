scriptName "functions_recoilCompensation_3";

_ownsDependency1 = [life_currentExpPerks, "perk_gunsspecialist_lessRecoil_3"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_gunsspecialist_lessRecoil_4"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	player setUnitRecoilCoefficient .8;

	player addEventHandler ["Respawn", {
		player setUnitRecoilCoefficient .8;
	}];
};