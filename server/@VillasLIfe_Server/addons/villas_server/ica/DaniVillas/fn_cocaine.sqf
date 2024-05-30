/*
	File: fn_cocaine.sqf
	By AxE && John "Paratus" VanderZwet

*/

if ((["pop_coca_b"] call ica_fnc_tengo) < 1) exitWith {};
["pop_coca_b",-1] call ica_fnc_item;
player setVariable ["drogado",true,true];
life_drug_level = life_drug_level + 0.15;
if (life_drug_level > 1) then { life_drug_level = 1; };

[] spawn
{
	life_cocaine_effect = time;
	systemChat "..::: Te sientes Imparable ! :::..";
	titleText [format ["<t color='#d9dad8' size='1.5'>..::: Te sientes Imparable ! :::..</t><br/><img image='%1' size='1.50'/>",["pop_coca_b"] call ica_fnc_classToPic], "PLAIN", -1, true, true];
	player setFatigue 0;
	player enableFatigue false;
	profileNamespace setVariable ["fois", 100];
	profileNamespace setVariable ["hearb", 100];	
	player setAnimSpeedCoef 1.1;
	waitUntil {!alive player OR ((time - life_cocaine_effect) > (4 * 60))};
	life_cocaine_effect = 0;
	player setAnimSpeedCoef 1;
	player enableFatigue true;
};

[] call ica_fnc_hudUpdate;
["pop_coca_b"] call ica_fnc_drugUsed;