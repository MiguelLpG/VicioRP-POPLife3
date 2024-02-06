    #include "..\..\script_macros.hpp"
/*
    File: fn_jerryCanRefuel.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Jesse "tkcjesse" Schultz

    Description:
    Refuels the empty fuel canister at a gas pump. Based off the jerryRefuel/lockpick scripts by Tonic.
*/
private ["_startPos","_badDistance","_title","_ui","_progress","_pgText","_cP","_action","_fuelCost"];
life_interrupted = false;
if (ITEM_VALUE("fuelEmpty") isEqualTo 0) exitWith {};
if (count(nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"],3.5]) isEqualTo 0) exitWith {[localize "STR_ISTR_Jerry_Distance",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (life_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {[localize "STR_NOTF_isrestrained",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (player getVariable "playerSurrender") exitWith {[localize "STR_NOTF_surrender",true,"slow"] call ANZUS_fnc_notificationSystem;};

private _fuelSettings = MAIN_SETTINGS("Shops","Fuel");
private _fuelCost = getNumber(_fuelSettings >> "fuelCan_refuel");

life_action_inUse = true;
private _action = [localize "STR_ISTR_Jerry_StationPump", format[localize "STR_ISTR_Jerry_PopUp",[_fuelCost] call ANZUS_fnc_numberText], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

if (_action) then {
    if (CASH < _fuelCost) exitWith {[localize "STR_NOTF_NotEnoughMoney",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
    _startPos = getPos player;
    
    //Setup the progress bar
    _title = "Refueling Can";
    _icon = "\ArmaGamingCore\images\displays\displayPause\game-settings.paa";

    disableSerialization;
    "progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
    _ui = uiNamespace getVariable "AnzusLife_Progress";
    _controlsGroup = _ui displayCtrl 1;
    _progress = _controlsGroup controlsGroupCtrl 3;
    _pgText = _controlsGroup controlsGroupCtrl 2;
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
    _progress progressSetPosition 0.01;
    _cP = 0.01;

    for "_i" from 0 to 1 step 0 do {
        if !((animationState player) == "AinvPknlMstpSnonWnonDnon_medic_1") then {
            [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
            player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
            player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
        };
        uiSleep 0.2;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _precentage = str round(_cP * 100) + "%";
        _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
        
        if (_cP >= 1) exitWith {};
        if (player getVariable ["inHostage",false]) exitWith {};
        if (!alive player) exitWith {life_action_inUse = false;};
        if (life_interrupted) exitWith {life_interrupted = false; life_action_inUse = false;};
    };

    //Kill the UI display and check for various states
    "progressBar" cutText ["","PLAIN"];
    player playActionNow "stop";

    if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
    if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
    if (!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
    if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
    if (!([false,"fuelEmpty",1,"misc"] call ANZUS_fnc_handleInv)) exitWith {life_action_inUse = false;};
    if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};

    life_action_inUse = false;

    [_fuelCost,true] call AnzusLife_AC_Cash;

    [true,"fuelFull",1,"misc"] call ANZUS_fnc_handleInv;
    [localize "STR_ISTR_Jerry_Refueled",true,"slow"] call ANZUS_fnc_notificationSystem;
} else {
    [localize "STR_NOTF_ActionCancel",true,"slow"] call ANZUS_fnc_notificationSystem;
    closeDialog 0;
    life_action_inUse = false;
};