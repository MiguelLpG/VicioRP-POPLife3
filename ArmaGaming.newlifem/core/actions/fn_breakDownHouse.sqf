#include "..\..\script_macros.hpp"
/*
    Begin breaking down house
    Repentz ft. bully devs who won't do it for me so if its shit its not my fucking fault
*/

private ["_curObject","_distance","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curObject = cursorObject;
life_interrupted = false;

if (life_action_inUse) exitWith {};
if (isNull _curObject) exitWith {}; //Bad type
_distance = ((boundingBox _curObject select 1) select 0) + 2;
if (player distance _curObject > _distance) exitWith {}; //Too far
if (player getVariable ["AnzusLife_CrowbarUsed",false]) exitWith {["The heat is too hot right now, please wait 10 minutes from your last robbery to rob another house",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (ITEM_VALUE("crowbar") isEqualTo 0) exitWith {life_action_inUse = false; ["You do not have a crowbar",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!(_curObject isKindOf "House_F")) exitWith {["Not a house",true,"slow"] call ANZUS_fnc_notificationSystem};
if (typeOf cursorObject isEqualTo "Land_pop_mansion_deluxe") exitWith {["This house's config is broke, we will be fixing this soon.",true,"slow"] call ANZUS_fnc_notificationSystem};
if (west countSide playableUnits < 7) exitWith {["There must be 7 cops online for me to be able to break into houses.",true,"slow"] call ANZUS_fnc_notificationSystem};

_door = [_curObject] call ANZUS_fnc_nearestDoor;
if (_door isEqualTo 0) exitWith {[localize "STR_House_Door_NotNear",true,"slow"] call ANZUS_fnc_notificationSystem;};

_locked = _curObject getVariable [format ["bis_disabled_Door_%1",_door],0];

if (_locked isEqualTo 0) exitWith {
    _curObject setVariable [format ["bis_disabled_Door_%1",_door],1,true];
    _curObject animateSource [format ["Door_%1_source", _door], 0];
    [localize "STR_House_Door_unlockedAlready",true,"slow"] call ANZUS_fnc_notificationSystem;
};

life_action_inUse = true; //Lock out other actions

//Setup the progress bar
_title = "Breaking Into House";
_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\lockpick.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progressBar = _controlsGroup controlsGroupCtrl 3;
_titleText = _controlsGroup controlsGroupCtrl 2;
_titleText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, str("1" + "%"), (100 * (pixelH * pixelGrid * 0.50))];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_badDistance = false;

if (isNil "AnzusLife_BurglarySpeed") then {
    AnzusLife_BurglarySpeed = 1;
};

for "_i" from 0 to 1 step 0 do {
    //player playAction "AL_lockpick";
    if !((animationState player) == "AL_lockpick") then {
        [player,"AL_lockpick",true] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
        player switchMove "AL_lockpick";
        player playMoveNow "AL_lockpick";
    };

    uiSleep (0.26 * AnzusLife_BurglarySpeed);

    if (isNull _ui) then {
        "progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
        _ui = uiNamespace getVariable "AnzusLife_Progress";
        _controlsGroup = _ui displayCtrl 1;
        _progressBar = _controlsGroup controlsGroupCtrl 3;
        _titleText = _controlsGroup controlsGroupCtrl 2;
    };
    _cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_lockpickMultiplier", 1]));
    _progressBar progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _titleText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
    if (_cP >= 1 || !alive player) exitWith {};
    if (life_istazed) exitWith {}; //Tazed
    if (life_isknocked) exitWith {}; //Knocked
    if (life_interrupted) exitWith {};
    if (player getVariable ["restrained",false]) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
    if (player distance _curObject > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (_badDistance) exitWith {[localize "STR_ISTR_Lock_TooFar",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};

life_action_inUse = false;

_dice = random(100);
if (_dice < 60) then {
    if (ITEM_VALUE("gloves") isEqualTo 0 && _curObject getVariable ["AnzusLife_HouseRobbed",false] isEqualTo false) then {[player,12] spawn AnzusLife_CREATEEVIDENCE;};
    if (_curObject getVariable ["AnzusLife_HouseRobbed",false] isEqualTo false) then {
        _curObject setVariable ["AnzusLife_HouseRobbed",true,true];
        [_curObject] call ANZUS_fnc_houseCrateInit;    
    };
    [localize "STR_ISTR_Crowbar_Success",false,"slow"] call ANZUS_fnc_notificationSystem;
    ["burglary"] spawn mav_ttm_fnc_addExp;
    player setVariable ["AnzusLife_CrowbarUsed",true];

    _chance = random (100);
    _maxChance = missionNamespace getVariable ["AnzusLife_AlarmChance", 60];
    if (_chance < _maxChance) then {
        ["Oh shit, the house alarm went off!",true,"slow"] call ANZUS_fnc_notificationSystem;
        [_curObject,"burglaryAlarm",30,1] remoteExecCall ["say3D",-2];
        [localize "STR_ISTR_Crowbar_alarmNOTF",false,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem",west];
        
        _rndmrk = random(1000);
        _mrkstring = format ["houseRobMarker_%1", _rndmrk];
        [_mrkstring,[0,0,0],"HouseRob"] remoteExec ["AnzusLife_Lib_CreateMarker", 2];
    };

    [] spawn {
        sleep 600;
        player setVariable ["AnzusLife_CrowbarUsed",false];
    };

    if (!isNil {(group player) getVariable ["gang_name",""]}) then {
        _oldamm = (group player) getVariable ["AnzusLife_HousesRobbed",0];
        _ammedit = _oldamm + 1;
        (group player) setVariable ["AnzusLife_HousesRobbed",_ammedit,true];

        if ((group player) getVariable ["AnzusLife_HousesRobbed",0] >= 19) then {
            _gangrole = (group player) getVariable ["gang_role",[]];
            if (_gangrole isEqualTo []) exitWith {};
                
            _gangselect = _gangrole select 0;
            if (_gangselect != 0) then {
                _task = "Breaking and Entering";
                _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
                if (!_check) then {
                    [_task] remoteExec ["AnzusLife_UnlockTask",2];
                    (group player) setVariable ["AnzusLife_HousesRobbed",nil,true];
                };
            };
        };
    };
} else {
    [localize "STR_ISTR_Crowbar_Failed",true,"slow"] call ANZUS_fnc_notificationSystem;
};

