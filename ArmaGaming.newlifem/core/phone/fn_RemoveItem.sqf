private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

	
private _itemList = _display displayCtrl 130002;
private _amountCtrl = _display displayCtrl 130003;
private _itemSelection = lbCurSel _itemList;
if (_itemSelection isEqualto -1) exitWith {};
private _itemData = _itemList lbData _itemSelection;
if (_itemData isEqualto "") exitWith {};
private _amountStr = ctrlText _amountCtrl;
private _amountisnumber = [_amountStr] call ANZUS_fnc_isNumber;
if !(_amountisnumber) exitWith {};

_amount = parseNumber _amountStr;
if (_amount <= 0) exitWith {};



private _displayName = localize (getText(missionconfigfile >> "VirtualItems" >> _itemData >> "displayName"));
private _text = format["Are you sure you want to remove %2 %1(s)?",_displayName,_amount];

private _response = ["Remove Item?", _text] call ANZUS_fnc_sendWarning;
if (_response) then {
	if ([false, _itemData, _amount,"give"] call ANZUS_fnc_handleInv) then {
		[format["You have removed %2 %1(s) from your inventory.",_displayName,_amount],true,"slow"] call ANZUS_fnc_notificationSystem;
		[3] call ANZUS_fnc_updatePartial;
	} else {
		[format["You cannot remove %1 from you inventory.",_displayName],true,"slow"] call ANZUS_fnc_notificationSystem;
	};
} else {
	[format["You have cancelled removing a %2 %1(s) from your inventory.",_displayName,_amount],true,"slow"] call ANZUS_fnc_notificationSystem;
};

switch (_itemData) do { 
    case "keyCard" : { player setVariable ["copLevel",0,true]; }; 
    default { }; 
};


[3] call ANZUS_fnc_updatePartial;
[] call ANZUS_fnc_LoadInventory;