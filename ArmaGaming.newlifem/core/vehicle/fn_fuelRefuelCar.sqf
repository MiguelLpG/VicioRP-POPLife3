    #include "..\..\script_macros.hpp"
/*
    File: fn_fuelRefuelCar.sqf
    Author: NiiRoZz

    Description:
    Adds fuel in car.
*/
disableSerialization;
private ["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_classname = lbData[20302,(lbCurSel 20302)];
_index =  lbValue[20302,(lbCurSel 20302)];

if (isNil "_classname" || _classname isEqualTo "") exitWith {
    [localize "STR_Select_Vehicle_Pump",true,"slow"] call ANZUS_fnc_notificationSystem;
    vehiclefuelList = [];
    life_action_inUse = false;
    closeDialog 0;
};

_car = (vehiclefuelList select _index) select 0;
_vehicleInfo = [_className]call ANZUS_fnc_fetchVehInfo;
_fuelNow = fuel _car;
_fueltank = (_vehicleInfo select 12);
if (_car isKindOf "B_Truck_01_box_F" || _car isKindOf "B_Truck_01_transport_F") then {_fueltank = 350;};//hemtt
if (_car isKindOf "C_Van_01_box_F") then {_fueltank = 100;};
if (_car isKindOf "I_Truck_02_covered_F" || _car isKindOf "I_Truck_02_transport_F") then {_fueltank = 175;};
_fueltoput= ((SliderPosition 20901)-(floor(_fuelnow * _fueltank)));
_setfuell = _fuelnow + (_fueltoput/_fueltank);
_timer = ((_fueltoput * .25)/100);
if (_car distance player > 10 && !(isNull objectParent player)) exitWith {
    [localize "STR_Distance_Vehicle_Pump",true,"slow"] call ANZUS_fnc_notificationSystem;
    vehiclefuelList = [];
    life_action_inUse = false;
    closeDialog 0;
};

if ((BANK - (_fueltoput * life_fuelPrices))> 0)then {
    life_is_processing = true;
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

    _tp =0;
    _totalcost = _fueltoput * life_fuelPrices;
    for "_i" from 0 to 1 step 0 do {
        uiSleep  _timer;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _precentage = str round(_cP * 100) + "%";
        _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
        
            
        if (_cP >= 1) exitWith {};
        if (player getVariable ["inHostage",false]) exitWith {};
        if (player distance _car > 10) exitWith {};
        if !(isNull objectParent player) exitWith {};
        if !((BANK - round(0.01 * _totalcost))> 0) exitWith {};

        _value = round((0.01 * _totalcost));  
        [_value,true] call AnzusLife_AC_Bank;
        _tp = _tp +1;
        if (_tp == 9) then {
            _tp = 0;
            [_car,_cp * _setfuell] remoteExecCall ["ANZUS_fnc_setFuel",_car];
        };
    };

    "progressBar" cutText ["","PLAIN"];
    if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};

    if (_car distance player > 10 || !(isNull objectParent player)) then {
        [localize "STR_Distance_Vehicle_Pump",true,"slow"] call ANZUS_fnc_notificationSystem;
        vehiclefuelList = [];
        life_is_processing = false;
        life_action_inUse = false;
        [0] call ANZUS_fnc_updatePartial;
        closeDialog 0;
    } else {
        life_is_processing = false;
        [0] call ANZUS_fnc_updatePartial;
        ["You have filled up your vehicle, have a good day!",true,"slow"] call ANZUS_fnc_notificationSystem;
    };
} else {
    [localize "STR_NOTF_NotEnoughMoney",true,"slow"] call ANZUS_fnc_notificationSystem;
};

vehiclefuelList = [];
life_action_inUse = false;
closeDialog 0;
