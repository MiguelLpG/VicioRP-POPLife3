#include "..\..\script_macros.hpp"
/*
*	File: fn_keyHandler.sqf
*	Author: Bryan "Tonic" Boardwine
*
*	Description:
*	Main key handler for event 'keyDown'.
*/
private ["_handled","_veh","_locked","_interactionKey","_interruptionKeys"];
params [
	"_ctrl",
	"_code",
	"_shift",
	"_ctrlKey",
	"_alt"
];
_speed = speed cursorObject;
_handled = false;

_interactionKey = if ((actionKeys "User10") isEqualTo []) then {219} else {(actionKeys "User10") select 0};
_custompickupKey = if ((actionKeys "User9") isEqualto []) then {33} else {(actionKeys "User9") select 0};

_interruptionKeys = [17,30,31,32]; //A,S,W,D

if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Crouch") || _code in (actionKeys "Prone") || _code in (actionKeys "MoveDown") || _code in (actionKeys "MoveUp") || _code in [16,18]) && ((player getVariable ["playerSurrender",false]) || life_isknocked || life_istazed || (player getVariable ["inHostage",false]))) exitWith {
	true;
};

if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in [16,18]) && (player getVariable ["restrained",false])) exitWith {
	true;
};

if(_code in (actionKeys "nextWeapon") && (player getVariable ["playerSurrender",false] || player getVariable ["restrained",false])) exitWith {
	true;
};

if (_code in (actionKeys "User8")) exitWith {
	[] call ANZUS_fnc_markerMenu;
};

if (_ctrlKey) then {
	if (_code == 0x04 && playerSide == west) then {
		_handgun = (currentWeapon player == handgunWeapon player);	

		_current = handgunWeapon player;

		if (!_handgun && _current != "") exitWith { ["You can only store handguns on your belt.",true,"slow"] call ANZUS_fnc_notificationSystem; };
		if (_current == "" && life_belt_storedWeapon == "") exitWith { ["You do not have any handguns to store on your belt.",true,"slow"] call ANZUS_fnc_notificationSystem; };

		if (time - life_belt_lastSwitched < 2) exitWith {};

		life_belt_lastSwitched = time;

		if (life_belt_storedWeapon == "") then {
			life_belt_storedWeapon = _current;

			_ammo = player ammo (currentMuzzle player);
			if (_ammo > 0) then {
				_mag = currentMagazine player;
				if (_mag != "") then {
					player addMagazine [_mag, _ammo];
				};
			};

			player removeWeapon _current;

			["Your weapon has been stored on your belt.",true,"slow"] call ANZUS_fnc_notificationSystem;
		} else {
			_old = life_belt_storedWeapon;
			life_belt_storedWeapon = _current;

			_ammo = player ammo (currentMuzzle player);
			if (_ammo > 0) then {
				_mag = currentMagazine player;
				if (_mag != "") then {
					player addMagazine [_mag, _ammo];
				};
			};

			player removeWeapon _current;
			player playMove "amovpercmstpsnonwnondnon";
			player addWeapon _old;
			player selectWeapon _old;
		
			["Your weapon has been switched from your belt.",true,"slow"] call ANZUS_fnc_notificationSystem;
		};
	};
};


