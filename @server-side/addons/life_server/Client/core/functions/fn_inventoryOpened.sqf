#include "..\..\script_macros.hpp"
/*
    File: fn_inventoryOpened.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    For the mean time it blocks the player from opening another persons backpack
*/
private ["_cont1","_cont2","_unit","_list","_idc","_exit"];
if (count _this isEqualTo 1) exitWith {false};
params ["_unit", "_cont1","_cont2"];

_list = ["LandVehicle","Ship","Air"];

if (isNull _cont1 && isNull _cont2) exitWith {};	

_closest = 4000;
{
    if ((_unit distance _x) < _closest ) then {_closest = (_unit distance _x)};
} forEach ((playableUnits + switchableUnits) - [_unit]);

_exit = false;
{
	if (!isNull _x) then {
		if (player getVariable "restrained" isEqualTo true) then {
			_exit = true;
			["You are restrained, you can not do that!",true,"slow"] call ANZUS_fnc_notificationSystem;
		};

		if(_x getVariable ["isEvidence",false]) then{
			_exit = true;
		};


		private _containerType = typeOf _x;
		if (FETCH_CONFIG2(getNumber, "CfgVehicles", _containerType, "isBackpack") isEqualTo 1) exitWith {
			[localize "STR_MISC_Backpack",true,"slow"] call ANZUS_fnc_notificationSystem;
			_exit = true;
		};
		

		if ((typeOf _x) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then {
			_house = nearestObject [player, "House"];
			if (!(_house in life_vehicles) && (_house getVariable ["locked",true])) then {
				[localize "STR_House_StorageLock",true,"slow"] call ANZUS_fnc_notificationSystem;
				_exit = true;
			};
		};

		if (KINDOF_ARRAY(_x,_list)) then {
			if (!(_x in life_vehicles) && {locked _x isEqualTo 2}) then {
				[localize "STR_MISC_VehInventory",true,"slow"] call ANZUS_fnc_notificationSystem;
				_exit = true;
			};
		};		

		if ((typeOf _x) isEqualTo "C_IDAP_supplyCrate_F" && !(_x getVariable ["Robbed",false])) then {
			if (!(_x getVariable ["isMissionCrate", false])) then {
				["The evidence locker does not seem to be open!",true,"slow"] call ANZUS_fnc_notificationSystem;
				_exit = true;
			};
		};	
		if (_x isKindOf "Man" && !alive _x) then {
			[localize "STR_NOTF_NoLootingPerson",true,"slow"] call ANZUS_fnc_notificationSystem;
			_exit = true;
		};
		_bpCargo = ((getBackpackCargo _x) select 0);
		if ( ({_x != "B_Parachute"} count _bpCargo) != 0 ) then {

			private _closest = 4000;
			{
			    if ((_unit distance _x) < _closest ) then {_closest = (_unit distance _x)};
			} forEach ((playableUnits + switchableUnits) - [_unit]);

			if(_closest <= 5) then {
				["Too close to a Player.",true,"slow"] call ANZUS_fnc_notificationSystem;
				_exit = true;
			};
		};

		if ((typeOf _x) isEqualTo "B_CargoNet_01_ammo_F" ) then {
			_type = "";
			if ((vehicleVarName _x) == "CartelStorageBox") then {
				_type = "Cartel";
			} else {
				_type = "Mafia";
			};
			_group = [_type] call AnzusLife_Lib_GetGroup;
			if !(_group isEqualTo (group player)) exitWith {[format ["You are not a member of the %1, capture the base to access!",_type],true,"slow"] call ANZUS_fnc_notificationSystem;_exit=true;};
		};

	};
} forEach [_cont2,_cont1];

if (FETCH_CONST(life_adminlevel) isEqualTo 0) then {
	_unit spawn {
		waituntil {!(isnull (finddisplay 602))};
		private _ply = _this;
		if !(_ply isEqualTo (vehicle _ply)) then {
			((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
			((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
			((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
		};
		waituntil {isnull (finddisplay 602)};
	};
};
_exit;