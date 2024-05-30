
// Transporte y Distribución de Mercancías Ilegales --- > Rosario Enterprise
// By AxE.
// ["init"] call ica_fnc_rosarioEnt


_p = _this select 0;


if (_p isEqualTo "init") exitWith {

    //Acciones de inicio
	[NPC_ROSARIO_MISIONES_2, [".::: Transporte de Drogas ::: Rosario Enterprise", {["drogas"] call ica_fnc_rosarioEnt}]] remoteExec ["addAction", 0,true];
	[NPC_ROSARIO_MISIONES_2, [".::: Transporte de Armas ::: Rosario Enterprise", {["armas"] call ica_fnc_rosarioEnt}]] remoteExec ["addAction", 0,true];
	[NPC_ROSARIO_MISIONES_4, [".::: Transporte de Drogas ::: Rosario Enterprise", {["drogas"] call ica_fnc_rosarioEnt}]] remoteExec ["addAction", 0,true];
	[NPC_ROSARIO_MISIONES_4, [".::: Transporte de Armas ::: Rosario Enterprise", {["armas"] call ica_fnc_rosarioEnt}]] remoteExec ["addAction", 0,true];


	[zona_1, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];
	[zona_2, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];
	[zona_3, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];
	[zona_4, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];
	[tienda_terro, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];
	[tienda_bf, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];
	[camello, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];
	[NPC_ROBOS_MENORES_NARCO_1, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];
	[NPC_ROBOS_MENORES_RICOS_1, ["Entregar Droga .:: Rosario Enterprise ::.", {["entrega"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosario"",[]])"]] remoteExec ["addAction", 0,true];

	[zona_1, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];
	[zona_2, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];
	[zona_3, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];
	[zona_4, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];
	[tienda_terro, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];
	[tienda_bf, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];
	[camello, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];
	[NPC_ROBOS_MENORES_NARCO_1, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];
	[NPC_ROBOS_MENORES_RICOS_1, ["Entregar Armas .:: Rosario Enterprise ::.", {["entregaA"] call ica_fnc_rosarioEnt},nil,6,true,true,"","_target in (profileNamespace getVariable [""npcsRosarioA"",[]])"]] remoteExec ["addAction", 0,true];

	[NPC_ROSARIO_COBROS, ["Cobrar .::: Transporte de Drogas ::: Rosario Enterprise", {["cobro"] call ica_fnc_rosarioEnt}]] remoteExec ["addAction", 0,true];
	[NPC_ROSARIO_COBROS, ["Cobrar .::: Transporte de Armas ::: Rosario Enterprise", {["cobroA"] call ica_fnc_rosarioEnt}]] remoteExec ["addAction", 0,true];


};


if (_p isEqualTo "drogas") exitWith {

	/*if (profileNamespace getVariable ["rosarioEnt",false]) exitWith {
		[player,"Hmm no se... Creo que eres policia o algo .. pides mercancía pero no la vendes ?...",
		"Rosario Enterprise","pop_coca_b"] call ica_fnc_axeMsg;
	};*/

	if !(isNull objectParent player) exitWith {
	[player,"Es poco amigable hacer negocios desde el coche no crees ?",
	"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	};

	_lvl = "ti" call ica_fnc_expToLevel;
	if (_lvl < 3) exitWith {
		[player,"Tu no sabes como van estos negocios ... se te nota ...",
		"Rosario Enterprise","pop_coca_b"] call ica_fnc_axeMsg;
	};

	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};
	 if !({side _x == WEST} count playableUnits >= 4) exitWith {hint "Tienen que estar al menos 4 policías conectados, sino, no es divertido."};

	_accion = [
		"Estas apunto de iniciar un trabajo de transporte y distribucion de drogas a tres sitios diferentes... Deberas comprar la droga por 35.000€ y podrás ganar casi el doble. Aceptas ?",
		"Transporte de Drogas ::. Rosario Ent",
		"Si",
		"No"
	] call BIS_fnc_guiMessage;
	waituntil {!isNil "_accion"};

	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado...","PLAIN"];};

	if (vicio_din < 35000) exitWith {titleText["No tienes suficiente dinero para comprar la droga.", "PLAIN"]};
	vicio_din = vicio_din - 35000;

	_npcs = selectRandom [[zona_1,NPC_ROBOS_MENORES_NARCO_1,tienda_terro],[zona_3,tienda_terro,zona_4],[tienda_bf,camello,zona_1],[NPC_ROBOS_MENORES_NARCO_1,zona_2,NPC_ROBOS_MENORES_RICOS_1]];

	profileNamespace setVariable ["npcsRosario",_npcs];
	profileNamespace setVariable ["rosarioEnt",true];
	profileNamespace setVariable ["rosarioEntregados",0];
	_tiempo = 60 * 20;
	profileNamespace setVariable ["rosarioTiempo",_tiempo];

	_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Transporte de mercancías - Rosario Enterprise </t><br/><t size=""1"">Bienvenido a Rosario Enterprise, los buenos negocios de nuestros clientes se expanden ahora al segmento de la micro-distribución, esperamos que los negocios sean de mutuo provecho!.</t>";

	("La Isla del Rosario") hintC [
		_paraf,
		"Debes tomar la mercancía y distribuirla, te he marcado en este mapa tres contactos que seguro pagarán un buen precio por ella.",
		"Debes evitar controles policiales y ser sigiloso para evitar levantar interes de aquellos grupos organizados que controlen la zona.",
		"No puedes usar aeronaves, serían detectadas y en caso de irte de la ciudad deberás volver y continuar la misión sin problemas.",
		(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""https://www.empirerpg.es/"">pagina web</a></t>.")
	];
	hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
		0 = _this spawn {
			_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
			hintSilent "";
		};
	}];
	waituntil {isNull (findDisplay 72)};

	{

		_pos = position _x;
		_markerID = format["marker_%1",str(_x)];
		_marker = createMarkerLocal [ _markerID, _pos];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTextLocal "Entrega Rosario";
		_marker setMarkerTypeLocal "c_car";

	} foreach _npcs;

	_cajaGTA =  "Fapret_Mediano" createVehicle [8436.44,6273.69,0.00143814];
	clearMagazineCargoGlobal _cajaGTA;
	clearItemCargoGlobal _cajaGTA;
	clearWeaponCargoGlobal _cajaGTA;

	_cajaGTA addItemCargoGlobal ["pop_coca_b", 30];
	[_cajaGTA, 60] spawn ica_fnc_borrame;
	_cajaGTA allowdamage false;

	["loop"] spawn ica_fnc_rosarioEnt;

};



if (_p isEqualTo "armas") exitWith {

	/*if (profileNamespace getVariable ["rosarioEntA",false]) exitWith {
		[player,"Hmm no se... Creo que eres policia o algo .. pides mercancía pero no la vendes ?...",
		"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	};*/

	if !(isNull objectParent player) exitWith {
	[player,"Es poco amigable hacer negocios desde el coche no crees ?",
	"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	};

	_lvl = "ti" call ica_fnc_expToLevel;
	if (_lvl < 4) exitWith {
		[player,"Tu no sabes como van estos negocios ... se te nota ...",
		"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	};

	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};
      if !({side _x == WEST} count playableUnits >= 6) exitWith {hint "Tienen que estar al menos 6 policías conectados, sino, no es divertido."};

	_accion = [
		"Estas apunto de iniciar un trabajo de transporte y distribucion de armas a tres sitios diferentes... Deberas comprar las armas por 36.000€ y podrás ganar mucho. Aceptas ?",
		"Transporte de Armas ::. Rosario Ent",
		"Si",
		"No"
	] call BIS_fnc_guiMessage;
	waituntil {!isNil "_accion"};

	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado...","PLAIN"];};

	if (vicio_din < 36000) exitWith {titleText["No tienes suficiente dinero para comprar las armas.", "PLAIN"]};
	vicio_din = vicio_din - 36000;
	profileNamespace setVariable ["rosarioEntregadosA",0];
	_npcs = selectRandom [[zona_1,zona_3,zona_4],[zona_3,tienda_terro,zona_1],[tienda_bf,zona_2,zona_1],[zona_3,zona_2,zona_4]];

	profileNamespace setVariable ["npcsRosarioA",_npcs];
	profileNamespace setVariable ["rosarioEntA",true];
	_tiempo = 60 * 20;
	profileNamespace setVariable ["rosarioTiempoA",_tiempo];

	_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Transporte de mercancías - Rosario Enterprise </t><br/><t size=""1"">Bienvenido a Rosario Enterprise, los buenos negocios de nuestros clientes se expanden ahora al segmento de la micro-distribución, esperamos que los negocios sean de mutuo provecho!.</t>";

	("La Isla del Rosario") hintC [
		_paraf,
		"Debes tomar la mercancía y distribuirla, te he marcado en este mapa tres contactos que seguro pagarán un buen precio por ella.",
		"Debes evitar controles policiales y ser sigiloso para evitar levantar interes de aquellos grupos organizados que controlen la zona.",
		"No puedes usar aeronaves, serían detectadas y en caso de irte de la ciudad deberás volver y continuar la misión sin problemas.",
		(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""https://www.empirerpg.es/"">pagina web</a></t>.")
	];
	hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
		0 = _this spawn {
			_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
			hintSilent "";
		};
	}];
	waituntil {isNull (findDisplay 72)};

	{

		_pos = position _x;
		_markerID = format["marker_%1",str(_x)];
		_marker = createMarkerLocal [ _markerID, _pos];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTextLocal "Entrega Rosario";
		_marker setMarkerTypeLocal "c_car";

	} foreach _npcs;

	_cajaGTA =  "Fapret_Mediano" createVehicle [8431,6272.04,0.00143814];
	clearMagazineCargoGlobal _cajaGTA;
	clearItemCargoGlobal _cajaGTA;
	clearWeaponCargoGlobal _cajaGTA;

	 _cajaGTA addItemCargoGlobal ["hgun_007_W_PPK", 3];
	[_cajaGTA, 60] spawn ica_fnc_borrame;
	_cajaGTA allowdamage false;

	["loopA"] spawn ica_fnc_rosarioEnt;

};


if (_p isEqualTo "loop") exitWith {

	while {profileNamespace getVariable "rosarioTiempo" > 0} do {

		if (profileNamespace getVariable ["rosariook",false]) exitWith {
			[player,format ["Gran trabajo %1 !!, puedes ir a nuestro coordinador en Downtown y solicitar tu bien merecido bono por completar la distribucion de la mercancia.",name player],
			"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
			profileNamespace setVariable ["rosarioPaga",true];
		};

		hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Rosario Enterprise: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Entrega de Droga<br/>Tiempo restante: %2</t>",["pop_coca_b"] call ica_fnc_classToPic,[((profileNamespace getVariable "rosarioTiempo")/60)+.01,"HH:MM"] call BIS_fnc_timetostring];

		if( objectParent player isKindOf "Air") exitWith {
			[player,"Te lo dije, te han detectado los radares ... quedate con la mercancía ya no me interesa. ",
			"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
			profileNamespace setVariable ["rosarioTiempo",0];
		};

		if !(alive player) exitWith {
			profileNamespace setVariable ["rosarioTiempo",0];
		};

		if (profileNamespace getVariable ["rosarioTiempo",0] <= 0 ) exitWith {
			[player,"Te has tardado demasiado, han comprado la mercancia a la compentecia ... quedate con la mercancía ya no me interesa. ",
			"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
		};

		profileNamespace setVariable ["rosarioTiempo",(profileNamespace getVariable "rosarioTiempo") - 10];

		uisleep 10;
	};


};


if (_p isEqualTo "loopA") exitWith {

	while {profileNamespace getVariable "rosarioTiempoA" > 0} do {

		if (profileNamespace getVariable ["rosarioAok",false]) exitWith {
			[player,format ["Gran trabajo %1 !!, puedes ir a nuestro coordinador en Downtown y solicitar tu bien merecido bono por completar la distribucion de la mercancia.",name player],
			"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
			profileNamespace setVariable ["rosarioPagaA",true];
		};

		hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Rosario Enterprise: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Entrega de Armas<br/>Tiempo restante: %2</t>",["hgun_007_W_PPK"] call ica_fnc_classToPic,[((profileNamespace getVariable "rosarioTiempo")/60)+.01,"HH:MM"] call BIS_fnc_timetostring];

		if( objectParent player isKindOf "Air") exitWith {
			[player,"Te lo dije, te han detectado los radares ... quedate con la mercancía ya no me interesa. ",
			"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
			profileNamespace setVariable ["rosarioTiempoA",0];
		};

		if !(alive player) exitWith {
			profileNamespace setVariable ["rosarioTiempoA",0];
		};

		if (profileNamespace getVariable ["rosarioTiempoA",0] <= 0 ) exitWith {
			[player,"Te has tardado demasiado, han comprado la mercancia a la compentecia ... quedate con la mercancía ya no me interesa. ",
			"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
		};

		profileNamespace setVariable ["rosarioTiempoA",(profileNamespace getVariable "rosarioTiempoA") - 10];

		uisleep 10;
	};


};


if (_p isEqualTo "cobroA") exitWith {

	if !(isNull objectParent player) exitWith {
	[player,"Es poco amigable hacer negocios desde el coche no crees ?",
	"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	};

	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, pobfavo"};

	if !(profileNamespace getVariable ["rosarioAok",false]) exitWith {hint "Trabaja primero, ¿qué te crees que eres político?"};
	if !(profileNamespace getVariable ["rosarioPagaA",false]) exitWith {hint "Te falta trabajo que hacer he ... Ojo .. yo solo digo"};

	_exp = round (random [3,5,7]);
	_pago = round (random [52000,67500,72500]);

	_npcs = profileNamespace getVariable "npcsRosarioA";
	{
		_markerID = format["marker_%1",str(_x)];
		deleteMarkerLocal _markerID;

	} foreach _npcs;
	profileNamespace setVariable ["npcsRosarioA",[]];
	profileNamespace setVariable ["rosarioEntA",false];
	profileNamespace setVariable ["rosarioAok",false];
	profileNamespace setVariable ["rosarioPagaA",false];
	profileNamespace setVariable ["rosarioEntregadosA",0];
	[format["%1 - Ha entregado el paquete de armas. Recibió %2 € y %3 de experiencia.", getPlayerUID player, _pago, _exp, vicio_din, vicio_atmdin], "Hacks"] remoteExecCall ["A3Log", 2];
	vicio_din = vicio_din + _pago;
	["exp",_exp] call ica_fnc_arrayexp;

	[format ["+ %1exp", _exp]] call ica_fnc_infolog;
	[format ["+ %1euro", _pago]] call ica_fnc_infolog;
	_userHack = HW getvariable ["nombre",""];
	[player,format ["Todo listo papu ... tu no me has visto ... yo si me quedo con tu cara por las dudas. por cierto el user de deepweb es %1",_userHack],
	"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	if (life_HC_isActive) then {
		[getPlayerUID player,profileName,"211"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	} else {
		[getPlayerUID player,profileName,"211"] remoteExecCall ["life_fnc_wantedAdd",2];
	};

};


if (_p isEqualTo "cobro") exitWith {

	if !(isNull objectParent player) then {
	[player,"Es poco amigable hacer negocios desde el coche no crees ?",
	"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	};

	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, pobfavo"};

	if !(profileNamespace getVariable ["rosariook",false]) exitWith {hint "Trabaja primero, ¿qué te crees que eres político?"};
	if !(profileNamespace getVariable ["rosarioPaga",false]) exitWith {hint "Te falta trabajo que hacer he ... Ojo .. yo solo digo"};

	_exp = round (random [2,4,6]);
	_pago = round (random [47500,55000,60000]);

	_npcs = profileNamespace getVariable "npcsRosario";
	{
		_markerID = format["marker_%1",str(_x)];
		deleteMarkerLocal _markerID;

	} foreach _npcs;

	profileNamespace setVariable ["rosarioEntregados",0];
	profileNamespace setVariable ["npcsRosario",[]];
	profileNamespace setVariable ["rosarioEnt",false];
	profileNamespace setVariable ["rosariook",false];
	profileNamespace setVariable ["rosarioPaga",false];
	[format["%1 - Ha entregado el paquete de drogas. Recibió %2 € y %3 de experiencia.", getPlayerUID player, _pago, _exp, vicio_din, vicio_atmdin], "Hacks"] remoteExecCall ["A3Log", 2];
	vicio_din = vicio_din + _pago;
	["exp",_exp] call ica_fnc_arrayexp;

	[format ["+ %1exp", _exp]] call ica_fnc_infolog;
	[format ["+ %1euro", _pago]] call ica_fnc_infolog;
	_userHack = HW getvariable ["nombre",""];
	[player,format ["Todo listo papu ... no me conoces ... yo si me quedo con tu cara por las dudas. Por cierto el usuario de acceso al portatil deepweeb es %1",_userHack],
	"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	if (life_HC_isActive) then {
		[getPlayerUID player,profileName,"211"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	} else {
		[getPlayerUID player,profileName,"211"] remoteExecCall ["life_fnc_wantedAdd",2];
	};

};


if (_p isEqualTo "entrega") exitWith {
// comprobamos que no haya entregado ya en este NPC
_a = cursorTarget;
if(_a getvariable "entregueYa") exitWith {hint "Ya has entregado en este NPC, no me seas Corleone";};
[] spawn {
	_a = cursorTarget;
	_a setVariable["entregueYa", true];
	sleep(60*3);
	_a setVariable["entregueYa", false];
};
	if !(isNull objectParent player) exitWith {
	[player,"Es poco amigable hacer negocios desde el coche no crees ?",
	"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	};

	_n = 2 + floor(random 2);
	[_n, "Entregando Mercancia..."] call ica_fnc_barrita;
	sleep _n;

	_drogaCantidad = ["pop_coca_b"] call ica_fnc_tengo;
	if(_drogaCantidad < 10)exitWith{
	hint "no tienes Droga para mi ... !!";
	};
	["pop_coca_b", -10] call ica_fnc_item;
	hint "Gracias por la droga !! ";

	profileNamespace setVariable ["rosarioEntregados",(profileNamespace getVariable ["rosarioEntregados",0]) + 1];

	if (profileNamespace getVariable ["rosarioEntregados",0] >= 3) exitWith {
		profileNamespace setVariable ["rosariook",true];
	};

	_exp = round (random [1,3,4]);
	_pago = round (random [5000,7500,10000]);

	vicio_din = vicio_din + _pago;
	["exp",1] call ica_fnc_arrayexp;

	[format ["+ %1exp", 1]] call ica_fnc_infolog;
	[format ["+ %1euro", _pago]] call ica_fnc_infolog;

};


if (_p isEqualTo "entregaA") exitWith {
// comprobamos que no haya entregado ya en este NPC
	_a = cursorObject;
	if(_a getvariable "entregueYa") exitWith {hint "Ya has entregado en este NPC, no me seas Corleone";};
	[] spawn {
		_a = cursorObject;
		_a setVariable["entregueYa", true];
		sleep(60*3);
		_a setVariable["entregueYa", false];
	};

	if !(isNull objectParent player) exitWith {
	[player,"Es poco amigable hacer negocios desde el coche no crees ?",
	"Rosario Enterprise","hgun_007_W_PPK"] call ica_fnc_axeMsg;
	};

	_pWeap = primaryWeapon player;
	_hgWeapon = handgunWeapon player;

    if( _pWeap != "" or _hgWeapon != "" ) exitWith{

    titleText["Pon tus armas en la mochila, no te pagaremos mientras lleves armas equipadas.", "PLAIN"];
	};


	_n = 2 + floor(random 2);
	[_n, "Entregando Mercancia..."] call ica_fnc_barrita;
	sleep _n;

	_armaCantidad = ["hgun_007_W_PPK"] call ica_fnc_tengo;
	if(_armaCantidad < 1)exitWith{
		hint "no tienes armas para mi ... !";
	};
	["hgun_007_W_PPK", -1] call ica_fnc_item;

	profileNamespace setVariable ["rosarioEntregadosA",(profileNamespace getVariable ["rosarioEntregadosA",0]) + 1];

	hint "Gracias por las armas!";

	if (profileNamespace getVariable ["rosarioEntregadosA",0] >= 3) exitWith {
		profileNamespace setVariable ["rosarioAok",true];
	};

	_exp = round (random [1,3,4]);
	_pago = round (random [5000,7500,10000]);

	vicio_din = vicio_din + _pago;
	["exp",1] call ica_fnc_arrayexp;

	[format ["+ %1exp", 1]] call ica_fnc_infolog;
	[format ["+ %1euro", _pago]] call ica_fnc_infolog;

};
