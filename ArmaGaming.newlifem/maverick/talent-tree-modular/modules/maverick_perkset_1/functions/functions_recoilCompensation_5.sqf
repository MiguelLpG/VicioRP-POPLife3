scriptName "functions_recoilCompensation_5";
	
_ownsDependency1 = [life_currentExpPerks, "perk_gunsspecialist_lessRecoil_5"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	player setUnitRecoilCoefficient .7;

	player addEventHandler ["Respawn", {
		player setUnitRecoilCoefficient .7;
	}];
};