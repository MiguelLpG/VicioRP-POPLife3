
/*
por: Icaruk
	call ica_fnc_limitadorDeArmas
	player addmagazines ["CUP_30Rnd_9x19_EVO", 3]; player addweapon "r3f_mp5a5";
	player addmagazines ["RH_16Rnd_9x19_cz", 3]; player addweapon "RH_cz75";

*/

if ((player getVariable "brazos") >= 50) exitWith {
	puedoDisparar = nil;
	hint "Tienes los brazos rotos, no puedes aguantar un arma";
};
if ((player getVariable "invisible")) exitWith {
	puedoDisparar = nil;
	hint "No puedes disparar siendo invisible";
};

_listaSMGs = ["cup_bizon"];
_listaCarabinas = ["cup_m1014"];
_listafusiles = ["CUP_arifle_Mk16_STD_FG"];
_listaFrancotiradores = ["pop_winchester"];

_mirC = ["cha_cobradot_sight"];
_mirM = ["cha_1p78_sight"];
_mirL = ["cha_pso_sight"];

_arma = toLower (currentWeapon player);
_visor = toLower (player weaponAccessories _arma select 2);

_lvl = "tir" call ica_fnc_expToLevel;
puedoDisparar = true;

switch (true) do {
	case (_arma in _listaSMGs): {
		switch (true) do {
			case (_visor in _mirC): {
				if (_lvl >= 4) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirM): {
				if (_lvl >= 6) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirL): {
				if (_lvl >= 7) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
		};
		if (_lvl >= 1) exitWith {};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;
	};
	case (_arma in _listaCarabinas): {
		switch (true) do {
			case (_visor in _mirC): {
				if (_lvl >= 4) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirM): {
				if (_lvl >= 6) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirL): {
				if (_lvl >= 7) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
		};
		if (_lvl >= 2) exitWith {};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;
	};
	case (_arma in _listaFusiles): {
		switch (true) do {
			case (_visor in _mirC): {
				if (_lvl >= 4) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirM): {
				if (_lvl >= 6) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirL): {
				if (_lvl >= 7) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
		};
		if (_lvl >= 3) exitWith {};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;
	};
	case (_arma in _listaFrancotiradores): {
		switch (true) do {
			case (_visor in _mirC): {
				if (_lvl >= 4) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirM): {
				if (_lvl >= 6) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirL): {
				if (_lvl >= 7) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
		};
		if (_lvl >= 5) exitWith {};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;
	};
};

_arma spawn {
	if (isNil {esperandoCambioDeArma}) then {
		esperandoCambioDeArma = true;
		waitUntil {sleep 1; currentWeapon player != _this};
		puedoDisparar = nil;
		esperandoCambioDeArma = nil;
	};
};

_visor spawn {
	if (isNil {esperandoCambioDevisor}) then {
		esperandoCambioDevisor = true;
		waitUntil {sleep 1; player weaponAccessories currentweapon player select 2 != _this};
		puedoDisparar = nil;
		esperandoCambioDevisor = nil;
	};
};


/*
EHLA = player addEventHandler ["Fired", {
	if (armaAntigua != currentWeapon player) then {
		puedoDisparar = nil;
		if (inputAction "DefaultAction") then {
			false
		};
	};
}];


if (isNil {puedoDisparar}) then {false} else {true};

// playSound3D ['a3\sounds_f\weapons\Other\dry9.wss', _this select 0];

// this addWeapon "SMG_03_khaki";