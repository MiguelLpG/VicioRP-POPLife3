
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

private ["_param", "_tio"];

_tio = param [0];

if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; 
    hint parsetext
    "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
    <br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

adminprivi = ["DEVELOPERID"];

 
if ( !(getplayerUID player in adminprivi) AND (deServicio == 0)) exitWith { hint "No estás de servicio"};

if ((isNull _tio) OR (isNil {_tio})) exitWith {};
player setPosATL (getPosATL _tio);

_nombre = name _tio; // definimos variables
hint format ["Te has teletransportado a la posición de %1", _nombre];

["Admin Log",format ["%1 - (%2) se ha teletransportado a %3",profileName,(getPlayerUID player),_nombre]] remoteexeccall ["ica_fnc_customlog",2];
