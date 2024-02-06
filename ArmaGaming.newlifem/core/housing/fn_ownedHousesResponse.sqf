params[["_unit", objNull], ["_houses", []]];

if (isNull _unit) exitWith {};

if (count _houses == 0) exitWith {
	[format["%1 owns no houses", name _unit],true,"slow"] call ANZUS_fnc_notificationSystem;
};

[_unit, _houses] spawn {
	params["_unit", "_houses"];
	
	["All of the suspect's houses are marked on your map",true,"slow"] call ANZUS_fnc_notificationSystem;

	_markers = [];
	{
		_position = call compile format ["%1",_x select 0];
		_marker = createMarkerLocal [format ["house_%1",round(random(99999))],_position];
		_marker setMarkerTextLocal format["Suspect's house (%1)", name _unit];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Lighthouse";

		_markers pushBack _marker;
	} foreach _houses;

	uiSleep 60;

	{
		deleteMarkerLocal _x;
	} foreach _markers;
	 
};