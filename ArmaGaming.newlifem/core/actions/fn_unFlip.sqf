params [
    ["_veh",objNull,[objNull]]
];

if (isNull _veh) exitWith {};
if(!(_veh isKindOf "LandVehicle" || _veh isKindOf "Air" || _veh isKindOf "Ship")) exitWith {};
if ((player distance _veh) >= 8) exitWith {}; 

 private _pos = getPosAtl _veh; 
 _pos set[2,(_pos select 2) + 1]; 
 _veh allowDamage false; 
 _veh setPos [_pos select 0,_pos select 1, 2000 + random (3000)]; 
 _veh setPosATL _pos; 
 _veh allowDamage true; 
