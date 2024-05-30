/*
	File: fn_heroin.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Say hello to my little friend!
*/

if ((["pop_opio_b"] call ica_fnc_tengo) < 1) exitWith {};
["pop_opio_b",-1] call ica_fnc_item;

player setVariable ["drogado",true,true];
life_drug_level = life_drug_level + 0.10;
if (life_drug_level > 1) then { life_drug_level = 1; };
[] call ica_fnc_hudUpdate;

if (life_heroin_effect == 0) then
{
	life_heroin_effect = time;
	[] spawn
	{
		systemChat "..::: Te sientes Terrible ! :::..";
		titleText [format ["<t color='#c4cc62' size='1.5'>..::: Te sientes Terrible ! :::..</t><br/><img image='%1' size='1.50'/>",["pop_opio_b"] call ica_fnc_classToPic], "PLAIN", -1, true, true];
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1.5, 0.5, [0,0,0,0], [0.2,0.2,0.2,0.5], [1,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [life_drug_level / 10,life_drug_level / 10,true];
		"chromAberration" ppEffectCommit 1;
		
		waitUntil {!alive player || ((time - life_heroin_effect) > (4 * 60))};
		
		"chromAberration" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
		life_heroin_effect = 0;
	};
};

life_heroin_effect = time;

["pop_opio_b"] call ica_fnc_drugUsed;