#include "..\..\script_macros.hpp"
/*
    File Name: fn_launderMoney.sqf
  	Author: Ya Boi Travis Butts
*/
closeDialog 0;
_guy = param [0,objNull,[objNull]];
private _option = false;
private _sit = "";

_value = ITEM_VALUE("markedmoney");
if (life_action_inUse) exitWith {life_action_inUse = false};
if (_value isEqualTo 0) exitWith {["You do not have any marked bills to launder.",true,"slow"] call ANZUS_fnc_notificationSystem};
if (west countSide playableUnits < 5) exitWith {["There must be 5 cops online for me to be able to launder your money.",true,"slow"] call ANZUS_fnc_notificationSystem};

life_action_inUse = true;
_exit = false;

if (!((missionNamespace getVariable ["AnzusLife_Mafia",0]) > 0)) then {_exit = true;};
if (!_exit) then {
	private _action = ["Mafia Fee", "This money launder is owned by the mafia meaning they want a 20% fee out of your cleaning, would you like to pay this? If you hit no there could be bad results, choose wisly!", "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
	private _group = ["Mafia"] call AnzusLife_Lib_GetGroup;
	if (_group isEqualTo group player) exitWith {_sit = "isMafia"};
	if (!(isNull _group)) then {
	    if (_action) then {
	    	_option = true;
	    } else {
			_sit = "MafiaAvoid";
	    };
	};
};

_title = "Laundering Money";
_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\purchase.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 0.2;
    _cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_processMultiplier", 1]));
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
    if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
    if (player distance _guy > 10) exitWith {};
};

life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; "progressBar" cutText ["","PLAIN"]; life_action_inUse = false;};
if (player distance _guy > 10) exitWith {[localize "STR_Process_Stay",true,"slow"] call ANZUS_fnc_notificationSystem; "progressBar" cutText ["","PLAIN"]; life_action_inUse = false;};

_amountofbills = ITEM_VALUE("markedmoney");
_billsellprice = ITEM_SELLPRICE("markedmoney");

_cutamm = ceil(_amountofbills / 100 * 20);
_cut = (round(_billsellprice) * _cutamm);

if (_option) then {
	_newammbills = _amountofbills - _cutamm;
	_total = _newammbills * _billsellprice;

	[false,"markedmoney",_amountofbills,"money"] call ANZUS_fnc_handleInv;
	[_total] call AnzusLife_AC_Cash;
	[format["You have laundered your marked bills, and have recived $%1 in cash. The mafia took a $%2 cut, for cleaning your money, enjoy!",[_total] call ANZUS_fnc_numberText,[_cut] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;

    [format["Someone has laundered there money and have recived $%1 in fees, enjoy!",[_cut] call ANZUS_fnc_numberText],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem", _group];
    [_cut,_group,"Launder"] remoteExec ["AnzusLife_ReciveGangProfit",2];
} else {
	_total = _amountofbills * _billsellprice;
	[false,"markedmoney",_amountofbills,"money"] call ANZUS_fnc_handleInv;
	[_total] call AnzusLife_AC_Cash;

	switch (_sit) do { 
		case "isMafia": {
			[format["Since you are apart of the mafia, you have laundered your marked bills for free and have recived $%1 in cash.",[_total] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
		}; 
		case "MafiaAvoid": {
			[format["You have laundered your marked bills, and have recived $%1 in cash. The mafia was notifited of you denying the fee, enjoy!",[_total] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
			[player,_cut,"Money Launder"] remoteExec ["AnzusLife_DenyFee",_group];
		}; 
		default {		
			[format["You have laundered your marked bills, and have recived $%1 in cash, enjoy!",[_total] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
		}; 
	};
};

["laundering"] spawn mav_ttm_fnc_addExp;

_noATMTime = MAIN_SETTINGS_TYPE(getNumber,"MajorCrimes","noatm_timer");
[_noATMTime] spawn {
	params["_noATMTime"];
	life_use_atm = false;
	sleep 60 * _noATMTime;
	life_use_atm = true;
};