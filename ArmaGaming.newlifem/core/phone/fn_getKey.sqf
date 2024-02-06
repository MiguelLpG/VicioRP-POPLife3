params [
	["_player", objNull, [objNull]],
	["_vehicle", objNull, [objNull]]
];

if (isNull _player || isNull _vehicle) exitWith {};

if !(_vehicle in life_vehicles) then {
	private _vehDisplay = ([typeOf _vehicle] call ANZUS_fnc_fetchCfgDetails) select 1;
	[format["%1 has given you the keys to their %2.",name _player, _vehDisplay],true,"slow"] call ANZUS_fnc_notificationSystem;
	life_vehicles pushBack _vehicle;
	[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",2];
};