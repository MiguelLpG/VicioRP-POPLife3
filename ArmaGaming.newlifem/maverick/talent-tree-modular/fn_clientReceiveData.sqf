scriptName "fn_clientReceiveData";

params [
	["_level", 0],
	["_exp", 0],
	["_perkPoints", 0],
	["_perks", []]
];

	
if (life_perksInitialized) exitWith {};

if !(_perks isEqualTo []) then {
	[_perks] call mav_ttm_fnc_setPerks;
};

life_currentExpLevel = _level;
life_currentExp = _exp;
life_currentPerkPoints = _perkPoints;

	
life_perksInitialized = true;