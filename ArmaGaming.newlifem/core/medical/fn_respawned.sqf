#include "..\..\script_macros.hpp"
/*
    File: fn_respawned.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sets the player up if he/she used the respawn option.
*/
private ["_handle"];
//Reset our weight and other stuff
1 cutFadeOut 1;
["AnzusLife_Bleedout_efHandle", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
AnzusLife_BleedoutStart = nil;
AnzusLife_BleedoutDuration = nil;
AnzusLife_Bleedout_efHandle = nil;

life_action_inUse = false;
life_use_atm = true;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
[CASH,true] call AnzusLife_AC_Cash;
life_respawned = false;
player playMove "AmovPercMstpSnonWnonDnon";

life_corpse setVariable ["Revive",nil,true];
life_corpse setVariable ["Reviving",nil,true];
if (life_corpse getVariable "AnzusLife_Stabilized" > 0) then {
    life_corpse setVariable ["AnzusLife_Stabilized",0,true];
};

player setVariable ["Revive",nil,true];
player setVariable ["Reviving",nil,true];
player setVariable ["life_is_alive", true, true];
player setVariable ["tf_unable_to_use_radio", false];

if (player getVariable ["AnzusLife_UsedCyanide",false]) then {
    player setVariable ["AnzusLife_UsedCyanide",false,true];
};

if (player getVariable ["AnzusLife_Stabilized",0] > 0) then {
    player setVariable ["AnzusLife_Stabilized",0,true];
};

EM_climbing = false;
[player] call ANZUS_fnc_removeItems;

//Load gear for a 'new life'
switch (playerSide) do
{
    case west: {
        _handle = [] spawn ANZUS_fnc_copLoadout;
    };
    case civilian: {
        _handle = [] spawn ANZUS_fnc_civLoadout;
    };
    case independent: {
        _handle = [] spawn ANZUS_fnc_medicLoadout;
    };
    waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if (!isNull life_corpse) then {
    private "_containers";
    life_corpse setVariable ["Revive",true,true];
    _containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
    {deleteVehicle _x;} forEach _containers; //Delete the containers.
    deleteVehicle life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if (life_is_arrested) exitWith {
    [localize "STR_Jail_Suicide",true,"slow"] call ANZUS_fnc_notificationSystem;
    life_is_arrested = false;
    [player,true,15,player] spawn ANZUS_fnc_jail;
    [] call ANZUS_fnc_updateRequest;
};

[0,true] remoteExec ["ANZUS_fnc_delWarrantsServ",2];
[] call ANZUS_fnc_updateRequest;
[] call ANZUS_fnc_hudUpdate; //Request update of hud.
