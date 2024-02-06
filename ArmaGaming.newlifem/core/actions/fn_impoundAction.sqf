#include "..\..\script_macros.hpp"
/*
    File: fn_impoundAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Impounds the vehicle
*/
private ["_vehicle","_type","_time","_value","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters","_impoundValue","_price","_impoundMultiplier"];
_vehicle = param [0,objNull,[objNull]];
_filters = ["Car","Air","Ship"];

if (!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if (player distance _vehicle > 10) exitWith {};
if (_vehicle getVariable "NPC") exitWith {[localize "STR_NPC_Protected",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (life_action_inUse) exitWith {["You are in an action already.",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_vehicle == truckMissionVeh) exitWith {};

_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (_vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
_price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");
_player = [((_vehicleData select 0) select 0)] call AnzusLife_Lib_GetPlayerByUID;

[format[localize "STR_NOTF_BeingImpounded",((_vehicleData select 0) select 1),_vehicleName],false,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem",_player];
life_action_inUse = true;

//Setup the progress bar
_title = "Impounding Vehicle";
_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\impound.paa";


disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progressBar = _controlsGroup controlsGroupCtrl 3;
_titleText = _controlsGroup controlsGroupCtrl 2;
_titleText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, str("1" + "%"), (100 * (pixelH * pixelGrid * 0.50))];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 0.3;
    _cP = _cP + (0.02 * (missionNamespace getVariable ["mav_ttm_var_impoundMultiplier", 1]));
    _progressBar progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _titleText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
    if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
    if (player distance _vehicle > 10) exitWith {};
    if (!alive player) exitWith {};
};

"progressBar" cutText ["","PLAIN"];

if (player distance _vehicle > 10) exitWith {[localize "STR_NOTF_ImpoundingCancelled",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
if (!alive player) exitWith {life_action_inUse = false;};
if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
    
if (count crew _vehicle isEqualTo 0) then {
    if (!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};
    _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
    if (_vehicle == truckMissionVeh) exitWith {};
      
    if (_vehicle isKindOf "Car") then {
      [_vehicle,player] call AnzusLife_ImpoundVehicle;
    } else {
      private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");
      private _value = _price * getNumber(_shopSettings >> "vehicle_cop_impound_multiplier");

      [_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",2];

      if (_vehicle in life_vehicles) then {
        [format[localize "STR_NOTF_OwnImpounded",[_value] call ANZUS_fnc_numberText,_type],true,"slow"] call ANZUS_fnc_notificationSystem;
        [_value,true] call AnzusLife_AC_Bank;
      } else {
        [format[localize "STR_NOTF_Impounded",_type,[_value] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
        [_value] call AnzusLife_AC_Bank;
        ["VehicleImpounded"] spawn mav_ttm_fnc_addExp;
      };

      [1] call ANZUS_fnc_updatePartial;
    };
} else {
    [localize "STR_NOTF_ImpoundingCancelled",true,"slow"] call ANZUS_fnc_notificationSystem;
};

life_action_inUse = false;