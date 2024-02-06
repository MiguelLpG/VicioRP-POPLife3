#include "..\..\script_macros.hpp"
/*
    File: fn_buyHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Buys the house?
*/
private ["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;
_gameSettings = MAIN_SETTINGS("GameSettings","Player");

if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (((vehicleVarName _house) find "houseDisable") > -1 ) exitWith {[localize "STR_House_alreadyOwned",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_house getVariable ["house_owned",false]) exitWith {[localize "STR_House_alreadyOwned",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!isNil {(_house getVariable "house_sold")}) exitWith {[localize "STR_House_Sell_Process",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((missionNamespace getVariable ['mav_ttm_var_home',0]) isEqualTo 0) exitwith { [localize "STR_House_License",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (count life_houses >= (getNumber(_gameSettings >> "house_limit")) && (FETCH_CONST(life_adminlevel) < 2)) exitWith {[format[localize "STR_House_Max_House",getNumber(_gameSettings >> "house_limit")],true,"slow"] call ANZUS_fnc_notificationSystem;};
closeDialog 0;

_houseCfg = [(typeOf _house)] call ANZUS_fnc_houseConfig;
if (count _houseCfg isEqualTo 0) exitWith {};
private _time = time + 20;
private _action = [localize "STR_House_Purchase", format[localize "STR_House_BuyMSG",[(_houseCfg select 0)] call ANZUS_fnc_numberText,(_houseCfg select 1)], "BUY", "CANCEL", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

if(_action && !(time > _time)) then {
    if(BANK < (_houseCfg select 0)) exitWith {[format[localize "STR_House_NotEnough"],true,"slow"] call ANZUS_fnc_notificationSystem;};
    if (_house getVariable ["house_owned",false]) exitWith {[localize "STR_House_alreadyOwned",true,"slow"] call ANZUS_fnc_notificationSystem;};
    _value = (_houseCfg select 0);
    [_value,true] call AnzusLife_AC_Bank;
    [_value/10] call AnzusLife_BudgetAdd;
    
    [1] call ANZUS_fnc_updatePartial;
    
    if(life_HC_isActive) then {
        [_uid,_house] remoteExec ["HC_fnc_addHouse",HC_Life];
    } else {
        [_uid,_house] remoteExec ["TON_fnc_addHouse",RSERV];
    };
    
    _house setVariable ["house_owner",[_uid,profileName],true];
    _house setVariable ["locked",true,true];
    _house setVariable ["containers",[],true];
    _house setVariable ["uid",floor(random 99999),true];

    [(_houseCfg select 0)] remoteExecCall ["AnzusLife_ItemBought", 2];
    ["buyHouse"] spawn mav_ttm_fnc_addExp;
    [player,"buy"] remoteexeccall ["say3D",-2];

    life_vehicles pushBack _house;
    life_houses pushBack [str(getPosATL _house),[]];
    _marker = createMarkerLocal [format ["house_%1",(_house getVariable "uid")],getPosATL _house];
    _houseName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _house), "displayName");
    _marker setMarkerTextLocal _houseName;
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTypeLocal "loc_Lighthouse";
    _numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house),"numberOfDoors");
    for "_i" from 1 to _numOfDoors do {
        _house setVariable [format ["bis_disabled_Door_%1",_i],1,true];
    };
};