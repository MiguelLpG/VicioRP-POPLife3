
/*
Correos del Estado
by: AxE


*/

_param = _this select 0;

if (_param isEqualTo "init") exitWith {

	[[NPC_AXE_CORREOS, ["Solicitar equipamento y coche oficial - Correos del Estado", {["solicito2"] spawn ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS, ["Entregar equipamento y coche oficial - Correos del Estado", {["entrego"] spawn ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS, ["Recoger paquetes de correos - Correos del Estado", {["recoger"] spawn ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS, ["Cobrar salario por ruta - Correos del Estado", {["cobrar"] spawn ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;

	[[NPC_AXE_CORREOS_1, ["Solicitar equipamento y coche oficial - Correos del Estado", {["solicito"] spawn ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS_1, ["Entregar equipamento y coche oficial - Correos del Estado", {["entrego"] spawn ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS_1, ["Recoger paquetes de correos - Correos del Estado", {["recoger"] spawn ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS_1, ["Cobrar salario por ruta - Correos del Estado", {["cobrar"] spawn ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;

	paquetesCorreos = 6;

	while {true} do {
			if (paquetesCorreos > 19) then {
				paquetesCorreos = 20
				};
		paquetesCorreos = paquetesCorreos + ceil(random 19);
		publicVariable "paquetesCorreos";

		sleep (60 * 10);
	};



};

_class = "pop_correos";

if (_param isEqualTo "recoger") exitWith {

	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policia, acaparador!";};
	_trabajo = player getVariable ["trabajando_correos",0];
	if (_trabajo > 0) exitWith {hint "Ya te di paquetes antes ... debes cobrar por ellos antes de pedir mas, las cuentas claras."};
	if (isNil {paquetesCorreos}) exitWith {hint "Al parecer no han llegado paquetes..."};

	_n = 10;

	if !(paquetesCorreos >= _n) exitWith {hint "No me queda ningún paquete para ti, vuelve más tarde."};
	if !(player canAdd [_class, _n]) exitWith {hint "No tienes suficiente espacio."};

	paquetesCorreos = paquetesCorreos - _n;
	publicVariable "paquetesCorreos";

	["pop_correos",_n] call ica_fnc_item;
	player setVariable ["trabajando_correos",1,true];
	player setVariable ["entregados_correos",0,true];
	[format ["+ %1", [_class] call ica_fnc_classToName]] call ica_fnc_infolog;

		while {(player getVariable "trabajando_correos") == 1} do
		{
			if (!alive player) exitWith {};

			_listaventa = listaCasas + listaGarajes;
			if((typeof cursorObject) in _listaventa) then {
			accionparadabuzon = player addAction ["Entregar paquete",{
			player removeAction accionparadabuzon;
			["entregaPaquete"] call ica_fnc_correos;
			}];
			waitUntil {!((typeof cursorObject) in _listaventa)};
			player removeAction accionparadabuzon;
			};
		};
};


if (_param isEqualTo "cobrar") exitWith {
	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policía, acaparador!";};
	if (!isNil {ocupado}) exitWith {hint "Estas ocupado."};
	0 spawn {
		ocupado = true;
		sleep 2;
		ocupado = nil;
	};
	_cobrotrabajo = player getVariable ["trabajando_correos",0];
	if (_cobrotrabajo < 1) exitWith {hint "trabaja primero no me seas tan vago"};
	_paquetes = ["pop_correos"] call ica_fnc_tengo;

	if (_paquetes > 0) exitWith {hint "Pero que es esto? Aun tienes paquetes que entregar, venga y no me seas vago ve y entrega todo."};

	_entregadospaga = player getVariable "entregados_correos";
	if (isNil "_entregadospaga") exitWith {hint "Vienes a cobrar? pero si me acaba de llamar Lorenzo y no ha recibido su correo..."};
	if (_entregadospaga < 0.5) exitWith {hint "Amigo, tenias que poner el correo en las puertas de las casas, no?"};

	_din = (800 * _entregadospaga) + (round random 1000);
	vicio_din = vicio_din + _din;
	if (_entregadospaga > 6) then {
	["exp",8] call ica_fnc_arrayexp;
	[format ["+ %1 de exp", 8]] call ica_fnc_infolog;
	};
	[format ["+ %1�", _din]] call ica_fnc_infolog;
	player setVariable ["trabajando_correos",0,true];
	_organizacion = cursorObject getVariable["controlado_por",grpNull];
	if(!isNull _organizacion) then
	{
	[(round (_din * 0.01)),_organizacion] call life_fnc_gangExtorsion;
	};
		_lvl = cursorObject getVariable ["negociolvl",0];
		_lvl = _lvl + 2;
		if (_lvl > 100) then {
		_lvl = 100;
		};
		cursorObject setVariable ["negociolvl",_lvl, true];
//	player forceAddUniform (player getVariable "uniforme");
//	player setVariable ["uniforme", nil];
	hint format ["Gracias por tu trabajo!! \n\n Seul te ha pagado: %1, recuerda que para obtener experiencia deberas entragar todos los paquetes.", _din];

};


if (_param isEqualTo "entregaPaquete") exitWith {

	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policia, acaparador!";};
	_paquetes = [_class] call ica_fnc_tengo;
	_cobrotrabajox = player getVariable ["trabajando_correos",0];
	if (_cobrotrabajox < 1) exitWith {hint "registrate primero en seul no me seas tan vago"};
	if !(vehicle player == player) exitWith {hint "Y como pretendes entregar el correo desde el coche ? mentalmente ?"};
	if (_paquetes == 0) exitWith {hint "No tienes ninguna caja de seul."};
	//if ((typeof vehicle player) != "pop_nemo_correos") exitWith {hint "Solo estas autorizado para entregar correos en un coche de correos."};
	_flag = false;
	{
		if (typeOf(_x) == "empirerp_furgoseul" || typeOf(_x) == "empirerp_furgonrw") exitWith {
			_flag = true;
		};
	} forEach ((position player) nearEntities ["Car", 50]);
	if !(_flag) exitWith{hint "Debes usar el vehículo de correos para este trabajo!";};
	_clase = typeof cursorObject;
	_buzon = (nearestObjects [player, [_clase], 7]) select 0;

	if ((player distance cursorObject) > 10) exitWith {hint "debes acercarte mas a la puerta no crees ?"};

	_entregado = cursorObject getVariable "correo_entregado";
	if (isNil "_entregado") then {_entregado = 0};
	if (_entregado > 0.5) exitWith {hint "El correo de esta casa ya fue entregado, busca otro buzon"};
	_recompensa = 0;

	[2, "Colocando el correo ..."] spawn ica_fnc_barrita;
	 player playActionNow "PutDown";

	cursorObject setVariable ["correo_entregado",1,true];
	["pop_correos",-1] call ica_fnc_item;
	[format ["- %1 %2", -1, ["pop_correos"] call ica_fnc_classToName]] call ica_fnc_infolog;


		if ((floor random 100) < 10) then {
	_regalo1 = [

		["pop_esposas", 1, 2],
		["pop_llaves", 1, 2],
		["pop_lingotehierro", 1, 2]
	] call BIS_fnc_selectRandom;

	_regalitoComun = _regalo1 select 0;
	_canComun = (_regalo1 select 1) + round random (_regalo1 select 2);

	[_regalitoComun, _canComun] call ica_fnc_item;
	[format ["+ %1 %2", _canComun, [_regalitoComun] call ica_fnc_classToName]] call ica_fnc_infolog;

	hint format ["Este paquete de correo tenia: %1 %2 ... mejor te lo quedas pero shshsh \n\n", _canComun, _regalitoComun];

	_recompensa = 1;
	};

	if ((floor random 100) < 5) then {
	private ["_regalitoRaro", "_canRaro"];
		_regalo2 = [
			// ["className", cantidadSegura, cantidadRandomA�adida],
			["pop_bisturi_item", 1, 0],
			["pop_nokia", 1, 0],
			["pop_componentes", 1, 0]
		] call BIS_fnc_selectRandom;

		_regalitoRaro = _regalo2 select 0;
		_canRaro = (_regalo2 select 1) + round random (_regalo2 select 2);

		[_regalitoRaro, _canRaro] call ica_fnc_item;
		[format ["+ %1 %2", _canRaro, [_regalitoRaro] call ica_fnc_classToName]] call ica_fnc_infolog;

		hint format ["Hostias!! Este paquete de correo tenia: %1 %2 ... madre mia que me lo quedo ! \n\n", _canRaro, _regalitoRaro];
		_recompensa = 1;
	};

	if (_recompensa < 1) exitWith {
	sleep 2;
	_pentregados = player getVariable "entregados_correos";
	player setVariable ["entregados_correos",_pentregados + 1,true];
	["Correo entregado"] call ica_fnc_infolog;
	};
};
// SPAWN VEHICULO LAKESIDE
if (_param isEqualTo "solicito") exitWith {
	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policia, acaparador!";};
    if (!license_civ_driver) exitwith {hint "No tienes carnet de conducir B, no puedes conducir este coche."};
    if (vicio_din < 5000) exitwith {hint "La fianza del coche son 5000€"};
	if ((count (player nearEntities [["Car", "Motorcycle"], 15]))>1) exitwith {hint "Saca los vehiculos de cerca mia no vaya a ser que reviente"};
    vicio_din = vicio_din - 5000;
	player setvariable ["trabajandoCorreos", true];
	private _arraySeleccion = ["seul", "nrw"];
	private _transporte = _arraySeleccion select floor random count _arraySeleccion;
	player setvariable ["transporte", _transporte];
	
	switch (_transporte) do
	{
		case "seul": // SEUL
		{
			_cochecorreo = "empirerp_furgoseul" createvehicle getMarkerPos "correo_01_lake";
			_cochecorreo setvariable ["propietario",name player,true];
			player setvariable ["uniforme",uniform player,true];
			player forceAddUniform "uniforme_seul";
			player addHeadgear "empirerp_seulgorra";
		};
		case "nrw": // NRW
		{
			_cochecorreo2 = "empirerp_furgonrw" createvehicle getMarkerPos "correo_01_lake";
			_cochecorreo2 setvariable ["propietario",name player,true];
			player setvariable ["uniforme",uniform player,true];
			player forceAddUniform "uniforme_nrw";
			player addHeadgear "empirerp_nrwgorra";
		};
	};
    hint "Todo listo capo, recoge los paquetes aqui mismo, cargalos y ve a entregar todo a las puertas de las casas.";
};
// SPAWN VEHICULO MORRISON
if (_param isEqualTo "solicito2") exitWith {
	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policia, acaparador!";};
    if (!license_civ_driver) exitwith {hint "No tienes carnet de conducir B, no puedes conducir este coche."};
    if (vicio_din < 5000) exitwith {hint "La fianza del coche son 5000€"};
	if ((count (player nearEntities [["Car", "Motorcycle"], 15]))>1) exitwith {hint "Saca los vehiculos de cerca mia no vaya a ser que reviente"};
    vicio_din = vicio_din - 5000;
	player setvariable ["trabajandoCorreos", true];
	private _arraySeleccion = ["seul", "nrw"];
	private _transporte = _arraySeleccion select floor random count _arraySeleccion;
	player setvariable ["transporte", _transporte];
	
	switch (_transporte) do
	{
		case "seul":
		{
			_cochecorreo = "empirerp_furgoseul" createvehicle getMarkerPos "correo_01_morri"; //Lakeside
			_cochecorreo setvariable ["propietario",name player,true];
			player setvariable ["uniforme",uniform player,true];
			player forceAddUniform "uniforme_seul";
			player addHeadgear "empirerp_seulgorra";
		};
		case "nrw":
		{
			_cochecorreo2 = "empirerp_furgonrw" createvehicle getMarkerPos "correo_01_morri"; //Morrison
			_cochecorreo2 setvariable ["propietario",name player,true];
			player setvariable ["uniforme",uniform player,true];
			player forceAddUniform "uniforme_nrw";
			player addHeadgear "empirerp_nrwgorra";
		};
	};
    hint "Todo listo capo, recoge los paquetes aqui mismo, cargalos y ve a entregar todo a las puertas de las casas.";
};


if (_param isEqualTo "entrego") exitWith {
	if (playerSide == WEST) exitWith {hint "Ya tienes trabajo como policia, acaparador!";};
	if (player getvariable "trabajandoCorreos" == false) exitwith {hint "No estás trabajando de esto, ¿que intentabas?"};
    if ((count (nearestObjects [player, ["man"], 6]))>1) exitwith {hint "De uno en uno, por favor."};
    _transporte = player getvariable "transporte";

	switch (_transporte) do {
		case "seul": 
		{
			_cochecorreo = nearestObject [player, "empirerp_furgoseul"];
			if ((player distance _cochecorreo) > 5) exitwith {hint "Acerca el coche de seul."};
			_propietario = _cochecorreo getvariable "propietario";
			if (name player != _propietario) exitwith {hint "Este coche no esta registrado a tu nombre."};
				_paquetes = ["pop_correos"] call ica_fnc_tengo;
					if (_paquetes > 0) exitWith {hint "Me quieres entregar el camion teniendo paquetes encima? Tu que quieres estafarme?"};

			deletevehicle _cochecorreo;
			removeHeadgear player;
			removeUniform player;
			_uniforme = player getvariable "uniforme";
			player adduniform _uniforme;
				player setVariable ["uniforme", nil];
				player setvariable ["trabajandoCorreos", false];
			vicio_din = vicio_din + 4000;
			hint "Todo listo, el coche esta guardado en el garage, se te ha descontado una parte por el alquiler, los desperfectos causados y la gasolina, vuelve a por mas trabajo cuando quieras.";
		};
	case "nrw": 
		{
			_cochecorreo = nearestObject [player, "empirerp_furgonrw"];
			if ((player distance _cochecorreo) > 5) exitwith {hint "Acerca el coche de nrw."};
			_propietario = _cochecorreo getvariable "propietario";
			if (name player != _propietario) exitwith {hint "Este coche no esta registrado a tu nombre."};
				_paquetes = ["pop_correos"] call ica_fnc_tengo;
					if (_paquetes > 0) exitWith {hint "Me quieres entregar el camion teniendo paquetes encima? Tu que quieres estafarme?"};

			deletevehicle _cochecorreo;
			removeHeadgear player;
			removeUniform player;
			_uniforme = player getvariable "uniforme";
			player adduniform _uniforme;
				player setVariable ["uniforme", nil];
				player setvariable ["trabajandoCorreos", false];
			vicio_din = vicio_din + 4000;
			hint "Todo listo, el coche esta guardado en el garage, se te ha descontado una parte por el alquiler, los desperfectos causados y la gasolina, vuelve a por mas trabajo cuando quieras.";
		};
	};
};
