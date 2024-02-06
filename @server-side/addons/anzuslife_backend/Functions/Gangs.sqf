#include "\life_server\script_macros.hpp"

["AnzusLife_OpenGangPicker", {
	if (isNil {group player getVariable "gang_name"}) exitWith {["You are not in a gang, please join/create a gang before opening this.",true,"slow"] call ANZUS_fnc_notificationSystem};

	_grouprole = (group player) getVariable ["gang_role",[]];
	_groupleader = (group player) getVariable ["gang_owner",""];
	_groupsetup = _grouprole select 0;
	_isLeader = if (getPlayerUID player isEqualTo _groupleader) then {true} else {false};

	if (_grouprole isEqualTo []) exitWith {["Your gang is bugged, please try reloging if error consists contact dev.",true,"slow"] call ANZUS_fnc_notificationSystem};

	switch (_groupsetup) do { 
		case 0: {
			if (_isLeader) then {
				_dialog = createDialog "AnzusLife_GangProgressPicker";
				waitUntil {_dialog};

				buttonSetAction [2401,"['Mafia'] call AnzusLife_GangProgressSelect;"];
				buttonSetAction [2402,"['Cartel'] call AnzusLife_GangProgressSelect;"];
			} else {
				["Your leader has not setup your gang's progress, contact your leader first.",true,"slow"] call ANZUS_fnc_notificationSystem;
			};
		}; 
		case 1: {
			[] call AnzusLife_OpenGangProgress;
		}; 
		case 2: {
			[] call AnzusLife_OpenGangProgress;
		};
	};
}] call AnzusLife_ClientCompile;

["AnzusLife_GangProgressSelect", {
	params [
		["_type","",[""]]
	];

	if (_type isEqualTo "") exitWith {["No option selected",true,"slow"] call ANZUS_fnc_notificationSystem};

	closeDialog 0;
	[format["Your gang has chosen the %1 role, enjoy!",_type],true,"slow"] call ANZUS_fnc_notificationSystem;

	if (_type isEqualTo "Mafia") then {
		(group player) setVariable ["gang_role",[1,[0,0,0,0,0,0]],true];
	} else {
		(group player) setVariable ["gang_role",[2,[0,0,0,0,0,0]],true];
	};

	[5,group player] remoteExec ["TON_fnc_updateGang",2];
}] call AnzusLife_ClientCompile;

