["AnzusLife_TakeHostage",{
	private ["_target","_ehFired","_ehReload"];
    _target = param [0,objNull];

    if (!(isPlayer _target)) exitwith {["Target is not a valid player.",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if ((handgunWeapon player isEqualTo "") OR ((handgunWeapon player) IN ["TR8_Mining_Drill"])) exitwith {["You are not carrying a harmful weapon.",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if (!isNil "AnzusLife_EnableHostage") exitwith {["You already have someone hostage.",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if (player getVariable ['inHostage',false] isEqualto true || cursorObject getVariable ['inHostage',false] isEqualto true) exitWith {};

    player setVariable ["inHostage",true,true];
    _target setVariable ["inHostage",true,true];
    [] spawn AnzusLife_ForceWalkHostage;
    AnzusLife_EnableHostage = true;
    AnzusLife_HostageMode = "hostage";
    AnzusLife_HostageTarget = _target;
    AnzusLife_HostageReloading = false;

    if (!isNil {(group player) getVariable ["gang_name",""]}) then {
        _gangrole = (group player) getVariable ["gang_role",[]];
        if (_gangrole isEqualTo []) exitWith {};
            
        _gangselect = _gangrole select 0;
        if (_gangselect != 0) then {
            _task = "Armed Detainment";
            _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
            if (!_check) then {[_task] remoteExec ["AnzusLife_UnlockTask",2];};
        };
    };

    _ehFired = player addEventHandler ["Fired",
    {
        if (AnzusLife_HostageMode isEqualTo "hostage") exitwith
        {
            if ((!isNull AnzusLife_HostageTarget) && ((handgunWeapon player) != "crow_x26" || "crow_x26_blk_yellow" || "crow_x26_yellow" || "crow_x26_green") && AnzusLife_EnableHostage) then {[player] remoteExec ["AnzusLife_KillHostage", _target]};

            AnzusLife_EnableHostage = false;
        };
    }];

    _ehReload = (findDisplay 46) displayAddEventHandler ["KeyDown",
    {
        if ((_this select 1) in actionKeys "ReloadMagazine") then
        {
            [] spawn
            {
                AnzusLife_HostageReloading = true;
                uiSleep 3.5;
                if (!isNil "AnzusLife_HostageReloading") then {AnzusLife_HostageReloading = false};
            };
            false;
        };
    }];

    player playAction "gesture_takehostage";
    [_target,"AL_TakenHostage"] remoteExecCall ["ANZUS_fnc_animSync",-2];
    _target attachto [player,[-0.05,0.2,-0.02]];
    uiSleep 2;

    while {AnzusLife_EnableHostage} do 
    {
        if (AnzusLife_HostageMode isEqualTo "hostage" && !AnzusLife_HostageReloading) then { player playAction "gesture_takehostageloop"; };
        if (AnzusLife_HostageMode isEqualTo "shoot" && !AnzusLife_HostageReloading) then { player playAction "gesture_takehostageshootloop"; };
        uiSleep 2;
        if ((isNull AnzusLife_HostageTarget) OR (_target getVariable "life_is_alive" isEqualTo false) OR (player getVariable "life_is_alive" isEqualTo false) OR !(isNull (objectParent player)) OR !(isNull (objectParent AnzusLife_HostageTarget))) exitwith {};
    };

    player playaction "gesture_stop";
    player removeEventHandler ["Fired",_ehFired];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown",_ehReload];
    [player,"AL_ReleaseHostage"] remoteExecCall ["ANZUS_fnc_animSync",-2];
	[_target,"AL_ReleasedHostage"] remoteExecCall ["ANZUS_fnc_animSync",-2];
	sleep 2;
    detach _target;
	[_target,""] remoteExecCall ["ANZUS_fnc_animSync",-2];
    [player,""] remoteExecCall ["ANZUS_fnc_animSync",-2];
    player setVariable ["inHostage",false,true];
    _target setVariable ["inHostage",false,true];

    AnzusLife_EnableHostage = nil; AnzusLife_HostageMode = nil; AnzusLife_HostageTarget = nil; AnzusLife_HostageReloading = nil;
}] call AnzusLife_ClientCompile;

["AnzusLife_KillHostage",{
    params [["_player",objNull,[objNull]]];

    if (!isRemoteExecuted) exitWith {};
    if (player getVariable ["inHostage",false] isEqualTo false) exitWith {["Not in hostage mode!",true,"slow"] call ANZUS_fnc_notificationSystem;}; 
    if (damage _player isEqualTo 1) exitWith {};

    player setHit ["head",1];
    [_player] call ANZUS_fnc_writeDeathScreen;
}] call AnzusLife_ClientCompile;

["AnzusLife_ForceWalkHostage",{
    if (isNil "AnzusLife_EnableHostage") exitWith {};
  
    while {AnzusLife_EnableHostage} do {
        player forceWalk true;
    };
}] call AnzusLife_ClientCompile;

["AnzusLife_TazedGangPerk", {
    _gangrole = (group player) getVariable ["gang_role",[]];
    if (_gangrole isEqualTo []) exitWith {};
        
    _gangselect = _gangrole select 0;
    if (_gangselect != 0) then {
        _task = "High Voltage";
        _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
        if (!_check) then {[_task] remoteExec ["AnzusLife_UnlockTask",2];};
    };
}] call AnzusLife_ClientCompile;