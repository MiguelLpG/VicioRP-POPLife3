
/*
por: Medel
*/

//["debug"] call ica_fnc_policia;

/*

HOTEL FANTASMA - PACO - CLUB 7 - ALCAMPO  - BANCO

*/

_param = param [0];

if (_param isEqualTo "debug") exitWith {
    if (missionNamespace getVariable "nopolicia" isEqualTo false) then {
        missionNamespace setVariable ["nopolicia", true, true];
        hint "Ahora puedes robar sin policía";
    } else {
        missionNamespace setVariable ["nopolicia", false, true];
        hint "Ya no puedes robar sin policía";
    };
};

	_polis = 0;
	_poli = false;
	Poli = false;
	switch (_param) do {
		case "Paco": { _polis = 2;};

		case "Manolo": { _polis = 2;};

		case "Club7": { _polis = 8;};

		case "Putas": { _polis = 6;};

		case "Farmacia": { _polis = 3;};

		case "Nuclear": { _polis = 10;};

		case "Sucursal": { _polis = 10;};

		case "Ropa": { _polis = 6;};

		case "Militar": { _polis = 12;};

		case "Lezo": { _polis = 13;};

		case "Concesionario": { _polis = 6;};

		case "Banco": { _polis = 13;};

		case "ohz": { _polis = 8;};

		case "Hotelf": { _polis = 13;};
		
		case "Casino": { _polis = 8;};

		case "Robo_Donador": { _polis = 8;};

		case "Alcampo": { _polis = 6;};

		default {_polis = 1000;};
	};

	_polisOn = {side _x == WEST} count playableUnits;

    if !(_polisOn >= _polis) then { 
        hint parseText format  
  
        ["<t size = ""2"" color=""#DE2828"" align='center'>ALERTA <br/> 
        <t size = ""1"" color=""#21618C"" align='left'>Tienen que estar al menos %1 policias conectados, sino corres el riesgo de que se tome justicia por cuenta propia y te salga el tiro por la culata ... ¿quieres probar?.</t></t>  

        ",_polis]; 
  		_poli = true;
 		} else {_poli = false;};
	if ((missionNamespace getVariable "nopolicia") isEqualTo true) then {_poli = false;};

	Poli = _poli;
