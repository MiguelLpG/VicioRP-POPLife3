
if(!(_this select 0)) exitWith {};
	[] call compile PreprocessFileLineNumbers "\villas_server\init.sqf";
	[] call compile PreprocessFileLineNumbers "\villas_server\A3L_Functions\initA3L.sqf";

	onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";
	[8,true,16] execFSM "core\fsm\timeModule.fsm";


if (isDedicated) then {
	[] call compile PreprocessFileLineNumbers "\villas_server\ica\initServer.sqf";
};

