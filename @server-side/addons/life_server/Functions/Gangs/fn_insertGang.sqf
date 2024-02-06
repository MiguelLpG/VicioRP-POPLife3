#include "\life_server\script_macros.hpp"

private ["_query","_queryResult","_gangMembers","_group"];
params [
    ["_ownerID",objNull,[objNull]],
    ["_uid","",[""]],
    ["_gangName","",[""]]
];
_group = group _ownerID;
_player = [_uid] call AnzusLife_Lib_GetPlayerByUID;
if (isNull _player) exitWith {};

if (isNull _ownerID || _uid isEqualTo "" || _gangName isEqualTo "") exitWith {};

_ownerID = owner _ownerID;
_gangName = [_gangName] call ANZUS_fnc_mresString;
_query = format ["SELECT id FROM gangs WHERE name='%1' AND active='1'",_gangName];
_queryResult = [_query,2] call ANZUS_fnc_asyncCall;

if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"There is already a gang created with that name please pick another name."] remoteExecCall ["ANZUS_fnc_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

_query = format ["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND active='1'",_uid,"%"];
_queryResult = [_query,2] call ANZUS_fnc_asyncCall;

if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"You are currently already active in a gang, please leave the gang first."] remoteExecCall ["ANZUS_fnc_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

private _ranks = getArray (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Rank_Array");
private _maxRank = count(_ranks)-1;

_query = format ["SELECT id, active FROM gangs WHERE name='%1' AND active='0'",_gangName];
_queryResult = [_query,2] call ANZUS_fnc_asyncCall;
_name = [name _player] call ANZUS_fnc_mresString;

_gangMembers = [[[_name,_uid,_maxRank]]] call ANZUS_fnc_mresArray;
_defaultGangRole = [0,[0,0,0,0,0,0]];
_newGangName = _gangName;

if (!(count _queryResult isEqualTo 0)) then {
    _query = format ["UPDATE gangs SET active='1', owner='%1',members='%2' WHERE id='%3'",_uid,_gangMembers,(_queryResult select 0)];
} else {
    _query = format ["INSERT INTO gangs (owner, name, members, tasks) VALUES('%1','%2','%3','%4')",_uid,_gangName,_gangMembers,_defaultGangRole];
};
_queryResult = [_query,1] call ANZUS_fnc_asyncCall;

_group setVariable ["gang_name",_newGangName,true];
_group setVariable ["gang_owner",_uid,true];
_group setVariable ["gang_bank",0,true];
_group setVariable ["gang_maxMembers",50,true];
_group setVariable ["gang_members",[[name _player,_uid,_maxRank]],true];
_group setVariable ["gang_role",_defaultGangRole,true];
[_group] remoteExecCall ["ANZUS_fnc_GangCreated",_ownerID];

uiSleep 0.35;
_query = format ["SELECT id FROM gangs WHERE owner='%1' AND active='1'",_uid];
_queryResult = [_query,2] call ANZUS_fnc_asyncCall;

_group setVariable ["gang_id",(_queryResult select 0),true];
