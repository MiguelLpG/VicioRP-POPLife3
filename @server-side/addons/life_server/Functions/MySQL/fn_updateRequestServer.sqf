
private ["_uid","_side","_cash","_bank","_licenses","_gear","_stats","_name","_alive","_position","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_stats = [_this,7,[100,100],[[]]] call BIS_fnc_param;
_alive = [_this,9,false,[true]] call BIS_fnc_param;
_position = [_this,10,[],[[]]] call BIS_fnc_param;

	
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {};

	
_name = [_name] call ANZUS_fnc_mresString;
_gear = [_gear] call ANZUS_fnc_mresArray;
_stats = [_stats] call ANZUS_fnc_mresArray;
_cash = [_cash] call ANZUS_fnc_numberSafe;
_bank = [_bank] call ANZUS_fnc_numberSafe;
_position = if (_side isEqualTo civilian) then {[_position] call ANZUS_fnc_mresArray} else {[]};

	
for "_i" from 0 to count(_licenses)-1 do {
    _bool = [(_licenses select _i) select 1] call ANZUS_fnc_bool;
    _licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call ANZUS_fnc_mresArray;

switch (_side) do {
    case west: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', cop_stats='%6' WHERE pid='%7'",_name,_cash,_bank,_gear,_licenses,_stats,_uid];};
    case civilian: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%5', arrested='%6', civ_stats='%7', civ_alive='%8', civ_position='%9' WHERE pid='%10'",_name,_cash,_bank,_licenses,_gear,[_this select 8] call ANZUS_fnc_bool,_stats,[_alive] call ANZUS_fnc_bool,_position,_uid];};
    case independent: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%5', med_stats='%6' WHERE pid='%7'",_name,_cash,_bank,_licenses,_gear,_stats,_uid];};
};

_queryResult = [_query,1] call ANZUS_fnc_asyncCall;