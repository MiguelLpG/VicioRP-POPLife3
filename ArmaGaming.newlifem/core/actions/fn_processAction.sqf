#include "..\..\script_macros.hpp"
/*
    File: fn_processAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Master handling for processing an item.
    NiiRoZz : Added multiprocess
*/
private ["_vendor","_type","_itemInfo","_oldItem","_newItemWeight","_newItem","_oldItemWeight","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_materialsRequired","_materiANZUSiven","_noLicenseCost","_text","_filter","_totalConversions","_minimumConversions"];
params [
    ["_vendor",objNull,[objNull]],
    ["_type","",[""]]
];

if (isNull _vendor || _type isEqualTo "" || (player distance _vendor > 10)) exitWith {};

if (isClass (missionConfigFile >> "ProcessAction" >> _type)) then {
    _filter = false;
    _materialsRequired = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsReq");
    _materiANZUSiven = M_CONFIG(getArray,"ProcessAction",_type,"MateriANZUSive");
    _noLicenseCost = M_CONFIG(getNumber,"ProcessAction",_type,"NoLicenseCost");
    _text = M_CONFIG(getText,"ProcessAction",_type,"Text");
} else {_filter = true;};

if (_filter) exitWith {life_action_inUse = false;};

_itemInfo = [_materialsRequired,_materiANZUSiven,_noLicenseCost,(localize format ["%1",_text])];
if (count _itemInfo isEqualTo 0) exitWith {life_action_inUse = false;};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_exit = false;
if (count _oldItem isEqualTo 0) exitWith {life_action_inUse = false;};

