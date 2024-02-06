if (isDedicated) exitWith {};
if (!isNil{aero_player_markers_pos}) exitWith {};
				   
private ["_marker","_markerText","_temp","_unit","_vehicle","_markerNumber","_show","_injured","_text","_num","_getNextMarker","_getMarkerColor","_showAllSides","_showPlayers","_showAIs","_l"];

aero_player_markers_pos = getPosVisual player;
addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	aero_player_markers_pos = _pos;
}];

_getNextMarker = {
	private ["_marker"]; 
	_markerNumber = _markerNumber + 1;
	_marker = format["um%1",_markerNumber];	
	if(getMarkerType _marker == "") then {
		createMarkerLocal [_marker, _this];
	} else {
		_marker setMarkerPosLocal _this;
	};
	_marker;
};

_getMarkerColor = {
	if ((_this getVariable ["taxTime",0]) > time) exitWith { [opfor,true] call bis_fnc_sideColor;};
	if (side _this == independent) exitWith { "ColorRed"; };
	[(side _this),true] call bis_fnc_sidecolor;
};

while {true} do {
	  
	waitUntil {
		sleep 0.025;
		true;
	};
	
	_markerNumber = 0; 

	_units = [player];
	if (playerSide == west) then {
		_units = allUnits select {(side _x == west || _x getVariable ["parole", false]) && !(isObjectHidden _x)};
	};

	if (playerSide == independent) then {
		_units = allUnits select {side _x == independent && !(isObjectHidden _x)};
	};
	
	if (playerSide == civilian) then {
		private _unit = units player;
		_units = allUnits select {_x in _unit && !(isObjectHidden _x) || ((_x getVariable ["taxTime",0]) > time)};
	};

	{
		_show = false;
		_unit = _x;
		_tax = _unit getVariable ["taxTime",0];
		_parole = _unit getVariable ["parole_time", -1];

		if (("ItemGPS" in assignedItems _unit) && isPlayer _unit ) then {
			_show = true;
		}; 

		if ( isPlayer _unit && _tax > time) then {
			_show = true;
		};

		if (isPlayer _unit && _parole > -1) then {
			_show = true;
		};

		if(_show) then {
			_vehicle = vehicle _unit;
			_pos = getPosATL _vehicle;
			_color = _unit call _getMarkerColor;  

			_markerText = _pos call _getNextMarker;
			_markerText setMarkerColorLocal _color;
 			_markerText setMarkerTypeLocal "c_unknown";
			_markerText setMarkerSizeLocal [0.8,0];

			_marker = _pos call _getNextMarker;
			_marker setMarkerColorLocal _color;
			_marker setMarkerDirLocal getDir _vehicle;
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerTextLocal "";			
			if(_vehicle isEqualTo (objectParent player)) then {
				_marker setMarkerSizeLocal [0.8,1];
			} else {
				_marker setMarkerSizeLocal [0.5,0.7];
			};
			
			_text = "";

			if (_parole > -1) then {
				_text = format["%1-%2m", name _x, _parole];
			} else {
				if(!(_vehicle isEqualTo _unit) && !(_vehicle isKindOf "ParachuteBase")) then {
					
					if(!isNull driver _vehicle) then {
						_text = format["%1 %2", name driver _vehicle, _text];	
					};							 						
					
					if((aero_player_markers_pos distance (getPosVisual  _vehicle)) < 50) then {
						aero_player_markers_pos = getPosVisual  _vehicle;
						_num = 0;
						{
							if(alive _x && isPlayer _x && !(_x isEqualTo (driver _vehicle))) then {
								_text = format["%1%2 %3", _text, if(_num>0)then{","}else{""}, name _x];
								_num = _num + 1;
							};						
						} forEach crew _vehicle; 
					} else { 
						_num = {alive _x && isPlayer _x && !(_x isEqualTo (driver _vehicle))} count crew _vehicle;
						if (_num>0) then {					
							if (isNull driver _vehicle) then {
								_text = format["%1 %2", _text, name (crew _vehicle select 0)];
								_num = _num - 1;
							};
							if (_num>0) then {
								_text = format["%1 +%2", _text, _num];
							};
						};
					};
				} else {	
					_text = name _x;
				};
			};
			_markerText setMarkerTextLocal _text;
		};
		
	} forEach _units;
	
	if !(isNull truckMissionVeh) then {
		_color = [opfor,true] call bis_fnc_sideColor;
		_pos = getPosATL truckMissionVeh;
		_markerText = _pos call _getNextMarker;
		_markerText setMarkerColorLocal _color;
		_markerText setMarkerTypeLocal "c_unknown";
		_markerText setMarkerSizeLocal [0.8,0];
		_markerText setMarkerTextLocal "Transport Truck";

		_marker = _pos call _getNextMarker;
		_marker setMarkerColorLocal _color;
		_marker setMarkerDirLocal getDir truckMissionVeh;
		_marker setMarkerTypeLocal "mil_triangle";
		_marker setMarkerTextLocal "";				
	};


	_markerNumber = _markerNumber + 1;
	_marker = format["um%1",_markerNumber];	
	while {(getMarkerType _marker) != ""} do {
		deleteMarkerLocal _marker;
		_markerNumber = _markerNumber + 1;
		_marker = format["um%1",_markerNumber];
	};
	 
};
