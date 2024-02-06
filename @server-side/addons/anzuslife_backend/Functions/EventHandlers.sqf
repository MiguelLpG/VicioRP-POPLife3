#include "\life_server\script_macros.hpp"

["AnzusLife_EventHandlers",{
	waitUntil {!isNull player};

	player addEventHandler ["Killed", {_this call ANZUS_fnc_onPlayerKilled}];
	player addEventHandler ["HandleDamage", {_this call ANZUS_fnc_handleDamage}];
	player addEventHandler ["Respawn", {_this call ANZUS_fnc_onPlayerRespawn}];
	player addEventHandler ["Fired", {_this spawn ANZUS_Eventhandler_Fired;}];
	player addEventHandler ["FiredNear", {_this call ANZUS_fnc_antiCombatRevive}];
	player addEventHandler ["InventoryClosed", {_this call ANZUS_fnc_inventoryClosed}];
	player addEventHandler ["InventoryOpened", {_this call ANZUS_fnc_inventoryOpened}];
	player addEventHandler ["HandleRating", {0}];
	
	/*
	player addEventHandler["Put", {
		_supplyEvent = MAIN_SETTINGS("Events","SupplyCrate");
		_dropWeapons = getArray(_supplyEvent >> "supply_weapons");

		params ["_unit", "_container", "_item"];
		if (!isPlayer _unit) exitWith {};
		if (toLower (typeOf _container) find "weaponholder" > -1) exitWith {};

		_canPut = true;
		{
			if (_x isEqualType 0) then {

			} else {
				if (((toLower _item) find (toLower (_x select 0))) > -1) then {
					_canPut = false;
				};
			};
		} foreach _dropWeapons;
		
		if (_canPut) exitWith {};
		
		_items = weaponCargo _container;
		_index = [_item,_items] call TON_fnc_index;
		if (_index == -1) exitWith {};
			
		_items deleteAt _index;

		clearWeaponCargoGlobal _container;
		{
			_container addWeaponCargoGlobal [_x, 1];
		} foreach _items;

		player addWeapon _item;
		["You can't store airdrop weapons anywhere.",true,"slow"] call ANZUS_fnc_notificationSystem;
	}];
	*/

	player addEventHandler["Take", {
		params ["_unit", "_container", "_item"];
		if (!isPlayer _unit) exitWith {};

		if ((typeOf _container) isEqualTo "C_IDAP_supplyCrate_F") exitWith {};
		if (toLower (typeOf _container) find "weaponholder" > -1) exitWith {};

		_doLog = false;
		{
			if (((toLower _item) find (toLower (_x select 0))) > -1) then {
				_doLog = true;
			};
		} foreach _dropWeapons;

		if (!_doLog) exitWith {};
	}];

	
	player addEventHandler ["AnimStateChanged", {
		params ["_unit", "_anim"];
		if (_anim find "amovpercmsprsnonwnondf_amovppnemstpsnonwnondnon" > -1) then {
			_objs = lineIntersectsSurfaces [eyePos player, (eyePos player vectorAdd [2* (sin (getDir player)),2 * (cos (getDir player)),0]), player]; 
				
			if (count _objs > 0) then {
				_pos = getPosATL player;
				player setVelocity [0,0,0];
				player switchMove "";
				player playMove "amovpercmstpsnonwnondnon_amovppnemstpsnonwnondnon";
				player setPosATL _pos;
			};
		};
	}];

	["radioDetect", "OnSpeak", { 
		_new = ( (_this select 0) getVariable["restrained", false] || ((_this select 0) getVariable["surrendered", false]) );
		_current = (_this select 0) getVariable ["tf_unable_to_use_radio",false];
		if !(_new isEqualTo _current) then {
			(_this select 0) setVariable ["tf_unable_to_use_radio", _new];
		};
	}, player] call TFAR_fnc_addEventHandler;

	["radioDetect", "OnTangent", { 
		_radio = (call TFAR_fnc_ActiveSwRadio);
		_channel = (_radio call TFAR_fnc_getSwChannel) + 1;
		_currentFreq = [_radio, _channel] call TFAR_fnc_GetChannelFrequency;
		_freq = parseNumber _currentFreq;
		[_unit,_radio,_freq] call AnzusLife_BadFreq;
	}, player] call TFAR_fnc_addEventHandler;

	["radioSetDetect", "OnSWFreqSet", { 
		params ["_unit", "_radio","_freq"];
		_freq = parseNumber _freq;
		[_unit,_radio,_freq] call AnzusLife_BadFreq;
	}, player] call TFAR_fnc_addEventHandler;

	["radioNewDetect", "OnRadioOwnerSet", { 
		params ["_unit", "_radioid"];

		_radio = (call TFAR_fnc_ActiveSwRadio);
		_isGoodRadio = [_radio,"RoleplayRadio"] call TFAR_fnc_isSameRadio;
		
		if (!_isGoodRadio) then {
			["You seem to have a radio thats not in the server, giving you a roleplay radio.",true,"slow"] call ANZUS_fnc_notificationSystem;
	        player unassignItem _radio;
	        player removeItem _radio;

            player addItem "RoleplayRadio";
            player assignItem "RoleplayRadio"; 
		};

		_num = parseNumber ((random [40,250,512]) toFixed 1);
		for "_i" from 1 to 9 do {
			[_radio, _i, str _num ] call TFAR_fnc_SetChannelFrequency;
		};
		
	}, player] call TFAR_fnc_addEventHandler;

	player addEventHandler ["GetOutMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];

		if (_vehicle isKindOf "Air") then {
			AnzusLife_HeliEjectThread = _unit spawn {
				waitUntil {(isTouchingGround _this)};
				uiSleep 0.2;
			};
		};

		if (currentWeapon _unit != "") then {
			_unit action ["SwitchWeapon", _unit, _unit, 100];
		};
	}];

	addMissionEventHandler ["Map", {_this call ANZUS_fnc_onMapOpen;}];

	AnzusLife_EventHandlers = nil;
},false] call AnzusLife_ClientCompile;

