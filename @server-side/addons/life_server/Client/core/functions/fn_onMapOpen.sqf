params ["_mapIsOpened", "_mapIsForced"];

if (_mapIsOpened) then {
    if ( playerSide isEqualTo independent ) then {[] spawn ANZUS_fnc_medicMarkers;};
};