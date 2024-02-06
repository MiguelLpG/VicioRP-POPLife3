#include "\life_server\script_macros.hpp"

private _newplayer = call AnzusLife_Lib_GetREPlayer;
if (isNull _newplayer) exitWith {};

private _group = group _newplayer;
if (isNull _group) exitWith {};

private _groupOwner = _group getVariable ["gang_owner",""];
if (_groupOwner != getPlayerUID _newplayer) exitWith {};

private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

[format ["UPDATE gangs SET active='0' WHERE id='%1'",_groupID],1] call ANZUS_fnc_asyncCall;
["CALL deleteOldGangs",1] call ANZUS_fnc_asyncCall;

[_group] remoteExec ["ANZUS_fnc_gangDisbanded",(units _group)];
uiSleep 5;
deleteGroup _group;