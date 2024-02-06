#include "..\..\script_macros.hpp"
/*
    File: fn_lockpick.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for lock-picking.
*/
private ["_curObject","_distance","_isVehicle","_title","_progress","_cP","_titleText","_dice","_badDistance"];
_curObject = cursorObject;
life_interrupted = false;

if (life_action_inUse) exitWith {};
if (isNull _curObject) exitWith {}; //Bad type
_distance = ((boundingBox _curObject select 1) select 0) + 2;
if (player distance _curObject > _distance) exitWith {}; //Too far

_isVehicle = if ((_curObject isKindOf "LandVehicle") || (_curObject isKindOf "Ship") || (_curObject isKindOf "Air")) then {true} else {false};
if (_isVehicle && _curObject in life_vehicles) exitWith {[localize "STR_ISTR_Lock_AlreadyHave",true,"slow"] call ANZUS_fnc_notificationSystem;};

//More error checks
if (!_isVehicle && !isPlayer _curObject) exitWith {};
if (!_isVehicle && !(_curObject getVariable ["restrained",false])) exitWith {};
if (_curObject getVariable "NPC") exitWith {[localize "STR_NPC_Protected",true,"slow"] call ANZUS_fnc_notificationSystem;};
private _owners = _curObject getVariable ['vehicle_info_owners', []];
private _owner = [((_owners select 0) select 0)] call AnzusLife_Lib_GetPlayerByUID;
if (!(isNull _owner) && (side _owner) isEqualTo independent ) exitWith {["Did you know that medics are here to help? Stop being a braindead.",true,"slow"] call ANZUS_fnc_notificationSystem;};

life_action_inUse = true; //Lock out other actions

//Setup the progress bar
_title = format [localize "STR_ISTR_Lock_Process",if (!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curObject) >> "displayName")}];
_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\lockpick.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_progress progressSetPosition 0.01;
_cP = 0.01;

_chance = random (30);
if (_chance > 17) then {
	["Oh shit, the car alarm went off!",true,"slow"] call ANZUS_fnc_notificationSystem;
    [_curObject,"CarAlarm"] remoteexeccall ["say3D",-2];
};

for "_i" from 0 to 1 step 0 do {
    if !((animationState player) == "AL_lockpick") then {
        [player,"AL_lockpick",true] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
        player switchMove "AL_lockpick";
        player playMoveNow "AL_lockpick";
    };

    uiSleep 0.26;
    _cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_lockpickMultiplier", 1]));
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

    if (_cP >= 1 || !alive player) exitWith {};
    if (life_istazed) exitWith {}; //Tazed
    if (life_isknocked) exitWith {}; //Knocked
    if (life_interrupted) exitWith {};
    if (player getVariable ["restrained",false]) exitWith {};
    if (player distance _curObject > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if (!([false,"lockpick",1,"lockpick"] call ANZUS_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

if (!_isVehicle) then {
    _curObject setVariable ["restrained",false,true];
    _curObject setVariable ["Escorting",false,true];
} else {
    _dice = random(100);
    if (_dice < 30) then {
        titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
        life_vehicles pushBack _curObject;
        [player,16] spawn AnzusLife_CREATEEVIDENCE;
    } else {
        [0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteExecCall ["ANZUS_fnc_broadcast",west];
        titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
    };
};
