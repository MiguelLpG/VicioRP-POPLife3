#include "..\..\script_macros.hpp"
/*
    File: fn_raidHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Raids the players house?
*/
private ["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_houseInv","_houseInvData","_houseInvVal"];
_house = param [0,objNull,[objNull]];

if (isNull _house || !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house getVariable "house_owner")}) exitWith {[localize "STR_House_Raid_NoOwner",true,"slow"] call ANZUS_fnc_notificationSystem;};

_uid = ((_house getVariable "house_owner") select 0);

if (!([_uid] call ANZUS_fnc_isUIDActive)) exitWith {[localize "STR_House_Raid_OwnerOff",true,"slow"] call ANZUS_fnc_notificationSystem;};

_houseInv = _house getVariable ["Trunk",[[],0]];
if (_houseInv isEqualTo [[],0]) exitWith {[localize "STR_House_Raid_Nothing",true,"slow"] call ANZUS_fnc_notificationSystem;};
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

for "_i" from 0 to 1 step 0 do {
    uiSleep 0.26;
    _cP = _cP + _cpRate;
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
    if (_cP >= 1 || !alive player) exitWith {};
    if (player distance _house > 13) exitWith {};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
if (player distance _house > 13) exitWith {life_action_inUse = false; titleText[localize "STR_House_Raid_TooFar","PLAIN"]};
if (!alive player) exitWith {life_action_inUse = false;};
life_action_inUse = false;

_houseInvData = (_houseInv select 0);
_houseInvVal = (_houseInv select 1);
_value = 0;
{
    _var = _x select 0;
    _val = _x select 1;

    if (ITEM_ILLEGAL(_var) isEqualTo 1) then {
        if (!(ITEM_SELLPRICE(_var) isEqualTo -1)) then {
            _houseInvData deleteAt _forEachIndex;
            _houseInvVal = _houseInvVal - (([_var] call ANZUS_fnc_itemWeight) * _val);
            _value = _value + (_val * ITEM_SELLPRICE(_var));
        };
    };
} forEach (_houseInv select 0);

if (_value > 0) then {
    [0,"STR_House_Raid_Successful",true,[[_value] call ANZUS_fnc_numberText]] remoteExecCall ["ANZUS_fnc_broadcast",RCLIENT];
    _value = round(_value / 2);
    [_value] call AnzusLife_AC_Bank;
    [1] call ANZUS_fnc_updatePartial;

    _house setVariable ["Trunk",[_houseInvData,_houseInvVal],true];

    if (life_HC_isActive) then {
        [_house] remoteExecCall ["HC_fnc_updateHouseTrunk",HC_Life];
    } else {
        [_house] remoteExecCall ["TON_fnc_updateHouseTrunk",RSERV];
    };
} else {
    [localize "STR_House_Raid_NoIllegal",true,"slow"] call ANZUS_fnc_notificationSystem;
};
