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
if (!(player getVariable ["AnzusLife_CrowbarUsed",false])) exitWith {["You did not rob this house",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!([false,"lockpick",1,"lockpick"] call ANZUS_fnc_handleInv)) exitWith {life_action_inUse = false;["You do not have a lockpick set",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!(typeOf _curObject isEqualTo "Land_WoodenCrate_01_F")) exitWith {["Not a crate that is robbable.",true,"slow"] call ANZUS_fnc_notificationSystem};
if (_curObject getVariable ["AnzusLife_HouseRobberyCrate",false] isEqualTo false) exitWith {["Not a crate that is robbable.",true,"slow"] call ANZUS_fnc_notificationSystem};
if (_curObject getVariable ["AnzusLife_HouseRobberyCrateRobbed",false] isEqualTo true) exitWith {["Chest has already been lockpicked",true,"slow"] call ANZUS_fnc_notificationSystem};

life_action_inUse = true;

//Setup the progress bar
_title = "Lockpicking Chest";
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

for "_i" from 0 to 1 step 0 do {
    player playAction "AL_lockpick";
    if !((animationState player) == "AL_lockpick") then {
        [player,"AL_lockpick",true] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
        player switchMove "AL_lockpick";
        player playMoveNow "AL_lockpick";
    };

    uiSleep 0.80;
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
if (_dice < 70) then {
    if (ITEM_VALUE("gloves") isEqualTo 0) then {[player,12] spawn AnzusLife_CREATEEVIDENCE;};
    _curObject setVariable ["AnzusLife_HouseRobberyCrateRobbed",true,true];
    ["You have succsesfully lockpicked the chest, loot it by pressing T!",false,"slow"] call ANZUS_fnc_notificationSystem;
	private _ammountOfItems = round(random [4,7,11]);

	private _itemsToAdd = [[],0];
	_itemsArray = M_CONFIG(getArray,"VirtualShops","burglary","items");
	_inv = _itemsToAdd select 0;
    _weight = _itemsToAdd select 1;

	for "_i" from 0 to _ammountOfItems do {
		_item = selectRandom (_itemsArray);

		_index = [_item,_inv] call TON_fnc_index;
	    if (_index isEqualTo -1) then {
	        _inv pushBack [_item,1];
	    } else {
	        _val = _inv select _index select 1;
	        _inv set [_index,[_item,_val + 1]];
	    };
        _weight = _weight + ([_item] call ANZUS_fnc_itemWeight);
	};

	_curObject setVariable ["Trunk",[_inv,_weight],true];
} else {
    ["You have failed to lockpick the chest!",false,"slow"] call ANZUS_fnc_notificationSystem;
};

