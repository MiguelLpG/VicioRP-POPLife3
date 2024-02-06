scriptName "functions_evidence_2";

_ownsDependency = [life_currentExpPerks, "perk_evidence_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency) then {
	mav_ttm_var_evidenceSpeed = 1.8;
};
