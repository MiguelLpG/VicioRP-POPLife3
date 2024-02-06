#include "..\..\script_macros.hpp"
/*
    File: fn_sellHouse.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Sells the house and delete all container near house.
*/
private ["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;

if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (isNil {_house getVariable "house_owner"}) exitWith {[localize "STR_House_noOwner",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_house getVariable ["house_sold",false]) exitWith {["Cannot sell house that is already sold.",true,"slow"] call ANZUS_fnc_notificationSystem;};
closeDialog 0;

_houseCfg = [(typeOf _house)] call ANZUS_fnc_houseConfig;
if (count _houseCfg isEqualTo 0) exitWith {};

private _action = [localize "STR_pInAct_SellHouse", format[localize "STR_House_SellHouseMSG",(round((_houseCfg select 0)/2)) call ANZUS_fnc_numberText,(_houseCfg select 1)], "SELL", "CANCEL", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

if (_action) then {
    if(life_antispam isEqualTo 1) exitWith {closeDialog 0;};
    if (_house getVariable ["house_sold",false]) exitWith {["Cannot sell house that is already sold.",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
    if (isNil {_house getVariable "house_owner"}) exitWith {[localize "STR_House_noOwner",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
    
    life_antispam = 1;
    closeDialog 0;
    disableUserInput true;
    _house setVariable ["house_sold",true,true];

    if (life_HC_isActive) then {
        [_house] remoteExecCall ["HC_fnc_sellHouse",HC_Life];
    } else {
        [_house] remoteExecCall ["TON_fnc_sellHouse",RSERV];
    };
    
    _house setVariable ["locked",false,true];
    _house setVariable ["containers",nil,true];
    deleteMarkerLocal format["house_%1",_house getVariable "uid"];
    _house setVariable ["uid",nil,true];

    _value = (round((_houseCfg select 0)/2));
    [_value] call AnzusLife_AC_Bank;

    [1] call ANZUS_fnc_updatePartial;
    _index = life_vehicles find _house;
    [format["%1/%2 sold a house/garage for $%3",profileName,(getPlayerUID player),(round((_houseCfg select 0)/2))], "sell.log"] remoteExec ["AH_LogInterface",2];

    if !(_index isEqualTo -1) then {
        life_vehicles deleteAt _index;
    };

    _index = [str(getPosATL _house),life_houses] call TON_fnc_index;
    if !(_index isEqualTo -1) then {
        life_houses deleteAt _index;
    };

    _numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house), "numberOfDoors");
    for "_i" from 1 to _numOfDoors do {
        _house setVariable [format ["bis_disabled_Door_%1",_i],0,true];
    };

    _containers = _house getVariable ["containers",[]];
    if (count _containers > 0) then {
        {
            _x setVariable ["Trunk",nil,true];
            
            if (life_HC_isActive) then {
                [_x] remoteExecCall ["HC_fnc_sellHouseContainer",HC_Life];
            } else {
                [_x] remoteExecCall ["TON_fnc_sellHouseContainer",RSERV];
            };
            
        } forEach _containers;
    };
    _house setVariable ["containers",nil,true];
};

[] spawn {sleep 1.5; life_antispam = 0;};
uiSleep 3; 
disableUserInput false;