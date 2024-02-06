#include "..\script_macros.hpp"
/*
    File: fn_initCiv.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the civilian.
*/

waitUntil {!(isNull (findDisplay 46))};
waitUntil {isNull(findDisplay 999210)};

if (isDevBranch || player getVariable "life_is_alive" isEqualTo true && !life_is_arrested) then {
    player setVehiclePosition [life_civ_position, [], 0, "CAN_COLLIDE"];
    [] remoteExec ["AnzusLife_PropertyTaxCheckLogin",2];
    [] remoteExec ["AnzusLife_WealthTaxCheckLogin",2];
    [] call ANZUS_fnc_hudSetup;
    cutText ["","BLACK IN"];
    showCinemaBorder false;
    player switchCamera "EXTERNAL";
    "SPLASHNOISE" cutText ["", "PLAIN"];

    [] spawn {
        5 fadeMusic 0;
        5 fadeSound 1;
        sleep 5;
        playMusic "";   
    };
} else {
    if (player getVariable "life_is_alive" isEqualTo false && !life_is_arrested) then {
        [] call ANZUS_fnc_spawnMenu;

        if (life_arrest_parole) then {
            [player,true,15,player, true] spawn ANZUS_fnc_jail;
        };

        waitUntil{!isNull (findDisplay 8999720)};
        waitUntil{isNull (findDisplay 8999720)};
        
    } else {
        if (life_is_arrested) then {
            life_is_arrested = false;
            [player,true,15,player] spawn ANZUS_fnc_jail;
            [] call ANZUS_fnc_hudSetup;
            cutText ["","BLACK IN"];
            showCinemaBorder false;
            player switchCamera "EXTERNAL";
            "SPLASHNOISE" cutText ["", "PLAIN"];
            [] spawn {
                5 fadeMusic 0;
                5 fadeSound 1;
                sleep 5;
                playMusic "";   
            };
        };
    };
};

if (ITEM_VALUE("keyCard") > 0) then {
    [false,"keyCard",ITEM_VALUE("keyCard"),"misc"] call ANZUS_fnc_handleInv;
};

player setVariable ["life_is_alive", true, true];

inGameUISetEventHandler ["PrevAction", "life_disable_getOut"]; 
inGameUISetEventHandler ["NextAction", "life_disable_getOut"];

EM_blacklist_obj =  
[ 
    "Land_Mil_WiredFence_F", 
    "Land_New_WiredFence_5m_F", 
    "Land_New_WiredFence_10m_F", 
    "Land_Concrete_SmallWall_4m_F", 
    "Land_Concrete_SmallWall_8m_F", 
    "Land_Gate_C",
    "Land_GateB",
    "Land_MainSection"
];