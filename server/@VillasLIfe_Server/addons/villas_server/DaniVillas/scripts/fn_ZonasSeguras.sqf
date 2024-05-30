// By FuRixX Lamborghini \\

waitUntil {!isNull (findDisplay 46)};

FuRixX_Zonas_Seguras = [
	[ [8529.79,6679.59,0.00143814],	60]
];

sleep 2;
for "_i" from 0 to 3 step 1 do {
	["<t color='#FF0000' size = '0.5'>Zonas Seguras By FuRixX</t>",-1.08,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
	sleep 0.5;
	["<t color='#FFF000' size = '0.5'>Zonas Seguras By FuRixX</t>",-1.08,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
	sleep 0.5;
	["<t color='#52BE80' size = '0.5'>Zonas Seguras By FuRixX</t>",-1.08,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
};
["<t color='#52BE80' size = '0.5'>Iniciando...</t>",-1.1,1.31,30,0,0,23789] spawn BIS_fnc_dynamicText;
sleep 2;
["<t color='#52BE80' size = '0.5'></t>",-1.08,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;

// Script Zonas Seguras
[] spawn {

	while {true} do {

		_estaenzona = player getVariable ["FuRixX_EstaEnZonaSegura", false];
		_enzonasegura = false;

		{

			_pos = _x select 0;
			_distanciaS = _x select 1;
			_disntacia = (player distance _pos) <= _distanciaS;
			if (_disntacia) then {
				_enzonasegura = true;
				player setVariable ["FuRixX_EstaEnZonaSegura", true];
				break;
			};

		} forEach FuRixX_Zonas_Seguras;

		if (_enzonasegura) then {
			["<t color='#52BE80' size = '0.5'>Estás en zona segura</t>",-1.08,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
		} else {

			if (_estaenzona) then {
				["<t color='#FF0000' size = '0.5'></t>",-1.10,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
			};
			player setVariable ["FuRixX_EstaEnZonaSegura", false];
		};

		sleep 0.2;
	};

};

// Sistema de ATMS Automáticos
[] spawn {

	while {true} do {

		_cerca = nearestObjects [player, ["house"], 200];
		_pos = getPos player;

		{

			if (typeOf _x == "Orel_NPC_ATM") then {

				_parametros = [getPos _x, 50];
				_encontrar = FuRixX_Zonas_Seguras find _parametros;

				if (_encontrar == -1) then {
					FuRixX_Zonas_Seguras pushBack _parametros;
				};
			};

		} forEach _cerca;

		waitUntil { (player distance _pos) > 100 };

	};

};

// By FuRixX Lamborghini \\