/*
Current Functionality:
	Server:
	Remote Exec code
	auto ban hackers
	auto kick hackers
	admin commands (esp, god, kick, ban, tp, etc)
	full logging to .rpt log + admin panel log + log files via dll
	check if clients AH is running
	assign all players tokens to avoid user spoofing
	check for invisibility on players


	Client:
	admin menu with commands above ^^ 
	check isserver value
	check for spectate
	remove keybinds
	bad variable check
	teleport check (meh)
	hacked loot pile check
	bad display check
	check for scripted no recoil
	load pbos from admins and compare on clients
	check for bad strings in actions
	check all displays/ctrls for bad strings
	make sure onmapsingleclick is not abused
	check oneachframe for abuse
	check draw3d for abuse
	check and ban for no grass (terrain grid changes)
	view distance check
	bait for people trying to modify default life_cash
	log if people get too much money in x time
	infinite ammo detection
	god mode detection (2 versions)
	check for speed hax
	check for no weapon sway scripts
	check for new missioneventhandlers (eachframe, mapsingleclick)
*/

#include <config.cfg>


if (debugInfo) then {
	diag_log format["SERVER Antihack: %1", str productVersion];
};

diag_log format["SERVER Antihack: SERVER ARCHITECTURE: %1", (productVersion select 7)];


_admins = [];

_serverThreads = [];
_serverEHs = [[], []];

_fnc_genRand = {
	params[["_len", 0]];

	_chars = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","X","Y","Z"];	
	
	_count = _len;
	if (_count == 0) then {
		_count = random 16;
		while {_count < 6} do {
			_count = random 16;
		};
	};

	_str = "";
	for "_i" from 0 to _count do {
		_c = selectRandom _chars;
		_str = _str + _c;
	};
	_str
};


comment "Random Variables";
_clientAliveCheck = call _fnc_genRand;
_clientThread1 = call _fnc_genRand;
_clientThread2 = call _fnc_genRand;
_ahLoadState = call _fnc_genRand;
ahLoadSuccess = call _fnc_genRand;
_ahPlayerToken = call _fnc_genRand;
_ahLoadCheck = call _fnc_genRand;
ahCheatLogs = call _fnc_genRand;
ahAdminLogs = call _fnc_genRand;
ahPlayerDeaths = call _fnc_genRand;
_ahAdminNotify = call _fnc_genRand;
_ahAdminReq = call _fnc_genRand;
_badmanCatched = call _fnc_genRand;
_goodPbos = call _fnc_genRand;
playerPbos = call _fnc_genRand;
_mapSingleClick = call _fnc_genRand;
_steamName = call _fnc_genRand;
_onEachFrameTime = call _fnc_genRand;
_atpPos = call _fnc_genRand;
_alMoneyCheck = call _fnc_genRand;
_alCashCheck = call _fnc_genRand;
_alBankCheck = call _fnc_genRand;
_adminLevel = call _fnc_genRand;
_playerAmmo = call _fnc_genRand;
_playerWeapon = call _fnc_genRand;
_playerDamage = call _fnc_genRand;
_playerLastHit = call _fnc_genRand;
_playerGodDetected = call _fnc_genRand;
_eventHandlerList = call _fnc_genRand;
_draw3DIndex = call _fnc_genRand;
_longMoneyTime = call _fnc_genRand;
_longMoneyCash = call _fnc_genRand;
_longMoneyBank = call _fnc_genRand;
_oldPlayerUids = call _fnc_genRand;
uidToToken = call _fnc_genRand;
tokenToUid = call _fnc_genRand;
uidToName = call _fnc_genRand;
playerCash = call _fnc_genRand;
playerBank = call _fnc_genRand;
clientLagSwitch = call _fnc_genRand;
_clientBeatTimer = call _fnc_genRand;

if (debugInfo) then {
	diag_log format["SERVER Antihack: _clientAliveCheck: %1", _clientAliveCheck];
	diag_log format["SERVER Antihack: _clientThread1: %1", _clientThread1];
	diag_log format["SERVER Antihack: _clientThread2: %1", _clientThread2];
	diag_log format["SERVER Antihack: _ahLoadState: %1", _ahLoadState];
	diag_log format["SERVER Antihack: ahLoadSuccess: %1", ahLoadSuccess];
	diag_log format["SERVER Antihack: _ahPlayerToken: %1", _ahPlayerToken];
	diag_log format["SERVER Antihack: ahCheatLogs: %1", ahCheatLogs];
	diag_log format["SERVER Antihack: ahAdminLogs: %1", ahAdminLogs];
	diag_log format["SERVER Antihack: ahPlayerDeaths: %1", ahPlayerDeaths];
	diag_log format["SERVER Antihack: _ahAdminNotify: %1", _ahAdminNotify];
	diag_log format["SERVER Antihack: _ahAdminReq: %1", _ahAdminReq];
	diag_log format["SERVER Antihack: _badmanCatched: %1", _badmanCatched];
	diag_log format["SERVER Antihack: _goodPbos: %1", _goodPbos];
	diag_log format["SERVER Antihack: playerPbos: %1", playerPbos];
	diag_log format["SERVER Antihack: _steamName: %1", _steamName];
	diag_log format["SERVER Antihack: _onEachFrameTime: %1", _onEachFrameTime];
	diag_log format["SERVER Antihack: _atpPos: %1", _atpPos];
	diag_log format["SERVER Antihack: _alMoneyCheck: %1", _alMoneyCheck];
	diag_log format["SERVER Antihack: _alCashCheck: %1", _alCashCheck];
	diag_log format["SERVER Antihack: _alBankCheck: %1", _alBankCheck];
	diag_log format["SERVER Antihack: _adminLevel: %1", _adminLevel];
	diag_log format["SERVER Antihack: _playerAmmo: %1", _playerAmmo];
	diag_log format["SERVER Antihack: _playerWeapon: %1", _playerWeapon];
	diag_log format["SERVER Antihack: _playerDamage: %1", _playerDamage];
	diag_log format["SERVER Antihack: _playerLastHit: %1", _playerLastHit];
	diag_log format["SERVER Antihack: _playerGodDetected: %1", _playerGodDetected];
	diag_log format["SERVER Antihack: _eventHandlerList: %1", _eventHandlerList];
	diag_log format["SERVER Antihack: _draw3DIndex: %1", _draw3DIndex];
	diag_log format["SERVER Antihack: _longMoneyTime: %1", _longMoneyTime];
	diag_log format["SERVER Antihack: _longMoneyCash: %1", _longMoneyCash];
	diag_log format["SERVER Antihack: _longMoneyBank: %1", _longMoneyBank];
	diag_log format["SERVER Antihack: _oldPlayerUids: %1", _oldPlayerUids];
	diag_log format["SERVER Antihack: uidToToken: %1", uidToToken];
	diag_log format["SERVER Antihack: tokenToUid: %1", tokenToUid];
	diag_log format["SERVER Antihack: uidToName: %1", uidToName];
	diag_log format["SERVER Antihack: playerCash: %1", playerCash];
	diag_log format["SERVER Antihack: playerBank: %1", playerBank];
	diag_log format["SERVER Antihack: clientLagSwitch: %1", clientLagSwitch];
	diag_log format["SERVER Antihack: _clientBeatTimer: %1", _clientBeatTimer];
	diag_log "SERVER Antihack: VARIABLES GENERATED";
};

if (moneyLogLimit > 0 || longMoneyLogLimit > 0 || ALMB) then {
	if (_alMoneyVar == "" || _alBankVar == "") exitWith {
		diag_log "SERVER Antihack: MONEY VARIABLE EMPTY WHILE SETTINGS REQUIRE SOMETHING, STOPPING";
	};
};

diag_log "SERVER Antihack: STARTING...";

