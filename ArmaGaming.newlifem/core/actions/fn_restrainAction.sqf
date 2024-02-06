#include "..\..\script_macros.hpp"
/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the target.
*/
private ["_unit"];
_unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "restrained") exitWith {};
if (player getVariable "restrained") exitWith {};
private _bad = (call(life_coplevel) < 5);
if ((side _unit isEqualTo west) && _bad) exitWith {};
if (player isEqualTo _unit) exitWith {};
if (!isPlayer _unit) exitWith {};
if !(playerSide isEqualTo west) exitWith {};

_degrees = getDir player; 
_degreesu = getDir _unit;
_totald = _degrees - _degreesu;

_anims = ['Incapacitated', 'unconscious', 'unconsciousoutprone'];

if(_totald >= -90 && _totald < 1 || _totald <= 90 && _totald > -1 || _totald >= 270 || _totald <= -270 || (animationState _unit) in _anims || _unit getVariable ["playerSurrender",false]) then {
	_unit setVariable ["playerSurrender",false,true];
	_unit setVariable ["restrained",true,true];

	[player] remoteExec ["ANZUS_fnc_restrain",_unit];
	[0,"STR_NOTF_Restrained",true,[name _unit, profileName]] remoteExecCall ["ANZUS_fnc_broadcast",west];
} else {
	["You must be behind your target to restrain them.",false,"slow"] call ANZUS_fnc_notificationSystem;
};
