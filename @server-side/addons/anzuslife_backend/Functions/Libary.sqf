["AnzusLife_Lib_CountTowTrucks",{
	private _count = ({(_x getvariable ["AL_Job","Unemployed"] isEqualTo "Tow Truck Driver")} count allPlayers);
	_count;
}] call AnzusLife_ClientCompile;

["AnzusLife_Lib_GetGroup",{
	params [["_type","",[""]]];

	private _group = 0;
	switch (_type) do { 
		case "Mafia": {_group = missionNamespace getVariable ["AnzusLife_Mafia",0]}; 
		case "Cartel": {_group = missionNamespace getVariable ["AnzusLife_Cartel",0]}; 
	};
	if (_group isEqualTo 0) exitWith {grpNull};

	private _groupobject = grpNull;
	{
		if ((_x getVariable ["gang_id",0]) isEqualTo _group) then {
			_groupobject = _x;
		};
	} forEach allGroups;
	if (isNull _groupobject) exitWith {grpNull};

	_groupobject;
}] call AnzusLife_ClientCompile;

["AnzusLife_Lib_GetNearestLocation",{
	private _player = param [0,objNull,[objNull]]; 

	private _location = []; 
	private _getlocation = "";
	text((nearestLocations [_player, AnzusLife_LocationTypes, 500] select {!(text(_x) isEqualTo "")}) select 0);
}] call AnzusLife_ClientCompile;

["AnzusLife_Lib_CheckTask",{
	params [
		["_task","",[""]],
		["_gangselect",0,[0]]
	];
	
	_return = false;
	_gangstasks = switch (_gangselect) do {
		case 1: {AnzusLife_MafiaTasks}; 
		case 2: {AnzusLife_CartelTasks}; 
	};

	_taskvalue = [_task,_gangstasks] call TON_fnc_index;
	if (_taskvalue isEqualTo -1) exitWith {true};

	if ((_gangstasks select _taskvalue) isEqualTo 1) then {true} else {false};
}] call AnzusLife_ClientCompile;

["AnzusLife_Lib_GetPlayerByUID",{
	params [["_uid","",[""]]];
	private _player = (allUnits select {getPlayerUID _x isEqualTo _uid}) select 0;
	if (isNil "_player") then {
		_player = objNull;
	};

	_player;
}] call AnzusLife_ClientCompile;

["AnzusLife_Lib_GetPlayerStatus",{
	params [["_uid","",[""]]];
	
	!isNull (_uid call AnzusLife_Lib_GetPlayerByUID);
}] call AnzusLife_ClientCompile;

["AnzusLife_Lib_ReplaceString",{
	params["_str", "_find", "_replace"];
	
	private _return = "";
	private _len = count _find;    
	private _pos = _str find _find;

	while {(_pos != -1) && (count _str > 0)} do {
		_return = _return + (_str select [0, _pos]) + _replace;
		
		_str = (_str select [_pos+_len]);
		_pos = _str find _find;
	}; 
	_return + _str;
}] call AnzusLife_ClientCompile;

["AnzusLife_Lib_GetREPlayer",{
	private _player = remoteExecutedOwner;

	private _newplayer = (allUnits select {owner _x isEqualTo _player}) select 0;

	if (isNil "_newplayer") exitWith {
		 objNull
	};
	_newplayer;

}] call AnzusLife_ServerCompile;

["AnzusLife_Lib_CreateMarker",{
	params [
		["_mrkstring","",[""]],
		["_pos",[],[[]]],
		["_type","",[""]]
	];
	
	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};
	
	_marker = "";
	switch (_type) do { 
		case "Robbery": {
			_pos = position _newplayer;
			_marker = createMarker [_mrkstring, _pos];
			_marker setMarkerColor "ColorRed";
			_marker setMarkerText "> Gas station robbery in progress <";
			_marker setMarkerType "plp_mark_civ_fuelstation";
			_marker setMarkerSize [0.5,0.5];
		}; 
		case "HouseRob": {
			_pos = position _newplayer;
			_marker = createMarker [_mrkstring, _pos];
			_marker setMarkerColor "ColorYellow";
			_marker setMarkerText "> House alarm system active <";
			_marker setMarkerType "plp_mark_as_house";
			_marker setMarkerSize [0.8,0.8];
		};
	};
	_marker;

    [_type,_marker] spawn {
	  	switch (_this select 0) do { 
			case "Robbery": {
				sleep 180;
				deleteMarker (_this select 1);
			};  
			case "HouseRob": {
				sleep 300;
				deleteMarker (_this select 1);
			};  
		};
    };
}] call AnzusLife_ServerCompile;

