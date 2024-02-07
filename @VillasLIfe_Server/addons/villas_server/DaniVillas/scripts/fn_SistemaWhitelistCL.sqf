// By FuRixX Lamborghini \\

/*

	["Init"] spawn FuRixX_fnc_SistemaWhitelistCL;
	------------------------------------------------
	["Policia"] spawn FuRixX_fnc_SistemaWhitelistCL;
	["EMS"] spawn FuRixX_fnc_SistemaWhitelistCL;
	["Mafia"] spawn FuRixX_fnc_SistemaWhitelistCL;
	["Terro"] spawn FuRixX_fnc_SistemaWhitelistCL;
	["Donador"] spawn FuRixX_fnc_SistemaWhitelistCL;
	["Admin"] spawn FuRixX_fnc_SistemaWhitelistCL;

*/

_modo = _this select 0;

if (_modo == "Init") exitWith {

	FuRixX_WhitelistUsuariosBD = [];
	FuRixX_BD_Obtenido = false;

	"FuRixX_WhitelistObtenerUsuariosCliente" addPublicVariableEventHandler {

		FuRixX_WhitelistUsuariosBD = (_this select 1) call BIS_fnc_sortAlphabetically;
		FuRixX_BD_Obtenido = true;
	};

};

_modo2 = _this select 1;
_disponible = "";
_index = 0;
_rangos = [
	["coplevel", 7],
	["mediclevel", 5],
	["mafialvl", 3],
	["terrolvl", 3],
	["donatorlvl", 5],
	["adminlevel", 4]
];

if (isNil "_modo") exitWith {hint "ERROR: Parámetro de entrada no fijado"};
if (isNil "_modo2") then {_modo2 = ""};

switch (_modo) do {
	case "Policia": {_disponible = "coplevel"; _index = 2};
	case "EMS": {_disponible = "mediclevel"; _index = 3};
	case "Mafia": {_disponible = "mafialvl"; _index = 4};
	case "Terro": {_disponible = "terrolvl"; _index = 5};
	case "Donador": {_disponible = "donatorlvl"; _index = 6};
	case "Admin": {_disponible = "adminlevel"; _index = 7};
};

if (_disponible == "") exitWith {hint "ERROR: Parametro de entrada no reconocido"};

if (_modo2 == "Actualizar") exitWith {

	_dialogo = findDisplay 3100;
	_lista = _dialogo displayCtrl 3101;
	lbClear _lista;

	FuRixX_BD_Obtenido = false;
	FuRixX_WhitelistObtenerUsuariosServidor = clientOwner;
	publicVariableServer "FuRixX_WhitelistObtenerUsuariosServidor";
	waitUntil {FuRixX_BD_Obtenido};

	FuRixX_Whitelist_Usuarios = []; 
	{

		_final = format ["%1 - %2", _x select 0, _x select _index];
		_lista lbAdd _final;
		FuRixX_Whitelist_Usuarios pushBack _x; 

	} forEach FuRixX_WhitelistUsuariosBD;
};

if (_modo2 == "Aplicar") exitWith {

	_dialogo = findDisplay 3100;
	_lista = _dialogo displayCtrl 3101;
	_lista2 = _dialogo displayCtrl 3105;

	_seleccionadoJugador = lbCurSel _lista;
	_seleccionadoRango = lbCurSel _lista2;

	if (_seleccionadoJugador == -1 or _seleccionadoRango == -1) exitWith {hint "Debes seleccionar el puesto y el jugador primero."};

	_seleccionJugador = FuRixX_Whitelist_Usuarios select _seleccionadoJugador;

	_uidjugador = _seleccionJugador select 1;
	_nombrejugador = _seleccionJugador select 0;

	_uidadmin = getPlayerUID player;
	_nombreadmin = name player;


	FuRixX_Whitelist = [_uidjugador, _disponible, _seleccionadoRango];
	publicVariableServer "FuRixX_Whitelist";

	hint format ['Has aplicado el rango %1 de %2 a la UID "%3"', _seleccionadoRango, _disponible, _uidjugador];
	[_modo, "Actualizar"] spawn FuRixX_fnc_SistemaWhitelistCL;

	FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** El usuario %1 `(%2)` ha agregado a %3 `(%4)` a la whitelist de **%5** con rango `%6`", name player, getPlayerUID player, _nombrejugador, _uidjugador, _disponible, _seleccionadoRango];
	publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_BD_Obtenido = false;
FuRixX_WhitelistObtenerUsuariosServidor = clientOwner;
publicVariableServer "FuRixX_WhitelistObtenerUsuariosServidor";
waitUntil {FuRixX_BD_Obtenido};

createDialog "FuRixX_Whitelist";
_dialogo = findDisplay 3100;
_titulo = _dialogo displayCtrl 3103;
_lista = _dialogo displayCtrl 3101;
_lista2 = _dialogo displayCtrl 3105;
_boton = _dialogo displayCtrl 3106;

_titulo ctrlSetText format ["Whitelist by FuRixX - %1", _modo];

FuRixX_Whitelist_Usuarios = []; 
{

	_final = format ["%1 - %2", _x select 0, _x select _index];
	_lista lbAdd _final;
	FuRixX_Whitelist_Usuarios pushBack _x; 

} forEach FuRixX_WhitelistUsuariosBD;

_lista lbSetCurSel 0;
_niveles = 0;

{

	if (_x select 0 == _disponible) then {
		_niveles = _x select 1;
		break;
	};

} forEach _rangos;

for "_i" from 0 to _niveles do {
	_lista2 lbAdd (str _i);
};

_lista2 lbSetCurSel 0;

_boton buttonSetAction format ["['%1', 'Aplicar'] spawn FuRixX_fnc_SistemaWhitelistCL", _modo];



// By FuRixX Lamborghini \\