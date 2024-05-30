/*
	File: fn_attachSmoke.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	pop_cannabis_i is bad, mmkay?
*/

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {};

_pe = "#particlesource" createVehicle (getpos _unit);
_pe setParticleCircle [0, [0, 0, 0]];
_pe setParticleRandom [2, [0.1, 0.1, 0], [0.05, 0.05, 0.3], 0.3, 0.25, [1, 1, 1, 1], 0, 0];
_pe setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 13,0],   "",    "Billboard",    0.5,    0.5,    [0,0,0],   [0, 0.2, -0.2],    1, 1.275, 1, 0.2,    [0, 0.2,0],    [[0.4,0.4,1, 0.1], [1,1,1, 0.01], [1,1,1, 0]],    [1000],    1,    0.04,    "",    "",    nil];    
_pe setDropInterval 0.025;
_pe attachTo [_unit,[0,0,0],"head"];
sleep 20;
detach _pe;
deleteVehicle _pe;