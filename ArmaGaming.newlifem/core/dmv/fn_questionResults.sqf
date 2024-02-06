#include "..\..\script_macros.hpp"

params [
	["_type","",[""]]
];

_testPrice = 1000;
switch (_type) do { 
	case "Fail": {
		closeDialog 0;
		[player,"TestFailure"] remoteexeccall ["say3D",-2];
		["You have failed your test, please read our rules!",false,"slow"] call ANZUS_fnc_notificationSystem;
	}; 

	case "One": {
		if(CASH < _testPrice) exitWith {[format["You dont have cash to take this test, the price is $%1", [_testPrice] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;};
		[_testPrice,true] call AnzusLife_AC_Cash;
		[0] call ANZUS_fnc_updatePartial;
		
		closeDialog 0;
		CreateDialog "speedLimitCity";
	}; 

	case "Two": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "speedLimitHW";
	}; 

	case "Three": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "speedingCar";
	}; 

	case "Four": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "trolling";
	}; 

	case "Five": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "pullOverIllegal";
	}; 

	case "Six": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "carCrash";
	}; 

	case "Seven": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "turning";
	}; 

	case "Eight": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "federal";
	}; 

	case "Nine": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "checkpoint";
	}; 

	case "Pass": {
		if ((time - life_action_delay) < 5) exitWith {closeDialog 0;};
		closeDialog 0;
		life_action_delay = time;

		missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),true];
		["DMV"] spawn mav_ttm_fnc_addExp;

		[player,"TestComplete"] remoteexeccall ["say3D",-2];
		[2] call ANZUS_fnc_updatePartial;

		["Congratulations! You have passed the test! You can now buy any land vehicle, drive responsibly!",false,"slow"] call ANZUS_fnc_notificationSystem;
	};
};