#include "..\..\script_macros.hpp"
/*
    File: fn_unimpound.sqf
    Author: Arma-Gaming
*/
disableSerialization;
_vendor = cursorObject;

private _display = findDisplay 98123;
private _ctrlList = _display displayCtrl 26;
private _selRow = lnbCurSelRow _ctrlList;
private _data = _ctrlList lnbData [_selRow, 0];
private _vid = _ctrlList lnbValue [_selRow, 0];

_data params [["_className", "", [""]]];

if (_selRow isEqualTo -1) exitWith {[localize "STR_Global_NoSelection",true,"slow"] call ANZUS_fnc_notificationSystem;};

private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");
private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");
private _retreivePrice = 0;
private _purchasePrice = 0;

garageExited = false;
switch (playerSide) do {
    case civilian: {
        _purchasePrice = _price * getNumber(_shopSettings >> "vehicle_purchase_multiplier_CIVILIAN");
    };
    case west: {
        _purchasePrice = _price * ((call AnzusLife_GovSubsidization) select 0);
    };
    case independent: {
        _purchasePrice = _price * ((call AnzusLife_GovSubsidization) select 1);
    };
};

_retreivePrice = _purchasePrice * getNumber(_shopSettings >> "vehicle_storage_fee_multiplier");
if (!(_retreivePrice isEqualType 0) || _retreivePrice < 1) then {_retreivePrice = 500;};

[_retreivePrice,_vid,_className,_vendor] spawn {
    params [["_retreivePrice",0,[0]],["_vid",0,[0]],["_className","",[""]],["_vendor",objNull,[objNull]]];

    private _action = ["Retreive Vehicle", format["Are you sure you want to retrieve this vehicle for $%1?",[_retreivePrice] call ANZUS_fnc_numberText], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
    if (_action) then {
        closeDialog 0;
        if (BANK < _retreivePrice) exitWith {[format[localize "STR_Garage_CashError",[_retreivePrice] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;};

        if (life_garage_sp isEqualTo "NONE") exitWith {["No spawnpoint available, please let a developer know this shop has no spawn.",true,"slow"] call ANZUS_fnc_notificationSystem;};
        if (life_garage_sp isEqualType []) then {
            [_vid,(life_garage_sp select 0), (life_garage_sp select 1), _retreivePrice] call AnzusLife_spawnVehicle;
        } else {
            if (life_garage_sp isEqualTo "player_garage") then {
                [_className,_vendor,_retreivePrice,_vid] spawn {
                    params["_className","_vendor","_retreivePrice","_vid"];
                    droppedVehicle = false;
                    ["To place your vehicle please press space, to cancel this press F1",true,"slow"] call ANZUS_fnc_notificationSystem;
                    _startposition = getPos player;

                    garageTmpVehicle = _className createVehicleLocal (position player);
                    garageVehicleType = _className;

                    _bbr = boundingBoxReal garageTmpVehicle;
                    _p1 = _bbr select 0;
                    _p2 = _bbr select 1;
                    _maxLength = abs ((_p2 select 1) - (_p1 select 1));
                    _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

                    switch (_className) do { 
                        case "Fox_ArrowXTLadder" : {
                            _maxHeight = 2.5;
                            _maxLength = 15;
                        };

                        case "Jonzie_Ambulance" : {
                            _maxHeight = 2.5;
                            _maxLength = 15;
                        };
                    };                   

                    garageTmpVehicle attachTo [player, [0, _maxLength, _maxHeight / 2]];

                    garageSpawnEh = (findDisplay 46) displayAddEventHandler['KeyUp', {
                        if (_this select 1 == 0x39) then {
                            droppedVehicle = true;
                        } else {
                            if (_this select 1 == 0x3B) then {
                                deleteVehicle garageTmpVehicle;
                                (findDisplay 46) displayRemoveEventHandler['KeyUp', garageSpawnEh];
                                garageExited = true;
                                [0] call AnzusLife_finishVehSpawn;
                            };
                        };
                    }];

                    private _distance = 10;
                    if ((typeOf _vendor) isEqualTo "Land_pop_mansion_deluxe" || (typeOf _vendor) isEqualTo "Land_InfoStand_V1_F") then {_distance = 35};
                    _distance = _distance + _maxLength;
                    
                    waitUntil {(garageTmpVehicle distance _startposition) > _distance || droppedVehicle isEqualTo true};
                    if (garageExited) exitWith {garageExited = false};
                    _pos = getPos garageTmpVehicle;

                    _class = garageVehicleType;
                    _pos set[2, (_pos select 2) + 1];
                    _dir = getDir garageTmpVehicle;
                    [_vid, _pos, _dir, _retreivePrice] call AnzusLife_spawnVehicle;

                    deleteVehicle garageTmpVehicle;

                    (findDisplay 46) displayRemoveEventHandler['KeyUp', garageSpawnEh];

                    if (player distance _startposition > _distance) then {
                        ["You have walked to far, dropping vehicle.",true,"slow"] call ANZUS_fnc_notificationSystem;
                    };
                };
            } else {
                if (life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
                    [_vid, life_garage_sp, 0, _retreivePrice] call AnzusLife_spawnVehicle;
                } else {
                    [_vid, (getMarkerPos life_garage_sp), (markerDir life_garage_sp), _retreivePrice] call AnzusLife_spawnVehicle;
                };
            };
        };
    };
};