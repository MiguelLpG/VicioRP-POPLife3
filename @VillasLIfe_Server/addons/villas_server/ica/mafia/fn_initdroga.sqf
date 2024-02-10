
/*
por: Icaruk
	0 spawn ica_fnc_initDroga;
*/

waitUntil {!isNil {camMet}};

// Vars
0 spawn {

	_tope = 200;
	_n = 20;
	while {true} do {
		if !(camMar <= 0) then {camMar = camMar - _n};
		if !(camHer <= 0) then {camHer = camHer - _n};
		if !(camCoc <= 0) then {camCoc = camCoc - _n};
		if !(camMet <= 0) then {camMet = camMet - _n};

		sleep (60 * 20);
	};
};

// Opio
0 spawn {
	private ["_cajas", "_contenidoCajas"];
	_cajas = [cajaOpio1, cajaOpio2, cajaopio3, cajaOpio5, cajaOpio6];

	while {true} do {
		_contenidoCajas = [];
		{_contenidoCajas = _contenidoCajas + magazineCargo _x} forEach _cajas;
		_opio = {"pop_opio_b"  isEqualTo  _x} count _contenidoCajas;

		if (_opio < 30) then {
			for "_x" from 0 to 30 do {
				(_cajas call BIS_fnc_selectRandom) addItemCargoGlobal ["pop_opio_b", 2];
			};
		};

		{_x animate ["door1", 0]} forEach [contenedores4, contenedores5, contenedores6];

		sleep (60 * 25);
	};
};

// Coca
0 spawn {
	private ["_cajas", "_contenidoCajas"];
	_cajas = [cajacoca1, cajacoca2, cajacoca3, cajacoca4, cajacoca6];

	while {true} do {
		_contenidoCajas = [];
		{_contenidoCajas = _contenidoCajas + magazineCargo _x} forEach _cajas;
		_coca = {"pop_coca_b"  isEqualTo  _x} count _contenidoCajas;

		if (_coca < 80) then {
			for "_x" from 0 to 20 do {
				(_cajas call BIS_fnc_selectRandom) addItemCargoGlobal ["pop_coca_b", 2];
			};
		};
		// {_x setVariable ["cerrado", true, true]} forEach _cajas;
		{_x animate ["door1", 0]} forEach [contenedores1, contenedores2, contenedores3, contenedores7, contenedores8];

		sleep (60 * 25);
	};
};

// Efedrina
0 spawn {
	private ["_cajas", "_contenidoCajas"];
	_cajas = [cajaHospital,cajaHospital2,cajaHospital3,cajaHospital4];

	while {true} do {
		_contenidoCajas = [];
		{_contenidoCajas = _contenidoCajas + magazineCargo _x} forEach _cajas;
		_efe = {"pop_efedrina_b" isEqualTo _x} count _contenidoCajas;

		if (_efe < 80) then {
			(_cajas call BIS_fnc_selectRandom) addItemCargoGlobal ["pop_efedrina_b", 30];
		};
		sleep (60 * 25);
	};
};
