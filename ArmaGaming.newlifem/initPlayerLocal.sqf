#include "script_macros.hpp"
/*
    File: initPlayerLocal.sqf
    Author:

    Description:
    Starts the initialization of the player.
*/
waitUntil {!(isNil "allFunctions")};
[] remoteExec ["TON_fnc_receiveFunctions",clientOwner];
waitUntil {(!(isNil "life_serverFunctionsReady"))}; waitUntil {life_serverFunctionsReady};


cutText ["","BLACK IN",10];

if (!hasInterface && !isServer) exitWith {
    [] call compile preprocessFileLineNumbers "\life_hc\initHC.sqf";
};

BIS_fnc_endMission = compileFinal (if (BIS_fnc_endMission isEqualType "") then {BIS_fnc_endMission} else {str(BIS_fnc_endMission)});

[] call AnzusLife_LoadClient;

[] spawn {
    _adjustLight = {
        CHBN_adjustBrightness = CHBN_adjustBrightness max 0 min 1;
        _brightness = if (CHBN_adjustBrightness > 0) then {200 * abs (1 - (2 ^ CHBN_adjustBrightness))} else {0};
        CHBN_light setLightAttenuation [10e10,(30000 / (_brightness max 10e-10)),4.31918e-005,4.31918e-005];
        CHBN_light setLightAmbient CHBN_adjustColor;
    };
    
    waitUntil {time > 0};
    if (missionNamespace getVariable ["CHBN_running",false]) exitWith {["CHBN script is running, addon disabled",true,"slow"] call ANZUS_fnc_notificationSystem;};
    CHBN_running = true;
    
    CHBN_adjustBrightness = missionNamespace getVariable ["CHBN_adjustBrightness",1];
    CHBN_adjustColor = missionNamespace getVariable ["CHBN_adjustColor",[0.5,0.7,1]];

    if (!isNil "CHBN_light") then {deleteVehicle CHBN_light};
    CHBN_light = "#lightpoint" createVehicleLocal [0,0,0];
    CHBN_light setLightBrightness 1;
    CHBN_light setLightDayLight false;
    call _adjustLight;

    for "_i" from 0 to 1 step 0 do {
        _adjustBrightness = CHBN_adjustBrightness;
        _adjustColor = CHBN_adjustColor;
        waitUntil {!(_adjustBrightness isEqualTo CHBN_adjustBrightness) || !(_adjustColor isEqualTo CHBN_adjustColor)};
        call _adjustLight;
    };
};