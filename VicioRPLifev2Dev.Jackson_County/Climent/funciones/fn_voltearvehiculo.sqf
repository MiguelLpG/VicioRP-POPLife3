
// ***********************************************************
// PoP Police framework by Blakord
// Flip Vehicle
// ***********************************************************

private ["_unit"];
_unit = cursorTarget;
_unit setVectorUp [0,0,1];
_unit setPosATL [(getPosATL _unit) select 0, (getPosATL _unit) select 1, 0];