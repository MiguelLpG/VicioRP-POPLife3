#include "\life_server\script_macros.hpp"

["AnzusLife_SpawnRocks", {
	_rocks = ["AnzusLife_Bits_Rock_L_Diamond","AnzusLife_Bits_Rock_L_Coal","AnzusLife_Bits_Rock_L_Iron"];
	_numberOfRocks = 30;
	_index = 0;
	
	_areas = LIFE_SETTINGS(getArray,"MiningAreas");
	if (_areas isEqualTo []) exitWith {};
		
	_source = getMarkerPos (selectRandom _areas);
	if(count nearestobjects [_source,_rocks,70] >= 30) exitwith {};

	_index = count (nearestobjects [_source,_rocks,70]);
	while {_index < _numberOfRocks} do 
	{
		_rand = (round (random 2));
		_class = _rocks select _rand;
		_dir = random 360;
		_dist = random 50;
		_pos = [((_source select 0) + (cos _dir) * _dist), ((_source select 1) + (sin _dir) * _dist), 0];
		_rock = _class createVehicle _pos;
		_hp = selectRandom [3,4];
		_rock setVariable ["health",_hp,true];
		_rock setDir (random 360);
		[_rock,false] remoteExecCall ["ANZUS_fnc_simDisable",0];
		_index = _index + 1;
	};
}] call AnzusLife_ServerCompile;

