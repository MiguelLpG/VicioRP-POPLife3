
/*
por Medel
*/

#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

adminprivi = ["DEVELOPERID"];

 
if ( !(getplayerUID player in adminprivi) AND (deServicio == 0)) exitWith { hint "No estás de servicio"};

_listaRobos = [];
missionNamespace setVariable ["ActualRobos",0,true];
missionNamespace setVariable ["ListaRobos",[_listaRobos],true];
missionNamespace setVariable ["RobosEnCurso", 0, true];
missionNamespace setVariable ["nopolicia", false, true];

missionNamespace setVariable ["robosPequenos",0,true];
missionNamespace setVariable ["robosMedianos",0,true];
missionNamespace setVariable ["robosGrandes",0,true];
[{robosactivos=0;}] remoteExec ["call"];
publicVariable "robosactivos";

hint "Has reiniciado todos los robos en curso";
