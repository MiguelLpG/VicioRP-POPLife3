// By FuRixX Lamborghini \\

/*

	fn_loadgear.sqf de la misión modificado

*/

waitUntil{!isNull findDisplay 46};
waitUntil{!isNil "pop_din"};
waitUntil {life_session_completed};

if (playerSide != Civilian) exitWith {};

_Equip = profileNamespace getVariable ["FuRxX_Sync_wiNDivagowHA", getUnitLoadout player];
player setUnitLoadout _Equip;

systemChat "FuRixX AntiDupe System -> Inventario Cargado";

while {true} do {

	profileNamespace setVariable ["FuRxX_Sync_wiNDivagowHA", getUnitLoadout player];
	sleep 0.5;

};



// By FuRixX Lamborghini \\