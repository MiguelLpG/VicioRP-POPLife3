#include "..\..\script_macros.hpp"

/*
    File: fn_escInterupt.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Monitors when the ESC menu is pulled up and blocks off
    certain controls when conditions meet.
*/
disableSerialization;

private _escSync = { 
    disableSerialization;
    private _abortButton = CONTROL(49,104);
    private _escapeMenu = MAIN_SETTINGS("GameSettings","EscapeMenu");
    private _abortTime = getNumber(_escapeMenu >> "escapeMenu_timer");

    if (isDevBranch || call(life_adminlevel) > 1) then {
    	_abortTime = 1;
    };

    if (life_combatTime > time) exitWith {_abortButton ctrlSetText "IN COMBAT, CAN NOT ABORT";};

    private _timeStamp = time + _abortTime;

    waitUntil {
        _abortButton ctrlSetText format [localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
        _abortButton ctrlCommit 0;
        if (dialog && {isNull (findDisplay 7300)}) then {closeDialog 0};

        round(_timeStamp - time) <= 0 || {isNull (findDisplay 49)}
    };

    _abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
    _abortButton ctrlCommit 0;
    _abortButton ctrlEnable true;
};

private _canUseControls = {
    if ((player getVariable ["restrained",false]) || (player getVariable ["Escorting",false]) || (life_is_arrested) || (life_istazed) || (life_isknocked) || (player getVariable ["inHostage",false]) || !(player getVariable ["life_is_alive",false])) then {false} else {true};
};

[] call ANZUS_fnc_updateRequest;

for "_i" from 0 to 1 step 0 do {
    waitUntil {!isNull (findDisplay 49)};
    private _abortButton = CONTROL(49,104);
    _abortButton buttonSetAction "[] call ANZUS_fnc_updateRequest; profileNamespace setVariable ['AL_Loadout',getUnitLoadout player]; [player] remoteExec [""TON_fnc_cleanupRequest"",2];";
    private _respawnButton = CONTROL(49,1010);
    private _fieldManual = CONTROL(49,122);
    private _saveButton = CONTROL(49,103);
    _saveButton ctrlSetText "";

    //Extras
    private _escapeMenu = MAIN_SETTINGS("GameSettings","EscapeMenu");
    if (getNumber(_escapeMenu >> "escapeMenu_displayExtras") isEqualTo 1) then {
        private _topButton = CONTROL(49,2);
        _topButton ctrlEnable false;
        _topButton ctrlSetText format ["%1",getText(_escapeMenu >> "escapeMenu_displayText")];
        _saveButton ctrlEnable false;
        _saveButton ctrlSetText format ["Player UID: %1",getPlayerUID player];
    };

    //Block off our buttons first.
    _respawnButton ctrlEnable false;
    _abortButton ctrlEnable false;
    _fieldManual ctrlEnable false;
    _fieldManual ctrlShow false;

    if (call _canUseControls) then {
        [] spawn _escSync;
    };

    waitUntil {isNull (findDisplay 49) || {!alive player}};
    if (!isNull (findDisplay 49) && {!alive player}) then {
        (findDisplay 49) closeDisplay 2;
    };
};