["AnzusLife_OpenGangProgress", {
	_roleArray = (group player) getVariable ["gang_role",[]];
	_role = _roleArray select 0;

	if (_roleArray isEqualTo []) exitWith {["Your gang is bugged, please try reloging if error consists contact dev.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	_taskarr = if (_role isEqualTo 1) then {AnzusLife_MafiaTasks} else {AnzusLife_CartelTasks};

	closeDialog 0;
	_xD = createDialog "AnzusLife_GangProgressTree";
	waitUntil {_xD};

	{
	  private _data = [_x select 0,_x select 1];
	  private _index = lbAdd [37,_x select 0];
	  lbSetData [37, _index, str(_data)];
	} foreach _taskarr;
	
	CONTROL(21541,37) ctrlSetEventHandler ["LBSelChanged", "[] call AnzusLife_GangProgressTaskSel"];
	CONTROL(21541,37) lbSetCurSel 0;
}] call AnzusLife_ClientCompile;

["AnzusLife_GangProgressTaskSel", {
	private _role = (group player) getVariable ["gang_role",[]] select 0;
	private _tasks = (group player) getVariable ["gang_role",[]] select 1;
	private _playerrole = [];

	if (_role isEqualTo 1) then {
		_playerrole = AnzusLife_MafiaTasks;
	};

	if (_role isEqualTo 2) then {	
		_playerrole = AnzusLife_CartelTasks;
	};

	private _current = _tasks select (lbCurSel 37);
	private _currenttask = _playerrole select (lbCurSel 37);
	private _maxvalue = _currenttask select 3;
	
	private _amount = 0;
	if (_currenttask select 2 != "") then {
		_totalamount = format["(group player) getVariable [%1,0]",str(_currenttask select 2)];
		_amount = call compile (_totalamount);
	};

	if (_current isEqualTo 1) then {
		_amount = _maxvalue;
	};
	
	private _data = call compile format["%1",lbData [37,(lbCurSel 37)]];
	private _description = _data select 1;
	private _color = if (_current isEqualTo 0) then {[0.949,0.255,0.18,0.8]} else {[0.18,0.945,0.396,0.8]};

	CONTROL(21541,42) progressSetPosition (_amount / _maxvalue);
	CONTROL(21541,42) ctrlSetTextColor _color;
	CONTROL(21541,43) ctrlSetText format ["%1%2",floor(_amount * 100 / _maxvalue),"%"];
  	CONTROL(21541,33) ctrlSetStructuredText parseText format ["<t size='0.7'>%1</t>",_description];
}] call AnzusLife_ClientCompile;

["AnzusLife_CaptureBase", {
	params [["_type","",[""]], ["_flag",objNull,[objNull]]];

	_group = _flag getVariable ["owner",0];
	_roleArray = (group player) getVariable ["gang_role",[]];
	_role = _roleArray select 0;
	_taskarr = _roleArray select 1;
	_taskscompleted = if (_taskarr isEqualTo [1,1,1,1,1,1]) then {true} else {false};

	if (isNil {group player getVariable ["gang_name",""]}) exitWith {["You are not in a gang, please create a gang first.",true,"slow"] call ANZUS_fnc_notificationSystem};
	if (_role isEqualTo 1 && _type isEqualTo "Cartel" || _roleArray isEqualTo 2 && _type isEqualTo "Mafia") exitWith {["You are at the wrong base, your gang's role is not this one.",true,"slow"] call ANZUS_fnc_notificationSystem};
	if (!_taskscompleted) exitWith {["You have not completed all the tasks, please finish all the tasks before capturing this.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if (_group isEqualTo (group player getVariable ["gang_id",0])) exitWith {["You are already in control of this.",true,"slow"] call ANZUS_fnc_notificationSystem};
	if (_flag getVariable ["inCapture",false]) exitWith {["Someone is already capturing this.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	_timePassed = (serverTime - (_flag getVariable ["lastCapture", 0]));
	if (_timePassed < 600) exitWith {[format["You must wait %1 minutes before you can capture this base.", (10 - floor (_timePassed / 60))],true,"slow"] call ANZUS_fnc_notificationSystem;};

	private _marker = "";
	private _zone = "";
	switch (_type) do { 
		case "Cartel": { 
			_marker = "CartelBase";
			_zone = "CartelArea";
		}; 
		case "Mafia": {
			_marker = "MafiaMarker";
			_zone = "MafiaZone";
		}; 
	};

	_group = [_type] call AnzusLife_Lib_GetGroup;
	
	private "_action";
	private "_cpRate";
	if (!isNull _group) then {
	    _gangName = _group getVariable ["gang_name",""];
	    private _action = [localize "STR_GNOTF_CurrentCapture", format[localize "STR_GNOTF_AlreadyControlled",_gangName,_type], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
	    _cpRate = 0.0035;
	} else {
	    _cpRate = 0.008;
	};

	if (!isNil "_action" && {!_action}) exitWith {[format[localize "STR_GNOTF_CaptureCancel",_type],true,"slow"] call ANZUS_fnc_notificationSystem};

	_title = format[localize "STR_GNOTF_Capturing",_type];
	_icon = "\ArmaGamingCore\images\displays\displayCommunicationTargets\organizations.paa";

	disableSerialization;
	"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
	_ui = uiNamespace getVariable "AnzusLife_Progress";
	_controlsGroup = _ui displayCtrl 1;
	_progress = _controlsGroup controlsGroupCtrl 3;
	_pgText = _controlsGroup controlsGroupCtrl 2;
	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	[format["%1 has started taking control of the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	[format["%1 is taking control of your base, intercept their attempt to take the base or they will become the %2!",((group player) getVariable "gang_name"),_type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_group];
	[_zone,_type,"ColorRed"] remoteExec ["AnzusLife_Lib_ChangeGangMarkerColor",2];
	_flag setVariable ["inCapture",true,true];

	for "_i" from 0 to 1 step 0 do {
	    uiSleep 1.50;
	    _cP = _cP + _cpRate;	
	    _progress progressSetPosition _cP;
	    _precentage = str round(_cP * 100) + "%";
    	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

	    if (_cP >= 1) exitWith {};
		if (player getVariable ["inHostage",false]) exitWith {_flag setVariable ["inCapture",false,true]; [format["%1 have stopped taking control of the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];};
		if (!alive player || life_istazed || life_isknocked) exitWith {_flag setVariable ["inCapture",false,true]; [format["%1 have stopped taking control of the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];};
	    if(player distance2D _flag > 75) exitWith {_flag setVariable ["inCapture",false,true]; [format["You are too far away, capture on the %1 Base failed!",_type],true,"slow"] call ANZUS_fnc_notificationSystem; [format["%1 have stopped taking control of the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];};
	};
	[_zone,_type,"ColorGreen"] remoteExec ["AnzusLife_Lib_ChangeGangMarkerColor",2];
	"progressBar" cutText ["","PLAIN"];
	if (!alive player || life_istazed || life_isknocked) exitWith {_flag setVariable ["inCapture",false,true];};
	if (player getVariable ["restrained",false]) exitWith {_flag setVariable ["inCapture",false,true];};
	if(player distance2D _flag > 75) exitWith {_flag setVariable ["inCapture",false,true];};
    if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; _flag setVariable ["inCapture",false,true];};

	[format["%1 have taken control of the %2 Base, and are now the %2!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	_flag setVariable ["inCapture",false,true];
	_flag setVariable ["lastCapture", serverTime, true];
	_flag setVariable ["owner",group player getVariable ["gang_id",0],true];
	[_marker,_type] remoteExec ["AnzusLife_Lib_ChangeGangMarker",2];

	[format["%1/%2 has captured %3 from %4 for %5", (name player), (getPlayerUID player), _type, _group getVariable ["gang_name","NOGANG"], ((group player) getVariable "gang_name")], "gang.log"] remoteExec ["AH_LogInterface",2];

	if (_type isEqualTo "Mafia") then {
		missionNamespace setVariable ["AnzusLife_Mafia", group player getVariable ["gang_id",0], true];
	} else {
		missionNamespace setVariable ["AnzusLife_Cartel", group player getVariable ["gang_id",0], true];
	};
}] call AnzusLife_ClientCompile;

["AnzusLife_DecaptureBase", {
	params [["_type","",[""]], ["_flag",objNull,[objNull]]];

	_group = _flag getVariable ["owner",0];
	_roleArray = (group player) getVariable ["gang_role",[]];
	_role = _roleArray select 0;

	if (_role isEqualTo 2 && _type isEqualTo "Cartel" || _roleArray isEqualTo 1 && _type isEqualTo "Mafia") exitWith {["You can not decap the same faction, you must recap from them.",true,"slow"] call ANZUS_fnc_notificationSystem};
	if (_group isEqualTo (group player getVariable ["gang_id",0])) exitWith {["You are in control of this, so you can not decap it.",true,"slow"] call ANZUS_fnc_notificationSystem};
	if (_flag getVariable ["inCapture",false]) exitWith {["Someone is in the middle of capturing/decapturing this, you must wait until its canceled or finished.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if (_group isEqualTo 0) exitWith {["There is no group currently in control of this base.",true,"slow"] call ANZUS_fnc_notificationSystem};

	private _marker = "";
	private _zone = "";
	switch (_type) do { 
		case "Cartel": { 
			_marker = "gang_area_5";
			_zone = "marker_24";
		}; 
		case "Mafia": {
			_marker = "gang_area_4";
			_zone = "marker_25";
		}; 
	};

	_group = [_type] call AnzusLife_Lib_GetGroup;
	if (isNull _group) exitWith {["There is no group currently in control of this base.",true,"slow"] call ANZUS_fnc_notificationSystem};

	private "_action";
	private "_cpRate";
	if (!isNull _group) then {
	    _gangName = _group getVariable ["gang_name",""];
	    private _action = [localize "STR_GNOTF_CurrentCapture", format[localize "STR_GNOTF_AlreadyControlledDecap",_gangName,_type], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
	    _cpRate = 0.0035;
	};

	if (!isNil "_action" && {!_action}) exitWith {["There is no gang in control of this, stopping the decap.",true,"slow"] call ANZUS_fnc_notificationSystem};

	_title = format["Decapturing %1 Base stay within 75m of the flag",_type];
	_icon = "\ArmaGamingCore\images\displays\displayCommunicationTargets\organizations.paa";

	disableSerialization;
	"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
	_ui = uiNamespace getVariable "AnzusLife_Progress";
	_controlsGroup = _ui displayCtrl 1;
	_progress = _controlsGroup controlsGroupCtrl 3;
	_pgText = _controlsGroup controlsGroupCtrl 2;
	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	[_zone,_type,"ColorRed"] remoteExec ["AnzusLife_Lib_ChangeGangMarkerColor",2];
	[format["%1 has started decapturing the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	[format["%1 is decapturing your base, intercept their attempt to decapture the base or you will loose being the %2!",((group player) getVariable "gang_name"),_type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_group];
	_flag setVariable ["inCapture",true,true];
	
	for "_i" from 0 to 1 step 0 do {
	    uiSleep 1.50;
	    _cP = _cP + _cpRate;	
	    _progress progressSetPosition _cP;
	    _precentage = str round(_cP * 100) + "%";
    	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

	    if (_cP >= 1) exitWith {};
		if (player getVariable ["inHostage",false]) exitWith {_flag setVariable ["inCapture",false,true]; [format["%1 have stopped decapturing the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];};
		if (!alive player || life_istazed || life_isknocked) exitWith {_flag setVariable ["inCapture",false,true]; [format["%1 have stopped decapturing the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];};
	    if(player distance2D _flag > 75) exitWith {_flag setVariable ["inCapture",false,true]; [format["You are too far away, decapture on the %1 Base failed!",_type],true,"slow"] call ANZUS_fnc_notificationSystem; [format["%1 have stopped taking control of the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];};
	};

	[_zone,_type,"ColorGreen"] remoteExec ["AnzusLife_Lib_ChangeGangMarkerColor",2];
	"progressBar" cutText ["","PLAIN"];
	if (!alive player || life_istazed || life_isknocked) exitWith {_flag setVariable ["inCapture",false,true];};
	if (player getVariable ["restrained",false]) exitWith {_flag setVariable ["inCapture",false,true];};
	if(player distance2D _flag > 75) exitWith {_flag setVariable ["inCapture",false,true];};
    if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; _flag setVariable ["inCapture",false,true];};

	[format["%1 have removed control of the %2 Base!",((group player) getVariable "gang_name"), _type],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	_flag setVariable ["inCapture",false,true];
	_flag setVariable ["owner",0,true];
	[_marker,_type,true] remoteExec ["AnzusLife_Lib_ChangeGangMarker",2];

	[format["%1/%2 has decaptured %3 from %4 for %5", (name player), (getPlayerUID player), _type, _group getVariable ["gang_name","NOGANG"], ((group player) getVariable "gang_name")], "gang.log"] remoteExec ["AH_LogInterface",2];

	if (_type isEqualTo "Mafia") then {
		missionNamespace setVariable ["AnzusLife_Mafia", 0, true];
	} else {
		missionNamespace setVariable ["AnzusLife_Cartel", 0, true];
	};
}] call AnzusLife_ClientCompile;

["AnzusLife_UnlockTask",{
	params [
		["_task","",[""]]
	];

	if (_task isEqualTo "") exitWith {};
		
	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	if (isNil {(group _newplayer) getVariable ["gang_name",""]}) exitWith {};
	_gangrole = (group _newplayer) getVariable ["gang_role",[]];
	if (_gangrole isEqualTo []) exitWith {};
		
	_gangselect = _gangrole select 0;
	_gangroles = _gangrole select 1;
	if (_gangselect isEqualTo 0) exitWith {};

	_gangstasks = switch (_gangselect) do { 
		case 1: {AnzusLife_MafiaTasks}; 
		case 2: {AnzusLife_CartelTasks}; 
	};

	_taskvalue = [_task,_gangstasks] call TON_fnc_index;
	if (_taskvalue isEqualTo -1) exitWith {};
	_gay = if ((_gangroles select _taskvalue) == 1) then {true} else {false};
	if (_gay) exitWith {};

	_updatetasks = _gangrole select 1;
	_updatetasks set[_taskvalue, 1];
	_gangrole set[1, _updatetasks];
	(group _newplayer) setVariable ["gang_role", _gangrole, true];
	[5,group _newplayer] call TON_fnc_updateGang;
	[format["Your gang has completed the '%1' task, congrats!",_task],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem", group _newplayer];
}] call AnzusLife_ServerCompile;

["AnzusLife_DenyFee",{
	params [
		["_newplayer",objNull,[objNull]],
		["_money",0,[0]],
		["_place","",[""]]
	];

	if (!(_place IN ["Marijuana Cartel","Cocaine Cartel","Heroin Cartel","Money Launder"])) exitWith {};
	[format["%1 has deny'd your fee of $%2 at the %3. He has been marked on your groups map, handle him well!",name _newplayer,[_money] call ANZUS_fnc_numberText,_place],true,"slow"] call ANZUS_fnc_notificationSystem;

	_newplayer setVariable ["taxTime",time + (60 * 15)];
}] call AnzusLife_ClientCompile;

["AnzusLife_ReciveGangProfit",{
	params [
		["_price",0,[0]],
		["_gang",grpNull,[grpNull]],
		["_type","",[""]]
	];

	if (isNull _gang) exitWith {};
	if (_price > 400000) exitWith {};

	_gFund = _gang getVariable ["gang_bank",0];
	_gang setVariable ["gang_bank",round(_gFund + _price),true];
	[1,_gang] call TON_fnc_updateGang;

	switch (_type) do { 
		case "DrugDealer": {[format["Someone has sold at your drug dealer, and you have recived $%1 in fees.",[_price] call ANZUS_fnc_numberText],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_gang];}; 
		case "Process": {[format["Someone has processed at one of your cartels, and you have recived $%1 in fees.",[_price] call ANZUS_fnc_numberText],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_gang];}; 
		case "Launder": {[format["Someone has laundered at your place, and you have recived $%1 in fees.",[_price] call ANZUS_fnc_numberText],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_gang];};
		case "Truck": {[format["Your gang has recived $%1 for unloading the transport truck.",[_price] call ANZUS_fnc_numberText],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_gang];};
	};
}] call AnzusLife_ServerCompile;