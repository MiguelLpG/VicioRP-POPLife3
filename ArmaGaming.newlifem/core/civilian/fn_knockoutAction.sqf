#include "..\..\script_macros.hpp"
/*
    File: fn_knockoutAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Knocks out the target.
*/
private "_target";
_target = param [0,objNull,[objNull]];

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};

_degrees = getDir player; 
_degreesu = getDir _target;
_totald = _degrees - _degreesu;

if((_totald >= -90 && _totald < 1 || _totald <= 90 && _totald > -1 || _totald >= 270 || _totald <= -270) && ((missionNamespace getVariable [format['life_inv_shank_%1', uiNamespace getVariable ['Life_Rnd', 0]], 0]) > 0 && life_is_arrested)) then {
	life_knockout = true;
	[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
	sleep 0.08;

	["You have shanked the persons legs, hop on them!",false,"slow"] call ANZUS_fnc_notificationSystem;
	[false,"shank",1,"jail"] call ANZUS_fnc_handleInv;
	[player,true] remoteExec ["ANZUS_fnc_knockedOut",_target];
} else {
	if (currentWeapon player == "") exitWith {};
	if ((currentWeapon player) in (assignedItems player)) exitWith {};

	life_knockout = true;
	[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
	sleep 0.08;

	[player] remoteExec ["ANZUS_fnc_knockedOut",_target];
};

sleep 3;
life_knockout = false;
