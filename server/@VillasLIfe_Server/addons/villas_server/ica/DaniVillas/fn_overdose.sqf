/*
	File: fn_overdose.sqf
	Author: John "Paratus" VanderZwet / cptjames32
	
	Description:
	Took things a little too far!
*/

_gesture = "GestureSpasm%1";
_duration = ceil random 30;
player playActionNow format[_gesture,2];

titleText ["<t color='#980707' size='2'>..::: !! Tienes una sobredosis !! :::..</t><br/>***********", "PLAIN", -1, true, true];

disableUserInput true;
player playActionNow format[_gesture,1];

for "_i" from 1 to _duration do {
	switch (_i) do
	{
		case (5): { player playActionNow format[_gesture,2]; };
		case (10): { player playActionNow format[_gesture,3]; };
		case (15): { player playActionNow format[_gesture,4]; };
		case (25): { player playActionNow format[_gesture,4]; };
	};
	sleep 2;
};

disableUserInput false;

_death = random 1;
if (_death > 0.7) then {
if (player getVariable ["drogado",false]) then { systemChat "Has muerto por una sobredosis de drogas, pasa en la vida, pasa en POPLIFE."; player setDamage 1; } else {};}
else { player playActionNow "gestureNod"; };

life_drug_level = life_drug_level - 1;