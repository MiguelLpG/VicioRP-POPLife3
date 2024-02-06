#include "..\..\script_macros.hpp"
private["_time","_bail","_esc","_countDown"];

params [
    ["_ret",[],[[]]],
    ["_bad",false,[false]],
    ["_time",15,[0]],
    ["_cop",objNull,[objNull]]
];

if (isNull _cop) exitWith {};
if !((isRemoteExecuted && (remoteExecutedOwner isEqualTo 2))) exitWith {};

_minutes = _time;
life_releaseTime = time + (_time * 60);

[true,"donuts",2,"jail"] call ANZUS_fnc_handleInv;
[true,"waterBottle",2,"jail"] call ANZUS_fnc_handleInv;

_esc = false;
_bail = false;
if(life_releaseTime <= 0) then { 
    life_releaseTime = time + (15 * 60);
};

life_canpay_bail = false;
life_bail_amount = _minutes * 1000;

private _copName = "an unknown cop";
if (!(_cop isEqualTo player)) then {_copName = "officer " + (name _cop)}; 

_currentJail = "CarcelAlcatraz";
_allJails = MAIN_SETTINGS("Jail","Locations");
_myJail = _allJails >> _currentJail;
_myJailRelease = _allJails >> _currentJail >> "ReleaseArea";
[format["You have been arrested at the %1 by %2 for %3 Month(s), be safe!", getText(_myJail >> "name"), name _cop, _time],true,"slow"] call ANZUS_fnc_notificationSystem;

if (_minutes > 60) then {
    [time] spawn {
        params["_startTime"];

        life_remaingJailTime = life_releaseTime - time;

        while {life_remaingJailTime > 0} do {
            life_remaingJailTime = life_releaseTime - time;
            _beenIn = time - _startTime;

            if (_beenIn > 3600) then {
                life_canpay_bail = true;
                life_bail_amount = round((life_remaingJailTime / 60) * 1000);
            };
            uiSleep 1;
        };
    };
};

private _display = uiNamespace getVariable ["AnzusLife_JailHud",displayNull];
3 cutRsc ["AnzusLife_JailHud","PLAIN"];

["JAILHUD_HANDLE", "onEachFrame", {
	params [["_copName","",[""]]];

	private _display = uiNamespace getVariable ["AnzusLife_JailHud",displayNull];
    private _formatTime = [(round(life_releaseTime - time)), "MM:SS", false] call BIS_fnc_secondsToString;
	private _ctrlTextTitle = _display displayCtrl 20;
	private _ctrlTextReason = _display displayCtrl 21;
	private _ctrlTextTimeLeft = _display displayCtrl 22;

	_ctrlTextTitle ctrlSetText "Arrested at Metro State Correctional Facility";
	_ctrlTextReason ctrlSetText format ["You were arrested by %1",_copName];
    _ctrlTextTimeLeft ctrlSetText _formatTime;
}, [_copName]] call BIS_fnc_addStackedEventHandler;

[] spawn {
    while {true} do {
        uisleep (5 * 60);
        if (!life_is_arrested) exitWith {};
        [player] remoteExec ["ANZUS_fnc_jailSaveTime",2];
    };
};

while {true} do {
    if (([player] call ANZUS_fnc_playerInBuilding) && isSprintAllowed player) then {
        player allowSprint false;
    } else {
        player allowSprint true;
    };

    _dist = (player distance (getMarkerPos "jail_marker"));
    
    if (_dist > 100) then {
        EM_enable = [true, true];
    } else {
        EM_enable = [true, false];
    };

    if( _dist >= 200) exitWith {
        _esc = true;
    };

    if(life_bail_paid) exitWith {
        _bail = true;
    };
    
    if((round(life_releaseTime - time)) < 1) exitWith {};
    if(!alive player && ((round(life_releaseTime - time)) > 0)) exitWith {};
    if (life_arrest_parole) exitWith {};
    sleep 1;
};


switch (true) do {
    case (_bail): {
        life_is_arrested = false;
        player setVariable ["arrested", false, true];
        life_bail_paid = false;
        [localize "STR_Jail_Paid",true,"slow"] call ANZUS_fnc_notificationSystem;

        player setPosATL (getArray(_myJailRelease >> "positionATL"));
        player setDir (getNumber(_myJailRelease >> "direction"));
        [5] call ANZUS_fnc_updatePartial;
        
        3 cutFadeOut 1;
        ["JAILHUD_HANDLE", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    };
    
    case (_esc): {
        life_is_arrested = false;
        player setVariable ["arrested", false, true];
        [localize "STR_Jail_EscapeSelf",true,"slow"] call ANZUS_fnc_notificationSystem;
        
        if (!isNil {(group player) getVariable ["gang_name",""]}) then {
            _gangrole = (group player) getVariable ["gang_role",[]];
            if (_gangrole isEqualTo []) exitWith {};
                
            _gangselect = _gangrole select 0;
            if (_gangselect != 0) then {
                _task = "Breaking Free";
                _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
                if (!_check) then {[_task] remoteExec ["AnzusLife_UnlockTask",2];};
            };
        };
        [5] call ANZUS_fnc_updatePartial;

        3 cutFadeOut 1;
        ["JAILHUD_HANDLE", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    };

    case (life_arrest_parole): {
        life_is_arrested = false;
        player setVariable ["arrested", false, true];
        [localize "STR_Jail_Released",true,"slow"] call ANZUS_fnc_notificationSystem;
        ["JAILHUD_HANDLE", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    };
    
    case (alive player && !_esc && !_bail): {
        life_is_arrested = false;
        player setVariable ["arrested", false, true];
        [localize "STR_Jail_Released",true,"slow"] call ANZUS_fnc_notificationSystem;
        
        player setPosATL (getArray(_myJailRelease >> "positionATL"));
        player setDir (getNumber(_myJailRelease >> "direction"));
        [5] call ANZUS_fnc_updatePartial;

        3 cutFadeOut 1;
        ["JAILHUD_HANDLE", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    };
};

EM_climbing = false;
EM_enable = [true, true];
EM_heightsOn = [0.25,1,2,2.25,3];
player setVariable ["restrained",false,true];
[false,"shank",ITEM_VALUE("shank"),"jail"] call ANZUS_fnc_handleInv;