["AnzusLife_BadFreq",{
	params ["_unit", "_radio","_freq"];
	if (side _unit isEqualTo civilian) then {
	   if(_freq > 30 && _freq < 35) then {
			["30.1 - 34.9 are blocked frequencies.",true,"slow"] call ANZUS_fnc_notificationSystem;
			[_radio, (_radio call TFAR_fnc_getSwChannel) + 1, "40"] call TFAR_fnc_SetChannelFrequency;
	   };
	};

	_freqs = missionNamespace getVariable ["AnzusLife_GangFreqs",[]];
	_index = [_freq,_freqs] call TON_fnc_index;
	if (_index != -1) then {
		_freqid = ((_freqs select _index) select 0);
		_gangid = group player getVariable ["gang_id",-1];

		if (_freqid != _gangid) then {
			[_radio, (_radio call TFAR_fnc_getSwChannel) + 1, "40"] call TFAR_fnc_SetChannelFrequency;
			["You have been moved off the encrypted frequency.",true,"slow"] call ANZUS_fnc_notificationSystem;
		};
	};
}] call AnzusLife_ClientCompile;


["ANZUS_Eventhandler_Fired",{
	private["_rock","_weapon","_ammoType","_projectile"];
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammoType", "_magazine", "_projectile", "_vehicle"];
	_rock = cursorobject;

	if(_weapon isequalto "TR8_Mining_Drill") then {
		if(!(typeOf cursorObject IN ["AnzusLife_Bits_Rock_L_Diamond", "AnzusLife_Bits_Rock_L_Coal", "AnzusLife_Bits_Rock_L_Iron"])) exitWith {};
		if(player distance _rock > 5) exitwith {["You must be within 5m of the rock.",true,"slow"] call ANZUS_fnc_notificationSystem;};
		_resource = "";
		
		_health = _rock getVariable "health";
		_health = _health - 1;

		if (_health < 1) then {
			_class = typeOf _rock;
			_pos = getPos _rock;
			switch (typeOf (_rock)) do {
				case "AnzusLife_Bits_Rock_L_Diamond": {
					_resource = "diamondOre";
				};
				case "AnzusLife_Bits_Rock_L_Coal": {
					_resource = "coalOre";
				};
				case "AnzusLife_Bits_Rock_L_Iron": {
					_resource = "ironOre";
				};
			};
			sleep 1;
			deleteVehicle _rock;
		} else {
			_rock setVariable ["health", _health, true];
		};	

		[true,_resource,2, "res"] call ANZUS_fnc_handleInv;
	};

	if (_ammoType isEqualTo "GrenadeHand_stone") then {
	    _projectile spawn {
	        private "_position";
	        while {!isNull _this} do {
	            _position = ASLtoATL (visiblePositionASL _this);
	            sleep 0.1;
	        };
	        [_position] remoteExec ["ANZUS_fnc_flashbang",-2];
	    };
	};

	if ( (_unit getVariable ["restrained",false]) || (_ammoType isEqualTo "M_Titan_AA") ) then {
		deleteVehicle _projectile;
	};
}] call AnzusLife_ClientCompile;