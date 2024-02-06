private ["_markers","_units"];
_markers = [];
_units = [];

sleep 0.25;
if (visibleMap) then {
    {   
        _player = _x getVariable ["CorpsePlayer",objNull];
        _down = _x getVariable ["Revive",false];
        if (!isNull _player && !_down) then {
            _units pushBack [_x,name _player];
        };
    } forEach allDeadMen;	

    {
        _marker = createMarkerLocal [format ["%1_dead_marker",(_x select 0)],visiblePosition (_x select 0)];
        _marker setMarkerColorLocal "ColorRed";
        _marker setMarkerTypeLocal "loc_Hospital";
        _marker setMarkerTextLocal format ["%1 - %2%3",(_x select 1),((_x select 0) getVariable ["bleed_percentage", 0]), "%"];
        _markers pushBack _marker;
    } forEach _units;

    waitUntil {!visibleMap};
    {deleteMarkerLocal _x;} forEach _markers;
};
