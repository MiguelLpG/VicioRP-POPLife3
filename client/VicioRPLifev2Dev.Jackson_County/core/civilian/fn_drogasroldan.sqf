waitUntil {!isNull player};

_din = 35000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _unit) exitWith {};
	
_t = if (("log" call ica_fnc_expToLevel) >= 5) then {3} else {12};
 if(vicio_din - _din < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

vicio_din = vicio_din-_din;

mybackpack = unitBackpack _unit ;
mybackpack addItemCargoGlobal ["pop_coca_t", 25]; 

reload _unit;
[[["YA TIENES LA DROGA, LLEVASELA AL VIEJO EN SAN CRISTOBAL"]], "BIS_fnc_typeText", true, true, false] call BIS_fnc_MP;