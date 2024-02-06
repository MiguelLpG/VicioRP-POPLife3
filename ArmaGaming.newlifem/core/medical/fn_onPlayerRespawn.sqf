#include "..\..\script_macros.hpp"
/*
    File: fn_onPlayerRespawn.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Does something but I won't know till I write it...
*/
private ["_unit","_corpse","_containers"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;
life_corpse setVariable ["CorpsePlayer",_unit,true];

{_corpse removeMagazine _x;} forEach magazines _corpse;

//Set some vars on our new body.
_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["tf_unable_to_use_radio", false];
_unit setVariable ["AnzusLife_Stabilized",0,true];

player playMoveNow "AmovPpneMstpSrasWrflDnon";
[] call ANZUS_fnc_requestMedic;
if (mav_ttm_var_stamina > 0) then {player enableFatigue false;};
