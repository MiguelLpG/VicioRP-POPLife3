cameratarget = param [0];
if(Camrunning) exitWith {};
Camrunning = true;	
_radius = 300;	
_angle = (getDir player);	
_altitude = 200;	
_dir = 0;	
_speed = 0.4;	
_coords = [cameratarget, _radius, _angle] call BIS_fnc_relPos;
_coords set [2,_altitude];
_camera = "camera" camCreate _coords;
_camera cameraEffect ["INTERNAL","BACK"];
_camera camPrepareFOV 0.700;
_camera camPrepareTarget cameratarget;
_camera camCommitPrepared 0;
_pos = cameratarget;
cutText ["","BLACK IN"];

while {Camrunning} do {
	_coords = [cameratarget, _radius, _angle] call BIS_fnc_relPos;
	_coords set [2, _altitude];
	_camera camPreparePos _coords;
	_camera camCommitPrepared _speed;
	waitUntil {camCommitted _camera || !(Camrunning)};
	if (!(Camrunning)) then {	
		_camera cameraEffect ["terminate","back"];
		camDestroy _camera;
	};
	if !(_pos isEqualTo cameratarget) then {
		_pos = cameratarget;
		_camera camPrepareTarget cameratarget;
	};
	_camera camPreparePos _coords;
	_camera camCommitPrepared 0;
	_angle = if(_dir isEqualTo 0) then {_angle - 1} else {_angle + 1};
};
