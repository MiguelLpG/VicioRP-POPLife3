/*
	File: fn_meth.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Not even once!
*/

life_drug_level = life_drug_level + 0.2;
if (life_drug_level > 1) then { life_drug_level = 1; };
player setVariable ["drogado",true,true];
if (life_meth_effect == 0) then
{
	life_meth_effect = time;
	[] spawn
	{
		"ColorInversion" ppEffectEnable true;
		"ColorInversion" ppEffectAdjust [life_drug_level / 5,0,life_drug_level / 5];
		"ColorInversion" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [life_drug_level / 10,life_drug_level / 10,true];
		"chromAberration" ppEffectCommit 1;
		sleep 2.25;	
		
		while {alive player && ((time - life_meth_effect) < (4 * 60))} do
		{
			"ColorInversion" ppEffectEnable true;
			"ColorInversion" ppEffectAdjust [life_drug_level / 5,0,life_drug_level / 5];
			"ColorInversion" ppEffectCommit 1;
			"chromAberration" ppEffectEnable true;
			"chromAberration" ppEffectAdjust [life_drug_level / 10,life_drug_level / 10,true];
			"chromAberration" ppEffectCommit 1;
			sleep 2;
		};
		
		"chromAberration" ppEffectEnable false;
		"ColorInversion" ppEffectEnable false;
		life_meth_effect = 0;
	};
};

life_meth_effect = time;

[] spawn
{
	systemChat "..::: Te sientes Increible ! :::..";
	titleText [format ["<t color='#48e1fb' size='1.5'>..::: Te sientes Increible ! :::..</t><br/><img image='%1' size='1.50'/>",["pop_efedrina_b"] call ica_fnc_classToPic], "PLAIN", -1, true, true];
	player setAnimSpeedCoef 1.15;
	player setFatigue 0;
	player enableFatigue false;
	waitUntil {!alive player OR ((time - life_meth_effect) > (4.5 * 60))};
	life_meth_effect = 0;
	player enableFatigue true;
	player setAnimSpeedCoef 1;
};

[] call ica_fnc_hudUpdate;
["meth"] call ica_fnc_drugUsed;