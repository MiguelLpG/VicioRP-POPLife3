#include "..\..\script_macros.hpp"

private ["_maxGather","_resource","_amount","_maxGather","_requiredItem"];

while{true} do {
    if !(isNull (objectParent player)) exitWith {};
    if(life_interrupted) exitWith {life_interrupted = false;};
    if (life_action_inUse) exitWith {};
    if !(isNull objectParent player) exitWith {};

    if (player getVariable "restrained") exitWith {[localize "STR_NOTF_isrestrained",true,"slow"] call ANZUS_fnc_notificationSystem; };
    if (player getVariable "playerSurrender") exitWith {[localize "STR_NOTF_surrender",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if (dialog) exitWith {[localize "STR_NOTF_glitchYMenu",true,"slow"] call ANZUS_fnc_notificationSystem;};

    life_action_inUse = true;
    _zone = "";
    _requiredItem = "";
    _requiredskill = "";
    _exit = false;

    _resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";
    for "_i" from 0 to count(_resourceCfg)-1 do {

        _curConfig = _resourceCfg select _i;
        _resource = configName _curConfig;
        _maxGather = getNumber(_curConfig >> "amount");
        _zoneSize = getNumber(_curConfig >> "zoneSize");
        _resourceZones = getArray(_curConfig >> "zones");
        _requiredItem = getText(_curConfig >> "item");
        _requiredSkill = getText(_curConfig >> "skill");
        _requiredSkill2 = getText(_curConfig >> "skill2");
        {
            if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
        } forEach _resourceZones;

        if (_zone != "") exitWith {};
    };

    if (_zone isEqualTo "") exitWith {life_action_inUse = false;};

    if (_requiredItem != "") then {
        _item = ITEM_VARNAME(_requiredItem);
        _valItem = missionNamespace getVariable [_item,0];
        systemChat str (_valItem);

        if (_valItem < 1) exitWith {
            switch (_requiredItem) do {titleText[(localize "STR_NOTF_pdrill"), "PLAIN"];};
            life_action_inUse = false;
            _exit = true;
        };
    };

    if (_exit) exitWith {life_action_inUse = false;};

    _amount = round(random(_maxGather)) + 1;
    _diff = [_resource,_amount,life_carryWeight,life_maxWeight] call ANZUS_fnc_calWeightDiff;
    if (_diff isEqualTo 0) exitWith {
        [localize "STR_NOTF_InvFull",true,"slow"] call ANZUS_fnc_notificationSystem;


        life_action_inUse = false;
    };

    if ((_zone isEqualTo "uranium_1") && ((missionNamespace getVariable ["mav_ttm_var_uranium",0])== 0)) exitwith {
        ["You cannot mine uranium without the proper training (Uranium Gathering)",true,"slow"] call ANZUS_fnc_notificationSystem;
        _exit = true;
        life_action_inUse = false;
    };

    if ((_zone isEqualTo "lsd_1") && ((missionNamespace getVariable ["mav_ttm_var_lsd",0]) == 0)) exitwith {
        ["You cannot mine lsd without the proper training (LSD Gathering)",true,"slow"] call ANZUS_fnc_notificationSystem;
        _exit = true;
        life_action_inUse = false;
    };

    switch (_requiredItem) do {
        case "anzus_pickaxe": {playSound "mining"};
        case "pdrill": {playSound "pdrill"};
        default {playSound "harvest"};
    };


    for "_i" from 0 to 4 do {
        player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
        waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
        sleep 0.5;
    };

    if ([true,_resource,_diff,"gather"] call ANZUS_fnc_handleInv) then {
        _itemName = M_CONFIG(getText,"VirtualItems",_resource,"displayName");
        titleText[format [localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
    };

    sleep 1;
    life_action_inUse = false;
};
life_action_inUse = false;
