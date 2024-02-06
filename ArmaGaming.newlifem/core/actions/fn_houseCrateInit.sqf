#include "..\..\script_macros.hpp"
/*
    House crate initiation
    Repentz ft. bully devs who won't do it for me so if its shit its not my fucking fault
*/
params [ ["_house",objNull,[objNull]] ];

if (_house isKindOf "House_F" && playerSide isEqualTo civilian) then {
    if (player distance _house > 20) exitWith {};

    _door = [_house] call ANZUS_fnc_nearestDoor;
    if (_door isEqualTo false) exitWith {[localize "STR_House_Door_NotNear",true,"slow"] call ANZUS_fnc_notificationSystem;};
    
    _numberOfDoors = getNumber(configFile >> "CfgVehicles" >> typeOf _house >> "NumberOfDoors");
    for "_i" from 0 to _numberOfDoors do {
        _house setVariable [format ["bis_disabled_Door_%1",_i],0,true];
        _house animateSource [format ["Door_%1_source", _i], 1];
    };

    _cratePositions = getArray(missionconfigFile >> "HousingLoot" >> typeOf _house >> "lootPositions");
    if (count _cratePositions == 0) exitWith {
        ["This house does not have any loot positions defined! Contact a dev.",true,"slow"] call ANZUS_fnc_notificationSystem;
    };
    _random = selectRandom _cratePositions;

    _container = createVehicle["Land_WoodenCrate_01_F",[0,0,0],[],0,"NONE"];
    waitUntil {!isNil "_container" && {!isNull _container}};
    _container allowDamage false;
    _container enableSimulation false;
    _container setPosATL (_house modelToWorld _random);
    
    _container setDir 32;
    _container setVariable ["AnzusLife_HouseRobberyCrate",true,true];
    _container setVariable ["AnzusLife_HouseRobberyOpened",false,true];

    [_container] spawn {
        waitUntil {(_this select 0) getVariable ["AnzusLife_HouseRobberyOpened",false]};
        sleep 180;
        deleteVehicle (_this select 0);
    };
};