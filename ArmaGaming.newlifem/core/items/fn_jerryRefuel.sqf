#include "..\..\script_macros.hpp"
/*
    File: fn_jerryRefuel.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Refuels the vehicle if the player has a fuel can.
*/
private ["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState"];
_vehicle = cursorObject;
life_interrupted = false;

if (isNull _vehicle) exitWith {[localize "STR_ISTR_Jerry_NotLooking",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if (player distance _vehicle > 7.5) exitWith {[localize "STR_ISTR_Jerry_NotNear",true,"slow"] call ANZUS_fnc_notificationSystem;};

if (!([false,"fuelFull",1,"misc"] call ANZUS_fnc_handleInv)) exitWith {};
life_action_inUse = true;

_displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

_upp = format [localize "STR_ISTR_Jerry_Process",_displayName];

//Setup the progress bar
_title = "Refueling Vehicle";
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
    if (!alive player) exitWith {};
    if (life_interrupted) exitWith {};
};
life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",false,"slow"] call ANZUS_fnc_notificationSystem;};
if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};

switch (true) do {
    case (_vehicle isKindOF "LandVehicle"): {
        if (!local _vehicle) then {
            [_vehicle,(Fuel _vehicle) + 0.3] remoteExecCall ["ANZUS_fnc_setFuel",_vehicle];
        } else {
            _vehicle setFuel ((Fuel _vehicle) + 0.3);
        };
    };

    case (_vehicle isKindOf "Air"): {
        if (!local _vehicle) then {
            [_vehicle,(Fuel _vehicle) + 0.1] remoteExecCall ["ANZUS_fnc_setFuel",_vehicle];
        } else {
            _vehicle setFuel ((Fuel _vehicle) + 0.1);
        };
    };

    case (_vehicle isKindOf "Ship"): {
        if (!local _vehicle) then {
            [_vehicle,(Fuel _vehicle) + 0.35] remoteExecCall ["ANZUS_fnc_setFuel",_vehicle];
        } else {
            _vehicle setFuel ((Fuel _vehicle) + 0.35);
        };
    };
};
[format[localize "STR_ISTR_Jerry_Success",_displayName],false,"slow"] call ANZUS_fnc_notificationSystem;
[true,"fuelEmpty",1,"misc"] call ANZUS_fnc_handleInv;