#include "..\..\script_macros.hpp"
/*
    File: fn_revivePlayer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the revive process on the player.
*/
private ["_target","_revivable","_targetName","_ui","_progress","_titleText","_cP","_title","_reviveCost"];
_target = param [0,objNull,[objNull]];
if (isNull _target) exitWith {};
_reviveCost = LIFE_SETTINGS(getNumber,"revive_fee");

_revivable = _target getVariable ["Revive",false];
if (_revivable) exitWith {};
if (_target getVariable ["Reviving",objNull] == player) exitWith {[localize "STR_Medic_AlreadyReviving",true,"slow"] call life_fnc_notificationSystem;};
if (player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
_player = _target getVariable ["CorpsePlayer",objNull];
private _targetName = name _player;
if (isNull _player) then {_targetName = "Unknown Player"};

life_action_inUse = true; //Lockout the controls.

_target setVariable ["Reviving",player,true];

//Setup the progress bar
_title = format [localize "STR_Medic_Progress",_targetName];
_icon = "\ArmaGamingCore\images\displays\displayCommunicationTargets\medical.paa";

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

private _badDistance = false;

for "_i" from 0 to 1 step 0 do {
    if !((animationState player) == "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    uiSleep .15;
    _cP = _cP + .01;
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

    if (_cP >= 1 || !alive player) exitWith {};
    if (life_istazed) exitWith {}; //Tazed
    if (life_isknocked) exitWith {}; //Knocked
    if (life_interrupted) exitWith {};
    if (player getVariable ["restrained",false]) exitWith {};
    if (player distance _target > 4) exitWith {_badDistance = true;};
    if (_target getVariable ["Revive",false]) exitWith {};
    if (_target getVariable ["Reviving",objNull] != player) exitWith {};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (_target getVariable ["Reviving",objNull] != player) exitWith {[localize "STR_Medic_AlreadyReviving",true,"slow"] call life_fnc_notificationSystem; life_action_inUse = false;};
_target setVariable ["Reviving",NIL,true];

if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if (_target getVariable ["Revive",false]) exitWith {[localize "STR_Medic_RevivedRespawned",true,"slow"] call life_fnc_notificationSystem; life_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (_badDistance) exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
_target setVariable ["Revive",true,true];
[profileName] remoteExecCall ["life_fnc_revived",_target];

if (playerSide isEqualTo independent) then {
    titleText[format [localize "STR_Medic_RevivePayReceive",_targetName,[_reviveCost] call life_fnc_numberText],"PLAIN"];
	[_total] call AnzusLife_AC_Bank;
    [1] call life_fnc_updatePartial;
    ["Revive"] spawn mav_ttm_fnc_addExp;
};

sleep .6;
player reveal _target;
