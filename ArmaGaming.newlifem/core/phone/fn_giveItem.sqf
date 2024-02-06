#include "..\..\script_macros.hpp"
	
private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

	
private _itemList = _display displayCtrl 130002;
private _plist = _display displayCtrl 130004;
private _amountCtrl = _display displayCtrl 130003;

	
private _itemSelection = lbCurSel _itemList;
private _pSelection = lbCurSel _pList;

	
private _amountStr = ctrlText _amountCtrl;

	
private _amountisnumber = [_amountStr] call ANZUS_fnc_isNumber;
if !(_amountisnumber) exitWith {};// the amount isnt a number -.-

if (_itemSelection isEqualto -1) exitWith {};	
if (_pSelection isEqualto -1) exitWith {};	

	
private _itemData = _itemList lbData _itemSelection;
private _pData = _plist lbData _pSelection; 

if (_itemData isEqualto "") exitWith {};	
if (_pData isEqualto "") exitWith {};	


private _unit = call (compile _pData); 
if (isNil "_unit") exitWith {};//Shouldn't happen.
if (isNull _unit || {_unit isEqualTo player}) exitWith {};//Shouldn't happen.
 
if ((parseNumber _amountStr) <= 0) exitWith {};// Need to enter an amount more then 0.

if !([false,_itemData, (parseNumber _amountStr), "give"] call ANZUS_fnc_handleInv) exitWith {};//does not have the amount to give.

switch (_itemData) do { 
    case "keyCard" : { 
    	player setVariable ["copLevel",ITEM_VALUE("keyCard"),true];
    }; 
    default { }; 
};
	
[_itemData, (parseNumber _amountStr), player] remoteExec ["ANZUS_fnc_receiveItem", _unit]; 
[3] call ANZUS_fnc_updatePartial;
[] call ANZUS_fnc_LoadInventory;