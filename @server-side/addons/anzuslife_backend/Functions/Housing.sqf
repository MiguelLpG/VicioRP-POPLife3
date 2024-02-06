#include "\life_server\script_macros.hpp"

["AnzusLife_PropertyTaxCheck",{
	params [["_house",objNull,[objNull]]];
	
	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	_houseID = _house getVariable ["house_id",-1];
	_query = format ["SELECT property_tax FROM houses WHERE id='%1'",_houseID];
	_queryResult = [_query,2] call ANZUS_fnc_asyncCall;

	[_queryResult] remoteExec ["AnzusLife_PropertyTaxPay",_newplayer];
}] call AnzusLife_ServerCompile;

["AnzusLife_PropertyTaxPay",{
	params [
		["_result",[],[[]]]
	];

	_house = cursorObject;
	_propertytax = _result select 0;
	_houseCfg = [(typeOf _house)] call ANZUS_fnc_houseConfig;
	if (count _houseCfg isEqualTo 0) exitWith {};

	_propamount = (round((_houseCfg select 0)/20));

	if (_propamount > BANK) exitWith {["You do not have enough money in your bank to pay your property tax.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	private _action = ["Property Tax", format["You have %1 day(s) left to pay your property tax, paying the tax will set it back to 7 days. Your property tax amount is $%2, would you like to pay it?", _propertytax, (round((_houseCfg select 0)/20)) call ANZUS_fnc_numberText], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

	if (_action) then {
		if(life_antispam isEqualTo 1) exitWith {closeDialog 0;};

	    life_antispam = 1;
	    closeDialog 0;
	    disableUserInput true;
	    
		[_propamount,true] call AnzusLife_AC_Bank;
		[1] call ANZUS_fnc_updatePartial;
		[_house] remoteExec ["AnzusLife_PropertyTaxPayServ",2];
		disableUserInput false;
		life_antispam = 0;
	};
}] call AnzusLife_ClientCompile;

["AnzusLife_PropertyTaxPayServ",{
	params [["_house",objNull,[objNull]]];

	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	_houseID = _house getVariable ["house_id",-1];
	_query = format ["UPDATE houses SET property_tax = '7' WHERE id='%1'",_houseID];
	_queryResult = [_query,1] call ANZUS_fnc_asyncCall;
	
	_house setVariable ["house_tax",7,true];
	["You have paid your property tax, and will have to repay it in a week.",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem", _newplayer];
}] call AnzusLife_ServerCompile;

["AnzusLife_PropertyTaxCheckLogin",{
	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	_query = format ["SELECT property_tax FROM houses WHERE pid='%1'",getPlayerUID _newplayer];
	_queryResult = [_query,2,true] call ANZUS_fnc_asyncCall;
	
	_propertytaxs = [];
	{
		_propertytaxs pushback (_x);
	} forEach _queryResult;

	if (((_propertytaxs select 0) select 0) < 4) then {
		[_propertytaxs] remoteExec ["AnzusLife_NotifyTax",_newplayer];
	};
}] call AnzusLife_ServerCompile;

["AnzusLife_NotifyTax",{
	params [
		["_result",[],[[]]]
	];
	
	if (count _result isEqualTo 0) exitWith {};
	if (!(playerSide isEqualTo civilian)) exitWith {};

	{
		[format["Hello %1, you have %2 day(s) left to pay the property tax on your home!", name player, _x select 0],true,"slow"] call ANZUS_fnc_notificationSystem;
	} forEach _result;
}] call AnzusLife_ClientCompile;

["AnzusLife_WealthTaxCheckLogin",{
	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	_query = format ["SELECT wealth_tax FROM players WHERE pid='%1'",getPlayerUID _newplayer];
	_queryResult = [_query,2,true] call ANZUS_fnc_asyncCall;
	
	_taxes = [];
	{
		_taxes pushback (_x);
	} forEach _queryResult;

	if (((_taxes select 0) select 0) > 0) then {
		_updateQuery = format["UPDATE players SET wealth_tax = 0 WHERE pid='%1'",getPlayerUID _newplayer];
		[_updateQuery,1] call ANZUS_fnc_asyncCall;
	};

	[_taxes] remoteExec ["AnzusLife_NotifyWealthTax",_newplayer];
}] call AnzusLife_ServerCompile;

["AnzusLife_NotifyWealthTax",{
	params [
		["_result",[],[[]]]
	];
	
	if (count _result isEqualTo 0) exitWith {};
	if (!(playerSide isEqualTo civilian)) exitWith {};

	{
		if ((_x select 0) > 0) then {
			[format["Hello %1, the government taxed you $%2 due to you being quite wealthy.", name player, [_x select 0] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
		};
	} forEach _result;
}] call AnzusLife_ClientCompile;


["AnzusLife_IncomeTaxCheckLogin",{
	_newplayer = call AnzusLife_Lib_GetREPlayer;
	if (isNull _newplayer) exitWith {};

	_query = format ["SELECT taxamount FROM players WHERE pid='%1'",getPlayerUID _newplayer];
	_queryResult = [_query,2,true] call ANZUS_fnc_asyncCall;
	
	_taxes = [];
	{
		_taxes pushback (_x);
	} forEach _queryResult;

	_amount = ((_taxes select 0) select 0);
	_tax = 0;

	if (_amount > 0) then {
		// 50k-100k: 15%
		// 100k-200k: 25%
		// 200k--: 30%

		_taxHigh = AnzusLife_GovData select 1; 
		_taxMed = AnzusLife_GovData select 2; 
		_taxLow = AnzusLife_GovData select 3; 

		if (_amount > (_taxHigh select 1)) then { 
			_tax = _tax + (_amount - (_taxHigh select 1)) * (_taxHigh select 0); 
			_amount = (_taxHigh select 1); 
		}; 
		if (_amount > (_taxMed select 1)) then { 
			_tax = _tax + (_amount - (_taxMed select 1)) * (_taxMed select 0); 
			_amount = (_taxMed select 1); 
		}; 
		if (_amount > (_taxLow select 1)) then { 
			_tax = _tax + (_amount - (_taxLow select 1)) * (_taxLow select 0); 
		}; 

		_updateQuery = format["UPDATE players SET taxamount=0 WHERE pid='%1'",getPlayerUID _newplayer,_tax];
		[_updateQuery,1] call ANZUS_fnc_asyncCall;
	};

	[_tax] remoteExec ["AnzusLife_NotifyIncomeTax",_newplayer];
}] call AnzusLife_ServerCompile;

["AnzusLife_NotifyIncomeTax",{
	params [
		["_amount",[],[[]]]
	];

	if (_amount > 0) then {
		[format["Hello %1, the governement taxed you $%2 due to your high income.", name player, [_amount] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
		[_amount,true] call AnzusLife_AC_Bank;
	};
}] call AnzusLife_ClientCompile;

["AnzusLife_BoltLock",{
	params [
		["_obj",objNull,[objNull]]
	];

	if (isNull _obj) exitWith {};
	_door = [_obj] call AnzusLife_GetDoor;
	if (_door isEqualTo "") exitWith {};
	if (_obj getVariable [format["BIS_Disabled_%1",_door],0] isEqualTo 1) exitWith {["This door is already locked!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if (_obj getVariable [format ['%1c4charge',_door],false]) exitWith {["A charge is on the door!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if (_obj getVariable [format ['%1boltLocked',_door],false]) exitWith {["This door is already bolted!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if (_obj getVariable [format ['%1placing',_door],false]) exitWith {["Someone is already bolting the door!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if !([false,"boltLocker",1,"house"] call ANZUS_fnc_handleInv) exitWith {};
	life_action_inUse = true;
	_obj setVariable [format["%1placing",_door],true,true];

	closeDialog 0;
	//Setup the progress bar
	_title = "Bolting door";
	_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\lockpick.paa";

	disableSerialization;
	"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
	_ui = uiNamespace getVariable "AnzusLife_Progress";
	_controlsGroup = _ui displayCtrl 1;
	_progress = _controlsGroup controlsGroupCtrl 3;
	_pgText = _controlsGroup controlsGroupCtrl 2;
	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_add = 0.01;
	_cP = _add;
	life_interrupted = false;
	for "_i" from 0 to 1 step 0 do {
		if ((animationState player) != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
			player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};

		sleep 0.15;
		_cP = _cP + _add;
		_progress progressSetPosition _cP;
	    _precentage = str round(_cP * 100) + "%";
	    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
	    
		if (_cP >= 1) exitWith {};
		if (player getVariable ["inHostage",false]) exitWith {};
		if (!alive player) exitWith {};
		if !(isNull objectParent player) exitWith {};
		if (isNull _obj) exitWith {};
		if (life_interrupted) exitWith {};
	};
	life_action_inUse = false;
	"progressBar" cutText ["","PLAIN"];
	_obj setVariable [format["%1placing",_door],nil,true];
	if (!alive player) exitWith {["You have died!",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if !(isNull objectParent player) exitWith {["You got in car.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (isNull _obj) exitWith {["The evidence has been collected.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (life_interrupted) exitWith {["You have canceled.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; call ANZUS_fnc_hudUpdate;};


	["This door has been bolted!",true,"slow"] call ANZUS_fnc_notificationSystem;
	_obj setVariable [format["%1boltLocked",_door],true,true];
	if ((_door find "door_") isEqualTo -1) then {
		_door = [_door,"door","door_"] call AnzusLife_Lib_ReplaceString;
	};
	_obj setVariable [format["BIS_Disabled_%1",_door],1,true];

}] call AnzusLife_ClientCompile;

["AnzusLife_RemoveBoltLock",{
	params [
		["_obj",objNull,[objNull]]
	];

	_door = [_obj] call AnzusLife_GetDoor;
	if (isNull _obj) exitWith {};
	if (_obj getVariable [format["BIS_Disabled_%1",_door],0] isEqualTo 0) exitWith {["This door is already unlocked!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if (_obj getVariable [format ['%1c4charge',_door],false]) exitWith {["A charge is on the door!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if !(_obj getVariable [format ['%1boltLocked',_door],false]) exitWith {["This door is not bolted!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if (_obj getVariable [format ['%1removing',_door],false]) exitWith {["Someone is already bolting the door!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if !([false,"boltCutter",1,"house"] call ANZUS_fnc_handleInv) exitWith {};
	life_action_inUse = true;
	_obj setVariable [format["%1removing",_door],true,true];

	closeDialog 0;
	//Setup the progress bar
	_title = "Cutting bolts";
	_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\lockpick.paa";

	disableSerialization;
	"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
	_ui = uiNamespace getVariable "AnzusLife_Progress";
	_controlsGroup = _ui displayCtrl 1;
	_progress = _controlsGroup controlsGroupCtrl 3;
	_pgText = _controlsGroup controlsGroupCtrl 2;
	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_add = 0.01;
	_cP = _add;
	life_interrupted = false;
	for "_i" from 0 to 1 step 0 do {
		if ((animationState player) != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
			player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};

		sleep 0.35;
		_cP = _cP + _add;
		_progress progressSetPosition _cP;
	    _precentage = str round(_cP * 100) + "%";
	    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
	    
		if (_cP >= 1) exitWith {};
		if (player getVariable ["inHostage",false]) exitWith {};
		if (!alive player) exitWith {};
		if !(isNull objectParent player) exitWith {};
		if (isNull _obj) exitWith {};
		if (life_interrupted) exitWith {};
	};
	life_action_inUse = false;
	"progressBar" cutText ["","PLAIN"];
	_obj setVariable [format["%1removing",_door],nil,true];
	if (!alive player) exitWith {["You have died!",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if !(isNull objectParent player) exitWith {["You got in car.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (isNull _obj) exitWith {["The evidence has been collected.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (life_interrupted) exitWith {["You have canceled.",false,"slow"] call ANZUS_fnc_notificationSystem;  call ANZUS_fnc_hudUpdate;};
	if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; call ANZUS_fnc_hudUpdate;};


	["The bolt lock has been removed!",true,"slow"] call ANZUS_fnc_notificationSystem;
	_obj setVariable [format["%1boltLocked",_door],nil,true];
	if ((_door find "door_") isEqualTo -1) then {
		_door = [_door,"door","door_"] call AnzusLife_Lib_ReplaceString;
	};
	_obj setVariable [format["BIS_Disabled_%1",_door],nil,true];

}] call AnzusLife_ClientCompile;