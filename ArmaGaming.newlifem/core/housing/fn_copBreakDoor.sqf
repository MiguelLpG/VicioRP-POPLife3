#include "..\..\script_macros.hpp"
/*
    File: fn_copBreakDoor.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Allows cops to 'kick' in the door?
*/
private ["_house","_door","_title","_titleText","_progress","_cpRate","_cP","_uid"];
_house = param [0,objNull,[objNull]];

if (isNull _house || !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house getVariable "house_owner")}) exitWith {[localize "STR_House_Raid_NoOwner",true,"slow"] call ANZUS_fnc_notificationSystem;};

_uid = (_house getVariable "house_owner") select 0;
if (!([_uid] call ANZUS_fnc_isUIDActive)) exitWith {[localize "STR_House_Raid_OwnerOff",true,"slow"] call ANZUS_fnc_notificationSystem;};

_door = [_house] call ANZUS_fnc_nearestDoor;
if (_door isEqualTo 0) exitWith {[localize "STR_Cop_NotaDoor",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((_house getVariable [format ["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {[localize "STR_House_Raid_DoorUnlocked",true,"slow"] call ANZUS_fnc_notificationSystem;};

life_action_inUse = true;

//Setup the progress bar
_title = "Raiding House";
_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\openDoor.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_progress progressSetPosition 0.01;
_cP = 0.01;
_cpRate = _cP;
[format[localize "STR_House_Raid_NOTF",(_house getVariable "house_owner") select 1],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",RCLIENT];


for "_i" from 0 to 1 step 0 do {
    if !((animationState player) == "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    uiSleep 0.26;

    _cP = _cP + _cpRate;
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
    if (_cP >= 1 || !alive player) exitWith {};
    if (life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (!alive player) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
_house animateSource [format ["Door_%1_source", _door], 1];
_house setVariable [format ["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
