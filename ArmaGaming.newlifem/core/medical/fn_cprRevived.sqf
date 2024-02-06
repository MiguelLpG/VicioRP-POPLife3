#include "..\..\script_macros.hpp"
params [
	["_playerWhoReved",objNull,[objNull]]
];
private ["_dir"];
player setVariable ["life_is_alive", true, true];
[life_save_gear] spawn ANZUS_fnc_loadDeadGear;
_dir = getDir life_corpse;

1 cutFadeOut 1;
["AnzusLife_Bleedout_efHandle", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
AnzusLife_BleedoutStart = nil;
AnzusLife_BleedoutDuration = nil;
AnzusLife_Bleedout_efHandle = nil;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

player setDir _dir;
player setPosATL (getPosATL _playerWhoReved);
life_corpse setVariable ["Revive",nil,true];
deleteVehicle life_corpse;

life_action_inUse = false;
EM_climbing = false;
EM_enable = [true, true];

player setVariable ["Revive",nil,true];
player setVariable ["Reviving",nil,true];
if (player getVariable "AnzusLife_Stabilized" > 0) then {
	player setVariable ["AnzusLife_Stabilized",0,true];
};

[] call ANZUS_fnc_playerSkins;
[] call ANZUS_fnc_hudUpdate;
[] call ANZUS_fnc_updateRequest;

player setDamage (_playerWhoReved getVariable ["mav_ttm_var_cprFull",0.75]);

[] spawn {
	sleep 5;
	[] call ANZUS_fnc_updateRequest;
};
