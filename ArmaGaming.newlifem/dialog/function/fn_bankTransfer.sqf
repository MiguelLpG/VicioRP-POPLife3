#include "..\..\script_macros.hpp"

private ["_value","_unit","_tax"];
if(life_antispamactive isEqualTo true) exitWith {closeDialog 0; ["You must wait 3 seconds in between bank transfers.",true,"slow"] call ANZUS_fnc_notificationSystem};
life_antispamactive = true;

_value = parseNumber (ctrlText 123);
_unit = call compile format ["%1",(lbData[122,(lbCurSel 122)])];
if (isNull _unit) exitWith {};
if ((lbCurSel 122) isEqualTo -1) exitWith {[localize "STR_ATM_NoneSelected",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (isNil "_unit") exitWith {[localize "STR_ATM_DoesntExist",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_value > 999999) exitWith {[localize "STR_ATM_TransferMax",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_value < 500) exitWith {["The minimum transfer is $500",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!([str(_value)] call ANZUS_fnc_isNumber)) exitWith {[localize "STR_ATM_notnumeric",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (_value > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds",true,"slow"] call ANZUS_fnc_notificationSystem;};

private _gameSettings = MAIN_SETTINGS("GameSettings","Player"); 
_tax = _value * getNumber(_gameSettings >> "bank_transferTax");
_tax = ceil _tax;
if ((_value + _tax) > BANK) exitWith {[format[localize "STR_ATM_SentMoneyFail",_value,_tax],true,"slow"] call ANZUS_fnc_notificationSystem;};


_value = (_value + _tax);
[_value,true] call AnzusLife_AC_Bank;

_valueToSend = (_value - _tax);
[_valueToSend,player] remoteExecCall ["ANZUS_fnc_wireTransfer",_unit];
[] call ANZUS_fnc_atmMenu;
[1] call ANZUS_fnc_updatePartial;
[format[localize "STR_ATM_SentMoneySuccess",[_valueToSend] call ANZUS_fnc_numberText,name _unit,[_tax] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
[format["%1/%2 transfered %3/%4 $%5",profileName,(getPlayerUID player),name _unit,getPlayerUID _unit,_valueToSend], "money.log"] remoteExec ["AH_LogInterface",2];
	
[] spawn {
	sleep 3;
	life_antispamactive = false;
};
