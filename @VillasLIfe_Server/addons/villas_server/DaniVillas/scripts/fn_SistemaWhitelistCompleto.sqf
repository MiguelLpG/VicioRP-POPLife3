// By FuRixX Lamborghini \\

_entrada = _this select 0;

if (isNil "_entrada") then {_entrada = ""};

_Entradas = ["Policia", "EMS"];

_Admin = call life_adminlevel;

if (_Admin <= 0) exitWith {};

_Fundadores = [
	"76561198975543222", // FuRixX
	"76561198424187813", // Villas Gay
	"76561198155575661", // Edy
	"76561198993091673" // Offi
];

if (_Admin >= 2) then {
	_Entradas pushBack "Mafia";
	_Entradas pushBack "Terro"; 
};

if (_Admin >= 4) then {_Entradas pushBack "Donador"};

if (getPlayerUID player in _Fundadores) then {_Entradas pushBack "Admin"};

if (_entrada == "Abrir") exitWith {

	_dialogo = findDisplay 3100;
	_lista = _dialogo displayCtrl 3101;

	_index = lbCurSel _lista;
	if (_index == -1) exitWith {hint "Debes seleccionar algo"};

	_seleccion = _Entradas select _index;
	hint format ["Has abierto el menu de %1", _seleccion];
	closeDialog 0;
	[_seleccion] spawn FuRixX_fnc_SistemaWhitelistCL;


};

createDialog "FuRixX_Whitelist";

_dialogo = findDisplay 3100;
_titulo = _dialogo displayCtrl 3103;
_lista = _dialogo displayCtrl 3101;
_lista2 = _dialogo displayCtrl 3105;
_boton = _dialogo displayCtrl 3106;

_lista2 ctrlShow false;

_titulo ctrlSetText "Sistema de Whitelists"; 

{

	_lista lbAdd (format ["Menu de %1", _x]);


} forEach _Entradas;

_boton buttonSetAction "['Abrir'] spawn FuRixX_fnc_SistemaWhitelistCompleto";

// By FuRixX Lamborghini \\