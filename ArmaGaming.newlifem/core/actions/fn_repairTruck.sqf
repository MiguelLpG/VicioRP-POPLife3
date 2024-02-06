#include "..\..\script_macros.hpp"
/*
    File: fn_repairTruck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for toolkits, to be revised in later version.
*/
private ["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test","_sideRepairArray"];

_veh = cursorObject;
_remove = true; 
life_interrupted = false;
if (isNull _veh) exitWith {};
if ((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air")) then {
    life_action_inUse = true;
    _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");
    _upp = format [localize "STR_NOTF_Repairing",_displayName];

    //Setup the progress bar
    _title = _upp;
    _icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\repair.paa";

    disableSerialization;
    "progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
    _ui = uiNamespace getVariable "AnzusLife_Progress";
    _controlsGroup = _ui displayCtrl 1;
    _progress = _controlsGroup controlsGroupCtrl 3;
    _pgText = _controlsGroup controlsGroupCtrl 2;
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
    _add = 0.01;
    if (!(ITEM_VALUE("toolkit") > 0)) then {_add = 0.001;};
    if (playerSide isEqualTo independent) then {_add = 0.075};
    _progress progressSetPosition _add;
    _cP = _add;

    for "_i" from 0 to 1 step 0 do {
        if (animationState player != "Acts_carFixingWheel") then {
            playSound "repair";
            [player,"Acts_carFixingWheel",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
            player switchMove "Acts_carFixingWheel";
            player playMoveNow "Acts_carFixingWheel";
            player disableAI "anim"; 
        };

        sleep 0.35;
        _cP = _cP + (_add * (missionNamespace getVariable ["mav_ttm_var_repairMultiplier", 1]));
        _progress progressSetPosition _cP;
        _precentage = str round(_cP * 100) + "%";
        _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

        if (_cP >= 1) exitWith {};
        if (player getVariable ["inHostage",false]) exitWith {};
        if (!alive player) exitWith {};
        if !(isNull objectParent player) exitWith {};
        if (life_interrupted) exitWith {};
    };

    life_action_inUse = false;
    "progressBar" cutText ["","PLAIN"];
    player switchMove "stop";
    if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
    if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
    if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];life_action_inUse = false;};
    _veh setDamage 0;

    sleep 1;
    player switchMove "Stand";
    titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
};