#include "\life_server\script_macros.hpp"
["AnzusLife_OpenWhitelist",{
	params [
		["_side",sideEmpty,[sideEmpty]]
	];

	if (playerSide isEqualTo civilian) exitWith {};
	if (_side isEqualTo sideEmpty) exitWith {};

	private _player = cursorObject;
	if (isNull _player) exitWith {};
	if (!(_player in allPlayers)) exitWith {};

	AnzusLife_InteractedObject = _player;

	private _playerlevel = 0;
	private _playerdept = 0;
	switch (_side) do { 
		case west: {_side = "Cop"; _playerlevel = _player getVariable ["AnzusLife_CopLevel",0]; _playerdept = _player getVariable ["AnzusLife_CopDept",0];}; 
		case independent: {_side = "Medic"; _playerlevel = _player getVariable ["AnzusLife_MedicLevel",0]; _playerdept = _player getVariable ["AnzusLife_MedicDept",0];}; 
	};

	private _factionSettings = MAIN_SETTINGS("GameSettings","GovFactions");

	//Cop
	private _maxCopLevel = getNumber(_factionSettings >> "cop_maxLevel");
	private _copRankArray = getArray(_factionSettings >> "cop_rankArray");
	private _copDeptCount = getNumber(_factionSettings >> "cop_departmentsCount");
	private _copDeptArray = getArray(_factionSettings >> "cop_departmentsArray");
	private _copWLLevel = getNumber(_factionSettings >> "cop_whitelistLevel");

	//Medic
	private _maxMedLevel = getNumber(_factionSettings >> "med_maxLevel");
	private _medRankArray = getArray(_factionSettings >> "med_rankArray");
	private _medDeptCount = getNumber(_factionSettings >> "med_departmentsCount");
	private _medDeptArray = getArray(_factionSettings >> "med_departmentsArray");
	private _medWLLevel = getNumber(_factionSettings >> "med_whitelistLevel");

	private _currentLevel = switch (playerSide) do { 
		case west: {call(life_coplevel)}; 
		case independent: {call(life_mediclevel)}; 
	};

	if (_side isEqualTo "Cop" && (playerSide != west || call(life_coplevel) < _copWLLevel)) exitWith {["You are not a high enough level cop to whitelist other people.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if (_side isEqualTo "Medic" && (playerSide != independent || call(life_mediclevel) < _medWLLevel)) exitWith {["You are not a high enough level medic to whitelist other people.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	
	rankfix = _side;

	_dialog = createDialog "AnzusLife_Whitelist";
	if (!_dialog) exitWith {["Dialog could not be opened!",true,"slow"] call ANZUS_fnc_notificationSystem;};

	_display = findDisplay 15215;
	_level = _display displayCtrl 22;
	_department = _display displayCtrl 23;

	switch (_side) do {
		case "Cop": {
			for "_i" from 0 to _maxCopLevel do {
			    private _levelindex = _level lbAdd format["%1",_copRankArray select _i];
			    _level lbSetData [_levelindex, str(_i)];
			};

			for "_i" from 0 to _copDeptCount do {
			    private _deptindex = _department lbAdd format["%1",_copDeptArray select _i];
			    _department lbSetData [_deptindex, str(_i)];
			};
		};

		case "Medic": {
			for "_i" from 0 to _maxMedLevel do {
				private _levelindex = _level lbAdd format["%1",_medRankArray select _i];
				_level lbSetData [_levelindex, str(_i)];
			};

			for "_i" from 0 to _medDeptCount do {
			    private _deptindex = _department lbAdd format["%1",_medDeptArray select _i];
			    _department lbSetData [_deptindex, str(_i)];
			};
		};
	};


	_level lbSetCurSel _playerlevel;
	_department lbSetCurSel _playerdept;

	buttonSetAction [25, format["if ((time - life_action_delay) < 0.2) exitWith {hint localize ""STR_NOTF_ActionDelay""; closeDialog 0;}; if (player isEqualTo AnzusLife_InteractedObject) exitWith {[""You can not whitelist yourself."",true,""slow""] call ANZUS_fnc_notificationSystem}; _level = lbData [22, lbCurSel 22]; _level = parseNumber(_level); if (_level > %1) exitWith {['You can not set higher then your current level.',true,'slow'] call ANZUS_fnc_notificationSystem}; _department = lbData [23, lbCurSel 23]; _department = parseNumber(_department); if (_level > 0 && _department == 0) exitWith {[""You must select a department to whitelist the player under if there rank is above 0."",true,""slow""] call ANZUS_fnc_notificationSystem;}; life_action_delay = time; [rankfix,AnzusLife_InteractedObject,_level,_department] remoteExec ['AnzusLife_UpdateLevel',2]; closeDialog 0; rankfix = nil; AnzusLife_InteractedObject = nil;",_currentLevel]];
}] call AnzusLife_ClientCompile;  

["AnzusLife_UpdateLevel",{
	params [
		["_type","",[""]],
		["_player",objNull,[objNull]],
		["_level",-1,[0]],
		["_department",-1,[0]]
	];

	private _factionSettings = MAIN_SETTINGS("GameSettings","GovFactions");
	private _copWLLevel = getNumber(_factionSettings >> "cop_whitelistLevel");
	private _medWLLevel = getNumber(_factionSettings >> "med_whitelistLevel");

	if !(_type in ["Medic","Cop"]) exitWith {};
	if (isNull _player) exitWith {};

	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	if (!(side _newplayer IN [west,independent])) exitWith {};

	_query = format["SELECT coplevel, mediclevel FROM players WHERE pid=%1", getPlayerUID _newplayer];
	_result = [_query, 2] call ANZUS_fnc_asyncCall;

	_coprank = _result select 0;
	_medrank = _result select 1;

	_playerrank = switch (side _newplayer) do { 
		case west: {_coprank}; 
		case independent: {_medrank}; 
	};
	
	if (side _newplayer isEqualTo west && _playerrank < _copWLLevel) exitWith {};
	if (side _newplayer isEqualTo independent && _playerrank < _medWLLevel) exitWith {};
	if (_playerrank <= _level) exitWith {};

	_type = toLower(_type); 
	_leveldb = _type + "level";
	_deptdb = _type + "dept";

	_query = format["UPDATE players SET %1 = '%2', %3 = '%4' WHERE pid='%5'",_leveldb,_level,_deptdb,_department,getPlayerUID _player];
	[_query,1] call ANZUS_fnc_asyncCall;

	["Client has been whitelisted, please have them logout.",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem", _newplayer];

	[format["%1/%2 whitelisted %3/%4 for %5 Level:%6 Department:%7", name _newplayer, getPlayerUID _newplayer, name _player,getPlayerUID _player , _type, _level, _department],"whitelist.log"] call AH_LogInterface;

	_player setVariable [format["AnzusLife_%1Level",_type],_level,true]; 
	_player setVariable [format["AnzusLife_%1Dept",_type],_department,true];
}] call AnzusLife_ServerCompile;

["AnzusLife_MajorCrimeAlert",{
	
	if (playerSide != west || call(life_coplevel) < 4) exitWith {["You are not a high enough level to declare a major crime.",true,"slow"] call ANZUS_fnc_notificationSystem;};

	private _action = ["Major Crime", "Are you sure you would like to declare your situation as a major crime, this should only be used for scenarios such as DoC takeovers or major hostage situations. Please follow your SOPs, these actions are logged.", "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
	if (_action) then {
		if (life_antispam isEqualTo 1) exitWith {closeDialog 0;};

	    life_antispam = 1;
		[format["%1 has declared a major crime for the police force, all other major crimes disabled.",name player],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",-2];
		missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];
		[format["%1/%2 just declared a major crime at %3 (%4)",(name player),(getPlayerUID player),mapGridPosition player, serverTime], "money.log"] remoteExec ["AH_LogInterface",2];
		life_antispam = 0;
	};
}] call AnzusLife_ClientCompile;  