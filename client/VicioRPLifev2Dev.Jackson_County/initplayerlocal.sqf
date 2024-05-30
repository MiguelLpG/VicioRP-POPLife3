life_adminlevel = nil; life_coplevel = nil; life_donator = nil;
if(!hasInterface) exitWith {};

#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);

[true] spawn ica_fnc_vistaBonita;

[] execVM "core\init.sqf";

votando = false;

hierbas = 0;

if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

[] spawn Climent_fnc_rangos;

player allowDamage true;

if (vehicle player == player) then {
	player allowDamage false;
};