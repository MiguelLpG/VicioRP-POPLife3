#include "\life_server\script_macros.hpp"

private ["_queryResult","_query","_alias"];
params [
    "_uid",
    "_name",
    ["_money",-1,[0]],
    ["_bank",-1,[0]],
    ["_returnToSender",objNull,[objNull]]
];

	
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {["Bad UID or name",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (isNull _returnToSender) exitWith {["ReturnToSender is Null!",true,"slow"] call ANZUS_fnc_notificationSystem;};

_query = format ["SELECT pid, name FROM players WHERE pid='%1'",_uid];


_tickTime = diag_tickTime;
_queryResult = [_query,2] call ANZUS_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Insert Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

	
if (_queryResult isEqualType "") exitWith {[] remoteExecCall ["ANZUS_fnc_dataQuery",(owner _returnToSender)];};
if !(count _queryResult isEqualTo 0) exitWith {[] remoteExecCall ["ANZUS_fnc_dataQuery",(owner _returnToSender)];};

	
_name = [_name] call ANZUS_fnc_mresString;
_alias = [[_name]] call ANZUS_fnc_mresArray;
_money = [_money] call ANZUS_fnc_numberSafe;
_bank = [_bank] call ANZUS_fnc_numberSafe;

	
_query = format ["INSERT INTO players (pid, name, cash, bankacc, aliases, cop_licenses, med_licenses, civ_licenses, civ_gear, cop_gear, med_gear) VALUES('%1', '%2', '%3', '%4', '%5','""[]""','""[]""','""[]""','""[[],[]]""','""[[],[]]""','""[[],[]]""')",
    _uid,
    _name,
    _money,
    _bank,
    _alias
];

[_query,1] call ANZUS_fnc_asyncCall;
[] remoteExecCall ["ANZUS_fnc_dataQuery",(owner _returnToSender)];