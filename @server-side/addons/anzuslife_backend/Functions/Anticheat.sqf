#include "\life_server\script_macros.hpp"

["AnzusLife_AC_Cash",{
	params [["_amount",0,[0]],["_remove",false,[false]]];
	if (_remove) then {
    	_amount = _amount * -1;
	};

	_hasCheated = call AnzusLife_AC_CheckMoney;
	if (_hasCheated) exitWith {};
		
	CASH = CASH + _amount;
	uiNamespace setVariable ["alcash",CASH];

	[0] call ANZUS_fnc_updatePartial; 
}] call AnzusLife_ClientCompile;

["AnzusLife_AC_Bank",{
	params [["_amount",0,[0]],["_remove",false,[false]]];
	if (_remove) then {
    	_amount = _amount * -1;
	};

	_hasCheated = call AnzusLife_AC_CheckMoney;
	if (_hasCheated) exitWith {};

	BANK = BANK + _amount;
	if (BANK < 0) then {
		BANK = 0;
	};
	uiNamespace setVariable ["albank",BANK];
	[1] call ANZUS_fnc_updatePartial;
}] call AnzusLife_ClientCompile;

["AnzusLife_AC_CheckMoney",{
	_oldcash = uiNamespace getVariable ["alcash",0];
	_oldbank = uiNamespace getVariable ["albank",0];

	private _hasCheated = false;
	_hasCheated = (CASH != _oldcash || BANK != _oldbank);
	
	if (_hasCheated) then {
		[format["%1-%2 has tried to spawn cheated money (Cheated Cash: %3 - Cheated Bank: %4) (Old Cash: %5 - Old Bank: %6)",(name player),(getPlayerUID player),CASH,BANK,_oldcash,_oldbank],"surveilance.log"] call AH_LogInterface;
		CASH = 0;
		BANK = 0;
		uiNamespace setVariable ["alcash",0];
		uiNamespace setVariable ["albank",0];
		[6] call ANZUS_fnc_updatePartial;
	};

	_hasCheated;
}] call AnzusLife_ClientCompile;

["AnzusLife_AC_OpenTrunk",{
	params [["_vehicle",objNull,[objNull]],["_player",objNull,[objNull]]];

	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	_val = _vehicle getVariable ["trunk_open", "0"];
	if (_val isEqualTo "0" || _val isEqualTo (getPlayerUID _newplayer)) then {
		_vehicle setVariable ["trunk_open", getPlayerUID _newplayer];
		_vehicle setVariable ["trunk_last_open", serverTime];
		[_vehicle] remoteExec ["ANZUS_fnc_openInventory",_newplayer];
	} else {
		_time = _vehicle getVariable ["trunk_last_open", serverTime];
		if (serverTime - _time > 60) then {
			private _players = [];
			if ((typeOf _vehicle) == "Land_CargoBox_V1_F") then {
				_players = allPlayers select {_x distance _vehicle < 6};
			} else {
				_players = allPlayers select {_x distance _vehicle < 17};
			};
			
			if (count _players > 1) then {
				["There are players too close to the vehicle to open the inventory",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_newplayer];
			} else {
				_vehicle setVariable ["trunk_open", "0"];
				_vehicle setVariable ["trunk_last_open", serverTime];
				["Please reopen the vehicle inventory...",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_newplayer];
			};
		} else {
			["The vehicle inventory is already in use!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_newplayer];
		};
	};
}] call AnzusLife_ServerCompile;

["AnzusLife_AC_CloseTrunk",{
	params [["_vehicle",objNull,[objNull]]];

	_val = _vehicle setVariable ["trunk_open", "0"];
}] call AnzusLife_ServerCompile;

["AnzusLife_AC_TakeItemCheck",{
	inGameUISetEventHandler["Action", "
		_ret = false;

		_action = (_this select 3);
		if (_action == ""TakeItem"") then {
			_list = player nearEntities [""Man"", 8];
			_list = _list select {isPlayer _x};

			if(count _list > 0) then {
				[""Too close to a player to take this."",true,""slow""] call ANZUS_fnc_notificationSystem;
				_ret = true;
			}; 
		};
		
		_ret;
	"];

	player addEventHandler ["Take", {
		params ["_unit", "_container", "_item"];

		if (isClass (configFile >> "CfgVehicles" >> _item)) then {
			[_unit, _container, _item] spawn {
				params ["_unit", "_container", "_item"];

				uiSleep 0.3;

				_players = (allPlayers select {_x != player && player distance _x < 30});
				{
					if ((unitBackpack player) isEqualTo (unitBackpack _x)) then {
						_vehicle = typeOf _container;
						if ((typeOf (unitBackpack player) != "") && (_vehicle != "GroundWeaponHolder")) then {
							[format["Dupe, removed backpack: %1, items: %2 at %3 in %4", typeOf (unitBackpack player), backpackItems player, mapGridPosition player, _vehicle],"log"] call AH_Report;
						};
						removeBackpack player;
					};
				} foreach _players;
			};
		};
	}];
}] call AnzusLife_ClientCompile;