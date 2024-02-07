/*
        File: fn_insertRequest.sqf
        Author: Bryan "Tonic" Boardwine
        Security edit: McIvan
        
        Description:
        Does something with inserting... Don't have time for
        descriptions... Need to write it...
*/

private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias","_query1"];
if (!isRemoteExecuted) exitWith {};
if (remoteExecutedOwner isEqualTo 0) exitWith {};
private _players = allPlayers select {(owner _x) isEqualTo remoteExecutedOwner};
if (_players isEqualTo []) exitWith {};
private _player = _players select 0;
_uid = getplayeruid _player;
_name = _player getvariable ["realname",name _player];
_money = 0;
_bank = 85000;

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";};
if(isNull _player) exitWith {systemChat "ReturnToSender is Null!";}; 

_query = format["GetPlayerIDName:%1",_uid];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

if(typeName _queryResult == "STRING") exitWith {[] remoteExecCall ["Sock_fnc_dataquery",(owner _player)];}; 
if(count _queryResult != 0) exitWith {[] remoteExecCall ["Sock_fnc_dataquery",(owner _player)];};

_name = [_name] call DB_fnc_mresString;
_alias = [[_name]] call DB_fnc_mresArray;
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Prepare the query statement..
_query = format["InsertEmptyPlayer:%1:%2:%3:%4:%5",
        _uid,
        _name,
        _money,
        _bank,
        _alias
];

waitUntil {!DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

[] remoteexec ["Sock_fnc_dataquery",(owner _returnToSender)];