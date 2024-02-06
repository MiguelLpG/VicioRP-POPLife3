#include "..\..\script_macros.hpp"

private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
params [
    ["_target",objNull,[objNull]]
];
if(isNull _target) exitWith {};

_revivable = _target getVariable ["Revive",false];
if(_revivable) exitWith {};
if(player distance _target > 5) exitWith {};
if(life_action_inUse) exitWith {};
if(_target isEqualTo player) exitWith {};
if (life_combatTime > time) exitWith {["You cannot revive in combat!",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((_target getVariable ["Reviving",objNull]) isEqualTo player) exitWith {[localize "STR_Medic_AlreadyReviving",true,"slow"] call ANZUS_fnc_notificationSystem;};
if !(((_target getVariable ["Reviving",objNull]) isEqualTo objNull)) exitWith {[localize "STR_Medic_AlreadyReviving",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_target getVariable ["AnzusLife_UsedCyanide",false]) exitWith {["This player seems to have no pulse due to him using a cyanide.",true,"slow"] call ANZUS_fnc_notificationSystem};

_target setVariable ["Reviving",player,TRUE];
life_action_inUse = true;

//Setup the progress bar
_title = format [localize "STR_CPR_Progress"];
_icon = "\ArmaGamingCore\images\displays\displayCommunicationTargets\medical.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_progress progressSetPosition 0.01;
_cP = 0.01;
private _badDistance = false;
while {true} do {
	if!((animationState player) == "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep .15;
	_cP = _cP + .01;
	_progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {};
	if(life_isknocked) exitWith {};
	if(life_interrupted) exitWith {};
	if(!(isNull objectParent player)) exitWith {};
	if((player getVariable ["restrained",false])) exitWith {};
	if(player distance _target > 5) exitWith {_badDistance = true;};
	if(_target getVariable ["Revive",false]) exitWith {};
	if(_target getVariable ["Reviving",ObjNull] != player) exitWith {};
};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (_target getVariable ["Reviving",objNull] != player) exitWith {["Somebody is already reviving them",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
_target setVariable ["Reviving",nil,true];

if(!(isNull objectParent player)) exitWith {life_action_inUse = false; ["You can not CPR from a vehicle.",true,"slow"] call ANZUS_fnc_notificationSystem};
if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if(_target getVariable ["Revive",false]) exitWith {[localize "STR_Medic_RevivedRespawned",true,"slow"] call ANZUS_fnc_notificationSystem;life_action_inUse = false;};
if((player getVariable ["restrained",false])) exitWith {life_action_inUse = false;};
if(_badDistance) exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;


_break = floor (random 100);


if (_break > (99 - (missionNamespace getVariable ["mav_ttm_var_cprChance",15]))) then {
	_target setVariable ["Revive",true,true];
	[player] remoteExecCall ["ANZUS_fnc_cprrevived",_target];
	if (((player getVariable ["cprExp",0]) < time)) then {
		["CPR"] spawn mav_ttm_fnc_addExp;
	};
	player setVariable ["cprExp",time+300];
	sleep .6;
	player reveal _target;
} else {
	["You have failed the CPR, try again!",true,"slow"] call ANZUS_fnc_notificationSystem;
	[_target] spawn ANZUS_fnc_cprKit;
};