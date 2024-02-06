#include "\life_server\script_macros.hpp"

_eventSetting = MAIN_SETTINGS("Events","SupplyCrate");
if (getNumber(_eventSetting >> "enable_supplyCrate") isEqualTo 0) exitWith {};

missionInProgress = false;

// minimum & maximum time between missions in minutes
_minTime = getNumber(_eventSetting >> "supply_minTime");
_maxTime = getNumber(_eventSetting >> "supply_maxTime");

if (isNil "ServerRE") then {
	ServerRE = {
		params ["_code", "_id"];
		if(_code isEqualType '') then {
			_code = compile _code;
		};

		[[],_code] remoteExecCall ['call', _id]
	};
};

getPosition = {
	_pos = [
		nil,
		["water"],
		{
			_nearbyLocations = nearestLocations [_this, ["NameCity","NameCityCapital", "NameVillage", "NameLocal", "Airport"], 500];
			((count _nearbyLocations) isEqualTo 0)
		}
	] call BIS_fnc_randomPos;
	_pos
};

getWeaponMagazine = {
	params["_weapon"];
	_magazine = ( getArray ( configFile >> "CfgWeapons" >> _weapon >> "magazines" )) select 0;
	_magazine;
};

getRandMinutes = {  
	params["_minutesMin", "_minutesMax"];
	_minutesMin = _minutesMin * 60;
	_minutesMax = _minutesMax * 60;
	_med = _minutesMax - _minutesMin; 
	_med = _med / 2; 
	_med = _minutesMin + _med;
	_ret = random[_minutesMin, _med, _minutesMax];  
	_ret  
};  


generateMission = {
	params["_pos"];
	_eventSetting = MAIN_SETTINGS("Events","SupplyCrate");
	_maxWeapons = getNumber(_eventSetting >> "supply_maxWeapons");

	_markerName = format["weapon_mis_%1",(str random 9999999)];
	_marker = createMarker[_markerName, _pos];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [300,300];

	_txtMrk = createMarker[(_markerName + "1"), _pos];
	_txtMrk setMarkerType "mil_dot";
	_txtMrk setMarkerText "Weapons cache";

	missionInProgress = true;
	
	missionMarkers = [];
	missionMarkers pushBack _markerName;

	_script = '["A weapons cache mission has started and the crate will drop in 5 minutes! Check your map for the location!",true,"slow"] call ANZUS_fnc_notificationSystem;';
	[_script, -2] call ServerRE;

	uiSleep 300;
	
	_safePos = [_pos, 0, 100, 2] call BIS_fnc_findSafePos;
	_safePos set[2, 300];

	_crate = createVehicle ["C_IDAP_supplyCrate_F", [0,0,300], [], 0, "CAN_COLLIDE"];
	_crate setPosATL _safePos;
	_para = createVehicle ["O_Parachute_02_F", [0,0,300], [], 0, "CAN_COLLIDE"];
	_para setPosATL _safePos;


	_crate attachTo [_para,[0,0,0]];
	_crate setDir 90;
	clearWeaponCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;

	[_crate, _para] spawn {
		params["_crate", "_para"];
		waitUntil {(getPos _crate select 2) < 2};
		detach _crate;

		_pos = getPos _crate;
		_crate setPos [_pos select 0, _pos select 1, 0.5];

		uiSleep 5;
		if (!isNull _para) then {
			deleteVehicle _para;
		};

		_isWater = surfaceIsWater (getPos missionCrate);
		if (_isWater) then {
			deleteVehicle missionCrate;
			missionCrate = nil;
			missionInProgress = false;

			{
				deleteMarker _x;
				deleteMarker (_x + "1");
			} foreach missionMarkers;

			["Crate has landed in water, spawning new crate..",true,"slow"] call ANZUS_fnc_notificationSystem;

			_pos = call getPosition;
			[_pos] spawn generateMission;
		} else {
			createVehicle ["Smokeshellpurple", _pos, [], 0, "CAN_COLLIDE"];
		};
	};

	_crate setVariable ["isMissionCrate", true, true];
	missionCrate = _crate;
	publicVariable "missionCrate";
	clearItemCargoGlobal _crate;

	_weaponCount = random _maxWeapons;
	if (_weaponCount < 1) then {
		_weaponCount = 1;
	};

	for "_i" from 1 to (round _weaponCount) do {
		_spawnWeapons = getArray(_eventSetting >> "supply_weapons");
		_spawnItems = getArray(_eventSetting >> "supply_items");

		_itemCount = count(_spawnWeapons);
		_item = selectRandomWeighted _spawnWeapons;
		_attachments = [];

		if (_item isEqualType []) then {
			_attachments = _item select 1;
			_item = _item select 0;
		};
		_mag = [_item] call getWeaponMagazine;

		_crate addItemCargoGlobal [_item, 1];
		_crate addItemCargoGlobal [selectRandom _spawnItems, 1];
		{
			_crate addItemCargoGlobal [_x, 1];
		} foreach _attachments;
		_crate addItemCargoGlobal [_mag, random[9, 11, 13]];
	};

	_script = '
		["The weapon mission crate has dropped with a parachute within the circle!",true,"slow"] call ANZUS_fnc_notificationSystem;

		if (!isNil "missionCrate") then {
			if (typeName missionCrate == "OBJECT") then {
				missionCrate addEventHandler["ContainerOpened", {
					missionCrateReached = true;
					publicVariableServer "missionCrateReached";
				}];
			};
		};
	';
	[_script, -2] call ServerRE;
};

// someone has opened the crate, end mission
"missionCrateReached" addPublicVariableEventHandler {
	// prevent this being triggered multiple times
	if (!missionInProgress) exitWith {};
	missionInProgress = false;

	[] spawn {
		// two options for this: either sleep 30 secs and get multiple EH pub vars
		// or call RE instantly and sleep 30 sec on all clients, requires extra thread on everyone
		uiSleep 30;

		{
			deleteMarker _x;
			deleteMarker (_x + "1");
		} foreach missionMarkers;

		_script = '
			["Players have secured the weapons cache!",true,"slow"] call ANZUS_fnc_notificationSystem;

			if (!isNil "missionCrate") then {
				if (typeName missionCrate == "OBJECT") then {
					missionCrate removeAllEventHandlers "ContainerOpened";
				};
			};
		';
		[_script, -2] call ServerRE;

		sleep 300;
		deleteVehicle missionCrate;
		missionCrate = nil;
	};
};


[_minTime,_maxTime] spawn {
	params [["_minTime",0,[0]],["_maxTime",0,[0]]];
	
	// minutes sleep between missions
	_minMax = [_minTime, _maxTime];
	_sleepDuration = _minMax call getRandMinutes;
	while {true} do {
		waitUntil {uiSleep 1; !missionInProgress;};
		uiSleep _sleepDuration;

		_pos = call getPosition;
		[_pos] spawn generateMission;

		_sleepDuration = _minMax call getRandMinutes;
	};
};