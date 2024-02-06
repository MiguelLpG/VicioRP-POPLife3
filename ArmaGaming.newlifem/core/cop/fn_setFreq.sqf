private _freq = switch (playerSide) do { 
	case west : {[[1,"33.2"],[2,"33.3"],[3,"33.4"],[4,"33.5"],[5,"32.1"],[6,"64.1"]]}; 
	case independent : {[[1,"32.1"],[2,"33.2"],[3,"33.3"],[4,"33.4"],[5,"33.5"],[6,"64.1"]]}; 
	default {[]}; 
};

{[(call TFAR_fnc_activeSwRadio), _x select 0, _x select 1] call TFAR_fnc_setChannelFrequency;} forEach _freq;

["Your Frequencies have been set!",false,"slow"] call ANZUS_fnc_notificationSystem;
