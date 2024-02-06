#include "..\..\script_macros.hpp"
/*
    File: fn_actionKeyHandler.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master action key handler, handles requests for picking up various items and
    interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private ["_curObject","_CrateModelNames","_crate","_fish","_animal","_whatIsIt","_handle"];
_curObject = cursorObject;
if (life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if (life_interrupted) exitWith {life_interrupted = false;};

if (isNull _curObject) exitWith {
    private "_handle";
    if (playerSide isEqualTo civilian && !life_action_gathering) then {
        _whatIsIt = [] call ANZUS_fnc_whereAmI;
        if (life_action_gathering) exitWith {}; 
        switch (_whatIsIt) do {
            case "mine": { _handle = [] spawn ANZUS_fnc_mine;};
            case "resource": {_handle = [] spawn ANZUS_fnc_gather;};
            default {_handle = [] spawn ANZUS_fnc_gather;};
        };
        
        life_action_gathering = true;
        waitUntil {scriptDone _handle};
        life_action_gathering = false;
    };
};

if (dialog) exitWith {}; //Don't bother when a dialog is open.
if !(isNull objectParent player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
if (!isNull life_actionThread) then {terminate life_actionThread};
life_actionThread = [] spawn { 
    sleep 60;
    life_action_inUse = false;
    life_actionThread = scriptNull;
};

//Check if it's a dead body.
if (_curObject isKindOf "Man" && !(_curObject isKindOf "Animal") && {!alive _curObject} && !(_curObject getVariable ["Revive",false]) && _curObject distance player < 5) exitWith {   

    if (ITEM_VALUE("cprKit") > 0) then {
        [_curObject] spawn ANZUS_fnc_cprKit;
    };

};