disableSerialization;

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};
private _listbox = _display displayCtrl 140002;
private _plist = _display displayCtrl 140003;

private _keySelection = lbCurSel _listbox;
private _pSelection = lbCurSel _plist;

if (_keySelection isEqualTo -1) exitWith {
    ["You must select a person to give keys to!",true,"slow"] call ANZUS_fnc_notificationSystem;
};
if (_pSelection isEqualTo -1) exitWith {
    ["You must select a vehicle to give keys for!",true,"slow"] call ANZUS_fnc_notificationSystem;
};

private _keyData = _listbox lbData _keySelection;
private _pData = _plist lbData _pSelection;

if (_keyData isEqualto "") exitWith {};//ERR 
if (_pData isEqualto "") exitWith {};//ERR 

private _vehicle = life_vehicles select (parseNumber _keyData);

private _unit = call (compile _pData); 

if (isNull _unit || isNil "_unit") exitWith {};//ERR 
if (_unit == player) exitWith {};//ERR 

private _uid = getPlayerUID _unit;
private _owners = _vehicle getVariable "vehicle_info_owners";
private _index = [_uid,_owners] call TON_fnc_index;

if (_index isEqualTo -1) then  {
    _owners pushBack [_uid,name _unit];
    _vehicle setVariable ["vehicle_info_owners",_owners,true];
};

private _vehicleDisplay = ([typeOf _vehicle] call ANZUS_fnc_fetchCfgDetails) select 1;
[format["You have given the keys for your %1 to %2",_vehicleDisplay,name _unit],true,"slow"] call ANZUS_fnc_notificationSystem;

[player,_vehicle] remoteExec  ["ANZUS_fnc_getKey", _unit]; 
