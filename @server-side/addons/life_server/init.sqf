#include "script_macros.hpp"
private ["_timeStamp","_extDBNotLoaded"];
/*
    File: init.sqf
    Author: Bryan "Tonic" Boardwine
    Edit: Nanou for HeadlessClient optimization.
    Please read support for more informations.
    Description:
    Initialize the server and required systems.
*/

life_serverFunctionsReady = false;
TON_fnc_receiveFunctions =
compileFinal "
	{
		_name = _x select 0;
		_code = _x select 1;
		missionNamespace setVariable [_name,_code];
	}forEach allFunctions;
	life_serverFunctionsReady = true;
";
publicVariable "TON_fnc_receiveFunctions";
[] spawn {
	[""] remoteExec ["TON_fnc_initFunctions",2];
	waitUntil {life_serverFunctionsReady};
};


DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
_extDBNotLoaded = "";
serv_sv_use = [];
publicVariable "life_server_isReady";
life_save_civilian_position = if (MAIN_SETTINGS_TYPE(getNumber,"Saving","save_civilianPosition") isEqualTo 0) then {false} else {true};

//Headless Clients
life_HC_isActive = false;
publicVariable "life_HC_isActive";
HC_Life = false;
publicVariable "HC_Life";

if (isNil {uiNamespace getVariable "AnzusLife_sql_gang"}) then {
    AnzusLife_sql_gang = round(random(9999));
    CONSTVAR(AnzusLife_sql_gang);
    uiNamespace setVariable ["AnzusLife_sql_gang",AnzusLife_sql_gang];

    try {
        _result = EXTDB format ["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(AnzusLife_sql_gang),EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _extDBNotLoaded = [true, _exception];
    };
    if (_extDBNotLoaded isEqualType []) exitWith {};
    EXTDB "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    AnzusLife_sql_gang = uiNamespace getVariable "AnzusLife_sql_gang";
    CONSTVAR(AnzusLife_sql_gang);
    diag_log "extDB3: Still Connected to Database";
};

if (_extDBNotLoaded isEqualType []) exitWith {
    life_server_extDB_notLoaded = true;
    publicVariable "life_server_extDB_notLoaded";
};

life_server_extDB_notLoaded = false;
publicVariable "life_server_extDB_notLoaded";

if (serverName != "Arma-Life.com - Test Server") then {
	["CALL resetLifeVehicles",1] call ANZUS_fnc_asyncCall;
};

["CALL deleteDeadVehicles",1] call ANZUS_fnc_asyncCall;
["CALL deleteOldHouses",1] call ANZUS_fnc_asyncCall;
["CALL deleteOldGangs",1] call ANZUS_fnc_asyncCall;
["CALL deleteUnpaidHouses",1] call ANZUS_fnc_asyncCall;


_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Arma Life Server Init ---------------------------------";
diag_log "------------------------------------------ Version 5.0.0 -------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";


[] spawn {
    _query = "UPDATE players SET civ_alive = '0' WHERE civ_alive = '1'";
    [_query,1] call ANZUS_fnc_asyncCall;
};

[8,true,96] execFSM "\life_server\FSM\timeModule.fsm";

life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
life_copdept = 0;
life_medicdept = 0;

addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile preprocessFileLineNumbers "\life_server\functions.sqf";

cleanupFSM = [] execFSM "\life_server\FSM\cleanup.fsm";

[] call AnzusLife_FetchWarrants;
[] call TON_fnc_initHouses;
cleanup = [] spawn TON_fnc_cleanup;

life_server_isReady = true;
publicVariable "life_server_isReady";

server_corpses = [];
addMissionEventHandler ["EntityRespawned", {_this call TON_fnc_entityRespawned}];

[] call ANZUS_fnc_weaponMission;
missionNamespace setVariable ["AnzusLife_ThreatLevel",0,true];
missionNamespace setVariable ["AnzusLife_GangFreqs",[],true];

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Arma Life Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