if (isServer) then {

	AH_loadingStart = diag_tickTime;
	diag_log format["SERVER Antihack: LOADING STARTED AT %1 WITH SERVER-FPS: %2", AH_loadingStart, diag_fps];
	diag_log format["SERVER Antihack: SCRIPT THREADS AT START: %1", (count diag_activeSQFScripts)];

	AH_CheatLogs = ["Hacker logs will be here. All detections, kicks and bans will be logged."];
	AH_AdminLogs = ["Admin logs will be here. All admin requests to the server will be logged."];
	AH_PlayerDeaths = ["All player deaths will be here with details."];

	AH_PlayersLoaded = [];

	diag_log "SERVER Antihack: VARIABLES LOADED. LOADING FUNCTIONS...";

	_serverPwCorrect = _serverCmdPassword serverCommand "#exec users";
	if (_serverPwCorrect) then {
		diag_log "SERVER Antihack: SERVER PASSWORD CORRECT";
	} else {
		diag_log "SERVER Antihack: SERVER PASSWORD IS NOT CORRECT, KICKS/BANS WILL NOT WORK!";
	};

	comment "compile functions";
	_AH_CString = {
		params["_in"];
		_out = "";
		if(typeName _in == "CODE") then {
			_str = str(_in);
			_out = _str select [1, (count(_str)-2)];
		};
		if(typeName _in == "STRING") then {
			_out = _in;
		};
		_out
	};
	AH_CString = compileFinal ([_AH_CString] call _AH_CString);

	_AH_CompileF = {
		params["_in"];
		_code = compileFinal ([_in] call AH_CString);
		_code
	};
	AH_CompileF = [_AH_CompileF] call _AH_CompileF;
	
	AH_GenRand = [_fnc_genRand] call AH_CompileF;

	AH_RE = [{
		params ["_code", "_id"];
		if(_code isEqualType '') then {
			_code = compile _code;
		};

		[[],_code] remoteExecCall ['call', _id]

	}] call AH_CompileF;

	

	{
		_level = _x;
		_bois = _level select 0;
		_admins append _bois;
	} foreach _adminBois;


	AH_GetToken = [{
		params["_who"];
		_uid = "0";

		if (typeName _who == "OBJECT") then {
			_uid = getPlayerUID _who;
		} else {
			_uid = _who;
		};

		_token = missionNamespace getVariable format["%1-%2",uidToToken,_uid];
		_token
	}] call AH_CompileF;
	
	comment 'TODO: FIX THIS';
	AH_TimeStr = [{
		_time = time;

		_hoursFull = _time / 3600;
		_hours = floor _hoursFull;
		_minutes = (_hoursFull - _hours) * 60;
		_minutes = round _minutes;

		_ret = format["%1h %2min", _hours, _minutes];
		_ret
	}] call AH_CompileF;

	AH_CheckSum = [{
		params["_data"];
		_sum1 = 0;
		_sum2 = 0;
		_data = toArray _data;

		for "_i" from 0 to (count _data)-1 do {
			_sum1 = ((_sum1 + (_data select _i)) % 255);
			_sum2 = ((_sum2 + _sum1) % 255);
		};

		_return = _sum2 + _sum1;
		_return
	}] call AH_CompileF;

	if (!isNil "serverToken") then {
		publicVariableServer "serverToken";
	};


	{
		_admins pushBackUnique _x;
	} foreach _sadmins;


	AH_GetAdmins = [("
		_admins = " + str _admins + ";
		_admins
	")] call AH_CompileF;

	AH_GetSAdmins = [("
		_sadmins = " + str _sadmins + ";
		_sadmins
	")] call AH_CompileF;


	AH_GetInfiWhiteList = ['
		_white = ' + str _infiBanWhite + ';
		_white
	'] call AH_CompileF;

	if (logOnly) then {
		AH_Ban = [''] call AH_CompileF;
	} else {
		AH_Ban = ['
			params[''_uid''];
			if (_uid in ' + str _admins + ') exitWith {};
			''' + _serverCmdPassword + ''' serverCommand format[''#exec ban "%1"'', _uid];
		'] call AH_CompileF;
	};

	if (logOnly) then {
		AH_Kick = [''] call AH_CompileF;
	} else {
		AH_Kick = ['
			params[''_uid''];
			if (_uid in ' + str _admins + ') exitWith {};
			''' + _serverCmdPassword + ''' serverCommand format[''#exec kick "%1"'', _uid];
		'] call AH_CompileF;
	};

	AH_WriteAdminLog = [{
		params["_log", "_uid", ["_hideChat", false]];

		if (_uid in (call AH_GetSAdmins)) exitWith {};
		[_log] append AH_AdminLogs;

		_res = "log" callExtension format["2~%1", _log];
		if (_res != "success") then {
			diag_log ((call AH_TimeStr) + ": FAILED TO WRITE LOG FILE: " + _res); 
		};

		diag_log ((call AH_TimeStr) + ": ANTI-HAX (ADMIN LOG): " + _log);

		if (adminChat) then {
			if (!_hideChat) then {
				[_log, _uid] call AH_ChatAll;
			};
		};
	}] call AH_CompileF;

	AH_WriteHaxLog = [{
		params["_log"];
		[_log] append AH_CheatLogs;

		_res = "log" callExtension format["1~%1", _log];
		if (_res != "success") then {
			diag_log ((call AH_TimeStr) + ": FAILED TO WRITE LOG FILE: " + _res); 
		};

		diag_log ((call AH_TimeStr) + ": ANTI-HAX (HAX LOG): " + _log);

		[_log, "screen"] call AH_NotifyAdmins;
	}] call AH_CompileF;

	AH_WriteConnectionLog = [{
		params["_log"];

		_res = "log" callExtension format["3~%1", _log];
		if (_res != "success") then {
			diag_log ((call AH_TimeStr) + ": FAILED TO WRITE LOG FILE: " + _res); 
		};

	}] call AH_CompileF;

	AH_Whitelist = [{
		params[["_token", "0"], ["_uid", "0"]];

		_adminUid = missionNamespace getVariable [format["%1-%2", tokenToUid, _token], "0"];

		if (_adminUid != "0" && _uid != "0") then {
			if (_adminUid in (call AH_GetAdmins)) then {
				_res = "log" callExtension format["2~%1", _uid];
				if (_res != "success") then {
					diag_log format["SERVER Antihack: FAILED TO WHITELIST UID %1 WITH ERROR: %2", _uid, _res];
				};
			} else {
				_name = missionNamespace getVariable[format['%1-%2', uidToName, _adminUid], "Unknown"];
				[format["%1 (UID: %2) IS NOT AN ADMIN AND IS TRYING TO WHITELIST UID: %3", _name, _adminUid, _uid]] call AH_WriteHaxLog;
			};
		};
	}] call AH_CompileF;

	AH_RemovePeeps = [{
		params[["_token","UNDEFINED"], ["_toLogg", "UNDEFINED"], ["_action", "log"]];

		if (_token == "SERVER" && _action == "log") then {
			_log = format["Server log: %1",_toLogg];
			[_log] call AH_WriteHaxLog;
		} else {

			_uid = missionNamespace getVariable [format["%1-%2", tokenToUid, _token], "0"];
			_name = missionNamespace getVariable[format['%1-%2', uidToName, _uid], "Unknown"];
			

			if (_uid == "0") then {
				if (count _token == 17) then {
					_uid = _token;
				};
			};

			if (_action == "ban") exitWith {
				_log = format["%1 (UID: %2) was banned: %3",_name,_uid,_toLogg];
				[_log] call AH_WriteHaxLog;
				[_uid] call AH_Ban;
			};
			if (_action == "kick") exitWith {
				_log = format["%1 (UID: %2) was kicked: %3",_name,_uid,_toLogg];
				[_log] call AH_WriteHaxLog;		
				[_uid] call AH_Kick;
			};
			if (_action == "log") exitWith {
				_log = format["%1 (UID %2) was logged: %3",_name,_uid,_toLogg];
				[_log] call AH_WriteHaxLog;
			};
		};
	}] call AH_CompileF;

	AH_ChatAll = [{
		_success = params["_message", "_uid"];
		if (!_success) exitWith {};
		if (_uid == "") exitWith {};

		_name = missionNamespace getVariable[format['%1-%2', uidToName, _uid], "Unknown"];

		_script = format["
			systemChat ""AH: %1"";
		", _message];

		[_script, 0] call AH_RE;

	}] call AH_CompileF;

	if (ELI) then {
		AH_LogInterface = {
			_success = params["_log", "_file"];
			if (!_success) exitWith { false };

			"log" callExtension format["5~%1|%2", _file, _log];
			true
		};
	};

	comment "cut";

	ProcAdminReq = [{
		params["_token", "_player", "_reqId", "_reqInfo"];

		_uid = "0";
		_name = name _player;
		if (isNull _player) exitWith {
			["SERVER","Unknown person sent an admin request","log"] call AH_RemovePeeps;
		};

		_uid = missionNamespace getVariable format["%1-%2", tokenToUid, _token];

		if (getPlayerUID _player != _uid) exitWith {
			["SERVER","Invalid admin request, UID/Token mismatch","log"] call AH_RemovePeeps;
		};
	
		if !(_uid in _admins) exitWith {
			[[_player] call AH_GetToken,"Player trying to use admin functions","ban"] call AH_RemovePeeps;
		};

		switch (_reqId) do { 
			case -19 : {
				[_token, _reqInfo] call AH_Whitelist;

				_log = format["%1 (UID: %2) whitelisted user with UID: %3",_name,_uid,_reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -18 : {
				_log = format["%1 (UID: %2) toggled their no fatigue",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -17 : {
				_log = format["%1 (UID: %2) toggled their no sway",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -16 : {
				_log = format["%1 (UID: %2) toggled their no recoil",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -15 : {
				_log = format["%1 (UID: %2) toggled their rapid fire",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -14 : {
				_log = format["%1 (UID: %2) toggled their infinite ammo",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -13 : {
				_log = format["%1 (UID: %2) toggled their AI ESP",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -12 : {
				_log = format["%1 (UID: %2) now on speed",_name,_uid];
				if (!_reqInfo) then {
					_log = format["%1 (UID: %2) is no longer on speed",_name,_uid];
				};
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -11 : {
				_log = format["%1 (UID: %2) toggled their vehicle boost",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -10 : {
				_log = format["%1 (UID: %2) toggled their auto revive",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -9 : {
				_log = format["%1 (UID: %2) toggled their vehicle god mode",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -8 : {
				_log = format["%1 (UID: %2) toggled their flymode",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -7 : {
				_log = format["%1 (UID: %2) is using virtual arsenal",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -6 : {
				_log = format["%1 (UID: %2) is using freecam",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -5 : {
				_log = format["%1 (UID: %2) toggled their No grass",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -4 : {
				_log = format["%1 (UID: %2) toggled their Dead Markers",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -3 : {
				_log = format["%1 (UID: %2) toggled their Map Markers",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -2 : {
				_log = format["%1 (UID: %2) toggled their ESP",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case -1 : {
				_log = format["%1 (UID: %2) toggled their God Mode",_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 0 : { 
				_reqInfo setDamage 1;
			 	_log = format["%1 (UID: %2) was killed by Admin %3 (UID: %4)",(name _reqInfo),(getPlayerUID _reqInfo),_name,_uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			}; 
			case 1 : {  
				_TPuid = getPlayerUID _reqInfo;
				_TPname = name _reqInfo;
				[_TPuid,_TPname,"Admin Kick","kick"] call AH_RemovePeeps;
				_log = format["%1 (UID: %2) was kicked by Admin %3 (UID: %4)", _TPname,_TPuid,_name,_uid];
				
				[_log, _uid] call AH_WriteAdminLog;
			}; 
			case 2 : {  
				_TPuid = getPlayerUID _reqInfo;
				_TPname = name _reqInfo;
				[_TPuid,_TPname,"Admin Ban","ban"] call AH_RemovePeeps;
				_log = format["%1 (UID: %2) was banned by Admin %3 (UID: %4)", _TPname,_TPuid,_name,_uid];
				
				[_log, _uid] call AH_WriteAdminLog;
			}; 
			case 5 : {  
				_adminID = owner _reqInfo;

				_logs = AH_CheatLogs;
				_logs resize 250;

				missionNamespace setVariable[ahCheatLogs, _logs];
				_adminID publicVariableClient ahCheatLogs;

				_log = format["%1 (UID: %2) requested haxor logs", _name,_uid];
				
				[_log, _uid, true] call AH_WriteAdminLog;
			}; 					
			case 6 : {  
				_adminID = owner _reqInfo;

				_logs = AH_AdminLogs;
				_logs resize 250;

				missionNamespace setVariable[ahAdminLogs, _logs];
				_adminID publicVariableClient ahAdminLogs;

				_log = format["%1 (UID: %2) requested admin logs", _name,_uid];
				
				[_log, _uid, true] call AH_WriteAdminLog;
			}; 
			case 7: {
				_pos = _reqInfo select 0;
				_obj = _reqInfo select 1;
				
				_obj setPosATL _pos;
				_log = format["%1 (UID: %2) was TP'd to %3",name _obj, getPlayerUID _obj, mapGridPosition _pos];
				[_log, _uid, true] call AH_WriteAdminLog;
			};
			case 8: {

				[{
					if (!isNil "life_thirst" && !isNil "life_hunger") then {
						life_thirst = 100;
						life_hunger = 100;
					};
				}, owner _reqInfo] call AH_RE;

				(vehicle _reqInfo) setDamage 0;
				_reqInfo setDamage 0;

				_log = format["%1 (UID: %2) was healed by Admin %3 (UID: %4)",(name _reqInfo),(getPlayerUID _reqInfo),_name,_uid];

			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 9: {
				_class = _reqInfo select 0;
				_pos = _reqInfo select 1;
				_pos set[2, 500];

				_dir = _reqInfo select 2;
				_v = createVehicle[_class, _pos, [], 0, 'CAN_COLLIDE'];

				_pos set[2, 1];
				_v setPosATL _pos;
				_v setDir _dir;

				_log = format["%1 (UID: %2) spawned %3",_name, _uid, _class];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 10: {
				_time = _reqInfo;
				setDate _time;

				_log = format["%1 (UID: %2) changed the time",_name, _uid];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 11: {
				_reqInfo setDamage 1;
				_log = format["%1 (UID: %2) destroyed %3 at %4",_name,_uid,typeOf _reqInfo,mapGridPosition _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};	
			case 12: {
				_log = format["%1 (UID: %2) revived %3 (UID %4)",_name,_uid,name _reqInfo,getPlayerUID _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 13: {
				[{disableUserInput true;}, owner _reqInfo] call AH_RE;
				_log = format["%1 (UID: %2) froze %3 (UID %4)",_name,_uid,name _reqInfo,getPlayerUID _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 14: {
				[{disableUserInput false;}, owner _reqInfo] call AH_RE;
				_log = format["%1 (UID: %2) unfroze %3 (UID %4)",_name,_uid,name _reqInfo,getPlayerUID _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 15: {
				_script = format["
					[""AdminMsg"",[""%1""]] call BIS_fnc_showNotification;
					systemChat ""Admin MSG: %1"";
				", _reqInfo];

				[_script, 0] call AH_RE;
				_log = format["%1 (UID: %2) messaged all with %3",_name,_uid,_reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 16: {
				_reqInfo setVariable["restrained",true,true];
				[_reqInfo]remoteExec["life_fnc_restrain",_reqInfo];

				_log = format["%1 (UID: %2) restrained %3",_name,_uid, name _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 17: {
				_reqInfo setPos (getMarkerPos "jail_marker");
				[_reqInfo] remoteExecCall ["life_fnc_jailSys",2];

				_log = format["%1 (UID: %2) jailed %3",_name,_uid, name _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 18: {

				_reqInfo setVariable["restrained",false,true];
				_log = format["%1 (UID: %2) unrestrained %3",_name,_uid, name _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 19: {
				if(_reqInfo distance (getMarkerPos "jail_marker") <= 60)then{
					_reqInfo setPos (getMarkerPos 'jail_release');
				};

				_log = format["%1 (UID: %2) freed %3",_name,_uid, name _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 20: {
				[_reqInfo] spawn {
					params["_reqInfo"];
					_explosion = "LightningBolt" createVehicle _reqInfo;
					_explosion setDamage 1;
					_class = selectRandom ["lightning1_F","lightning2_F"];
					_lightning = _class createVehicle _reqInfo;
					uiSleep 0.15;
					deleteVehicle _lightning;
				};

				_log = format["%1 (UID: %2) zeusd at %3",_name,_uid, mapGridPosition _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};
			case 21: {
				_obj = _reqInfo select 0;
				_val = _reqInfo select 1;
				_obj hideObjectGlobal _val;

				_log = format["%1 (UID: %2) toggled invisibility",_name,_uid];
			 	[_log, _uid, true] call AH_WriteAdminLog;
			};
			case 22: {
				_adminID = owner _reqInfo;
				missionNamespace setVariable[ahPlayerDeaths, AH_PlayerDeaths];
				_adminID publicVariableClient ahPlayerDeaths;

				_log = format["%1 (UID: %2) requested death logs", _name,_uid];
				
				[_log, _uid, true] call AH_WriteAdminLog;
			};
			case 23: {
				_trees = []; 
				_weapons = [];
				{
					if (str _x find ": t_" > -1) then {
						_x setDamage 0;
					};
					if ((toLower (typeName _x) find "weaponholder") > -1) then {
						deleteVehicle _x;
					};
				} forEach [0,0,0] nearObjects 100000;
			};

			case 24: {
				_log = format["%1 (UID: %2) copied %3 (UID %4) loadout",_name,_uid,name _reqInfo,getPlayerUID _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};

			case 25: {
				_reqInfo setUnitLoadout (getUnitLoadout _player);
				_log = format["%1 (UID: %2) copied his loadout on %3 (UID %4)",_name,_uid,name _reqInfo,getPlayerUID _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};

			case 26: {
				_target = _reqInfo # 0;
				_code = _reqInfo # 1;

				_log = format["%1 (UID: %2) remote executed code on %3", _name, _uid, _target];
			 	[_log, _uid] call AH_WriteAdminLog;

				if (typeName _target == "OBJECT") then {
					[_code, (owner _target)] call AH_RE;
				} else {
					if (_target == 2) then {
						call compile _code;
					} else {
						[_code, _target] call AH_RE;
					};
				};
			};

			case 27: {
				_reqInfo moveInCargo (vehicle _player);
				_log = format["%1 (UID: %2) has moved %3 (UID %4) into their vehicle.",_name,_uid,name _reqInfo,getPlayerUID _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};

			case 28: {
				_player moveInCargo (vehicle _reqInfo);
				_log = format["%1 (UID: %2) has moved themself into %3 (UID %4) vehicle.",_name,_uid,name _reqInfo,getPlayerUID _reqInfo];
			 	[_log, _uid] call AH_WriteAdminLog;
			};

			default {_log = format ["UNKNOWN ADMIN REQUEST RECEIVED FROM %1 (UID: %2), REQUEST ID: %3",_name,_uid,_reqId]; [_log, _uid] call AH_WriteAdminLog; }; 
		};
		
	}] call AH_CompileF;

	AH_NotifyAdmins = ["
		params['_log', '_where'];
		" + _ahAdminNotify + " = [_log, _where];

		{
			if (getPlayerUID _x in (call AH_GetAdmins)) then {
				(owner _x) publicVariableClient '" + _ahAdminNotify + "';
			};
		} foreach allPlayers;

	"] call AH_CompileF;

	diag_log "SERVER Antihack: FUNCTIONS LOADED! STARTING SERVER CHECK LOOPS!";

	if (LPD) then {
		addMissionEventHandler ["EntityKilled", {
			params ["_killed", "_killer", "_instigator"];
			if (!isPlayer _killed) exitWith {};

			_vehicle = "None";
			if (!(isNull objectParent _killed)) then {
				_vehicle = (typeOf vehicle _killed);
			};
			_cash = _killed getVariable[playerCash, 0];

			_primary = "None";
			if (primaryWeapon _killed != "") then {
				_primary = primaryWeapon _killed;
			};

			_secondary = "None";
			if (secondaryWeapon _killed != "") then {
				_secondary = secondaryWeapon _killed;
			};

			_time = call AH_TimeStr;

			_deathStr = format["%1 killed %2 with %3 from %4m at %5 - time: %6 - ", (name _killer), (name _killed), (currentWeapon _killer), (_killer distance _killed), mapGridPosition _killed,_time];
			_deathStr = _deathStr + (format["%1 - Cash: %2 - Primary Weapon: %3, Secondary Weapon: %4, Vehicle: %5", name _killed, _cash, primaryWeapon _killed, secondaryWeapon _killed, _vehicle]);
			AH_PlayerDeaths pushBackUnique _deathStr;
		}];
	};



	_ahAdminReq addPublicVariableEventHandler {
		params["_varName", "_value", "_target"];
		_value call ProcAdminReq
	};

	_badmanCatched addPublicVariableEventHandler { 
		params["_varName", "_value", "_target"];
		_value call AH_RemovePeeps;
	};

	comment "cut";

	_ahLoadState addPublicVariableEventHandler {
		params["_varName", "_value", "_target"];

		_token = _value select 0;
		_success = _value select 1;
		_player = _value select 2;

		_uid = getPlayerUID _player;

		if (_success != ahLoadSuccess) then {
			[_token,"AH NOT LOADED SUCCESSFULLY","kick"] call AH_RemovePeeps;
		} else {
			_found = true;

			_testToken = missionNamespace getVariable[format["%1-%2", uidToToken, _uid], "0"];
			if (_testToken == "0") then {
				_found = false;
			} else {
				_testUid = missionNamespace getVariable[format["%1-%2", tokenToUid, _token], "0"];
				if (_testUid == "0") then {
					_found = false;
				} else {
					if (_testToken != _token || _testUid != _uid) then {
						_found = false;
					};
				};
			};

			if (_found) then {

				if(_uid in (call AH_GetAdmins)) exitWith {};

				if (PBO) then {
					_goodPbos = profileNamespace getVariable["AH_Good_Pbos", []];
					if (count _goodPbos > 10) then {

						_pbos = _value # 3;

						if (debugInfo) then {
							diag_log format["SERVER Antihack: COMPARING PBOS, APPROVED: %1, PLAYER: %2", count _goodPbos, count _pbos];
						};

						if (count _pbos < 10) then {
							[_token,(format["Like no pbos (%1) loaded", count _pbos]),"kick"] call AH_RemovePeeps;
						};

						_badPbos = 0;
						{
							if (typeName _x != "STRING") exitWith {
								[_token,(format["PBO (%1) typename incorrect, should be text, is %2", str _x, typeName _x]),"kick"] call AH_RemovePeeps;
							};

							if (!(_x in _goodPbos)) then {
								if (_badPbos < 10) then {
									[_token,(format["Unknown pbo loaded: %1", _x]),"kick"] call AH_RemovePeeps;
								};
								_badPbos = _badPbos + 1;
							};	
						} count _pbos;

						if (_badPbos > 10) then {
							[_token,(format["Total unknown pbos loaded: %1", _badPbos]),"kick"] call AH_RemovePeeps;
						};
					};
				};

				_oldUids = _value # 4;
				if (count _oldUids < 1) exitWith {
					[_token,"Player UIDs not loaded","kick"] call AH_RemovePeeps;
				};

				if (!(_uid in (call AH_GetInfiWhiteList))) then { 
					_oldUids = _oldUids - [_uid];
					{
						_gbRes = ("log" callExtension format["6~%1", _uid]);
						if (_gbRes == "true") then {
							[_token,format["Alt account (%1) is infiSHIT global banned!", _x],"log"] call AH_RemovePeeps;
						};	
					} foreach _oldUids;
				};

				AH_PlayersLoaded pushBack _uid;
				diag_log format[(call AH_TimeStr) + ": SERVER Antihack: %1 FULLY LOADED IN", name _player];
				
			} else {
				[_token,"AH was not loaded successfully","kick"] call AH_RemovePeeps;
			};
		};
	};

	[_admins, _ahLoadCheck] spawn {
		params["_admins", "_ahLoadCheck"];

		_count = 0;
		while {true} do {
			_count = _count + 1;

			comment 'run every 20 secs, dont wanna start a new thread';
			if (_count % 10 == 0) then {
				_count = 0;

				{
					_uid = getPlayerUID _x;
					_name = name _x;
					if (alive _x && !(_uid in _admins)) then {

						if !(_uid in AH_PlayersLoaded) then {
							_loadCheck = _x getVariable[_ahLoadCheck, 0];

							if (_loadCheck < 2) then {
								_x setVariable[_ahLoadCheck, _loadCheck + 1];
							} else {
								[[_x] call AH_GetToken,"Player load status not received","kick"] call AH_RemovePeeps;
							};
						} else {
							_typeOfPlayer = typeOf _x;
							if(_typeOfPlayer isKindOf "CAAnimalBase") then {
								[[_x] call AH_GetToken,"Player is an animal","ban"] call AH_RemovePeeps;
							};

							if (isObjectHidden _x) then {
								[[_x] call AH_GetToken,"Player is invisible","ban"] call AH_RemovePeeps;
							};

							if (rating _x < -1000) then {
								[[_x] call AH_GetToken,"AH not running, rating too low","kick"] call AH_RemovePeeps;
							};
						};
					};

					if (CWC) then {
						{
							_char = toLower _x;
							if (((toLower _name) find _char) > -1) exitWith {
								[[_x] call AH_GetToken,"Name contains forbidden characters","kick"] call AH_RemovePeeps;
							};
						} foreach ['Ă','Å','Ć','Č','Ċ','Đ','È','Ę','Ğ','Ģ','Ħ','Ï','Ĩ','Ĵ','ĵ','ĸ','Ŀ','Ľ','Ņ','Ŋ','Ő','Ô','Þ','Ř','Ş','Ţ','Ů','Û','Ŵ','Ŷ','Ż'];
					};

				} foreach allPlayers;
			};

			if (LAG) then {
				_code = compile format["%1 = %2;", clientLagSwitch, serverTime];
				[[], _code] remoteExecCall ["call", -2];
			};
			

			uiSleep 2;
		};
	};

	AH_RemoteLoop = {
		_str = ("
			comment 'todo load these from dll and be filters or something';
			_badCmds = ['setShotParents', 'ctrlCreate'];
			
			_checkedPlayers = [];
			_approvedPbos = profileNamespace getVariable['AH_Good_Pbos', []];

			while {true} do {
				_checkNumber = floor (random 10000);

				_code = ('
					if (getPlayerUID player in " + str _admins + ") exitWith {};
					if (isNil ''" + _ahPlayerToken + "'') exitWith {};

					_checkVal = uiNamespace getVariable [''" + _clientBeatTimer + "'', 0];
					if ((abs(diag_tickTime - _checkVal)) > 30) then {
						[(format[''AH heartbeat not running'', str _threadCount, (str count _threads)]),''kick''] call AH_Report;
					};

					player addRating -5000;

					[] spawn {

						_threads = [''" + _clientThread2 + "'', ''ah_slow_thrd''];

		");
		if (DKB) then {
			_str = _str + ("
				_threads pushBack ''" + _clientThread1 + "'';
			");
		};

		_str = _str + (" 

						_threadCount = 0;
						{

		");

		if (SRC) then {
			_str = (_str + "
					
							_curLine = _x select 3;
							
							for ''_i'' from 0 to (count _badCmds)-1 do {
								_cmd = _badCmds select _i;
								if ((_curLine find _cmd) > -1) then {
									
								};
							};
				");
			};


			_str = (_str + "
							_name = _x select 0;
							if (_name in _threads) then {
								_threadCount = _threadCount + 1;
							};

						} foreach diag_activeSQFScripts;

						if (count _threads > _threadCount) then {
							[(format[''AH not fully running, threads: %1, should be %2'', str _threadCount, (str count _threads)]),''kick''] call AH_Report;
							
							[] spawn AH_Kick;
						} else {
							uiSleep 10;
							player setVariable[''" + _clientAliveCheck + "'', ' + str(_checkNumber) + ', true];
						};
					};

				');
				[_code, -2] call AH_RE;
				uiSleep 60;

				_changed = false;
				{	

					if (getPlayerUID _x in " + str _admins + ") exitWith {
						if (getPlayerUID _x in " + str _sadmins + ") exitWith {};

						_pbos = _x getVariable['" + _goodPbos + "', []];

						if (count _pbos > 10) then {

							if ((_pbos isEqualTo _approvedPbos)) exitWith {};

							for '_i' from 0 to (count _pbos)-1 do {
								_pbo = _pbos select _i;
								_approvedPbos pushBackUnique _pbo;
							};

							_approvedPbos = _pbos;
							profileNamespace setVariable['AH_Good_Pbos', _approvedPbos];
							_changed = true;

							_log = format['Loaded new PBOs from %1, with %2 loaded', name _x, count _approvedPbos];
							[_log, getPlayerUID _x] call AH_WriteAdminLog;

							_x setVariable['" + _goodPbos + "', [], true];
						};
					};

					comment 'TODO PLEASE FIX THIS';
					if (alive _x) then {

						_val = _x getVariable['" + _clientAliveCheck + "', 0];
						if (_val == 0) then {
							if (_x in _checkedPlayers) then {
								[[_x] call AH_GetToken,'Player AH not loading!','kick'] call AH_RemovePeeps;
							} else {
								_checkedPlayers pushBackUnique _x;
							};
						} else {
							if (_val != _checkNumber) then {

			");
			if (debugInfo) then {
					_str = _str + ("
						[[_x] call AH_GetToken,format['Player AH not running properly or is killed! (value: %1, check: %2)', _val, _checkNumber],'kick'] call AH_RemovePeeps;
					");
			} else {
					_str = _str + ("
						[[_x] call AH_GetToken,'Player AH not running properly or is killed!','kick'] call AH_RemovePeeps;
					");
			};
					_str = _str + ("
							};
						};
					};
				} foreach allPlayers;

				if (_changed) then {
					saveProfileNamespace;
				};
			};
		");

		_serverThreads pushBack ([] spawn compile _str);
	};

	[] call AH_RemoteLoop;

	diag_log format["SERVER Antihack: LOADING SERVER CODE FINISHED AT %1 WITH SERVER-FPS: %2", diag_tickTime, diag_fps];
};


AH_CompileCode = {
	if (!isServer) exitWith {};

	diag_log "SERVER Antihack: COMPILING ADMIN CODE";
	AH_AdminCode = ("
	if (getPlayerUID player in " + str _admins + ") then {

		_uid = getPlayerUID player;
		adminPerms = [];

		if (_uid in " + str _sadmins + ") then {
			" + _adminLevel + " = 0;
		} else {

	");

	{
		_level = _x;
		_uids = _level select 0;
		_perms = _level select 1;

		AH_AdminCode = AH_AdminCode + ("
			if (_uid in " + str _uids + ") then {
				_index = " + str (_forEachIndex + 1) + ";
				" + _adminLevel + " = _index;
				adminPerms pushBackUnique [_index, " + str _perms + "];
			};
		");

	} foreach _adminBois;

	AH_AdminCode = AH_AdminCode + ("
		};

		if (isNil '" + _adminLevel + "') then {
			endMission 'loser';
		};

	");
	if (CWC) then {
		AH_AdminCode = AH_AdminCode + ("
		_name = (name player);
		{
			_char = toLower _x;
			if (((toLower _name) find _char) > -1) exitWith {
				endMission 'BadName';
			};
		} foreach ['Ă','Å','Ć','Č','Ċ','Đ','È','Ę','Ğ','Ģ','Ħ','Ï','Ĩ','Ĵ','ĵ','ĸ','Ŀ','Ľ','Ņ','Ŋ','Ő','Ô','Þ','Ř','Ş','Ţ','Ů','Û','Ŵ','Ŷ','Ż'];
		");
	};


	AH_AdminCode = AH_AdminCode + ("


		waitUntil {!isNull (findDisplay 46)};
		(findDisplay 46) displayAddEventHandler['KeyDown','if (_this select 1 == 59) then { call life_ShowAdminMenu; };'];
		(findDisplay 46) displayAddEventHandler['KeyDown',' if ((_this select 1) in [0xD3,0x06,0x05,0xCF,0x3F,0x40,0x41,0x3D]) then { _this call life_HotkeyHandler; };'];


		systemChat 'SERVER Antihack: Welcome Admin! Loading Admin Panel!';

		AH_TimeStr = compileFinal '" + ([AH_TimeStr] call AH_CString) + "';

		AllWeapons = [];
		AllVehicles = [];
		AllBackpacks = [];
		AllVItems = [];

		TargetObject = objNull;
		_annons = profileNamespace getVariable['adminAnnouncements', true];

		showAdminMessages = _annons;
		adminMessageQueue = [];
		sortByName = false;
		AdminListAis = false;
		isModLife = false;
		lastNotifyMessage = '';
		ListType = 'player';

		[] spawn {
			_cfgWeapons = configFile >> 'CfgWeapons';
			for '_i' from 0 to (count _cfgWeapons)-1 do {
				_weapon = _cfgWeapons select _i;
				if (isClass _weapon) then {
					_name = configName _weapon;
					_trimStart = toArray _name;
					_trimStart resize 2;
					_trimStart = toString _trimStart;
					_pic = (getText (configFile >> 'CfgWeapons' >> _name >> 'picture'));
					_displayName = (getText (configFile >> 'CfgWeapons' >> _name >> 'displayName'));

					if ((_pic != '')) then {
						if ((_trimStart != 'H_') && (_trimStart != 'V_') && (_trimStart != 'U_')) then {
							AllWeapons pushBackUnique [_name, _pic, _displayName]; 
						};
					};
				};
			};

			_cfgVehicles = configFile >> 'CfgVehicles';
			for '_i' from 0 to (count _cfgVehicles)-1 do {
				_vehicle = _cfgVehicles select _i;
				if (isClass _vehicle) then {
					_name = configName _vehicle;
					_pic = getText(_vehicle >> 'picture');
					_displayName = (getText (_vehicle >> 'displayName'));

					if((getText(_vehicle >> 'displayName') != '') && _pic != '' && getNumber(_vehicle >> 'scope') in [0,2]) then {
						if ((_name isKindOf 'Air') || (_name isKindOf 'LandVehicle') || (_name isKindOf 'Ship')) then {
							if !((_name isKindOf 'ParachuteBase') || (_name isKindOf 'BIS_Steerable_Parachute')) then {
								if ((toLower _name) find 'base' == -1) then {
									AllVehicles pushBackUnique [_name, _pic, _displayName];
								};
							};
						};

						if ((getNumber(_vehicle >> 'isBackpack') isEqualTo 1)) then {
							if ((toLower _name) find 'base' == -1) then {
								AllBackpacks pushBackUnique [_name, _pic, _displayName];
							};
						};
					};
				};
			};
			
			if (!isNil 'life_fnc_atmMenu' || !isNil 'life_vehicles' || !isNil 'life_licenses') then {
				isModLife = true;
			} else {
				isModLife = false;
			};

			if (isModLife) then {
				_cfgVItems = (missionConfigFile >> 'VirtualItems');
				for '_i' from 0 to (count _cfgVItems) - 1 do {
					_item = _cfgVItems select _i;
					if (isClass(_item)) then {
						_displayName = localize (getText (_item >> 'displayName'));
						_var = getText (_item >> 'variable');
						_icon = getText (_item >> 'icon');
						AllVItems pushBackUnique [_var,_icon,_displayName];
					};
				};	
			};

			systemChat 'AH: Config file loading finished';
		};


		'" + ahCheatLogs  + "' addPublicVariableEventHandler {
			params['_varName', '_value', '_target'];
			if !(isNil 'firstRun') then {
				if ((count _value) > (count localHaxLogArry)) then {
					_adminNotification = _value select (count _value)-1;
				};
			};
			localHaxLogArry = _value;
		};

		'" + _ahAdminNotify + "' addPublicVariableEventHandler {
			params['_varName', '_value', '_target'];

			if (!showAdminMessages) exitWith {};

			_log = _value select 0;
			_where = _value select 1;

			if (lastNotifyMessage == _log) exitWith {};
			lastNotifyMessage = _log;

			if (_where == 'screen') then {
				adminMessageQueue pushBackUnique _log;
			};

			if (_where == 'chat') then {
				systemChat _log;
				hint _log;
			};
		};

		[] spawn {
			while {true} do {
				if ((count adminMessageQueue > 0) && showAdminMessages) then {
					_log = adminMessageQueue select 0;
					[format['<t color=''#ff0000'' size = ''.5''>%1</t>', _log],-1,safeZoneH - 0.8,3,1,0,789] spawn BIS_fnc_dynamicText;
					
					adminMessageQueue deleteAt 0;
				};
				uiSleep 4;
			};
		};

		life_HotkeyHandler = {
			params ['_control', '_key', '_shift', '_ctrl', '_alt'];

			if (_key == 0x3D) exitWith {
				[] call CodeExecutor;
			};

			if(_key == 0xD3 || _key == 0xCF || _key == 0x40) exitWith {
				_curs = cursorObject;

				if (isNull _curs) then {
					_curs = cursorTarget;
				};

				if (isNull TargetObject || TargetObject != _curs) exitWith {
					TargetObject = _curs;

					if (isNull TargetObject) exitWith {};
					if (_key == 0xD3 && _ctrl && _shift) then {
						systemChat format['Are you sure you want to delete %1?', (typeOf _curs)];
					};
					if (_key == 0xCF && _ctrl && _shift) then {
						systemChat format['Are you sure you want to destroy %1?', (typeOf _curs)];
					};
					if (_key == 0x40) then {
						systemChat format['Are you sure you want to change the lock state of %1', typeOf _curs];
					};
				};

				if (TargetObject == _curs) exitWith {
					if (_key == 0xD3 && _ctrl && _shift) exitWith {
						deleteVehicle _curs;
						systemChat format['Deleted %1', (typeOf _curs)];
					};
					if (_key == 0xCF && _ctrl && _shift) exitWith {
						" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 11, _curs];
						publicVariableServer '" + _ahAdminReq + "';

						systemChat format['Destroyed %1', (typeOf _curs)];
					};
					if (_key == 0x40) exitWith {
						if (locked _curs == 2) exitWith {
							_curs setVehicleLock 'UNLOCKED';
							systemChat format['Cursor target was unlocked', name currentTarget];
						};
						if (locked _curs == 0 || locked _curs == 1) exitWith {
							_curs setVehicleLock 'LOCKED';
							systemChat format['Cursor target was locked', name currentTarget];
						};

						systemChat format['Unknown lock state: %1', locked _veh];
					};
				};
			};

			if (_key == 0x41) exitWith {
				" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 8, player];
				publicVariableServer '" + _ahAdminReq + "';
			};

			if (_key == 0x06 && _shift) exitWith {
				_veh = (vehicle player);
				_dir = getDir _veh;
				_dist = 5;

				_pos = getPos _veh;
				_pos = [(_pos select 0)+_dist*sin(_dir), (_pos select 1)+_dist*cos(_dir), (_pos select 2)];
				_veh setPos _pos;
			};
			if (_key == 0x05 && _shift) exitWith {
				_obj = vehicle player;
				_vel = velocity _obj;
				_obj setVelocity [(_vel select 0),(_vel select 1),10];
			};
		};

		life_AdminGod = {
			if (isNil 'adminGodToggle') then {adminGodToggle = false};
			if (!adminGodToggle) then {
				adminGodToggle = true;
				systemChat 'AH: Admin God Enabled';

				[] spawn {
					while {adminGodToggle} do {
						player removeAllEventHandlers 'HandleDamage';
						player addEventHandler ['HandleDamage', {
							params ['_unit', '_selection', '_damage', '_source', '_projectile', '_hitIndex', '_instigator', '_hitPoint'];
						    _unit action ['SwitchWeapon', _unit, _unit, 100];
							_unit switchCamera cameraView;
							0;
						}];
						player allowDamage false;
						player setBleedingRemaining 0;
						player setOxygenRemaining 1;
						player setFatigue 0;
						uiSleep 2;
					};
				};

			} else {
				adminGodToggle = false;
				systemChat 'AH: Admin God Disabled';

				player allowDamage true;
				player removeAllEventHandlers 'HandleDamage';
				player addEventHandler['handleDamage',{_this call life_fnc_handleDamage;}];
			};
		};
		life_AdminVGod = {
			if (isNil 'adminVGodToggle') then {adminVGodToggle = false};

			if (!adminVGodToggle) then {
				adminVGodToggle = true;
				[] spawn {
					while {adminVGodToggle} do {
						if ((vehicle player) != player) then {
							(vehicle player) allowDamage false;
							(vehicle player) removeAllEventhandlers 'HandleDamage';
							(vehicle player) addEventHandler ['HandleDamage', {0}];
						};
						uiSleep 2;
					};
				};
				systemChat 'AH: Admin Vehicle God Enabled';
			} else {
				adminVGodToggle = false;
				(vehicle player) allowDamage true;
				(vehicle player) removeAllEventhandlers 'HandleDamage';

				systemChat 'AH: Admin Vehicle God Disabled';
			};	
			
		};

		life_AdminESP = {
			if (isNil 'adminEspToggle') then {adminEspToggle = false};
			comment 'ty bantah <3';

			if (!adminEspToggle) then {
				adminEspToggle = true;
				systemChat 'AH: Admin ESP Enabled';

				admin_esp_eh = addMissionEventHandler ['Draw3D', {
					{
						if (!isNull _x) then {
							if (vehicle _x != cameraOn) then {
								_name = (name _x);
								_pos = (_x modelToWorld ((_x selectionPosition 'neck') vectorAdd [0,0,0.25]));

								if ((cameraOn distance _x) <= 1500) then {
										_color = [0,0.27,0.84,1];
										if (side _x == opfor) then {
											_color = [0.9,0.11,0,1];
										};
										if (side _x == civilian) then {
											_color = [0.4, 0, 0.4, 1];
										};
										if (side _x == independent) then {
											_color = [0, 0.8, 0.2, 1];
										};


										drawIcon3D ['', _color, _pos, 0, 0, 0, (format ['%1 (%2m)', _name, (round(cameraOn distance _x))]), 1.5, 0.03, 'PuristaLight','center',true];
								};
							};
						};
					} foreach allPlayers;
				}];

			} else {
				adminEspToggle = false;
				systemChat 'AH: Admin ESP Disabled';

				removeMissionEventHandler ['Draw3D', admin_esp_eh];
			};
		};

		life_AdminAiESP = {
			if (isNil 'adminAiEspToggle') then {adminAiEspToggle = false};
			comment 'ty bantah <3';

			if (!adminAiEspToggle) then {
				adminAiEspToggle = true;
				systemChat 'AH: Admin AI ESP Enabled';

				admin_ai_esp_eh = addMissionEventHandler ['Draw3D', {
					{
						if (!isNull _x && !(isPlayer _x)) then {
							if (vehicle _x != cameraOn) then {
								_name = (name _x);
								_pos = (_x modelToWorld ((_x selectionPosition 'neck') vectorAdd [0,0,0.25]));

								if ((cameraOn distance _x) <= 1500) then {
										_color = [0,0.27,0.84,1];
										if (side _x == opfor) then {
											_color = [0.9,0.11,0,1];
										};
										if (side _x == civilian) then {
											_color = [0.4, 0, 0.4, 1];
										};
										if (side _x == independent) then {
											_color = [0, 0.8, 0.2, 1];
										};


										drawIcon3D ['', _color, _pos, 0, 0, 0, (format ['%1 (%2m)', _name, (round(cameraOn distance _x))]), 1.5, 0.03, 'PuristaLight','center',true];
								};
							};
						};
					} foreach allUnits;
				}];

			} else {
				adminAiEspToggle = false;
				systemChat 'AH: Admin AI ESP Disabled';

				removeMissionEventHandler ['Draw3D', admin_ai_esp_eh];
			};
		};

		life_AdminRapidFire = {
			if (isNil 'adminRapidFireToggle') then {adminRapidFireToggle = false};

			if (!adminRapidFireToggle) then {
				adminRapidFireToggle = true;

				[] spawn {
					while {adminRapidFireToggle} do {
						(vehicle player) setWeaponReloadingTime [gunner (vehicle player), currentMuzzle (gunner (vehicle player)), 0];
						uiSleep 0.01;
					};
				};

				systemChat 'AH: Rapid fire enabled';
			} else {
				adminRapidFireToggle = false;

				systemChat 'AH: Rapid fire disabled';
			};
		};

		life_AdminRecoil = {
			if (isNil 'adminRecoilToggle') then {adminRecoilToggle = false};

			if (!adminRecoilToggle) then {
				adminRecoilToggle = true;

				adminOldRecoil = unitRecoilCoefficient player;
				player setUnitRecoilCoefficient 0;

				systemChat 'AH: No recoil enabled';
			} else {
				adminRecoilToggle = false;
				player setUnitRecoilCoefficient adminOldRecoil;

				systemChat 'AH: No recoil disabled';
			};
		};

		life_AdminSway = {
			if (isNil 'adminSwayToggle') then {adminSwayToggle = false};

			if (!adminSwayToggle) then {
				adminSwayToggle = true;

				player setCustomAimCoef 0;

				systemChat 'AH: No sway enabled';
			} else {
				adminSwayToggle = false;
				player setCustomAimCoef 1;

				systemChat 'AH: No sway disabled';
			};
		};

		life_AdminFatigue = {
			if (isNil 'adminFatigueToggle') then {adminFatigueToggle = false};

			if (!adminFatigueToggle) then {
				adminFatigueToggle = true;

				[] spawn {
					while {adminFatigueToggle} do {
						player setFatigue 0;
						uiSleep 0.5;
					};
				};

				systemChat 'AH: No fatigue enabled';
			} else {
				adminFatigueToggle = false;

				systemChat 'AH: No fatigue disabled';
			};
		};

		life_AdminBoost = {
			if (isNil 'adminBoostToggle') then {adminBoostToggle = false};

			if (!adminBoostToggle) then {
				adminBoostToggle = true;

				adminBoostEH = (findDisplay 46) displayAddEventHandler['KeyDown', {
					if (vehicle player == player) exitWith {};
					if (_this select 4) then {
						if (isNil 'lastSpeedAdded') then {lastSpeedAdded = 0};

						if (time - lastSpeedAdded > 1) then { 

							_vehicle = (vehicle player);
							_vel = velocity _vehicle;
							_dir = direction _vehicle;
							_speed = 0.5;
							_vehicle setVelocity [
								(_vel select 0) + (sin _dir * _speed), 
								(_vel select 1) + (cos _dir * _speed), 
								(_vel select 2)
							];
						};
					};
				}];
				systemChat 'AH: Press ALT for a boost!';
			} else {
				adminBoostToggle = false;
				(findDisplay 46) displayRemoveEventHandler['KeyDown', adminBoostEH];
				systemChat 'AH: Boosting turned off :(';
			};
		};
		life_AdminAutoRevive = {
			if (isNil 'adminReviveToggle') then {adminReviveToggle = false};

			if (!adminReviveToggle) then {
				adminReviveToggle = true;
				[] spawn {
					while {adminReviveToggle} do {
						waitUntil {!alive player || !adminReviveToggle};
						if (!adminReviveToggle) exitWith {};

						uiSleep 3;

						player setVariable ['Revive',false,true];
						[player] remoteExec ['ANZUS_fnc_cprrevived',player];

						" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 12, player];
						publicVariableServer '" + _ahAdminReq + "';
						systemChat 'AH: Revived yourself';
						uiSleep 10;
					};
				};
				systemChat 'AH: Enabled auto self revive';
			} else {
				adminReviveToggle = false;
				systemChat 'AH: Disabled auto self revive';
			};
		};
		life_AdminTP = {
			if !('ItemMap' in items player) then {
				systemChat 'AH: A map was added to your inventory';
				player addWeapon 'ItemMap';
			};

			if (isNil 'adminTpToggle') then {adminTpToggle = false;};

			if (!adminTpToggle) then {
				adminTpToggle = true;

				onMapSingleClick '
					if (_alt) then {
						_req = [_pos, vehicle player];
						" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 7,_req];
						publicVariableServer ''" + _ahAdminReq + "'';
						openMap[false,false];
					};
				';
				systemChat 'AH: You can now alt+click on your map to teleport';
			} else {
				adminTpToggle = false;
				systemChat 'AH: Map teleport disabled';
				onMapSingleClick '';
			};
		};
	");

	AH_AdminCode = AH_AdminCode + ("
		life_AdminDeadMarkers = {
			if (isNil 'adminDeadMarkersToggle') then {adminDeadMarkersToggle = false};

			if (!adminDeadMarkersToggle) then {
				adminDeadMarkersToggle = true;

				[] spawn {
					while {adminDeadMarkersToggle} do {
						_deadPeeps = allDeadMen;

						comment 'delete all markers';
						for '_i' from 0 to (count _deadPeeps)+10 do {
							deleteMarkerLocal ('deadPlayerMarker' + (str _i));
						};

						for '_i' from 0 to (count _deadPeeps)-1 do {
							_corpse = _deadPeeps select _i;
							if(!isNull _corpse) then {
								_marker = createMarkerLocal [('deadPlayerMarker' + (str _i)), getPos _corpse];
								
								_txt = format['DEAD (%1m)', round (player distance _corpse)];
								_marker setMarkerColorLocal 'ColorRed';
								_marker setMarkerTypeLocal 'waypoint';
								_marker setMarkerTextLocal _txt;
							};
						};
						uiSleep 5;
					};

					for '_i' from 0 to (count allDeadMen)+10 do {
						deleteMarkerLocal ('deadPlayerMarker' + (str _i));
					};
				};

				systemChat 'AH: Dead Markers Enabled';
			} else {
				adminDeadMarkersToggle = false;
				systemChat 'AH: Dead Markers Disabled';
			};
		};

		life_AdminMarkers = {
			if (isNil 'adminMarkersToggle') then {adminMarkersToggle = false};

			if (!adminMarkersToggle) then {
				adminMarkersToggle = true;

				[] spawn {
					_i = 0;
					_markers = [];
					while {adminMarkersToggle} do {
						{
							if (_x != player) then {

								
								_name = str (vehicle _x);

								if (getMarkerColor _name == '') then { 
									_marker = createMarkerLocal[_name, position (vehicle _x)];
									_marker setMarkerTypeLocal 'mil_triangle';

									if (side _x == west) then {
										_marker setMarkerColorLocal 'ColorWEST';
									};
									if (side _x == east) then {
										_marker setMarkerColorLocal 'ColorEAST';
									};
									if (side _x == independent) then {
										_marker setMarkerColorLocal 'colorIndependent';
									};
									if (side _x == civilian) then {
										_marker setMarkerColorLocal 'ColorCIV';
									};

									_markers pushBackUnique [_marker, (vehicle _x)];
								};

								if (isNull objectParent _x) then {
									_name setMarkerTextLocal format['%1 - %2m', name _x, round(player distance _x)];
								} else {
									_crewNames = [];
									{
										_crewNames pushBackUnique (name _x);
									} foreach crew (vehicle _x);
									_name setMarkerTextLocal format['%1 - %2m', str _crewNames, round(vehicle _x distance player)];
								};

								_name setMarkerDirLocal getDir (vehicle _x);
								_name setMarkerPosLocal getPos (vehicle _x);
							};
						} foreach allPlayers;
						uiSleep 0.1;

						_i = _i + 1;

						if (_i > 20) then {
							{
								_marker = _x select 0;
								_unit = _x select 1;
								if (_unit isKindOf 'vehicle') then {
									if ((count crew _unit) == 0) then {
										deleteMarker _marker;
										_markers deleteAt _forEachIndex;
									};
								} else {
									if (isNull _unit || !alive _unit) then {
										deleteMarker _marker;
										_markers deleteAt _forEachIndex;
									};
									if (vehicle _unit != _unit) then {
										if (getMarkerColor (str vehicle _unit) != '') then {
											deleteMarker _marker;
											_markers deleteAt _forEachIndex;
										};
									};
								};
							} foreach _markers;
							_i = 0;
						};
					};

					{
						deleteMarker (_x select 0);
					} foreach _markers;
				};


				systemChat 'AH: Player Markers Enabled';
			} else {
				adminMarkersToggle = false;
				systemChat 'AH: Player Markers Disabled';
			};
		};

		life_AdminRainbow = {
			_material =  'A3\characters_f_bootcamp\Data\VR_Soldier_F.rvmat';
			_texture = 'a3\data_f\rainbow_ca.paa';
			_vehicle = (vehicle player);

			for '_i' from 0 to 50 do {
				_vehicle setObjectTextureGlobal [_i,_texture];
				_vehicle setObjectMaterialGlobal [_i,_material];
			};

			systemChat 'AH: Danking reel hard';
		};

		life_AdminListNear = {
			
			if(isNil 'adminListNearToggle') then {adminListNearToggle = false};

			if (!adminListNearToggle) then {
				adminListNearToggle = true;
				systemChat 'AH: Enabled Near Player Display';

				[] spawn {
					_ents = [allUnits, [], {_x distance player}, 'ASCEND', {_x distance player < 200 && _x != player}] call BIS_fnc_sortBy;
					_count = 0;

					while{adminListNearToggle} do {
						_arr = [];

						{
							if (_x distance player < 200) then {
								if (count _arr >= 10) exitWith {
									_arr resize 10;
								};

								if (_x isKindOf 'Man') then {
									_arr pushBackUnique format['%1 - %2m', name _x, round(player distance _x)];
								} else {
									if (count crew _x != 0) then {
										{
											_arr pushBackUnique format['%1 - %2m', name _x, round(player distance _x)];
										} foreach crew _x;
									};
								};
							};
						} foreach _ents;

						_str = _arr joinString '<br/>';

						[('<t color=''#0055aa'' size = ''.4''>' + _str + '</t>'),safeZoneX-0.3, safeZoneY+0.05,0.1,0,0,800] spawn BIS_fnc_dynamicText;

						if (_count > 10) then {
							_count = 0;
							_ents = [allPlayers, [], {_x distance player}, 'ASCEND', {_x distance player < 200 && _x != player}] call BIS_fnc_sortBy;
						};

						_count = _count + 1;
						uiSleep 0.1;
					};
				};
				
			} else {
				adminListNearToggle = false;
				systemChat 'AH: Disabled Near Player Display';
			};
		};

		life_AdminStealth = {
			if (isNil 'adminStealthToggle') then {adminStealthToggle = false};

			if (!adminStealthToggle) then {
				adminStealthToggle = true;
				systemChat 'AH: Invisibility enabled';
			} else {
				adminStealthToggle = false;
				systemChat 'AH: Invisibility disabled';
			};

			" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 21, [(vehicle player), adminStealthToggle]];
			publicVariableServer '" + _ahAdminReq + "';
		};

		life_AdminFly = {
			if (isNil 'adminFlyToggle') then {adminFlyToggle = false};

			if (!adminFlyToggle) then {
				adminFlyToggle = true;
				player allowDamage false;

				[] spawn {
					while{adminFlyToggle} do {
						player playActionNow 'PlayerStand';
						_dir = eyeDirection player;
						if(currentWeapon player != '') then {
							_dir = player weaponDirection (currentWeapon player);
						};
						player setvelocity (_dir vectorMultiply 15);
					};
					uiSleep 1;
					player allowDamage true;
				};
				systemChat 'AH: Fly mode enabled';
			} else {
				adminFlyToggle = false;
				systemChat 'AH: Fly mode disabled';
			};
		};

		life_AdminSpeed = {
			if (isNil 'adminSpeedToggle') then {adminSpeedToggle = false};

			if(!adminSpeedToggle) then {
				adminSpeedToggle = true;
				player setAnimSpeedCoef 8;

				systemChat 'AH: Ye boii, feeling fast';

				" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, -12, true];
				publicVariableServer '" + _ahAdminReq + "';
			} else {
				adminSpeedToggle = false;
				player setAnimSpeedCoef 1;

				systemChat 'AH: Admin speed disabled';

				" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, -12, false];
				publicVariableServer '" + _ahAdminReq + "';
			};
		};

		life_AdminInfAmmo = {
			if (isNil 'adminInfAmmoToggle') then {adminInfAmmoToggle = false};

			if (!adminInfAmmoToggle) then {
				adminInfAmmoToggle = true;

				[] spawn {
					while {adminInfAmmoToggle} do {
						player setAmmo [currentWeapon player, 100000];
						vehicle player setVehicleAmmo 1;
						uiSleep 0.1;
					};
				};

				systemChat 'AH: Non-finite ammo enabled';
			} else {
				adminInfAmmoToggle = false;

				systemChat 'AH: Non-finite ammo disabled';
			};
		};


		life_AdminNoGrass = {
			if (isNil 'adminGrassToggle') then {adminGrassToggle = false};

			if (!adminGrassToggle) then {
				adminGrassToggle = true;
				setTerrainGrid 50;
				systemChat 'AH: Grass Disabled';
			} else {
				adminGrassToggle = false;
				setTerrainGrid 25;
				systemChat 'AH: Grass Enabled';
			};
		};

		life_AdminCleanup = {
			" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 23, true];
			publicVariableServer '" + _ahAdminReq + "';
			systemChat 'Cleaning up...';
		};

		life_ChangeTime = {
			" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 10, _this];
			publicVariableServer '" + _ahAdminReq + "';
			systemChat 'Changing time...';
		};

		life_AdminGiveAmmo = {
			_item = currentWeapon player;
			_mags = getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
			_mag = _mags select 0;
			
			player addMagazine _mag;
			player addMagazine _mag;
			systemChat 'AH: Spawned 2 mags';
		};

		life_AdminReviveNear = {
			_names = [];
			{
				if ((player distance _x) < 50) then {
					_x setVariable ['Revive',false,true];
					[_x] remoteExec ['ANZUS_fnc_cprrevived',_x];

					_names pushBackUnique (name _x);
				};	
			} foreach allDeadMen;

			systemChat format['AH: Revived: %1', (_names joinString ', ')];
		};

		life_VariableViewer = {
			params[['_filter', '']];

			_menu = (uiNamespace getVariable 'playerList');
			lbClear _menu;

			_options = (uiNamespace getVariable 'target_display');
			lbClear _options;

			_variables = allVariables missionNamespace;
			{
				_value = missionNamespace getVariable _x;
				if (_filter != '') then {
					if (((toLower _x) find _filter) > -1 || ((toLower (str _value)) find _filter) > -1) then {
						_menu lbAdd _x;
					}
				} else {
					_menu lbAdd _x;
				};
			} foreach _variables;

			ListType = 'variable';


			_varOptions = [
				'Display Value (hint)',
				'Display Value (edit-box)',
				'Set Value (edit-box)'
			];

			{
				_options lbAdd _x;
			} foreach _varOptions;

			_options ctrlRemoveAllEventHandlers 'LBDblClick';
			_options ctrlAddEventHandler ['LBDblClick','[lbText [10002,(lbCurSel 10002)]] call handleVariableSelection;'];

			_menu ctrlRemoveAllEventHandlers 'LBDblClick';
			_menu ctrlAddEventHandler ['LBDblClick','[lbText [10002,(lbCurSel 10002)]] call handleVariableSelection;'];
		};

		life_ShowHaxLogs = {
			disableSerialization;
			_mainList = uiNamespace getVariable 'mainList';

			lbClear _mainList;
			_mainList lbAdd 'Loading...';
			" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player,5,player];
			publicVariableServer '" + _ahAdminReq + "';
			
			waitUntil {!isNil '" + ahCheatLogs  + "'};
			lbClear _mainList;

			{
				_mainList lbAdd _x;
			} foreach " + ahCheatLogs  + ";

			" + ahCheatLogs  + " = nil;

			_mainList ctrlRemoveAllEventHandlers 'LBDblClick';
			_mainList ctrlAddEventHandler ['LBDblClick','hint (lbText [10001,(lbCurSel 10001)]);'];
		};
		
		life_ShowDeathLogs = {
			disableSerialization;
			_mainList = uiNamespace getVariable 'mainList';

			lbClear _mainList;
			_mainList lbAdd 'Loading...';
			" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player,22,player];
			publicVariableServer '" + _ahAdminReq + "';
			
			waitUntil {!isNil '" + ahPlayerDeaths  + "'};
			lbClear _mainList;

			{
				_mainList lbAdd _x;
			} foreach " + ahPlayerDeaths  + ";

			" + ahPlayerDeaths  + " = nil;

			_mainList ctrlRemoveAllEventHandlers 'LBDblClick';
			_mainList ctrlAddEventHandler ['LBDblClick','hint (lbText [10001,(lbCurSel 10001)]);'];
		};

		life_ShowAdminLogs = {
			disableSerialization;
			_mainList = uiNamespace getVariable 'mainList';

			lbClear _mainList;
			_mainList lbAdd 'Loading...';

			" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player,6,player];
			publicVariableServer '" + _ahAdminReq + "';

			lbClear _mainList;
			waitUntil {!isNil '" + ahAdminLogs + "'};
			{
				_mainList lbAdd _x;
			} foreach " + ahAdminLogs + ";

			" + ahAdminLogs + " = nil;

			_mainList ctrlRemoveAllEventHandlers 'LBDblClick';
			_mainList ctrlAddEventHandler ['LBDblClick','hint (lbText [10001,(lbCurSel 10001)]);'];
		};

		life_AdminWhitelist = {
			disableSerialization;
			_edit = (findDisplay 999) displayCtrl 10004;
			_c = ctrlText _edit;
			
			" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, -19, _c];
			publicVariableServer '" + _ahAdminReq + "';

			systemChat format['AH: UID %1 was whitelisted', _c];
		};

		life_FilterSpawnMenu = {
			params['_input'];
			if (_input == '') exitWith {
				[AdminSpawnType] call life_FillSpawnMenu;
			};

			_arr = [];
			if (AdminSpawnType == 'weapon') then {
				_arr = AllWeapons;
			};

			if (AdminSpawnType == 'vehicle') then {
				_arr = AllVehicles;
			};
			
			if (AdminSpawnType == 'vitem') then {
				_arr = AllVItems;
			};
			
			if (AdminSpawnType == 'backpack') then {
				_arr = AllBackpacks;
			};
				
			_output = [];
			{
				_text = _x select 0;
				_display = _x select 2;
				_in = tolower _input;
				if (((toLower _text) find _in > -1) || ((toLower _display) find _in > -1)) then {
					_output pushBackUnique _x;
				};
			} foreach _arr;					

			[AdminSpawnType, _output, true] call life_FillSpawnMenu;

		};

		life_ViewKeybinds = {
			'Keybinds' hintC [
				'Shift+4: TP 5 meters up',
				'Shift+5: TP 5 meters forwards',
				'F6: Lock/unlock cursor target',
				'F7: Heal self',
				'Shift+F5: Zeus cursor target',
				'Del: Delete (first confirm, second delete)',
				'End: Destroy (first confirm, second destroy)'
			];
		};

		life_FillSpawnMenu = {
			params['_type', ['_input', []], ['_filter', false]];

			_secondList = uiNamespace getVariable 'secondList';
			lbClear _secondList;

			_arr = [];
			if (count _input == 0 && !_filter) then {

				if (_type == 'weapons' || _type == 'weapon') then {
					_arr = AllWeapons;
					AdminSpawnType = 'weapon';
				};

				if (_type == 'vehicles' || _type == 'vehicle') then {
					_arr = AllVehicles;
					AdminSpawnType = 'vehicle';
				};

				if (_type == 'backpacks' || _type == 'backpack') then {
					_arr = AllBackpacks;
					AdminSpawnType = 'backpack';
				};

				if (_type == 'vitems' || _type == 'vitem') then {
					_arr = AllVItems;
					AdminSpawnType = 'vitem';
				};

			} else {
				_arr = _input;
			};
			
			for '_i' from 0 to (count _arr)-1 do {
				_s = _arr select _i;
				_text = _s select 2;
				_pic = _s select 1;
				_class = _s select 0;

				_secondList lbAdd _text;
				_secondList lbSetPicture[_i, _pic];
				_secondList lbSetData [_i, _class];
			};
		};

		life_FillPlayerList = {
			params['_units'];
			_playerList = uiNamespace getVariable 'playerList';
			_targetList = uiNamespace getVariable 'target_display';
			_admins = " + str _admins + ";
			_normies = " + str _sadmins + ";

			_adminObjs = [];
			_playerObjs = [];
			_aiObjs = [];

			ListType = 'player';

			{
				if (!isPlayer _x) then {
					if (simulationEnabled _x) then {
						_aiObjs pushBackUnique _x;
					};
				} else {
					_uid = getPlayerUID _x;
					if (_uid in _admins) then {
						if (!(_uid in _normies)) then {
							_adminObjs pushBackUnique _x;
						} else {
							_playerObjs pushBackUnique _x;
						};
					} else {
						_playerObjs pushBackUnique _x;
					};
				};
			} foreach _units;

			if (!sortByName) then {
				reverse _playerObjs;
				reverse _adminObjs;
			} else {
				_playerObjs sort true;
				_adminObjs sort true;
				_aiObjs sort true;
			};

			lbClear _playerList;
			lbClear _targetList;

			_playerList lbAdd '---Admins---';
		    _playerList lbSetColor [(lbSize 10002)-1,[0.6,1,0.4,1]];

			{	
				_playerList lbAdd format['%1',name _x];

				_weapon = currentWeapon _x;
	            if (_weapon == '') then {
	            	_weapon = primaryWeapon _x;
	            	if (_weapon == '') then {
	            		_weapon = secondaryWeapon _x;
	            	};
	            };
	            
	            _playerList lbSetPicture [(lbSize 10002)-1, (getText (configFile >> 'CfgWeapons' >> _weapon >> 'picture'))];
			
			} foreach _adminObjs;

			_playerList lbAdd '';
			_playerList lbAdd '---Players---';
		    _playerList lbSetColor [(lbSize 10002)-1,[0.302,0.651,1,1]];

		    {

	            if (!((vehicle _x) isKindOf 'LandVehicle') && !((vehicle _x) isKindOf 'Ship') && !((vehicle _x) isKindOf 'Air')) then {

	                _playerList lbAdd format['%1',name _x];
					_flag = '';
	                _weapon = currentWeapon _x;
	                if (_weapon == '') then {
	                	_weapon = primaryWeapon _x;
	                	if (_weapon == '') then {
	                		_weapon = secondaryWeapon _x;

							if (_weapon == '') then {
								if (side _x == opfor) then {
									_flag = '\A3\Data_F\Flags\Flag_red_CO.paa';
								};
								if (side _x == blufor) then {
									_flag = '\A3\Data_F\Flags\Flag_blue_CO.paa';
								};
								if (side _x == independent) then {
									_flag = '\A3\Data_F\Flags\Flag_green_CO.paa';
								};
								if (side _x == civilian) then {
									_flag = '\A3\Data_F\Flags\Flag_white_CO.paa';
								};
							};
	                	};
	                };
	                
					if (_weapon == '') then {
						_playerList lbSetPicture [(lbSize 10002)-1, _flag];
					} else {
						_playerList lbSetPicture [(lbSize 10002)-1, (getText (configFile >> 'CfgWeapons' >> _weapon >> 'picture'))];
					};
		        };
		    } forEach _playerObjs;

		    _playerList lbAdd '';
		    _playerList lbAdd '---In Vehicle---';
		    _playerList lbSetColor [(lbSize 10002)-1,[0.502,0.502,1,1]];
		    {

	            if(((vehicle _x) isKindOf 'LandVehicle') or ((vehicle _x) isKindOf 'Ship') or ((vehicle _x) isKindOf 'Air')) then {
	                {
	                    _playerList lbAdd format['%1',name _x];
	                    _playerList lbSetPicture [(lbSize 10002)-1, (getText (configFile >> 'cfgVehicles' >> typeOf (vehicle _x) >> 'picture'))];
	                } forEach crew _x;
	            };
		        
		    } foreach _playerObjs;

			if (AdminListAis && (count _aiObjs) > 0) then {
				_playerList lbAdd '';
				_playerList lbAdd '---AI---';
				_playerList lbSetColor [(lbSize 10002)-1,[0.502,0.502,1,1]];
				{
					if(((vehicle _x) isKindOf 'LandVehicle') or ((vehicle _x) isKindOf 'Ship') or ((vehicle _x) isKindOf 'Air')) then {
						{
							_playerList lbAdd format['%1',name _x];
							_playerList lbSetPicture [(lbSize 10002)-1, (getText (configFile >> 'cfgVehicles' >> typeOf (vehicle _x) >> 'picture'))];
						} forEach crew _x;
					} else {
						_playerList lbAdd format['%1',name _x];
						_flag = '';
						_weapon = currentWeapon _x;
						if (_weapon == '') then {
							_weapon = primaryWeapon _x;
							if (_weapon == '') then {
								_weapon = secondaryWeapon _x;

								if (_weapon == '') then {
									if (side _x == opfor) then {
										_flag = '\A3\Data_F\Flags\Flag_red_CO.paa';
									};
									if (side _x == blufor) then {
										_flag = '\A3\Data_F\Flags\Flag_blue_CO.paa';
									};
									if (side _x == independent) then {
										_flag = '\A3\Data_F\Flags\Flag_green_CO.paa';
									};
									if (side _x == civilian) then {
										_flag = '\A3\Data_F\Flags\Flag_white_CO.paa';
									};
								};
							};
						};
						
						if (_weapon == '') then {
							_playerList lbSetPicture [(lbSize 10002)-1, _flag];
						} else {
							_playerList lbSetPicture [(lbSize 10002)-1, (getText (configFile >> 'CfgWeapons' >> _weapon >> 'picture'))];
						};
					};
				} foreach _aiObjs;
			};

		    _playerList ctrlRemoveAllEventHandlers 'LBDblClick';
			_playerList ctrlAddEventHandler ['LBDblClick','[lbText [10002,(lbCurSel 10002)]] call life_HandlePlayerSelection;'];
		};

		fillExecList = {
			params[['_filter', '']];

			_players = [_filter, false, true] call life_FilterList;
			
			lbClear codePlayers;
			{
				codePlayers lbAdd (name _x);		
				codePlayers lbSetData [_forEachIndex, (name _x)];
			} foreach _players;
		};

		saveExecutedCode = {
			params['_code'];

			_oldCodes = profileNamespace getVariable ['AH_codeArr', []];
			_oldCodes pushBack _code;

			if ((count _oldCodes) > 50) then {
				_oldCodes resize 50;
			};
			
			profileNamespace setVariable ['AH_codeArr', _oldCodes];
			saveProfileNamespace;
		};

		setSelectedCode = {
			params['_add'];
			_oldCodes = profileNamespace getVariable ['AH_codeArr', []];

			_codeStr = '';

			if (_add) then {
				if (selectedCodeIndex < ((count _oldCodes)-1)) then {
					selectedCodeIndex = selectedCodeIndex + 1;
				};
			} else {
				if (selectedCodeIndex < 0) then {
					selectedCodeIndex = -1;
				} else {
					selectedCodeIndex = selectedCodeIndex - 1;
				};
			};

			if (selectedCodeIndex != -1) then {
				_codeStr = _oldCodes select selectedCodeIndex;
			};

			codeEdit ctrlSetText _codeStr;
		};

		CodeExecutor = {
			disableSerialization;

			closeDialog 0;
			createDialog 'AH_ExecMenu';
			_display = findDisplay 6969;

			codePlayers = _display displayCtrl 1500;
			codeFilter = _display displayCtrl 1401;
			codeEdit = (findDisplay 6969) displayCtrl 1400;
			selectedCodeIndex = -1;

			call fillExecList;

			codeFilter ctrlRemoveAllEventHandlers 'keyUp'; 
			codeFilter ctrlAddEventHandler['keyUp', '[ctrlText 1401] call fillExecList;'];

			_playerExec = _display displayCtrl 1600;
			_playerExec buttonSetAction '
				disableSerialization;
				_c = ctrlText codeEdit;

				[_c] call saveExecutedCode;

				_list = (findDisplay 6969) displayCtrl 1500;
				_selId = lbCurSel _list;
				if (_selId != -1) then {
					_name = _list lbData _selId;
					{
						if (name _x == _name) then {
							" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player,26,[_x, _c]];
							publicVariableServer ''" + _ahAdminReq + "'';
							hint (''Executed on '' + _name);
						};
					} foreach allPlayers;
				};
			';

			_localExec = _display displayCtrl 1601;
			_localExec buttonSetAction '
				disableSerialization;
				_c = ctrlText codeEdit;

				[_c] call saveExecutedCode;

				call compile _c;
			';

			_globalExec = _display displayCtrl 1602;
			_globalExec buttonSetAction '
				disableSerialization;
				_c = ctrlText codeEdit;

				[_c] call saveExecutedCode;
				
				" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player,26,[-2, _c]];
				publicVariableServer ''" + _ahAdminReq + "'';
				hint ''Executed'';
			';

			_serverExec = _display displayCtrl 1603;
			_serverExec buttonSetAction '
				disableSerialization;
				_c = ctrlText codeEdit;

				[_c] call saveExecutedCode;

				" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player,26,[2, _c]];
				publicVariableServer ''" + _ahAdminReq + "'';
				hint ''Executed'';
			';

			_nextCode = _display displayCtrl 1604;
			_nextCode buttonSetAction '
				[false] call setSelectedCode;
			';

			_prevCode = _display displayCtrl 1605;
			_prevCode buttonSetAction '
				[true] call setSelectedCode;
			';
		};


		life_HandleLoadoutSelection = {
			params['_name'];

			_loadouts = profileNamespace getVariable['ah_loadouts', []];

			if (_name == '') exitWith {};

			_loadout = [_name, _loadouts] call life_GetLoadout;

			systemChat format['Loading %1', _name];
			player setUnitLoadout _loadout;
		
		};

		life_GetLoadout = {
			params['_name', '_loadouts'];
			_ret = [];
			
			{
				if ((_x select 0) == _name) then {
					_ret = _x;
				};
			} foreach _loadouts;

			_ret
		};


		life_FillLoadoutSubMenu = {
			params['_value'];
			if (_value == '') exitWith {};

			if (_value == '-') exitWith {
				disableSerialization;
				_menu = (uiNamespace getVariable 'target_display');
				lbClear _menu;

				_options = [];

				_options pushBack 'Save current loadout';
				_options pushBack 'Load selected loadout';
				_options pushBack 'Override selected loadout';
				_options pushBack 'Duplicate selected loadout';
				_options pushBack 'Delete selected loadout';

				_options pushBack '';
				_options pushBack 'Delete all loadouts';

				{
					_menu lbAdd _x;
				} foreach _options;	

				_menu ctrlRemoveAllEventHandlers 'LBDblClick';
				_menu ctrlAddEventHandler ['LBDblClick','[lbText [10011,(lbCurSel 10011)]] call life_FillLoadoutSubMenu;'];
			};

			_loadouts = profileNamespace getVariable['ah_loadouts', []];

			_selId = lbCurSel 10002;
			_selText = lbText [10002,_selId];

			switch (_value) do { 
				case 'Save current loadout' : { 
					_edit = (findDisplay 999) displayCtrl 10004;
					_name = ctrlText _edit;

					if (_name == '') exitWith {
						systemChat 'AH: U dumb man, loadout name cant be empty af!';
					};

					_loadout = getUnitLoadout player;
					_loadouts = _loadouts + [[_name, _loadout]];

					systemChat format['AH: Saving %1', _name];

					profileNamespace setVariable ['ah_loadouts', _loadouts];
					saveProfileNamespace;
				}; 
				case 'Load selected loadout' : {
					if (_selText == '') exitWith {};
					_loadout = [_selText, _loadouts] call life_GetLoadout;
					player setUnitLoadout (_loadout select 1);

				};
				case 'Override selected loadout' : { 
					if (_selText == '') exitWith {};

					{
						_name = _x select 0;
						if (_name == _selText) exitWith {
							_arr = [_name, getUnitLoadout player];
							_loadouts set[_forEachIndex, _arr];
							profileNamespace setVariable ['ah_loadouts', _loadouts];
							saveProfileNamespace;
						};
					} foreach _loadouts;
				}; 
				case 'Duplicate selected loadout' : { 
					if (_selText == '') exitWith {};

					_edit = (findDisplay 999) displayCtrl 10004;
					_name = ctrlText _edit;

					if (_name == '') exitWith {
						systemChat 'AH: U dumb man, loadout name cant be empty af!';
					};

					_loadout = [_selText, _loadouts] call life_GetLoadout;
					_loadouts = _loadouts + [[_name, getUnitLoadout player]];
					profileNamespace setVariable ['ah_loadouts', _loadouts];
					saveProfileNamespace;
				};
				case 'Delete selected loadout' : { 
					if (_selText == '') exitWith {};

					{
						_name = _x select 0;
						if (_name == _selText) exitWith {
							systemChat format['AH: Deleted %1', _name];

							_loadouts deleteAt _forEachIndex;
							profileNamespace setVariable ['ah_loadouts', _loadouts];
							saveProfileNamespace;
						};
					} foreach _loadouts;
				}; 
				case 'Delete all loadouts' : {
					systemChat 'AH: Clearning loadouts';
					profileNamespace setVariable ['ah_loadouts', []];
					saveProfileNamespace;
				};

				default {}; 
			};
			call life_FillLoadouts;

		};

		life_FillLoadouts = {
			disableSerialization;

			_list = uiNamespace getVariable 'playerList';
			lbClear _list;

			_loadouts = profileNamespace getVariable['ah_loadouts', []];
			
			{
				_name = _x select 0;
				_list lbAdd _name;
			} foreach _loadouts;

			['-'] call life_FillLoadoutSubMenu;

			_list ctrlRemoveAllEventHandlers 'LBDblClick';
			_list ctrlAddEventHandler ['LBDblClick','[lbText [10002,(lbCurSel 10002)]] call life_HandleLoadoutSelection;'];
		};

		life_FilterList = {
			params['_filter', ['_fill', true], ['_filterPlayers', false]];

			_filter = toLower _filter;
			_output = [];

			if (ListType == 'variable' && !_filterPlayers) then {
				[_filter] call life_VariableViewer;
			} else {
				_players = allPlayers;

				{
					if (((toLower (name _x)) find _filter > -1) || ((getPlayerUID _x) find _filter > -1)  || (_filter == '')) then {
						_output pushBack _x;
					};
				} foreach _players;

				if (_fill) then {
					[_output] call life_FillPlayerList;
				};
			};
			_output
		};

		life_FilterPlayerList = {
			params['_filter'];
			_players = allPlayers;
			_list = uiNamespace getVariable 'playerList';
			_output = [];

			_filter = toLower _filter;

			lbClear _list;
			{
				if (((toLower (name _x)) find _filter > -1) || ((getPlayerUID _x) find _filter > -1)  || (_filter == '')) then {
					_output pushBack _x;
				};
			} foreach _players;

			[_output] call life_FillPlayerList;
		};

		[] spawn {
			adminlevelTestVal = " + _adminLevel + ";
			while {true} do {
				waitUntil {adminlevelTestVal != " + _adminLevel + "};
				" + _adminLevel + " = adminlevelTestVal;
				systemChat 'AH: STHAAAP MODIFYING MAH ADMIN LVL!';
			};
		};

		life_HandleAdminSpawn = {
			params['_index'];
			_list = uiNamespace getVariable 'secondList';
			_item = _list lbData _index;

			if (AdminSpawnType == 'weapon') exitWith {

				systemChat format['AH: Spawning %1', _item];

				switch(getNumber(configFile >> 'CfgWeapons' >> _item >> 'ItemInfo' >> 'type')) do {
					case 801: {
						player forceAddUniform _item;
					};
					case 701: {
						player addVest _item;
					};
					case 201: {
						player addItem _item;
					};
					case 101: {
						player addItem _item;
					};
					default {		
						player addWeapon _item;

						_mags = getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
						_mag = _mags select 0;
						
						player addMagazine _mag;
						player addMagazine _mag;
					};
				};
			};

			if (AdminSpawnType == 'vehicle') exitWith {

				[_item] spawn {
					params['_type'];
					adminSpawnType = _type;

					adminSpawnTmp = _type createVehicleLocal (position player);

					_bbr = boundingBoxReal adminSpawnTmp;
					_p1 = _bbr select 0;
					_p2 = _bbr select 1;
					_maxLength = abs ((_p2 select 1) - (_p1 select 1));
					_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

					adminSpawnTmp attachTo [player, [0, _maxLength, _maxHeight / 2]];

					vehicleSpawnEH = (findDisplay 46) displayAddEventHandler['KeyUp', {
						if (_this select 1 == 0x39) then {
							_pos = getPos adminSpawnTmp;

							_class = adminSpawnType;
							_dir = getDir adminSpawnTmp;
							vnick = createVehicle[_class, _pos, [], 0, 'CAN_COLLIDE'];
							vnick allowdamage false;
							vnick enableSimulation false;

							deleteVehicle adminSpawnTmp;

							vnick setPosATL _pos;
							vnick setDir _dir;
							[] spawn {
								sleep 1;
								vnick allowdamage true;
								vnick enableSimulation true;
								vnick = nil;
							};
							life_vehicles pushBack vnick;
							[getPlayerUID player,playerSide,vnick,1] remoteExec ['TON_fnc_keyManagement',2];

							
							(findDisplay 46) displayRemoveEventHandler['KeyUp', vehicleSpawnEH];

							systemChat format['AH: Spawning %1', adminSpawnType];
						} else {
							if (_this select 1 == 0x3B) then {
								deleteVehicle adminSpawnTmp;
								(findDisplay 46) displayRemoveEventHandler['KeyUp', vehicleSpawnEH];
							};
						};
					}];
				};
			};

			if (AdminSpawnType == 'backpack') exitWith {
				systemChat format['AH: Spawning %1', _item];
				removeBackpack player;
				player addBackpack _item;
			};

			if (AdminSpawnType == 'vitem') exitWith {
				systemChat format['AH: Spawning %1', _item];		
				[true,_item,1,'ah'] call ANZUS_fnc_handleInv;
			};

			systemChat 'AH: Spawn error, spawn type not defined';
		};

		life_HandleAdminFuncs = {
			params['_selected'];

			if !(_selected in toggleFuncs) then {
				toggleFuncs = toggleFuncs + [_selected];
			} else {
				toggleFuncs = toggleFuncs - [_selected];
			};

			switch (_selected) do {
				case '---View Hacker Logs---': {[] spawn life_ShowHaxLogs;};
				case '---View Admin Logs---': {[] spawn life_ShowAdminLogs;};
				case '---Spawn Weapons---': {['weapons'] call life_FillSpawnMenu;};
				case '---Spawn Vehicles---': {['vehicles'] call life_FillSpawnMenu;};
				case '---Spawn Backpacks---': {['backpacks'] call life_FillSpawnMenu;};
				case '---Spawn VItems---': {['vitems'] call life_FillSpawnMenu;};
				case '---View Loadouts---': {call life_FillLoadouts;};
				case '---Variable Viewer---': {[''] call life_VariableViewer;};
				case '---View Players---': {[allPlayers] call life_FillPlayerList;};
				case '---View Death Logs---': {[] spawn life_ShowDeathLogs;};
				case 'God Mode': {call life_ShowAdminMenu; [-1] call life_nofityServer; call life_AdminGod;};
				case 'Vehicle God Mode': {call life_ShowAdminMenu; [-9] call life_nofityServer; call life_AdminVGod;};
				case 'Auto Revive': {call life_ShowAdminMenu; [-10] call life_nofityServer; call life_AdminAutoRevive;};
				case 'ESP': {call life_ShowAdminMenu; [-2] call life_nofityServer; call life_AdminESP;};
				case 'AI ESP': {call life_ShowAdminMenu; [-13] call life_nofityServer; call life_AdminAiESP;};
				case 'Map Markers': {call life_ShowAdminMenu; [-3] call life_nofityServer; call life_AdminMarkers;};
				case 'Dead Markers': {call life_ShowAdminMenu; [-4] call life_nofityServer; call life_AdminDeadMarkers;};
				case 'Non-finite Ammo': {call life_ShowAdminMenu; [-14] call life_nofityServer; call life_AdminInfAmmo;};
				case 'Rapid Fire': {call life_ShowAdminMenu; [-15] call life_nofityServer; call life_AdminRapidFire;};
				case 'No Recoil': {call life_ShowAdminMenu; [-16] call life_nofityServer; call life_AdminRecoil;};
				case 'No Sway': {call life_ShowAdminMenu; [-17] call life_nofityServer; call life_AdminSway;};
				case 'No Fatigue': {call life_ShowAdminMenu; [-18] call life_nofityServer; call life_AdminFatigue;};
				case 'Invisibility': {call life_ShowAdminMenu; call life_AdminStealth;};
				case 'Snorting Speed': {call life_ShowAdminMenu; call life_AdminSpeed;};
				case 'Fly mode': {call life_ShowAdminMenu; [-8] call life_NotifyServer; call life_AdminFly;};
				case 'Vehicle Boost': {call life_ShowAdminMenu; [-11] call life_NotifyServer; call life_AdminBoost;};
				case 'Map Teleport': {call life_ShowAdminMenu; call life_AdminTP};
				case 'List AIs': {AdminListAis = !AdminListAis; call life_ShowAdminMenu;};
				case 'No Grass': {call life_ShowAdminMenu; [-5] call life_nofityServer; call life_AdminNoGrass;};
				case 'Display near Players': {call life_AdminListNear; call life_ShowAdminMenu; [-19] call life_nofityServer;};
				case 'Sort Player by Name': {call life_ShowAdminMenu; sortByName = !sortByName;};
				case 'Disable Announcements': {call life_ShowAdminMenu; showAdminMessages = !showAdminMessages; profileNamespace setVariable['adminAnnouncements', showAdminMessages]; };
				case 'Self Disconnect': {closeDialog 0; (finddisplay 46) closeDisplay 0;};
				case 'Revive Near Players': { call life_AdminReviveNear; };
				case 'Free Cam': {closeDialog 0; [-6] call life_nofityServer; [] call bis_fnc_camera;};
				case 'Virtual Arsenal': { closeDialog 0; [-7] call life_nofityServer; ['Open',true] spawn BIS_fnc_arsenal;};
				case 'Day Time (Global)': { [2018, 2, 17, 12, 00] call life_ChangeTime; };
				case 'Night Time (Global)': { [2018, 2, 17, 00, 00] call life_ChangeTime; };
				case 'Give Ammo': { [2018, 2, 17, 00, 00] call life_AdminGiveAmmo; };
				case 'Rainbow Vehicle': { [] call life_AdminRainbow; };
				case 'Whitelist UID': { [] call life_AdminWhitelist; };
				case 'View Keybinds': { closeDialog 0; [] call life_ViewKeybinds; };
			};
		};
		");


		AH_AdminCode = AH_AdminCode + ("

		life_NofityServer = {
			params['_id'];
			" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, _id, 'notify'];
			publicVariableServer '" + _ahAdminReq + "';
		};

		life_HandlePlayerActions = {
			params['_value'];

			if (isNil 'currentTarget') then {
				systemChat 'Target is not set';
			};

			if (isNull currentTarget) then {
				systemChat 'Target is not set';
			};

			_len = (count (name currentTarget)) + 1;
			_option = [_value, _len] call trimString;

			switch (_value) do {
				case 'Teleport target to me' : {
					_req = [getPosATL (vehicle player), currentTarget];
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 7, _req];

					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Teleported %1 to me', name currentTarget];
				}; 
				case 'Move into target vehicle' : {
					if (local (vehicle currentTarget) ) then {
						player moveInCargo (vehicle currentTarget);
					} else {
						" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 28, currentTarget];
						publicVariableServer '" + _ahAdminReq + "';
					};
					systemChat format['Got in %1 vehicle', name currentTarget];
				};
				case 'Move target into your vehicle' : {
					if (local (vehicle player) ) then {
						currentTarget moveInCargo (vehicle player);
					} else {
						" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 27, currentTarget];
						publicVariableServer '" + _ahAdminReq + "';
					};
					systemChat format['%1 got in your vehicle', name currentTarget];
				};
				default {};
			};

			switch (_option) do { 
				case 'Ban' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 2, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Banned %1', name currentTarget];
				}; 
				case 'Kick' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 1, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Kicked %1', name currentTarget];
				}; 
				case 'Kill' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 0, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Killed %1', name currentTarget];
				}; 
				case 'Freeze' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 13, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Froze %1', name currentTarget];
				}; 
				case 'Restrain' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 16, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Restrained %1', name currentTarget];
				}; 
				case 'Jail' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 17, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Jailed %1', name currentTarget];
				}; 
				case 'Zeus' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 20, getPos currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Zeused %1', name currentTarget];
				}; 
				case 'Heal' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 8, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Healed %1', name currentTarget];
				}; 
				case 'Revive' : {
					if (getPlayerUID currentTarget == '') exitWith {
						systemChat 'Unable to revived, player already left';
					};

					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 12, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';

					currentTarget setVariable ['Revive',false,true];
					[currentTarget] remoteExec ['ANZUS_fnc_cprrevived',currentTarget];

					systemChat format['Revived %1', name currentTarget];
				}; 
				case 'Teleport to' : {
					_req = [(position currentTarget), vehicle player];
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 7, _req];

					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Teleported to %1', (name currentTarget)];
				}; 
				case 'Spectate' : {
					currentTarget switchCamera 'EXTERNAL';
					_msg = format['Spectating %1 - Press F1 to cancel', name currentTarget];
					systemChat _msg;
					hint _msg;

					(findDisplay 46) displayAddEventHandler['KeyDown','if (_this select 1 == 0x3B) then { vehicle player switchCamera ''EXTERNAL'' };'];
				};
				case 'Unfreeze' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 14, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Unfroze %1', name currentTarget];
				};
				case 'Unrestrain' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 18, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Unrestrained %1', name currentTarget];
				};
				case 'Free' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 19, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					systemChat format['Freed %1', name currentTarget];
				};
				case 'Copy Loadout' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 24, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					_loadout = getUnitLoadout currentTarget;
					player setUnitLoadout _loadout;
					systemChat format['Copied %1 Loadout!', name currentTarget];
				};
				case 'Transfer Loadout' : {
					" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 25, currentTarget];
					publicVariableServer '" + _ahAdminReq + "';
					
					systemChat format['Cloned Loadout on %1!', name currentTarget];
				};
				default {}; 
			};
		};
			
		life_HandlePlayerSelection = {
			params['_name'];

			_target = objNull;
			{
				if (name _x == _name) then {
					_target = _x;
				};
			} foreach allPlayers;

			if (isNull _target) exitWith {
				systemChat 'Target not found!';
			};

			currentTarget = _target;
			
			_options = [];

			_options = [_options, ['Ban %1', 'red'], true] call life_AddToAdminList;
			_options = [_options, ['Kick %1', 'red'], true] call life_AddToAdminList;
			_options = [_options, ['Kill %1', 'red'], true] call life_AddToAdminList;
			_options = [_options, ['Freeze %1', 'red'], true] call life_AddToAdminList;
			_options = [_options, ['Restrain %1', 'red'], true] call life_AddToAdminList;
			_options = [_options, ['Jail %1', 'red'], true] call life_AddToAdminList;
			_options = [_options, ['Zeus %1', 'red'], true] call life_AddToAdminList;

			_options = [_options, ['', 'spacer'], false] call life_AddToAdminList;

			_options = [_options, ['Heal %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Revive %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Teleport to %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Teleport target to me', 'green'], false] call life_AddToAdminList;
			_options = [_options, ['Spectate %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Unfreeze %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Unrestrain %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Free %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Copy Loadout %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Transfer Loadout %1', 'green'], true] call life_AddToAdminList;
			_options = [_options, ['Move into target vehicle', 'green'], false] call life_AddToAdminList;
			_options = [_options, ['Move target into your vehicle', 'green'], false] call life_AddToAdminList;
				
			_options = [_options, ['', 'spacer'], false] call life_AddToAdminList;

			_tmp = _options;
			_options = [];
			{
				_txt = _x select 0;
				_color = _x select 1;

				_options = _options + [[format[_txt, (name _target)], _color]];
			} foreach _tmp;

			_options = _options + [[format['Name: %1', name _target], 'spacer']];
			_options = _options + [[format['Steam Name: %1', _target getVariable['" + _steamName + "', 'Unknown']], 'spacer']];
			_options = _options + [[format['UID: %1', getPlayerUID _target], 'spacer']];
			_options = _options + [[format['Position: %1', mapGridPosition _target], 'spacer']];
			_options = _options + [[format['Health: %1', round (100 - ((damage _target) * 100))], 'spacer']];
			_options = _options + [[format['Cash: %1', _target getVariable['" + playerCash + "', 0]], 'spacer']];
			_options = _options + [[format['Bank: %1', _target getVariable['" + playerBank + "', 0]], 'spacer']];
			

			_menu = (uiNamespace getVariable 'target_display');
			lbClear _menu;

			for '_i' from 0 to (count _options)-1 do {
				_curArry = _options select _i;
				_txt = _curArry select 0;
				_color = _curArry select 1;
				_action = _curArry select 2;


				_menu lbAdd _txt;
				if (_color == 'green') then {
					_menu lbSetColor [_i,[0,0.7,0.8,1]]; 
				};
				if (_color == 'red') then {
					_menu lbSetColor [_i,[0.8,0.4,0.4,1]]; 
				};
				if (_color == 'spacer') then {
					_menu lbSetColor [_i,[0.8,0.9,0.8,1]]; 
				};
				
			};

			_menu ctrlRemoveAllEventHandlers 'LBDblClick';
			_menu ctrlAddEventHandler ['LBDblClick','[lbText [10011,(lbCurSel 10011)]]  call life_HandlePlayerActions;'];
		};


		life_CreateBg = {
			_bg = _display ctrlCreate ['RscText', -1];
			_bg ctrlSetPosition _this;
			_bg ctrlSetBackgroundColor [0,0,0,0.4];
			_bg ctrlCommit 0;
		};

		
		life_FormatTopBar = {
			_topText = format['<t size=''1'' align=''left''>Classic Project - Jugadores Online: %1 - Servidor Online: %2</t>', str (count allPlayers), call AH_TimeStr];
			_bar = uiNamespace getVariable 'topBar';
			_bar ctrlSetStructuredText parseText _topText;
		};

		life_ShowAdminMenu = {
			_adminMenu = [];
			if (isNil 'toggleFuncs') then {
				toggleFuncs = [];

				if (!showAdminMessages) then {
					toggleFuncs = toggleFuncs + ['Disable Announcements'];
				};
			};

			disableSerialization;
			_display = (findDisplay 999);

			if (!dialog) then {
				createDialog ""RscCredits"";
				_display = (findDisplay 999);

				{
					_x ctrlShow false;
				} forEach (allControls (findDisplay 999));

				[-0.6875,-0.32,0.75,1.32] call life_CreateBg;

				_mainList = _display ctrlCreate ['RscListbox', 10001];
				_mainList ctrlSetPosition [-0.6875,-0.32,0.75,1.32];
				_mainList ctrlSetForegroundColor [0,0,0,0.7];
				_mainList ctrlCommit 0;
				uiNamespace setVariable ['mainList',_mainList];

				[0.0875,-0.32,0.45,1.58] call life_CreateBg;
				_playerList = _display ctrlCreate ['RscListbox', 10002];
				_playerList ctrlSetPosition [0.0875,-0.32,0.45,1.58];
				_playerList ctrlSetBackgroundColor [0,0,0,0.7];
				_playerList ctrlSetForegroundColor [0,0,0,0.7];
				_playerList ctrlCommit 0;
				uiNamespace setVariable ['playerList',_playerList];

				[1.1625,-0.32,0.5375,1.58] call life_CreateBg;
				_secondList = _display ctrlCreate ['RscListbox', 10003];
				_secondList ctrlSetPosition [1.1625,-0.32,0.5375,1.58];
				_secondList ctrlSetBackgroundColor [0,0,0,0.7];
				_secondList ctrlSetForegroundColor [0,0,0,0.7];
				_secondList ctrlCommit 0;
				uiNamespace setVariable ['secondList',_secondList];

				_editCtrl = _display ctrlCreate ['RscEdit', 10004];
				_editCtrl ctrlSetPosition [-0.6875,1.008,0.75,0.232];
				_editCtrl ctrlSetBackgroundColor [0,0,0,0.6];
				_editCtrl ctrlCommit 0;

				_btnBg = _display ctrlCreate ['RscButtonMenu', 10005];
				_btnBg ctrlSetPosition [-0.6875,1.26,0.75,0.06];
				_btnBg ctrlCommit 0;
				_btnBg ctrlEnable false;

				if (['Executor'] call adminHasPerm) then {
					_execBtn = _display ctrlCreate ['RscButtonMenuOk', 10006];
					_execBtn ctrlSetPosition [-0.6725,1.268,0.1175,0.04];
					_execBtn ctrlSetBackgroundColor [0.5,0.5,0.5,0.5];
					_execBtn ctrlSetText 'Ejecutar';
					_execBtn ctrlCommit 0;
					_execBtn buttonSetAction '
						disableSerialization;
						_edit = (findDisplay 999) displayCtrl 10004;
						_c = ctrlText _edit;
						call compile _c;
					';
				};
				
				if (['Admin Message'] call adminHasPerm) then {
					_msgBtn = _display ctrlCreate ['RscButtonMenuOk', 10007];
					_msgBtn ctrlSetPosition [-0.5285,1.268,0.1275,0.04];
					_msgBtn ctrlSetBackgroundColor [0.5,0.5,0.5,0.5];
					_msgBtn ctrlSetText 'Mensaje';
					_msgBtn ctrlCommit 0;
					_msgBtn buttonSetAction '
						disableSerialization;
						_edit = (findDisplay 999) displayCtrl 10004;
						_c = ctrlText _edit;
						" + _ahAdminReq + " = [call " + _ahPlayerToken + ", player, 15, _c];
						publicVariableServer ''" + _ahAdminReq + "'';
					';
				};


				_abortBtn = _display ctrlCreate ['RscButtonMenuOk', 10008];
				_abortBtn ctrlSetPosition [-0.3740,1.268,0.1355,0.04];
				_abortBtn ctrlSetBackgroundColor [0.5,0.5,0.5,0.5];
				_abortBtn ctrlSetText 'Salir';
				_abortBtn ctrlCommit 0;
				_abortBtn buttonSetAction 'endmission ''loser''';

				_filterEdit = _display ctrlCreate ['RscEdit', 10009];
				_filterEdit ctrlSetPosition [0.0875,1.28,0.45,0.04];
				_filterEdit ctrlSetBackgroundColor [0,0,0,0.6];
				_filterEdit ctrlCommit 0;
				_filterEdit ctrlRemoveAllEventHandlers 'keyUp'; 
				_filterEdit ctrlAddEventHandler['keyUp', '[ctrlText 10009] call life_FilterList;'];

				_filterItem = _display ctrlCreate ['RscEdit', 10013];
				_filterItem ctrlSetPosition [1.1625,1.28,0.5375,0.04];
				_filterItem ctrlSetBackgroundColor [0,0,0,0.6];
				_filterItem ctrlCommit 0;
				_filterItem ctrlRemoveAllEventHandlers 'keyUp'; 
				_filterItem ctrlAddEventHandler['keyUp', '[ctrlText 10013] call life_FilterSpawnMenu;'];


				_mapCtrl = _display ctrlCreate ['RscMapControl', 10010];
				_mapCtrl ctrlSetPosition [0.55,0.56,0.6,0.76];
				_mapCtrl ctrlCommit 0;

				ctrlMapAnimClear _mapCtrl;
				_mapCtrl ctrlMapAnimAdd [0, 0.05, getPos player];
				ctrlMapAnimCommit _mapCtrl;
				

				[0.55,-0.32,0.6,0.86] call life_CreateBg;
				uiNamespace setVariable['target_display',_display ctrlCreate ['RscListBox', 10011]];
				(uiNamespace getVariable 'target_display') ctrlSetPosition [0.55,-0.32,0.6,0.86];
				(uiNamespace getVariable 'target_display') ctrlSetBackgroundColor [0,0,0,0.6];
				(uiNamespace getVariable 'target_display') ctrlCommit 0;


				_topBar = _display ctrlCreate ['RscStructuredText', 10012];
				_topBar ctrlSetPosition [-0.6875,-0.388,2.3875,0.06];
				_topBar ctrlSetBackgroundColor [0,0,0,0.7]; 
				_topBar ctrlSetTextColor [1,1,1,0.7];
				_topBar ctrlCommit 0;
				uiNamespace setVariable ['topBar',_topBar];

				[] call life_FormatTopBar;
			};


			_mainList = uiNamespace getVariable 'mainList';
			_playerList = uiNamespace getVariable 'playerList';

			lbClear _mainList;
			
			[allUnits] call life_FillPlayerList;



			_adminMenu = [_adminMenu, ['---View Hacker Logs---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---View Admin Logs---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---------------','spacer']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---Spawn Weapons---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---Spawn Vehicles---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---Spawn Backpacks---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---Spawn VItems---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---View Loadouts---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---Variable Viewer---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---View Players---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---View Death Logs---','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---------------','spacer']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['God Mode','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Vehicle God Mode','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Auto Revive','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['ESP','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['AI ESP','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Map Markers','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Dead Markers','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Non-finite Ammo','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Rapid Fire','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['No Recoil','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['No Sway','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['No Fatigue','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Invisibility','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Snorting Speed','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Fly mode','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Map Teleport','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['No Grass','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Vehicle Boost','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Display near Players','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Sort Player by Name','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['List AIs','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Disable Announcements','toggle']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Self Disconnect','green']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---------------','spacer']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Revive Near Players','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Free Cam','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Virtual Arsenal','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Day Time (Global)','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Night Time (Global)','blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Give Ammo', 'blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Rainbow Vehicle', 'blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['Whitelist UID', 'blue']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['---------------','spacer']] call life_AddToAdminList;
			_adminMenu = [_adminMenu, ['View Keybinds', 'blue']] call life_AddToAdminList;


			for '_i' from 0 to (count _adminMenu)-1 do {
				_curArry = _adminMenu select _i;
				_txt = _curArry select 0;
				_color = _curArry select 1;
				_action = _curArry select 2;

				_mainList lbAdd _txt;
				if (_color == 'blue') then {
					_mainList lbSetColor [_i,[0,0.7,0.8,1]]; 
				};
				if (_color == 'red') then {
					_mainList lbSetColor [_i,[0.8,0.4,0.4,1]]; 
				};
				if (_color == 'spacer') then {
					_mainList lbSetColor [_i,[0.8,0.9,0.8,1]]; 
				};
				if (_color == 'toggle') then {
					if !(_txt in toggleFuncs) then {
						_mainList lbSetColor [_i, [0.9, 0.4, 0.4, 1]];
					} else {
						_mainList lbSetColor [_i, [0.4, 0.8, 0.4, 1]];
					};
				};
			};

			if (['---Spawn Weapons---'] call adminHasPerm) then {
				['weapons'] call life_FillSpawnMenu;
			} else {
				if (['---Spawn Vehicles---'] call adminHasPerm) then {
					['vehicle'] call life_FillSpawnMenu;
				};
			};

			_mainList ctrlRemoveAllEventHandlers 'LBDblClick';
			_mainList ctrlAddEventHandler ['LBDblClick','_func = lbText [10001,(lbCurSel 10001)]; [_func] call life_HandleAdminFuncs;'];

			_secondList = uiNamespace getVariable 'secondList';
			_secondList ctrlRemoveAllEventHandlers 'LBDblClick';
			_secondList ctrlAddEventHandler ['LBDblClick','[(lbCurSel 10003)] call life_HandleAdminSpawn;'];
					
		};

		trimString = {
			params['_input', ['_len', 3]];
			
			_arr = toArray _input;
			if (count _arr > _len) then {
				_arr resize ((count _arr) - _len);
				_output = toString _arr;
				_output
			} else {
				_input
			};
		};

		adminHasPerm = {
			params['_what'];

			_ret = false;
			if (_what != '---------------' && _what != '') then {
				if (" + _adminLevel + " == 0) then {
					_ret = true;
				} else {
					{
						if (" + _adminLevel + " >= (_x select 0)) then {
							if (_what in (_x select 1)) then {
								_ret = true;
							};
						};
					} foreach adminPerms;
				};
			} else {
				_ret = true;
			};

	 		_ret
		};

		life_AddToAdminList = {
			params['_list', '_option', ['_trim', false]];

			_txt = _option select 0;

			if (_trim) then {
				_txt = [_txt] call trimString;
			};

			if ([_txt] call adminHasPerm) then {
				_list = _list + [_option];
			};
		
 			_ret = _list;
 			_ret
		};
		firstRun = false;
		systemChat 'SERVER Antihack: Press F1 to open Admin Menu!';
	};
	");

	diag_log "SERVER Antihack: ADMIN CODE COMPILED, COMPING USER CODE";

	AH_MainCode = ("
	" + _ahLoadState + " = [];


	[] spawn {
		_pbos = [];
		_patches = configFile >> 'CfgPatches';
		for '_i' from 0 to (count _patches)-1 do {
			_patch = _patches select _i;
			if (isClass _patch) then {
				_pbos pushBackUnique (configName _patch);
			};
		};

		_oldUids = profileNamespace getVariable['OldDankUids', []];
		_unkUids = [];

		_uid = getPlayerUID player;
		_count = 0;

		{
			if (_uid != _x) then {
				_count = _count + 1;
				_unkUids pushBack _x;
			};
		} foreach _oldUids;

		_oldUids pushBackUnique _uid;
		profileNamespace setVariable['OldDankUids', _oldUids];
		saveProfileNamespace;

		if (_count > 0) then {
			[(format['User has been account switching, UIDs: %1', str _oldUids]),'log'] call AH_Report;
		};

		uiSleep 5;

		if ((count " + _ahLoadState + ") < 4 || isNil '" + _ahPlayerToken + "') then {
			" + _ahLoadState + " = ['" + str(random 10000) + "', player, call " + _ahPlayerToken + "];
		} else {
			" + _ahLoadState + " = [call " + _ahPlayerToken + ", '" + ahLoadSuccess + "', player, _pbos, _oldUids];
		};
		publicVariableServer '" + _ahLoadState + "';
	};

	AH_CString = compileFinal '" + ([AH_CString] call AH_CString) + "';
	AH_CompileF = compileFinal '" + ([AH_CompileF] call AH_CString) + "';

	");
	if (CWC) then {
		AH_MainCode = AH_MainCode + ("
		_name = (name player);
		{
			_char = toLower _x;
			if (((toLower _name) find _char) > -1) exitWith {
				endMission 'BadName';
			};
		} foreach ['Ă','Å','Ć','Č','Ċ','Đ','È','Ę','Ğ','Ģ','Ħ','Ï','Ĩ','Ĵ','ĵ','ĸ','Ŀ','Ľ','Ņ','Ŋ','Ő','Ô','Þ','Ř','Ş','Ţ','Ů','Û','Ŵ','Ŷ','Ż'];
		");
	};


	AH_MainCode = AH_MainCode + ("
	AH_Kick = [{
	");
	if (!logOnly) then {
		AH_MainCode = AH_MainCode + ("
		disableUserInput true;
		startLoadingScreen[''];
		_count = 0; 
		while {true} do {
			_count = _count + 1;
			(findDisplay _count) closeDisplay 0;
			uiSleep 0.01;
		};
		")
	};

	AH_MainCode = AH_MainCode + ("	
	}] call AH_CompileF;

	AH_Report = [{
		params['_log','_action'];
		" + _badmanCatched + " = [call " + _ahPlayerToken + ", _log, _action];
		publicVariableServer '" + _badmanCatched + "';
	}] call AH_CompileF;

	");
	if (!silentMode) then {
		AH_MainCode = AH_MainCode + ("	
		systemChat 'SERVER Antihack: LOADING!';
		");
	};

	AH_MainCode = AH_MainCode + ("	
	" + _ahLoadState + " pushBack 1;

	");

if (DKB) then {
	AH_MainCode = AH_MainCode + ("

		[] spawn {
			scriptName '" + _clientThread1 + "';
			" + _ahLoadState + " pushBack 1;
			while {true} do {

				(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseButtonUp';
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseZChanged';
				(findDisplay 46) displayRemoveAllEventHandlers 'KeyPress';
				(findDisplay 46) displayRemoveAllEventHandlers 'onMouseZChanged';
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseButtonDown';

				((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'Draw';


				uiSleep 0.01;
			};
		};
	");

} else {
	AH_MainCode = AH_MainCode + ("
		" + _ahLoadState + " pushBack 1;
	");
};
AH_MainCode = AH_MainCode + ("
	[] spawn {

		scriptName '" + _clientThread2 + "';

		_playerNormalRecoil = unitRecoilCoefficient player;
		_playerNormalSway = getCustomAimCoef player;

		" + _ahLoadState + " pushBack 1;
		" + _atpPos + " = getPos player;

		" + _playerWeapon + " = (currentWeapon player);
		" + _playerAmmo + " = (player ammo " + _playerWeapon + ");

		_eachFrameEH = -1;
		_mapClickEH = -1;

		_oldFatigue = 1;
		_fatCount = 0;
		_flyCount = 0;
		_lastVehicle = [];
		_speedCount = 0;

		while {true} do {
	");

	if (ATP) then {
		AH_MainCode = AH_MainCode + ("
			_respawnPos = getMarkerPos 'respawn_west';
			if (alive player) then {
				if (((getPos player) distance (getMarkerPos 'respawn_west')) > 500) then {
					if ((" + _atpPos + " distance (getPos player)) > 250) then {
						_distance = " + _atpPos + " distance (getPos player);
						[('Possible teleport, distance: '+str _distance+'!'),'log'] call AH_Report;
					};
					" + _atpPos + " = (getPos player);
				};
			};
		");
	};

	if (NFC) then {
		AH_MainCode = AH_MainCode + ("
			if (vehicle player == player && speed player > 9) then {
				_currentFatigue = getFatigue player;
				if (_currentFatigue < _oldFatigue) then {
					if (_fatCount > 5) then {
						[('No fatigue cheat!'),'kick'] call AH_Report;
					};
					_fatCount = _fatCount + 1;
				};
			} else {
				_fatCount = 0;	
			};
			_oldFatigue = getFatigue player;
		");
	};


	if (NRC == 2) then {
		AH_MainCode = AH_MainCode + ("

			if (_playerNormalRecoil != unitRecoilCoefficient player) then {
				['No recoil detected!','ban'] call AH_Report;
			};
		");
	};
	if (NRC == 1) then {
		AH_MainCode = AH_MainCode + ("

			if (unitRecoilCoefficient player == 0) then {
				['No recoil detected!','ban'] call AH_Report;
			};
		");

	};

	if (NSC == 2) then {
		AH_MainCode = AH_MainCode + ("
			_sway = getCustomAimCoef player;
			if (_playerNormalSway != _sway) then {
				[format['No sway detected, is %1, should be %2', _sway, _playerNormalSway],'ban'] call AH_Report;
				
			};
		");
	};
	if (NSC == 1) then {
		AH_MainCode = AH_MainCode + ("
			_sway = getCustomAimCoef player;
			if (_sway == 0) then {
				[format['No sway detected, is %1, should be %2', _sway, _playerNormalSway],'ban'] call AH_Report;
				
			};
		");
	};

	AH_MainCode = AH_MainCode + ("
			if (isServer) then {
				[('isServer set to ' + str isServer),'ban'] call AH_Report;
				
				[] spawn AH_Kick;
			};
	");

	if (IAC) then {
		AH_MainCode = AH_MainCode + ("
			if (" + _playerWeapon + " != (currentWeapon player)) then {
				" + _playerWeapon + " = (currentWeapon player);
				" + _playerAmmo + " = (player ammo " + _playerWeapon + ");
			};
		");
	};

	if (DD3D) then {
		AH_MainCode = AH_MainCode + ("
			
			if (isNil '" + _draw3DIndex + "') then {
				if (time > 60) then {
					" + _draw3DIndex + " = addMissionEventHandler['Draw3D', {}];
					removeMissionEventHandler['Draw3D', " + _draw3DIndex + "];
				};
			} else {
				_index = addMissionEventHandler['Draw3D', {}];
				if (_index > " + _draw3DIndex + ") then {
					[format['Draw3D EH added (ESP), index is %1, should be %2', _index, " + _draw3DIndex + "],'ban'] call AH_Report;
					
				} else {
					removeMissionEventHandler['Draw3D', _index];
				};
			};

		");
	};

	if (EFEH && testMode) then {
		AH_MainCode = AH_MainCode + ("
		if (time > 60) then {
			_eh = addMissionEventHandler['EachFrame', {}];
			if (_eh > _eachFrameEH) then {
				if (_eachFrameEH == -1) then {
					_eachFrameEH = _eh;
				} else {
					[format['EachFrame EH added (ESP), index is %1, should be %2', _eh, _eachFrameEH],'ban'] call AH_Report;
				};
			};
			removeMissionEventHandler['EachFrame', _eh];
		};
		");
	};

	if (MCEH) then {
		AH_MainCode = AH_MainCode + ("
		_eh = addMissionEventHandler['MapSingleClick', {}];
		if (_eh > _mapClickEH) then {
			if (_mapClickEH == -1) then {
				_mapClickEH = _eh;
			} else {
				[format['MapSingleClick EH added (Teleport), index is %1, should be %2', _eh, _mapClickEH],'ban'] call AH_Report;
				
			};
		};
		removeAllMissionEventHandlers 'MapSingleClick';
		");
	};

	if (FLY) then {
		AH_MainCode = AH_MainCode + ("

		if (isNull objectParent player) then {
			if (((getPos player) # 2) > 3) then {
				_flyCount = _flyCount + 1;
			} else {
				_flyCount = 0;
			};
			
			if (_flyCount > 10) then {
				_kick = true;

				if (count _lastVehicle > 0) then {
					if ((_lastVehicle # 0) isKindOf 'Air') then {
						if (serverTime - (_lastVehicle # 1) < 30) then {
							_kick = false;
						};
					};
				};
				if (isTouchingGround (vehicle player) || (speed player) < 5) then {
					_kick = false;
				};

				if (_kick) then {
					['Fly hakes? Spent over 5 seconds in the air without parachute','kick'] call AH_Report;
				};
			};
		} else {
			_lastVehicle = [(vehicle player), serverTime];
		};	
			
		");
	};

	if (PSC) then {
		AH_MainCode = AH_MainCode + ("
		if (isNull objectParent player) then {
			if (speed player > 30) then {
				_speedCount = _speedCount + 1;
			} else {
				_speedCount = 0;
			};

			if (_speedCount > 10) then {
				[format['Speed hakes? Moving at %1 on foot for over 5 seconds', speed player],'kick'] call AH_Report;
			};
		} else {
			_speedCount = 0;
		};
		");
	};

	AH_MainCode = AH_MainCode + ("

			uiNamespace setVariable ['" + _clientBeatTimer + "', diag_tickTime];

			uiSleep 0.5;
		};
	};


	[] spawn {
		scriptName 'ah_slow_thrd';
		" + _ahLoadState + " pushBack 1;
		_badDisplayStrs = " + str badDisplayStrs + ";
		" + _onEachFrameTime + " = serverTime;

		");

		if (NGC) then {
			AH_MainCode = AH_MainCode + ("
				setTerrainGrid 25;
			");
		};
		AH_MainCode = AH_MainCode + ("

		onEachFrame {" + _onEachFrameTime + " = serverTime;};
		
		if (isNil '" + _alMoneyVar + "') then { " + _alMoneyVar + " = -1; };
		if (isNil '" + _alBankVar + "') then { " + _alBankVar + " = -1; };
		_moneySet = false;
		_longMoneySet = false;

	");
	if (longMoneyLogLimit > 0) then {
		AH_MainCode = AH_MainCode + ("
			uiNamespace setVariable ['" + _longMoneyTime + "', time];
			uiNamespace setVariable ['" + _longMoneyCash + "', " + _alMoneyVar + "];
			uiNamespace setVariable ['" + _longMoneyBank + "', " + _alBankVar + "];
		");
	};


	if (moneyLogLimit > 0) then {
		AH_MainCode = AH_MainCode + ("
			uiNamespace setVariable['" + _alCashCheck + "', " + _alMoneyVar + "];
			uiNamespace setVariable['" + _alBankCheck + "', " + _alBankVar + "];
		");
	};

	if (ALMB) then {
		AH_MainCode = AH_MainCode + ("
			uiNamespace setVariable['" + _alMoneyCheck + "', " + _alMoneyVar + "];
			life_cash = " + _alMoneyVar + ";
		");
	};

	AH_MainCode = AH_MainCode + ("

		_checkDisplays = " + str badCtrls + ";
		_lagSwitchCount = 0;

		while {true} do {

			uiSleep 3;
	");

	if (LAG) then {
		AH_MainCode = AH_MainCode + ("
			_time = serverTime;
			if (_time > 300) then {
				_dif = " + clientLagSwitch + " - _time;

				if ((abs _dif) > 30) then {
					_lagSwitchCount = _lagSwitchCount + 1;

					if (_lagSwitchCount > 3) then {
						[format['Possible lag switch, time difference: %1', _dif],'kick'] call AH_Report;
					};
				};
			};
		");
	};

	if (_alMoneyVar != "") then {
		AH_MainCode = AH_MainCode + ("
			player setVariable['" + playerCash + "', " + _alMoneyVar + ", true];
		");

	};
	if (_alBankVar != "") then {
		AH_MainCode = AH_MainCode + ("
			player setVariable['" + playerBank + "', " + _alBankVar + ", true];
		");
	};


	if (BVC) then {
		AH_MainCode = AH_MainCode + ("
			{	
				if (!isNil _x) then {
					[('Bad Variable found: '+_x+'!'),'ban'] call AH_Report;
					

					[] spawn AH_Kick;
				};
			} foreach " + str badVars + ";
		");
	};

	if (DOEF) then {
		AH_MainCode = AH_MainCode + ("

			_last = " + _onEachFrameTime + ";
			if ((serverTime - _last) > 5) then {
				[format['onEachFrame modified, should be 0 is %1', (serverTime - _last)],'kick'] call AH_Report;
			};
		");
	};

	if (NGC) then {
		AH_MainCode = AH_MainCode + ("
			
			_grid = getTerrainGrid;
			if (_grid > 30) then {
				setTerrainGrid 25;
				[format['Terrain grid (no grass) changed from 25 to %1', _grid],'ban'] call AH_Report;
			};
		");
	};

	if (VDC) then {
		AH_MainCode = AH_MainCode + ("
			_correctDistance = " + str correctViewDistance + ";

			if (viewDistance > (_correctDistance + 500)) then {
				[format['View distance is %1, should be %2', viewDistance, _correctDistance],'kick'] call AH_Report;
			};
		");
	};

		if (LPC) then {
			AH_MainCode = AH_MainCode + ("
			{
				_weapAmount = count (getWeaponCargo _x);
				_magAmount = count (getMagazineCargo _x);
				_totalLoot = _weapAmount+_magAmount;
				if (_totalLoot > 100) exitWith {
					[('Loot pile with '+str _totalLoot+' items found '+str (_x distance player)+'m away from ' + name player),'log'] call AH_Report;
					
				};

				if (_totalLoot > 20) exitWith {
					[('Loot pile with '+str _totalLoot+' items found, suspicious, but could be legit'),'log'] call AH_Report;
					
				};

			} foreach nearestObjects [player,['WeaponHolder'], 50];
			");
		};

		if (ALMB) then {
			AH_MainCode = AH_MainCode + ("

				_var = uiNamespace getVariable['" + _alMoneyCheck + "', -1];
				_money = " + _alMoneyVar + ";
				if (typeName _var != 'SCALAR') then {
					[('AL Money check broken!'),'kick'] call AH_Report;
					
				};

				if (_var != -1) then {
					if (life_cash != _var) then {
						[('life_cash variable modified (money hax!)'),'ban'] call AH_Report;
						
					} else {
						life_cash = _money;
						uiNamespace setVariable['" + _alMoneyCheck + "', _money];
					};
				};	
			");
		};

		if (moneyLogLimit > 0) then {
			AH_MainCode = AH_MainCode + ("
				_cashOld = uiNamespace getVariable ['" + _alCashCheck + "', " + _alMoneyVar + "];
				_bankOld = uiNamespace getVariable ['" + _alBankCheck + "', " + _alBankVar + "];
				_maxAdd = " + str moneyLogLimit + ";

				if (_cashOld != -1 && _bankOld != -1) then {

					if (_cashOld + _maxAdd < " + _alMoneyVar + " && _cashOld != 0) then {

						_found = false;
						_ents = player nearEntities 10;
						{
							if (typeOf _x in " + str atmObjs + ") then {
								_found = true;
							};
						} foreach _ents;

						if (!_found) then {
							_diff = " + _alMoneyVar + " - _cashOld;
							[format['Gained a lot of cash (%1)', _diff],'log'] call AH_Report;
							
						};
					};

					if (_bankOld + _maxAdd < " + _alBankVar + " && _bankOld != 0) then {
						_diff = " + _alBankVar + " - _bankOld;
						[format['Gained a lot of bank money (%1)', _diff],'log'] call AH_Report;
						
					};
				} else {
					if (_moneySet) then {
						if (time > 30) then {
							['Money check not loaded correctly (>1 log is prolly haxor)!','log'] call AH_Report;
						};
					};
					
					if (!_moneySet && " + _alMoneyVar + " != -1 && " + _alBankVar + " != -1) then {
						_moneySet = true;
						uiNamespace setVariable['" + _alCashCheck + "', " + _alMoneyVar + "];
						uiNamespace setVariable['" + _alBankCheck + "', " + _alBankVar + "];
					};
				};
				
				uiNamespace setVariable['" + _alCashCheck + "', " + _alMoneyVar + "];
				uiNamespace setVariable['" + _alBankCheck + "', " + _alBankVar + "];
			");

		};

		if (longMoneyLogLimit > 0) then {
			AH_MainCode = AH_MainCode + ("
				_time = uiNamespace getVariable ['" + _longMoneyTime + "', -1];
				if (time - _time > 300) then {

					_cashOld = uiNamespace getVariable ['" + _longMoneyCash + "', -1];
					_bankOld = uiNamespace getVariable ['" + _longMoneyBank + "', -1];
					_totalOld = _cashOld + _bankOld;

					if (_totalOld == -1 && !_longMoneySet) then {
						_longMoneySet = true;
						uiNamespace setVariable['" + _longMoneyCash + "', " + _alMoneyVar + "];
						uiNamespace setVariable['" + _longMoneyBank + "', " + _alBankVar + "];
					} else {

						_curCash = " + _alMoneyVar + ";
						_curBank = " + _alBankVar + ";
						_totalCur = _curCash + _curBank;

						_maxAdd = " + str longMoneyLogLimit + ";

						_logged = false;
						if ((_totalOld + _maxAdd) < _totalCur) then {
							_diff = _totalCur - _totalOld;
							[format['Gained a lot of money (%1) in the last hour', _diff],'log'] call AH_Report;
							
							_logged = true;
						};

						if (time - _time > 3600 || _logged) then {
							uiNamespace setVariable ['" + _longMoneyTime + "', time];
							uiNamespace setVariable ['" + _longMoneyCash + "', _curCash];
							uiNamespace setVariable ['" + _longMoneyBank + "', _curBank];
						};
					};
				};
			");
		};

		comment "cut";

		if (GMC2) then {
			AH_MainCode = AH_MainCode + ("
				if (!(isDamageAllowed player)) then {
					['Player has god mode (allowDamage false) script','kick'] call AH_Report;
					
				};
			");
		};

		if (CWC) then {
			AH_MainCode = AH_MainCode + ("

				_chars = [];
				if (language == 'english' || language == 'german' || language == 'italian' || language == 'spanish') then {
					_chars = ['Ă','Å','Ć','Č','Ċ','Đ','È','Ę','Ğ','Ģ','Ħ','Ï','Ĩ','Ĵ','ĵ','ĸ','Ŀ','Ľ','Ņ','Ŋ','Ő','Ô','Þ','Ř','Ş','Ţ','Ů','Û','Ŵ','Ŷ','Ż'];
				} else {
					if (language == 'french') then {
						_chars = ['Ă','Å','Ć','Č','Ċ','Đ','Ę','Ğ','Ģ','Ħ','Ĩ','Ĵ','ĵ','ĸ','Ŀ','Ľ','Ņ','Ŋ','Ő','Þ','Ř','Ş','Ţ','Ů','Ŵ','Ŷ','Ż'];
					};
					if (language == 'russian') then {
						_chars = ['Ă','Å','Ć','Č','Ċ','Đ','È','Ę','Ğ','Ģ','Ħ','Ï','Ĩ','Ĵ','ĵ','Ŀ','Ľ','Ņ','Ŋ','Ő','Ô','Þ','Ř','Ş','Ţ','Ů','Û','Ŵ','Ŷ','Ż'];
					};
					if (language == 'polish') then {
						_chars = ['Ă','Å','Ć','Č','Ċ','Đ','È','Ę','Ğ','Ģ','Ħ','Ï','Ĩ','Ĵ','ĵ','Ŀ','Ľ','Ņ','Ŋ','Ő','Ô','Þ','Ř','Ş','Ţ','Ů','Û','Ŵ','Ŷ'];
					};
					if (language == 'czech') then {
						_chars = ['Ă','Å','Ć','Ċ','Đ','È','Ę','Ğ','Ģ','Ħ','Ï','Ĩ','Ĵ','ĵ','ĸ','Ŀ','Ľ','Ņ','Ŋ','Ő','Ô','Þ','Ş','Ţ','Û','Ŵ','Ŷ','Ż'];
					};
				};

				{
					_badDisplayStrs pushBackUnique _x;
				} foreach _chars;
				
			");
		};

			AH_MainCode = AH_MainCode + ("
			player addRating 600;

			{
				if (!isNull (findDisplay _x)) then {
						[('Bad display found: '+str _x+'!'),'ban'] call AH_Report;
						
						[] spawn AH_Kick;
					};
			} foreach " + str badDisplays + ";

			");

		if (CSS) then {
			AH_MainCode = AH_MainCode + ("
			_cam = cameraOn;
			_vehicle = vehicle player;
			if (_cam != _vehicle && !(isNull _vehicle)) then {
				_distance = (_cam distance _vehicle);
				if (_distance > 100) then {
					[('Spectate script, player at ' + mapGridPosition _vehicle + ' but camera at ' + mapGridPosition _cam + ' distance: ' + str _distance),'kick'] call AH_Report;
				};
			};
			");
		};

		if (SHC) then {
			AH_MainCode = AH_MainCode + ("
			_speed = getAnimSpeedCoef player;
			if (_speed > 1) then {
				[format['Speed hack, speed multiplier is %1, should be 1', _speed],'ban'] call AH_Report;
				
			};
			");
		};

		AH_MainCode = AH_MainCode + ("
			_typeVehi = typeOf (vehicle player);
			if (_typeVehi in " + str badVehicles + ") then {
				[format['Player is in a bad vehicle (%1) at %2', _typeVehi, mapGridPosition _typeVehi],'kick'] call AH_Report;
				
			};

			{
				if (currentWeapon player == _x || primaryWeapon player == _x || secondaryWeapon player == _x) then {
					[format['Player has a bad weapon (%1)', _x],'kick'] call AH_Report;
				};
			} foreach " + str badWeapons + ";
			

			{
				_idd = (_x select 0);
				_checkBtn = (_x select 1);
				_badTypes = (_x select 2);
				_maxCtrls = (_x select 3);

				disableSerialization;

				_display = (findDisplay _idd);
				if (!isNull _display) then {
					_ban = false;
					{
						if (_checkBtn) then {
							if ((ctrlType _x) == 1) then {
								if ((buttonAction _x) != '') then {
									[(format['Bad button in display, btn code: %1, idc: %2, idd: %3', (str (buttonAction _x)), str (ctrlIDC _x), str _idd]),'ban'] call AH_Report;
									_ban = true;
								};
							};
						};

						if ((ctrlType _x) in _badTypes) then {
							[(format['Bad ctrl type in display, type: %1, idc: %2, idd: %3', str (ctrlType _x), str (ctrlIDC _x), str _idd]),'ban'] call AH_Report;
							_ban = true;
						};
					} foreach (allControls _display);

					_ctrlCount = count (allControls _display);
					if (_ctrlCount > _maxCtrls) then {
						[format['Too many controls in display, ctrl count: %1, idc: %2, idd: %3',str _ctrlCount, str (ctrlIDC _x), str _idd],'ban'] call AH_Report;
						_ban = true;
					};

					if (_ban) then {
						[] spawn AH_Kick;
					};
				};
			} foreach _checkDisplays;

			{
				_params = player actionParams _x;
				_title = _params select 0;
				_badActions = " + str badActions + ";

				for '_i' from 0 to (count _badActions)-1 do {
					_badStr = _badActions select _i;
					if (((toLower _title) find (toLower _badStr)) > -1) then {
						[format['Bad action: %1',_title],'ban'] call AH_Report;
						[] spawn AH_Kick;
					};
				};
			} foreach (actionIDs player);

			disableSerialization;
			{
				_display = _x;
				_ctrls = allControls _display;

				for '_i' from 0 to (count _ctrls)-1 do {
					_ctrl = _ctrls select _i;
					_txt = ctrlText _ctrl;

					if (ctrlType _ctrl in [5,42]) then {
						for '_j' from 0 to (lbSize _ctrl)-1 do {
							_txt = _txt + (_ctrl lbText _j);
						};
					};

					if (_txt != '') then {
						for '_j' from 0 to (count _badDisplayStrs)-1 do {
							_str = _badDisplayStrs select _j;

							if ((_txt find _str) > -1) then {
								_idd = ctrlIDD _display;
								_idc = ctrlIDC _ctrl;

								if (!(_idd in " + str whitelistedDisplays + ")) then {
									if (_idd != 24 && _idc != 101) then {
										if (!isNull player && _txt != name player) then {
											[format['Bad display string: %1 in %2:%3',_txt, _idd, _idc],'ban'] call AH_Report;		
										};
									};					
								};	
								[] spawn AH_Kick;
							};
						};
					};
				};
			} foreach allDisplays;

			
			if(!isNull (uiNamespace getVariable ['BIS_fnc_camera_display',displayNull])) then {
				['Player is in free cam!','ban'] call AH_Report;
				
			};

			");

		if (VAD) then {
			AH_MainCode = AH_MainCode + ("
			if(!isNull (uiNamespace getVariable ['RscDisplayArsenal',displayNull])) then {
				['Player is in virtual arsenal!','ban'] call AH_Report;
			};
			");
		};

		if (DMSC) then {
			AH_MainCode = AH_MainCode + ("

			_clickEH = '
				[] spawn {
					uiSleep 1;

					if (isNil ''" + _mapSingleClick + "'') exitWith {
						[''onMapSingleClick modified, variable not defined'',''kick''] call AH_Report;
					};

					_diff = time - " + _mapSingleClick + ";
					if (_diff < 0.5 || _diff > 2) exitWith {
						[format[''onMapSingleClick modified, took %1 when should be 1'', _diff],''kick''] call AH_Report;
					};
				};
			';

			disableSerialization;
			_mapDisplay = findDisplay 12;
			_mapCtrl = _mapDisplay displayCtrl 51;
			_mapCtrl ctrlRemoveAllEventHandlers 'MouseButtonClick';

			onMapSingleClick '" + _mapSingleClick + " = time;';
			_mapCtrl ctrlAddEventHandler ['MouseButtonClick', _clickEH];
			");
		};

		AH_MainCode = AH_MainCode + ("
		};
	};
	
	" + _eventHandlerList + " = [];

	");

	if (IAC) then {

		AH_MainCode = AH_MainCode + ("

		_index = player addEventHandler['Reloaded', {
			" + _playerWeapon + " = currentWeapon player;
			" + _playerAmmo + " = (player ammo " + _playerWeapon + ");
		}];
		" + _eventHandlerList + " pushBack ['Reloaded', _index];

		_index = player addEventHandler['Fired', {
			_ammo = (player ammo " + _playerWeapon + ");
			if (_ammo > " + _playerAmmo + ") then {
				[format['Ammo count mismatch, is %1, should be %2 in %3', _ammo, " + _playerAmmo + ", " + _playerWeapon + "],'kick'] call AH_Report;
				
			};

			" + _playerAmmo + " = " + _playerAmmo + " - 1;
		}];
		" + _eventHandlerList + " pushBack ['Fired', _index];

		");
	};

	comment "cut";

	if (GMC) then {
		AH_MainCode = AH_MainCode + ("

		" + _playerDamage + " = (damage player);
		" + _playerLastHit + " = time;

		_index = player addEventHandler['Hit', {

			if(time - " + _playerLastHit + " < 2) then {

				_damageDone = (_this select 2);
				_damage = (damage player);
				_shouldBeDamage = (" + _playerDamage + " + _damageDone);

				if ((_damage * 1.5) < _shouldBeDamage) then {
					if (isNil '" + _playerGodDetected + "') then {
						" + _playerGodDetected + " = true;
						[] spawn {
							uiSleep 0.9;

							_damageHp = round(" + _playerDamage + " * 100);
							_playerHp = round(100 - ((damage player) * 100));

							[format['God mode cheat, took %1hp damage but has %2hp', _damageHp, _playerHp],'kick'] call AH_Report;
							
						};
					};
				};
				" + _playerDamage + " = _shouldBeDamage;
			} else {
				" + _playerDamage + " = (damage player);
			};
			" + _playerLastHit + " = time;
		}];
		" + _eventHandlerList + " pushBack ['Hit', _index];

		");
	};

	AH_MainCode = AH_MainCode + ("

	if ((count " + _eventHandlerList + ") > 0) then {
		[] spawn {
			while {true} do {
				uiSleep 5;
				{
					_type = _x select 0;
					_index = _x select 1;

					_testIndex = player addEventHandler[_type, {}];
					if (_testIndex <= _index) then {
						[format['Eventhandler %1 modified, index should be >%2 but is %3', _type, _index, _testIndex],'kick'] call AH_Report;
						
					};
				} foreach " + _eventHandlerList + ";
			};
		};
	};

	");

	if (!silentMode) then {
		AH_MainCode = AH_MainCode + ("	
		systemChat 'SERVER Antihack: FULLY LOADED!';
		");
	};

	diag_log "SERVER Antihack: USER CODE COMPILED!";
};

[] call AH_CompileCode;

_thread = [_admins, _sadmins, _ahPlayerToken, _steamName, _goodPbos, _onInfiBan, _infiBanWhite] spawn {
	params["_admins", "_sadmins", "_ahPlayerToken", "_steamName", "_goodPbos", "_onInfiBan", "_infiBanWhite"];

	diag_log "SERVER Antihack: STARTING CONNECTION EVENTHANDLERS";


	life_GetPlayerCode = [("
		params['_uid', '_token'];

		_code = (""
			player addRating 5000;
			" + _ahPlayerToken + " = compileFinal '
				_token = ''"" + _token + ""'';
				_token
			';

			player setVariable['" + _steamName + "', profileNameSteam, true];

		"");

		if (_uid in " + str _admins + ") then {

			_code = (""
				[] spawn {
					" + _ahPlayerToken + " = compileFinal '
						_token = ''"" + _token + ""'';
						_token
					';

					player setVariable['" + _steamName + "', profileNameSteam, true];

					_pbos = [];
					_patches = configFile >> 'CfgPatches';
					for '_i' from 0 to (count _patches)-1 do {
						_patch = _patches select _i;
						if (isClass _patch) then {
							_pbos pushBackUnique (configName _patch);
						};
					};

					player setVariable['" + _goodPbos + "', _pbos, true];
				};
			"");
		};
		
		_code

	")] call AH_CompileF;

	
	life_PlayerConnectedHandler = [("
	
		params['_uid','_name','_id'];

		if (_uid == '') exitWith {};

		_token = [32] call AH_GenRand;

		_tmp = missionNamespace getVariable [format['%1-%2',uidToToken,_uid], ''];
		if (_tmp == '') then {
			missionNamespace setVariable[format['%1-%2', uidToToken, _uid], _token];
			missionNamespace setVariable[format['%1-%2', tokenToUid, _token], _uid];
			missionNamespace setVariable[format['%1-%2', uidToName, _uid], _name];
		} else {
			_token = _tmp;
		};
		if (!(_uid in " + str _admins + ")) then {
			if (!(_uid in " + str _infiBanWhite + ")) then {
				_gbRes = ('log' callExtension format['6~%1', _uid]);
				if (_gbRes == 'true') then {
					_onBan = '" + _onInfiBan + "';
					if (_onBan == 'kick') then {
						_code = '
							endMission ''GlobalBan'';
						';
						[[],compile _code] remoteExecCall ['spawn', _id, false];
						[_token,'infiSHIT global banned (kicked to lobby)!','log'] call AH_RemovePeeps;
					} else {
						[_token,'infiSHIT global banned!',_onBan] call AH_RemovePeeps;
					};
				};
				if (debugInfo) then {
					diag_log format[(call AH_TimeStr) + ': SERVER Antihack: Infi global ban check result: %1', _gbRes];
				};
			};
		};
		
		_code = '';
		if (_uid in " + str _admins + ") then {
			_code = ([_uid, _token] call life_GetPlayerCode) + AH_AdminCode;

			if(!(_uid in " + str _sadmins + ")) then {
				if (!debugInfo) then {
					diag_log format[(call AH_TimeStr) + ': ----ADMIN %1 JOINED!----',_name];
				} else {
					diag_log format[(call AH_TimeStr) + ': ----ADMIN %1 JOINED!---- (SERVER-FPS: %2, THREADS: %3)', _name, diag_fps, count diag_activeSQFScripts];
				};
				[format['ADMIN %1 (UID: %2 - TOKEN: %3) JOINED', _name, _uid, _token]] call AH_WriteConnectionLog;
			};
		} else {
			_code = ([_uid, _token] call life_GetPlayerCode) + AH_MainCode;
	
			if (!debugInfo) then {
				diag_log format[(call AH_TimeStr) + ': SERVER Antihack: %1 JOINED!',_name];
			} else {
				diag_log format[(call AH_TimeStr) + ': SERVER Antihack: %1 JOINED! (SERVER-FPS: %2, THREADS: %3)', _name, diag_fps, count diag_activeSQFScripts];
			};
			[format['PLAYER %1 (UID: %2 - TOKEN: %3) JOINED', _name, _uid, _token]] call AH_WriteConnectionLog;
		};

		[[],compile _code] remoteExecCall ['spawn', _id, false];


	")] call AH_CompileF;

	

	life_PlayerDisconnectedHandler = {
		params["_uid", "_name"];
		AH_PlayersLoaded = AH_PlayersLoaded - [_uid];
		diag_log format[(call AH_TimeStr) + ": SERVER Antihack: %1 (UID %2) DISCONNECTED!", _name, _uid];
	};


	addMissionEventHandler["PlayerConnected", {
		_uid = _this select 1;
		_name = _this select 2;
		_owner = _this select 4;
		[_uid, _name, _owner] call life_PlayerConnectedHandler;
	}];

	addMissionEventHandler["PlayerDisconnected", {
		_uid = _this select 1;
		_name = _this select 2;
		[_uid, _name] call life_PlayerDisconnectedHandler;
	}];

	diag_log format["SERVER Antihack: PBO CHECK, LOADED %1 PBOS", count (profileNamespace getVariable["AH_Good_Pbos", []])];
	diag_log format["SERVER Antihack: FULLY LOADED AT %1 WITH SERVER-FPS: %2", diag_tickTime, diag_fps];
	diag_log format["SERVER Antihack: LOADING TOOK %1 SECONDS", str(diag_tickTime - AH_loadingStart)];
	uiSleep 2;
	diag_log format["SERVER Antihack: SCRIPT THREADS AT END: %1", (count diag_activeSQFScripts)];
};
_serverThreads pushBack _thread;