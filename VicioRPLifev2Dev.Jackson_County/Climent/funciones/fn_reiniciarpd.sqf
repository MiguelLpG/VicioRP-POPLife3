if ((call life_coplevel) < 8) exitwith {hint "No tienes suficiente rango en la policia para reiniciar los robos"};


[{robosactivos=0;}] remoteExec ["call"];

_listaRobos = [];
missionNamespace setVariable ["ActualRobos",0,true];
missionNamespace setVariable ["ListaRobos",[_listaRobos],true];
missionNamespace setVariable ["RobosEnCurso", 0, true];
missionNamespace setVariable ["nopolicia", false, true];

missionNamespace setVariable ["robosPequenos",0,true];
missionNamespace setVariable ["robosMedianos",0,true];
missionNamespace setVariable ["robosGrandes",0,true];



_param = ["Elige un Robo", "", [
	["todos", "Todos"],
	["paco", "Paco"],
	["manolo", "Manolo"],
	["farmacia", "Farmacia"],
	["club7", "Club 7"],
	["putas", "Casa de Putas"],
	["casino", "Robo Casino"],
	["alcampo", "Alcampo"],
	["hotelf", "Hotel Fantasma"],
	["ropa", "Tienda de Ropa"],
	["militar", "Militar"],
	["lezo", "Blas de Lezo"],
	["banco", "Banco"],
	["sucursal", "Sucursal Bancaria"],
	["nuclear", "Nuclear"]
]] call ica_fnc_eligeDato;

if (_param isEqualTo "") exitWith {};

if (_param isEqualTo "todos") exitWith {
	Paco setVariable ["reciente", false, true];
	Paco setVariable ["robando", false, true];
	Manolo setVariable ["reciente", false, true];
	Manolo setVariable ["robando", false, true];
	Farmacia setVariable ["reciente", false, true];
	Farmacia setVariable ["robando", false, true];
	Club7 setVariable ["reciente", false, true];
	Club7 setVariable ["robando", false, true];
	Putas setVariable ["reciente", false, true];
	Putas setVariable ["robando", false, true];
	Ropa setVariable ["reciente", false, true];
	Ropa setVariable ["robando", false, true];
	Militar setVariable ["reciente", false, true];
	Militar setVariable ["robando", false, true];
	Lezo setVariable ["reciente", false, true];
	Lezo setVariable ["robando", false, true];
	Banco setVariable ["reciente", false, true];
	Banco setVariable ["robando", false, true];
	Sucursal setVariable ["reciente", false, true];
	Sucursal setVariable ["robando", false, true];
	Nuclear setVariable ["reciente", false, true];
	Nuclear setVariable ["robando", false, true];
	alcampo setVariable ["reciente", false, true];
	alcampo setVariable ["robando", false, true];
	hotelf setVariable ["reciente", false, true];
	hotelf setVariable ["robando", false, true];
	casino setVariable ["reciente", false, true];
	casino setVariable ["robando", false, true];
	["Robos","Has reiniciado todos los robos.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "paco") exitWith {
	Paco setVariable ["reciente", false, true];
	Paco setVariable ["robando", false, true];
	["Robos","Has reiniciado Paco.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "manolo") exitWith {
	Manolo setVariable ["reciente", false, true];
	Manolo setVariable ["robando", false, true];
	["Robos","Has reiniciado Manolo.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "farmacia") exitWith {
	Farmacia setVariable ["reciente", false, true];
	Farmacia setVariable ["robando", false, true];
	["Robos","Has reiniciado Farmacia.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "club7") exitWith {
	Club7 setVariable ["reciente", false, true];
	Club7 setVariable ["robando", false, true];
	["Robos","Has reiniciado Club7.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "putas") exitWith {
	Putas setVariable ["reciente", false, true];
	Putas setVariable ["robando", false, true];
	["Robos","Has reiniciado Putas.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "ropa") exitWith {
	Ropa setVariable ["reciente", false, true];
	Ropa setVariable ["robando", false, true];
	["Robos","Has reiniciado Tienda de Lujo.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "militar") exitWith {
	Militar setVariable ["reciente", false, true];
	Militar setVariable ["robando", false, true];
	["Robos","Has reiniciado Militar.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "lezo") exitWith {
	Lezo setVariable ["reciente", false, true];
	Lezo setVariable ["robando", false, true];
	["Robos","Has reiniciado Blas de Lezo.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "banco") exitWith {
	Banco setVariable ["reciente", false, true];
	Banco setVariable ["robando", false, true];
	["Robos","Has reiniciado Banco.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "sucursal") exitWith {
	Sucursal setVariable ["reciente", false, true];
	Sucursal setVariable ["robando", false, true];
	["Robos","Has reiniciado Sucursal.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "nuclear") exitWith {
	Nuclear setVariable ["reciente", false, true];
	Nuclear setVariable ["robando", false, true];
	["Robos","Has reiniciado Nuclear.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "alcampo") exitWith {
	alcampo setVariable ["reciente", false, true];
	alcampo setVariable ["robando", false, true];
	["Robos","Has reiniciado Alcampo.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "hotelf") exitWith {
	hotelf setVariable ["reciente", false, true];
	hotelf setVariable ["robando", false, true];
	["Robos","Has reiniciado Hotel Fantasma.","success"] spawn cplus_notification_fnc_notification;
};

if (_param isEqualTo "casino") exitWith {
	casino setVariable ["reciente", false, true];
	casino setVariable ["robando", false, true];
	["Robos","Has reiniciado Casino.","success"] spawn cplus_notification_fnc_notification;
};