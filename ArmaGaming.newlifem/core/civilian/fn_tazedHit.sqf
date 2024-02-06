private["_curWep","_curMags","_attach","_obj"];
params [["_unit", objNull, [objNull]], ["_shooter", objNull, [objNull]]];

if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};
if(player getVariable ["life_is_alive",false] isEqualTo false) exitWith {};

if(_shooter isKindOf "Man") then
{
	if(!life_istazed) then
	{
		life_istazed = true;
		disableUserInput true;
		[] spawn {
			[] spawn ANZUS_fnc_ragdoll;
			player setVariable ["tf_unable_to_use_radio", true];
			uiSleep 9;
			life_istazed = false;
			player allowDamage true;
			disableUserInput false;
			player setVariable ["tf_unable_to_use_radio", false];
		};
	};
} else {
	_unit allowDamage true;
	life_istazed = false;
};