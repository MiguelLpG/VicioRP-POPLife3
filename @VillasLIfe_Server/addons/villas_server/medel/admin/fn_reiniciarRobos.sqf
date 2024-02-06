
/*
por Medel
*/

#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

adminprivi = ["76561199048328002"];

 
if ( !(getplayerUID player in adminprivi) AND (deServicio == 0)) exitWith { hint "No estás de servicio"};

_param = ["Elige un Robo", "", [
	["todos", "Todos"],
	["paco", "Paco"],
	["manolo", "Manolo"],
	["farmacia", "Farmacia"],
	["club7", "Club 7"],
	["putas", "Casa de Putas"],
	["ohz", "Robo Ohz"],
	["casino", "Robo Casino"],
	["alcampo", "Alcampo"],
	["hotelf", "Hotel Fantasma"],
	["Robo_Donador", "Robo Campamento Rebelde"],
	["ropa", "Tienda de Ropa"],
	["militar", "Militar"],
	["lezo", "Blas de Lezo"],
	["banco", "Banco"],
	["sucursal", "Sucursal Bancaria"],
	["nuclear", "Nuclear"]
]] call ica_fnc_eligeDato;

if (_param isEqualTo "") exitWith {};

if (_param isEqualTo "todos") exitWith {
	Paco setVariable ["reciente", false, true];
	Paco setVariable ["robando", false, true];
	[{paco setVariable ["Robo",false,true];}] remoteExec ["call"];
	Manolo setVariable ["reciente", false, true];
	Manolo setVariable ["robando", false, true];
	Farmacia setVariable ["reciente", false, true];
	Farmacia setVariable ["robando", false, true];
	Club7 setVariable ["reciente", false, true];
	Club7 setVariable ["robando", false, true];
	[{Robo_nightclub setVariable ["Robo",false,true];}] remoteExec ["call"];
	Putas setVariable ["reciente", false, true];
	Putas setVariable ["robando", false, true];
	Ropa setVariable ["reciente", false, true];
	Ropa setVariable ["robando", false, true];
	Militar setVariable ["reciente", false, true];
	Militar setVariable ["robando", false, true];
	Lezo setVariable ["reciente", false, true];
	Lezo setVariable ["robando", false, true];
	Banco setVariable ["reciente", false, true];
	Banco setVariable ["robando", false, true];
	[{banco setVariable ["Robo",false,true];}] remoteExec ["call"];
	Sucursal setVariable ["reciente", false, true];
	Sucursal setVariable ["robando", false, true];
	Nuclear setVariable ["reciente", false, true];
	Nuclear setVariable ["robando", false, true];
	alcampo setVariable ["reciente", false, true];
	alcampo setVariable ["robando", false, true];
	[{alcampoaa setVariable ["Robo",false,true];}] remoteExec ["call"];
	ohz setVariable ["reciente", false, true];
	ohz setVariable ["robando", false, true];
	Robo_Donador setVariable ["reciente", false, true];
	Robo_Donador setVariable ["robando", false, true];
	hotelf setVariable ["reciente", false, true];
	hotelf setVariable ["robando", false, true];
	[{hotel setVariable ["Robo",false,true];}] remoteExec ["call"];
	casino setVariable ["reciente", false, true];
	casino setVariable ["robando", false, true];
	[{robosactivos=0;}] remoteExec ["call"];
	publicVariable "robosactivos";
	
	hint "Has reiniciado todos los robos";
};

if (_param isEqualTo "paco") exitWith {
	Paco setVariable ["reciente", false, true];
	Paco setVariable ["robando", false, true];
	[{paco setVariable ["Robo",false,true];}] remoteExec ["call"];
	[{robosactivos=0;}] remoteExec ["call"];
	publicVariable "robosactivos";
	hint "Has reiniciado Paco";
};

if (_param isEqualTo "manolo") exitWith {
	Manolo setVariable ["reciente", false, true];
	Manolo setVariable ["robando", false, true];
	hint "Has reiniciado Manolo";
};

if (_param isEqualTo "farmacia") exitWith {
	Farmacia setVariable ["reciente", false, true];
	Farmacia setVariable ["robando", false, true];
	hint "Has reiniciado Farmacia";
};

if (_param isEqualTo "club7") exitWith {
	Club7 setVariable ["reciente", false, true];
	Club7 setVariable ["robando", false, true];
	[{Robo_nightclub setVariable ["Robo",false,true];}] remoteExec ["call"];
	[{robosactivos=0;}] remoteExec ["call"];
	publicVariable "robosactivos";
		hint "Has reiniciado Club 7";
};

if (_param isEqualTo "putas") exitWith {
	Putas setVariable ["reciente", false, true];
	Putas setVariable ["robando", false, true];
	hint "Has reiniciado robo a Casa de Putas";
};

if (_param isEqualTo "ropa") exitWith {
	Ropa setVariable ["reciente", false, true];
	Ropa setVariable ["robando", false, true];
	hint "Has reiniciado el robo a Ropa";
};

if (_param isEqualTo "militar") exitWith {
	Militar setVariable ["reciente", false, true];
	Militar setVariable ["robando", false, true];
	hint "Has reiniciado Militar";
};

if (_param isEqualTo "lezo") exitWith {
	Lezo setVariable ["reciente", false, true];
	Lezo setVariable ["robando", false, true];
	hint "Has reiniciado Blas de Lezo";
};

if (_param isEqualTo "banco") exitWith {
	Banco setVariable ["reciente", false, true];
	Banco setVariable ["robando", false, true];
	[{banco setVariable ["Robo",false,true];}] remoteExec ["call"];
	[{robosactivos=0;}] remoteExec ["call"];
	publicVariable "robosactivos";
	hint "Has reiniciado Banco";
};

if (_param isEqualTo "sucursal") exitWith {
	Sucursal setVariable ["reciente", false, true];
	Sucursal setVariable ["robando", false, true];
	hint "Has reiniciado Sucursal";
};

if (_param isEqualTo "nuclear") exitWith {
	Nuclear setVariable ["reciente", false, true];
	Nuclear setVariable ["robando", false, true];
	hint "Has reiniciado Nuclear";
};

if (_param isEqualTo "alcampo") exitWith {
	alcampo setVariable ["reciente", false, true];
	alcampo setVariable ["robando", false, true];
	[{alcampoaa setVariable ["Robo",false,true];}] remoteExec ["call"];
	[{robosactivos=0;}] remoteExec ["call"];
	publicVariable "robosactivos";
	hint "Has reiniciado Alcampo";
};

if (_param isEqualTo "ohz") exitWith {
	ohz setVariable ["reciente", false, true];
	ohz setVariable ["robando", false, true];
	hint "Has reiniciado Ohz";
};

if (_param isEqualTo "Robo_Donador") exitWith {
	Robo_Donador setVariable ["reciente", false, true];
	Robo_Donador setVariable ["robando", false, true];
	hint "Has reiniciado Base Rebelde";
};

if (_param isEqualTo "hotelf") exitWith {
	hotelf setVariable ["reciente", false, true];
	hotelf setVariable ["robando", false, true];
	[{hotel setVariable ["Robo",false,true];}] remoteExec ["call"];
	[{robosactivos=0;}] remoteExec ["call"];
	publicVariable "robosactivos";
	hint "Has reiniciado Hotel Fantasma";
};

if (_param isEqualTo "casino") exitWith {
	casino setVariable ["reciente", false, true];
	casino setVariable ["robando", false, true];
	hint "Has reiniciado el Casino";
};


