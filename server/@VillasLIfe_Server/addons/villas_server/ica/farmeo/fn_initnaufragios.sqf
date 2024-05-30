
/*
Naufragios por Icaruk
	[1] execVM "ica\farmeo\naufragios.sqf";
	
mod by AxE;

*/


	
	[cofre1, [" Forzar Cerradura y Buscar Joyas .::::. ", {["menu", 0.92, "naufragios"] call ica_fnc_ganzua}]] remoteExec ["addAction", 0,true];
	[cofre2, [" Forzar Cerradura y Buscar Joyas .::::. ", {["menu", 0.92, "naufragios"] call ica_fnc_ganzua}]] remoteExec ["addAction", 0,true];
	[cofre3, [" Forzar Cerradura y Buscar Joyas .::::. ", {["menu", 0.92, "naufragios"] call ica_fnc_ganzua}]] remoteExec ["addAction", 0,true];

_esconder = {
	private ["_escondite", "_barco"];
	_barco = typeOf _this;

	if (_barco isEqualTo "Land_Wreck_Traw_F") then {
		_escondite = [[4,-9,-4.1], [5.7,-9,-3.6], [1.4,2.7,4.7], [-4,-0.5,2.9], [-1,-4,-3]] call BIS_fnc_selectRandom;
	};
	if (_barco isEqualTo "Land_Wreck_Traw2_F") then {
		_escondite = [[1.2,-5,-3.9], [3,-5,2], [-4,-1.5,-2.6], [0.3,5,-4.2], [6,6.5,-4.2]] call BIS_fnc_selectRandom;
	};	
	if (_barco isEqualTo "Land_UWreck_MV22_F") then {
		_escondite = [[1.2,0.7,-2.9], [2.5,-6.5,-3.3], [2.9,-7.7,-2.2], [4,-1.7,-4.1], [-8,-6,-4.1]] call BIS_fnc_selectRandom;
	};
	_escondite
};




	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre1 attachTo [_barco, _barco call _esconder];
	//cofre1 addItemCargoGlobal [_class, _n];
	
	cofre1 setVariable["tengoJoyas", true ,true];
	
	
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre2 attachTo [_barco, _barco call _esconder];
	//cofre2 addItemCargoGlobal [_class, _n];
	
	cofre2 setVariable["tengoJoyas", true ,true];
	
	
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre3 attachTo [_barco, _barco call _esconder];
	//cofre3 addItemCargoGlobal [_class, _n];
	cofre3 setVariable["tengoJoyas", true ,true];

	sleep (60 * 20) + random (60 * 20);


		_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre1 attachTo [_barco, _barco call _esconder];
	//cofre1 addItemCargoGlobal [_class, _n];
	
	cofre1 setVariable["tengoJoyas", true ,true];
	
	
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre2 attachTo [_barco, _barco call _esconder];
	//cofre2 addItemCargoGlobal [_class, _n];
	
	cofre2 setVariable["tengoJoyas", true ,true];
	
	
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre3 attachTo [_barco, _barco call _esconder];
	//cofre3 addItemCargoGlobal [_class, _n];
	cofre3 setVariable["tengoJoyas", true ,true];


		sleep ((60 * 20) + random (60 * 20));

_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre1 attachTo [_barco, _barco call _esconder];
	//cofre1 addItemCargoGlobal [_class, _n];
	
	cofre1 setVariable["tengoJoyas", true ,true];
	
	
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre2 attachTo [_barco, _barco call _esconder];
	//cofre2 addItemCargoGlobal [_class, _n];
	
	cofre2 setVariable["tengoJoyas", true ,true];
	
	
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre3 attachTo [_barco, _barco call _esconder];
	//cofre3 addItemCargoGlobal [_class, _n];
	cofre3 setVariable["tengoJoyas", true ,true];


 sleep ((60 * 20) + random (60 * 20));

_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre1 attachTo [_barco, _barco call _esconder];
	//cofre1 addItemCargoGlobal [_class, _n];
	
	cofre1 setVariable["tengoJoyas", true ,true];
	
	
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre2 attachTo [_barco, _barco call _esconder];
	//cofre2 addItemCargoGlobal [_class, _n];
	
	cofre2 setVariable["tengoJoyas", true ,true];
	
	
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre3 attachTo [_barco, _barco call _esconder];
	//cofre3 addItemCargoGlobal [_class, _n];
	cofre3 setVariable["tengoJoyas", true ,true];