if (life_action_inUse) exitWith {
	if (!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!((actionKeys "User9") isEqualTo []) && {(inputAction "User9" > 0)}) exitWith {
	if (!life_action_inUse) then {
		[] spawn {
			private "_handle";
			_handle = [] spawn ANZUS_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

if (life_container_active) exitwith {
	//ignore movement actions
	private _allowedMoves = [
		"MoveForward",
		"MoveBack",
		"TurnLeft",
		"TurnRight",
		"MoveFastForward",
		"MoveSlowForward",
		"turbo",
		"TurboToggle",
		"MoveLeft",
		"MoveRight",
		"WalkRunTemp",
		"WalkRunToggle",
		"AdjustUp",
		"AdjustDown",
		"AdjustLeft",
		"AdjustRight",
		"Stand",
		"Crouch",
		"Prone",
		"MoveUp",
		"MoveDown",
		"LeanLeft",
		"LeanLeftToggle",
		"LeanRight",
		"LeanRightToggle"
	];
	if (({_code in (actionKeys _x)} count _allowedMoves) > 0) exitwith {
		false;
	};
	//handle other keys
	if (_code isEqualTo 57) then {//space key -> place
		life_storagePlacing = 0 spawn ANZUS_fnc_placestorage;
	} else { //other keys -> abort
		if (!isNull life_storagePlacing) exitWith {}; //already placing down a box
		if (!isNull life_container_activeObj) then {
			deleteVehicle life_container_activeObj;
			titleText [localize "STR_NOTF_PlaceContainerAbort", "PLAIN"];
		};
		life_container_active = false;
	};
	true;
};

switch (_code) do {
	// -- Disable commander/tactical view
	if (MAIN_SETTINGS_TYPE(getNumber,"GameSettings","disableCommanderView") isEqualTo 1 && call(life_adminlevel) < 1) then {
		private _CommandMode = actionKeys "tacticalView";

		if (_code in _CommandMode) then {
			[localize "STR_NOTF_CommanderView",true,"slow"] call ANZUS_fnc_notificationSystem;
			_handled = true;
		};
	};

	//Shift + -
	case 74: {
		if (_shift) then {
			if (!userInputDisabled) then {
				disableUserInput true;
				disableUserInput false;
				_handled = true;
			};
			true;
		};
	};

	//Surrender (Shift + B)
	case 48: {
		if (_shift) then {
			if (player getVariable ["playerSurrender",false]) then {
				[] spawn ANZUS_fnc_surrender;
			} else {
				if (!(currentWeapon player isEqualTo "")) exitWith {["Holster your gun before surrendering",true,"slow"] call ANZUS_fnc_notificationSystem};
				[] spawn ANZUS_fnc_surrender;
			};
			_handled = true;
		};
	};

	//Radar
	case 19: {
		if(!_shift && !(isNull (objectParent player)) && playerSide isEqualTo WEST && alive player && cursorObject isKindOf "Car") then {
			_ownerInfo = cursorObject getVariable ["vehicle_info_owners",[]];
			_owner = "Unknown";
			if (count _ownerInfo > 0) then {
				_uid = (_ownerInfo select 0) select 0;
				_plrs = allPlayers select {getPlayerUID _x isEqualTo _uid};
				if (count _plrs > 0) then {
					_owner = name (_plrs select 0);
				};
			};

			[parsetext format
				["<t color='#E59400'>***<t color='#00acfc'>Radar<t color='#E59400'>***<br/><t color='#00acfc'>Target: <t color='#E59400'>%1<br/><t color='#E59400'>  -<br/><t color='#00acfc'>Registered to: <t color='#E59400'>%3<br/><t color='#E59400'>  -<br/><t color='#00acfc'>Speed: <t color='#E59400'>%2",
				getText(configFile >> "CfgVehicles" >> (typeof cursorObject) >> "displayname"),
				round (speed cursorObject),
				_owner],
				true,"slow"]
			call ANZUS_fnc_notificationSystem;
		};
		if (_shift) then {_handled = true;};
		if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} &&  {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {speed cursorObject < 1}) then {
			[] call ANZUS_fnc_restrainAction;
		};
	};

	//Holster / recall weapon. (Shift + H)
	case 35: {

		if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};

		if ((player getVariable ["restrained",false])) exitWith {["You are restrained, you can not do that!",true,"slow"] call ANZUS_fnc_notificationSystem; _handled = true;};

		if (!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(life_curWep_h isEqualTo "")}) then {
			if (life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};

	case 57: {
		if (!isNull life_spikestrip && isNull (objectParent player)) then {
			detach life_spikeStrip; life_spikeStrip = objNull;
		};
	};

	//Bandage
	case 11: {
		if (_shift) then {
			[] spawn ANZUS_fnc_bandage;
		};
	};

	//Action Key Handler
	case _custompickupKey: {
		if (!life_action_inUse) then {
			[] spawn  {
				private "_handle";
				_handle = [] spawn ANZUS_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	//Interaction Key
	case _interactionKey: {
		if(player getVariable "life_is_alive" isEqualTo true) then {
			[] call AnzusLife_LoadInteraction;
		};
	};

	//Restraining (Shift + R)
	case 19: {
		if (_shift) then {_handled = true;};
		if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {speed cursorObject < 2} && {!(player getVariable 'restrained')}) then {
			[] call ANZUS_fnc_restrainAction;
		};
	};

	//Knock out, this is experimental and yeah... (Shift + G)
	case 34: {
		if(_shift) then {_handled = true;};
		if (_shift && playerSide isEqualTo civilian && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4) then {
			if ((animationState cursorObject) != "Incapacitated" && !life_knockout && !(player getVariable ["restrained",false]) && !life_istazed && !life_isknocked) then {
				[cursorObject] spawn ANZUS_fnc_knockoutAction;	
			};
		};

		if(_shift && !isNull cursorObject && cursorTarget isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 3 && isNull(objectParent player)) then
		{
			if((animationState cursorObject) != "Incapacitated" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed && (stance player) != "PRONE") then
			{
				if(playerSide isEqualTo west) then {
					[cursorObject] spawn ANZUS_fnc_tackleAction;
				};
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if (!_alt && {!_ctrlKey} && {!dialog} && {!life_action_inUse} && {!(player getVariable ["playerSurrender",false])} && {!(player getVariable ["restrained",false])} && {!life_isknocked} && {!life_istazed}) then {
			if (!(isNull objectParent player) && alive (objectParent player)) then {
				if ((objectParent player) in life_vehicles) then {
					if (time - life_trunkTimer > 5) then {
						life_trunkTimer = time;
						[vehicle player, player] remoteExecCall ["AnzusLife_AC_OpenTrunk", 2]; 
					} else {
						["You have recently closed your trunk, please wait 5 seconds before doing again.",true,"slow"] call ANZUS_fnc_notificationSystem;
					};
				};
			} else {
				private "_list";
				_list = (nearestObjects [player,["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5]) select 0;
				if (!(isNil "_list")) then {
					_house = nearestObject [(ASLtoATL (getPosASL _list)), "House"];
					if (_house getVariable ["locked", false] && (_house getVariable "house_owner" select 0) != getPlayerUID player) then {
						[localize "STR_House_ContainerDeny",true,"slow"] call ANZUS_fnc_notificationSystem;
					} else {
						if (time - life_trunkTimer > 5) then {
							life_trunkTimer = time;
							[_list, player] remoteExecCall ["AnzusLife_AC_OpenTrunk", 2]; 
						} else {
							["You have recently closed your trunk, please wait 5 seconds before doing again.",true,"slow"] call ANZUS_fnc_notificationSystem;
						};
					};
				} else {
					_list = ["landVehicle","Air","Ship"];
					if (KINDOF_ARRAY(cursorObject,_list) && {player distance cursorObject < 7} && {isNull objectParent player} && {alive cursorObject} && {!life_action_inUse}) then {
						if (cursorObject in life_vehicles || {locked cursorObject isEqualTo 0}) then {
							if (time - life_trunkTimer > 5) then {
								life_trunkTimer = time;
								[cursorObject, player] remoteExecCall ["AnzusLife_AC_OpenTrunk", 2]; 
							} else {
								["You have recently closed your trunk, please wait 5 seconds before doing again.",true,"slow"] call ANZUS_fnc_notificationSystem;
							};
						};
					} else {
						if ((typeOf cursorObject) isEqualTo "Land_WoodenCrate_01_F" && cursorTarget getVariable ["AnzusLife_HouseRobberyCrate",false] && cursorObject getVariable ["AnzusLife_HouseRobberyCrateRobbed",false]) then {
							if (time - life_trunkTimer > 5) then {
								life_trunkTimer = time;
								[cursorObject, player] remoteExecCall ["AnzusLife_AC_OpenTrunk", 2];
							} else {
								["You have recently closed your trunk, please wait 5 seconds before doing again.",true,"slow"] call ANZUS_fnc_notificationSystem;
							};
						} else {
							if ((typeOf cursorObject) isEqualTo "B_CargoNet_01_ammo_F" ) then {
								_type = "";
								if ((vehicleVarName cursorObject) == "CartelStorageBox") then {
									_type = "Cartel";
								} else {
									_type = "Mafia";
								};
								_group = [_type] call AnzusLife_Lib_GetGroup;
								if !(_group isEqualTo (group player)) exitWith {[format ["You are not a member of the %1, capture the base to access!",_type],true,"slow"] call ANZUS_fnc_notificationSystem;};
								if (time - life_trunkTimer > 5) then {
									life_trunkTimer = time;
									[cursorObject, player] remoteExecCall ["AnzusLife_AC_OpenTrunk", 2];
								} else {
									["You have recently closed your trunk, please wait 5 seconds before doing again.",true,"slow"] call ANZUS_fnc_notificationSystem;
								};
							} else {
								if ((typeOf cursorObject) isEqualTo "Land_CargoBox_V1_F") then {
									if (time - life_trunkTimer > 5) then {
										life_trunkTimer = time;
										[cursorObject, player] remoteExecCall ["AnzusLife_AC_OpenTrunk", 2];
									} else {
										["You have recently closed your trunk, please wait 5 seconds before doing again.",true,"slow"] call ANZUS_fnc_notificationSystem;
									};
								};
							};
						};
					};
				};
			};
		};
		if(_shift && !_alt && !_ctrlKey) then {
			if (!isNull life_spikestrip) exitWith {[localize "STR_ISTR_SpikesDeployment",true,"slow"] call ANZUS_fnc_notificationSystem;};
			if(([false,"spikeStrip",1,"spike"] call ANZUS_fnc_handleInv)) then
			{
				[] spawn ANZUS_fnc_spikeStrip;
			};
		};
		if(!_shift && !_alt && _ctrlKey && playerSide isEqualTo west) then {
			[] call ANZUS_fnc_openThreatMenu;
		};
	};

	//Y Player Menu
	case 21: {
		if (!_alt && !_ctrlKey && !_shift && !dialog && !(player getVariable ["restrained",false]) && {!life_action_inUse}) then {
			if (!(player getVariable ['playerSurrender', false]) && player getVariable ["life_is_alive",false]) then {
				[] call ANZUS_fnc_openPSIPhone;
			};
		};
	};

	//Quickbar
	case 4: {
		if(!_shift && !_alt && !_ctrlKey) then {
			if (isNull (uiNamespace getVariable ["AnzusLife_Phone",displayNull])) then {
				["usar",4] call ANZUS_fnc_quickBar;
			} else {
				["set",4] call ANZUS_fnc_quickBar;
			};
		};
	};
	case 5: {
		if(!_shift && !_alt && !_ctrlKey) then {	
			if (isNull (uiNamespace getVariable ["AnzusLife_Phone",displayNull])) then {
				["usar",5] call ANZUS_fnc_quickBar;
			} else {
				["set",5] call ANZUS_fnc_quickBar;
			};
		};
	};
	case 6: {
		if(!_shift && !_alt && !_ctrlKey) then {
			if (isNull (uiNamespace getVariable ["AnzusLife_Phone",displayNull])) then {
				["usar",6] call ANZUS_fnc_quickBar;
			} else {
				["set",6] call ANZUS_fnc_quickBar;
			};
		};
	};
	case 7: {
		if(!_shift && !_alt && !_ctrlKey) then {
			if (isNull (uiNamespace getVariable ["AnzusLife_Phone",displayNull])) then {
				["usar",7] call ANZUS_fnc_quickBar;
			} else {
				["set",7] call ANZUS_fnc_quickBar;
			};
		};
	};
	case 8: {
		if(!_shift && !_alt && !_ctrlKey) then {
			if (isNull (uiNamespace getVariable ["AnzusLife_Phone",displayNull])) then {
				["usar",8] call ANZUS_fnc_quickBar;
			} else {
				["set",8] call ANZUS_fnc_quickBar;
			};
		};
	};
	//Sync Data
	case 9: {
		if (_shift) then {
			[] spawn ANZUS_fnc_syncdata;
		};
		if(!_shift && !_alt && !_ctrlKey) then {
			if (isNull (uiNamespace getVariable ["AnzusLife_Phone",displayNull])) then {
				["usar",9] call ANZUS_fnc_quickBar;
			} else {
				["set",9] call ANZUS_fnc_quickBar;
			};
		};
	};
	case 10: {
		if(!_shift && !_alt && !_ctrlKey) then {
			if (isNull (uiNamespace getVariable ["AnzusLife_Phone",displayNull])) then {
				["usar",10] call ANZUS_fnc_quickBar;
			} else {
				["set",10] call ANZUS_fnc_quickBar;
			};
		};
	};

	//Panic Button
	case 25: {
		if (_shift) then {
			if (playerSide != west) exitWith {};
			if (player getVariable "life_is_alive" isEqualTo true) then {
				if(ITEM_VALUE("panicbutton") > 0) then {
					[] spawn ANZUS_fnc_callbackup;
				} else {
					["You do not have a panic button on you, buy one in the item store.",true,"slow"] call ANZUS_fnc_notificationSystem;
				};
			} else {
				[format["%1/%2 just declared a major crime at %3 (%4)",(name player),(getPlayerUID player),mapGridPosition player, serverTime], "majors.log"] remoteExec ["AH_LogInterface",2];
				missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];
				["You declared this situation as a major crime.",true,"slow"] call ANZUS_fnc_notificationSystem;
			};
		};
	};

	//luces solas (1)
	case 2: {
		if (playerSide in [west,independent] && {!(isNull(objectParent player))} && {!life_siren_active} && {((driver (objectParent player)) == player)}) then {
			_veh = objectParent player;

			if (isNil {_veh getVariable "vehLightBar"}) then {_veh setVariable ["vehLightBar",false,true];};

			if ((_veh getVariable "vehLightBar")) then {
				vehicle player animateSource["Lightbar", 0];
				_veh setVariable ["vehLightBar",false,true];
			} else {
				_veh setVariable ["vehLightBar",true,true];
				vehicle player animateSource["Lightbar", 1];
			};
		};
	};

	//Sirens + luces (2)
	case 3: {
		if (playerSide in [west,independent] && {!(isNull(objectParent player))} && {!life_siren_active} && {((driver (objectParent player)) == player)}) then {
			[] spawn {
				life_siren_active = true;
				sleep 5.16;
				life_siren_active = false;
			};

			_veh = objectParent player;
			if (isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
			if ((_veh getVariable "siren")) then {
				vehicle player animateSource["Lightbar", 0];
				_veh setVariable ["siren",false,true];
			} else {
				_veh setVariable ["siren",true,true];
				if (playerSide isEqualTo west) then {
					[_veh] remoteExec ["ANZUS_fnc_copSiren",RCLIENT]; 
					vehicle player animateSource["Lightbar", 1];
				} else {
					[_veh] remoteExec ["ANZUS_fnc_medicSiren",RCLIENT];
				};
			};
		};
	};

	//O Key
	case 24:{
		if(_shift) then {
			switch (player getVariable["Earplugs",0]) do {
				case 0: {["Ear Plugs 90%",true,"slow"] call ANZUS_fnc_notificationSystem; life_fadeSound = true; call ANZUS_fnc_hudUpdate; 1 fadeSound 0.1; player setVariable ["Earplugs", 10];
				};
				case 10: {["Ear Plugs 60%",true,"slow"] call ANZUS_fnc_notificationSystem; life_fadeSound = true; call ANZUS_fnc_hudUpdate; 1 fadeSound 0.4; player setVariable ["Earplugs", 40];
				};
				case 40: {["Ear Plugs 30%",true,"slow"] call ANZUS_fnc_notificationSystem; life_fadeSound = true; call ANZUS_fnc_hudUpdate; 1 fadeSound 0.7; player setVariable ["Earplugs", 70];
				};
				case 70: {["Ear Plugs Removed",true,"slow"] call ANZUS_fnc_notificationSystem; life_fadeSound = false; call ANZUS_fnc_hudUpdate; 1 fadeSound 1; player setVariable ["Earplugs", 0];
				};
			};
		};
	};

	//F1 Key
	case 59:{
		if !(player getVariable ["life_is_alive", true]) then {
			if (isNull(player getVariable ["Reviving", objNull]) && ((diag_tickTime - AnzusLife_BleedoutStart) > AnzusLife_BleedoutDuration)) then {
				life_respawned = true;
				[] call ANZUS_fnc_spawnMenu;

				1 cutFadeOut 1;
				["AnzusLife_Bleedout_efHandle", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				AnzusLife_BleedoutStart = nil;
				AnzusLife_BleedoutDuration = nil;
				AnzusLife_Bleedout_efHandle = nil;
			};
		} else {
			if(_shift && (playerSide isEqualTo WEST || playerSide isEqualTo independent)) then {
			call ANZUS_fnc_setFreq;
			};
		};
	};

	// V key
	case 0x2F: {
		if (!isNull (objectParent player) && life_disable_getOut) then {
			_handled = true;
		};
	};

	//U Key
	case 22: {
		if (!_alt && !_ctrlKey) then {
			if (isNull objectParent player) then {
				_veh = cursorObject;
			} else {
				_veh = objectParent player;
			};

			if (_veh isKindOf "House_F" && {playerSide isEqualTo civilian}) then {
				if (_veh in life_vehicles && {player distance _veh < 20}) then {
					_door = [_veh] call ANZUS_fnc_nearestDoor;
					if (_door isEqualTo 0) exitWith {[localize "STR_House_Door_NotNear",true,"slow"] call ANZUS_fnc_notificationSystem;};
					_locked = _veh getVariable [format ["bis_disabled_Door_%1",_door],0];

					if (_locked isEqualTo 0) then {
						_veh setVariable [format ["bis_disabled_Door_%1",_door],1,true];
						_veh animateSource [format ["Door_%1_source", _door], 0];
						[localize "STR_House_Door_Lock",true,"slow"] call ANZUS_fnc_notificationSystem;
						player playAction "Gesture_key";
					} else {
						_veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
						_veh animateSource [format ["Door_%1_source", _door], 1];
						[localize "STR_House_Door_Unlock",true,"slow"] call ANZUS_fnc_notificationSystem;
						player playAction "Gesture_key";
					};
				};
			} else {
				_locked = locked _veh;
				if (_veh in life_vehicles && {player distance _veh < 20}) then {
					if (_locked isEqualTo 2) then {
						if (local _veh) then {
							_veh lock 0;
						} else {
							[_veh,0] remoteExecCall ["ANZUS_fnc_lockVehicle",_veh];
						};
						[localize "STR_MISC_VehUnlock",true,"slow"] call ANZUS_fnc_notificationSystem;
						[_veh,"carlockunlock",50,1] remoteexeccall ["say3D",-2];
						player playAction "Gesture_key";
					} else {
						if (local _veh) then {
							_veh lock 2;
						} else {
							[_veh,2] remoteExecCall ["ANZUS_fnc_lockVehicle",_veh];
						};
						[localize "STR_MISC_VehLock",true,"slow"] call ANZUS_fnc_notificationSystem;
						[_veh,"carlockunlock",50,1] remoteexeccall ["say3D",-2];
						player playAction "Gesture_key";
					};
				};
			};
		};
	};
};

_handled;
