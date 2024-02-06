#include "..\..\script_macros.hpp"
/*
    File: fn_revived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    THANK YOU JESUS I WAS SAVED!
*/
private ["_medic","_dir","_reviveCost","_obj"];
_medic = param [0,"Unknown Medic",[""]];
_reviveCost = LIFE_SETTINGS(getNumber,"revive_fee");
player setVariable ["life_is_alive", true, true];
[life_save_gear] spawn life_fnc_loadDeadGear;

_obj = life_corpse;
if(isNull life_corpse) then {
	_obj = _medic;
};

_dir = getDir _obj;
[format[localize "STR_Medic_RevivePay",_medic,[_reviveCost] call life_fnc_numberText],true,"slow"] call life_fnc_notificationSystem;

1 cutFadeOut 1;
["AnzusLife_Bleedout_efHandle", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
AnzusLife_BleedoutStart = nil;
AnzusLife_BleedoutDuration = nil;
AnzusLife_Bleedout_efHandle = nil;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if (BANK > _reviveCost) then 
{
	[_reviveCost, true] call AnzusLife_AC_Bank;
} else {
    BANK = 0;
};

EM_climbing = false;
EM_enable = [true, true];
EM_heightsOn = [0.25,1,2,2.25,3];
//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL _obj);
_obj setVariable ["Revive",nil,true];
deleteVehicle _obj;

life_action_inUse = false;
player setVariable ["Revive",nil,true];
player setVariable ["Reviving",nil,true];
player setVariable ["tf_unable_to_use_radio", false];
player setVariable ["AnzusLife_Stabilized",0,true];

[] call life_fnc_hudUpdate;
[] call life_fnc_updateRequest;

player setDamage 0.5;

if (playerSide isEqualTo west) then
{
    player setVariable ["clockon",life_time,true];
	player setVariable ["copLevel",1,true];
};

[] spawn {
	sleep 5;
	[] call life_fnc_updateRequest;
};