["AnzusLife_Lib_ChangeGangMarker",{
	params [
		["_marker","",[""]],
		["_type","",[""]],
		["_normal",false,[false]]
	];

	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	if (_marker != "gang_area_4" && _marker != "gang_area_5") exitWith {};
	if (_type != "Mafia" && _type != "Cartel") exitWith {};
	if (isNil {(group _newplayer) getVariable "gang_name"}) exitWith {};
	
	if (_normal) then {
		_marker setMarkerText format["%1 Base", _type];
	} else {
		_marker setMarkerText format["%1 Base - Owned by: %2", _type, (group _newplayer) getVariable "gang_name"];
	};
}] call AnzusLife_ServerCompile;

["AnzusLife_Lib_ChangeGangMarkerColor",{
	params [
		["_marker","",[""]],
		["_type","",[""]],
		["_color","",[""]]
	];

	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	if (_marker != "marker_24" && _marker != "marker_25") exitWith {};
	if (_type != "Mafia" && _type != "Cartel") exitWith {};
	if (isNil {(group _newplayer) getVariable "gang_name"}) exitWith {};

	if !(isClass(configFile >> "CfgMarkerColors" >> _color)) exitWith {};
	
	_marker setMarkerColor _color;

}] call AnzusLife_ServerCompile;


["AnzusLife_Lib_OpenDoor",{
	params [
		["_building",objNull,[objNull]],
		["_door","",[""]]
	];
   
   	if isNull(_building) exitWith {false};
   	if (_door isEqualTo "") exitWith {false};

    _class = configfile >> "CfgVehicles" >> typeOf _building >> "UserActions";

	_opened = switch (true) do { 
		case (isClass (_class >> format["open%1",_door])) : { 
			_animation = (getText (_class >> format["open%1",_door] >> "statement"));
			_animation = [_animation,"this","_building"] call AnzusLife_Lib_ReplaceString;
			call compile _animation;
			true
		};
		case (isClass (_class >> format["open_%1",_door])) : { 
			_animation = (getText (_class >> format["open_%1",_door] >> "statement"));
			_animation = [_animation,"this","_building"] call AnzusLife_Lib_ReplaceString;
			call compile _animation;
			true
		};
		case (isClass (_class >> format["open%1",[_door,"door","doors"] call AnzusLife_Lib_ReplaceString])) : { 
			_animation = (getText (_class >> format["open%1",[_door,"door","doors"] call AnzusLife_Lib_ReplaceString] >> "statement"));
			_animation = [_animation,"this","_building"] call AnzusLife_Lib_ReplaceString;
			call compile _animation;
			true
		};
		case (isClass (_class >> format["open_%1",[_door,"door","door_"] call AnzusLife_Lib_ReplaceString])) : { 
			_animation = (getText (_class >> format["open_%1",[_door,"door","door_"] call AnzusLife_Lib_ReplaceString] >> "statement"));
			_animation = [_animation,"this","_building"] call AnzusLife_Lib_ReplaceString;
			call compile _animation;
			true
		};
		case (isClass (_class >> format["%1_open",[_door,"_",""] call AnzusLife_Lib_ReplaceString])) : { 
			_animation = (getText (_class >> format["%1_open",[_door,"_",""] call AnzusLife_Lib_ReplaceString] >> "statement"));
			_animation = [_animation,"this","_building"] call AnzusLife_Lib_ReplaceString;
			call compile _animation;
			true
		};
		default {
			false
		};
	};

	_opened
}] call AnzusLife_ClientCompile;