if (_type IN ["marijuana","cocaine","heroin"]) then {
    if (!((missionNamespace getVariable ["AnzusLife_Cartel",0]) > 0)) exitWith {};
    private _group = ["Cartel"] call AnzusLife_Lib_GetGroup;
    if (_group isEqualTo group player) exitWith {};
    
    _item = ((_newItem select 0) select 0);
    _math = ITEM_VALUE((_oldItem select 0) select 0);
    _newamm = ceil(_math / 6);
    _price = round(ITEM_SELLPRICE(_item)) * _newamm;

    private _action = ["Cartel Fee", "This processer is owned by the cartel meaning they want a 25% fee out of your processing, would you like to pay this? If you hit no there could be bad results, choose wisly!", "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
    if (!(isNull _group)) then {
        if (_action) then {
            private _cartelid = missionNamespace getVariable ["AnzusLife_Cartel",0];
            [false,((_oldItem select 0) select 0),_newamm,"process"] call ANZUS_fnc_handleInv;

            [_price,_group,"Process"] remoteExec ["AnzusLife_ReciveGangProfit",2];
        } else {
            private _place = "";
            switch (_type) do { 
                case "marijuana": { 
                    _place = "Marijuana Cartel";
                }; 
                case "cocaine": {
                    _place = "Cocaine Cartel";
                }; 
                case "heroin": {
                    _place = "Heroin Cartel";
                };
            };

            [player,_price,_place] remoteExec ["AnzusLife_DenyFee",_group];
            ["Bad choice, we will be handling you soon",true,"slow"] call ANZUS_fnc_notificationSystem;
        };
    };
};

_totalConversions = [];
{
    _var = ITEM_VALUE(_x select 0);
    if (_var isEqualTo 0) exitWith {_exit = true;};
    if (_var < (_x select 1)) exitWith {_exit = true;};
    _totalConversions pushBack (floor (_var/(_x select 1)));
} forEach _oldItem;

if (_exit) exitWith {life_is_processing = false; [localize "STR_NOTF_NotEnoughItemProcess",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};

_cost = _cost * (count _oldItem);

_minimumConversions = _totalConversions call BIS_fnc_lowestNum;
_oldItemWeight = 0;
{
    _weight = ([_x select 0] call ANZUS_fnc_itemWeight) * (_x select 1);
    _oldItemWeight = _oldItemWeight + _weight;
} count _oldItem;

_newItemWeight = 0;
{
    _weight = ([_x select 0] call ANZUS_fnc_itemWeight) * (_x select 1);
    _newItemWeight = _newItemWeight + _weight;
} count _newItem;

_exit = false;

if (_newItemWeight > _oldItemWeight) then {
    _netChange = _newItemWeight - _oldItemWeight;
    _freeSpace = life_maxWeight - life_carryWeight;
    if (_freeSpace < _netChange) exitWith {_exit = true;};
    private _estConversions = floor(_freeSpace / _netChange);
    if (_estConversions < _minimumConversions) then {
        _minimumConversions = _estConversions;
    };
};

if (_exit) exitWith {[localize "STR_Process_Weight",true,"slow"] call ANZUS_fnc_notificationSystem; life_is_processing = false; life_action_inUse = false;};


life_action_inUse = true;

//Setup the progress bar
_title = "Processing Item";
_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\inventory.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;
if (isNil "AnzusLife_ProcessPrice") then {
    AnzusLife_ProcessPrice = 1;
};

_cost = _cost * AnzusLife_ProcessPrice;

if (CASH < _cost) exitWith {[format[localize "STR_Process_License",[_cost] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

for "_i" from 0 to 1 step 0 do {
    sleep  0.9;
    _cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_processMultiplier", 1]));
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
    if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
    if (player distance _vendor > 10) exitWith {};
};

if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
if (player distance _vendor > 10) exitWith {[localize "STR_Process_Stay",true,"slow"] call ANZUS_fnc_notificationSystem; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
if (CASH < _cost) exitWith {[format[localize "STR_Process_License",[_cost] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

"progressBar" cutText ["","PLAIN"];
if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then {[localize "STR_NOTF_ItemProcess",true,"slow"] call ANZUS_fnc_notificationSystem;} else {[localize "STR_Process_Partial",true,"slow"] call ANZUS_fnc_notificationSystem;};

[_cost,true] call AnzusLife_AC_Cash;
["ItemProcessed", (((_newItem select 0) select 1)*(_minimumConversions))] spawn mav_ttm_fnc_addExp;
[0] call ANZUS_fnc_updatePartial;
life_is_processing = false;
life_action_inUse = false;

if (!isNil {(group player) getVariable ["gang_name",""]}) then {
    private _task = "";
    private _ammountNeeded = 300;
    switch (_type) do { 
        case "marijuana": {_task = "Ganja Gathering"; _ammountNeeded = 399}; 
        case "cocaine": {_task = "Kings of Cocaine"; _ammountNeeded = 499}; 
        case "heroin": {_task = "Wired"; _ammountNeeded = 399}; 
        default {}; 
    };

    _amm = ITEM_VALUE((_oldItem select 0) select 0);
    _oldamm = (group player) getVariable [format["AnzusLife_%1Processed",_type],0];
    _ammedit = _oldamm + _amm;
    (group player) setVariable [format["AnzusLife_%1Processed",_type],_ammedit,true];

    sleep 2;

    if ((group player) getVariable [format["AnzusLife_%1Processed",_type],0] >= _ammountNeeded) then {
        _gangrole = (group player) getVariable ["gang_role",[]];
        if (_gangrole isEqualTo []) exitWith {};
            
        _gangselect = _gangrole select 0;
        if (_gangselect != 0) then {
            _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
            if (!_check) then {
                [_task] remoteExec ["AnzusLife_UnlockTask",2];
                (group player) setVariable [format["AnzusLife_%1Processed",_type],nil,true];
            };
        };
    };
};

{
    [false,(_x select 0),((_x select 1)*(_minimumConversions)),"process"] call ANZUS_fnc_handleInv;
} count _oldItem;

{
    [true,(_x select 0),((_x select 1)*(_minimumConversions)),"process"] call ANZUS_fnc_handleInv;
} count _newItem;