/*
    File: fn_dialogHuella.sqf
    Author: LoSantosYT
    Description:
    Genera imagenes aleatorias de la huella
*/

_hackeo  = missionNamespace getVariable "Hackeando";

if (_hackeo isEqualTo "Vacio") then {
	[] spawn lsyt_fnc_contador;
	missionNamespace setVariable ["Hackeando", name player, true];

	createDialog "Huella";
	private _control = 1611;
	lastnum = 6;
	for "_i" from 1 to 6 do {
		[_control] call lsyt_fnc_rotarImg;
		_control = _control + 1;
	};

	sleep 1;
	[] spawn lsyt_fnc_finalizar;
	
} else {
	if (_hackeo isEqualTo name player) then{
		hint "Ya estas hackeando";

		createDialog "Huella";
		
		ctrlSetText [1611,pic1];
		ctrlSetText [1612,pic2];
		ctrlSetText [1613,pic3];
		ctrlSetText [1614,pic4];
		ctrlSetText [1615,pic5];
		ctrlSetText [1616,pic6];


	} else {
		hint "Ya esta hackeando por: " + (str (_hackeo));
	};
};


