// Recepción y Transporte de Mercancías Ilegales --- > Isla del Rosario
// By AxE.
// ["init"] call ica_fnc_rosario


_p = _this select 0;
_paquetex = _this select 1;

if (_p isEqualTo "init") exitWith {
	[zona_1, ["Entregar mercancía .:: Rosario Enterprise ::.", {["entrega","mafia"] call ica_fnc_rosario},nil,6,true,true,"","trans_rosario isEqualTo 1"]] remoteExec ["addAction", 0,true];
	[zona_2, ["Entregar mercancía .:: Rosario Enterprise ::.", {["entrega","mafia"] call ica_fnc_rosario},nil,6,true,true,"","trans_rosario isEqualTo 1"]] remoteExec ["addAction", 0,true];	
	[zona_3, ["Entregar mercancía .:: Rosario Enterprise ::.", {["entrega","mafia"] call ica_fnc_rosario},nil,6,true,true,"","trans_rosario isEqualTo 1"]] remoteExec ["addAction", 0,true];	
	[zona_4, ["Entregar mercancía .:: Rosario Enterprise ::.", {["entrega","mafia"] call ica_fnc_rosario},nil,6,true,true,"","trans_rosario isEqualTo 1"]] remoteExec ["addAction", 0,true];	
	[tienda_terro, ["Entregar mercancía .:: Rosario Enterprise ::.", {["entrega","terro"] call ica_fnc_rosario},nil,6,true,true,"","trans_rosario isEqualTo 2"]] remoteExec ["addAction", 0,true];
	[tienda_bf, ["Entregar mercancía .:: Rosario Enterprise ::.", {["entrega","bf"] call ica_fnc_rosario},nil,6,true,true,"","trans_rosario isEqualTo 3"]] remoteExec ["addAction", 0,true];	
	[camello, ["Entregar mercancía .:: Rosario Enterprise ::.", {["entrega","droga"] call ica_fnc_rosario},nil,6,true,true,"","trans_rosario isEqualTo 4"]] remoteExec ["addAction", 0,true];

	
	[[admin_box, ["Velocidad x1",{ player setAnimSpeedCoef 1;},nil,1.5,true,true,""," call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Velocidad x5",{ player setAnimSpeedCoef 5;},nil,1.5,true,true,""," call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Velocidad x10",{ player setAnimSpeedCoef 10;},nil,1.5,true,true,""," call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Chaleco Admin azul",{player addVest "pop_chaleco_cmd_cmd_43";},nil,1.5,true,true,""," call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Chaleco Admin amarillo",{player addVest "pop_chaleco_cmd_cmd_48";},nil,1.5,true,true,""," call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Invencible",{player allowdamage false;},nil,1.5,true,true,""," call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Vencible",{player allowdamage true;},nil,1.5,true,true,""," call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Curar pandemia",{player setVariable ["enfermedad", nil, true]; profilenameSpace setvariable ["enfermedad",nil]} remoteExec ["BIS_fnc_spawn",0],nil,1.5,true,true,"","call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Borrar PDA",{life_wanted_list = []} remoteExec ["BIS_fnc_spawn",0],nil,1.5,true,true,""," call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	[[admin_box, ["Arreglar alertas",{anunciado = nil} remoteExec ["BIS_fnc_spawn",0],nil,1.5,true,true,"","call life_adminlevel > 1"]],"addAction",true,true] call BIS_fnc_MP;
	
};


if (_p isEqualTo "solicito") exitWith {

if ((player getvariable "rosario") > 0) exitwith {hint "Caballero, estamos esperando que realice la entrega del paquete que le fue asignado con anterioridad"};
player setVariable ["rosario",1,true];

rosario_goingon = NPC_AXE_ROSARIO getvariable "rosario";

if (rosario_goingon) exitWith {hint "Lo siento pero ya estamos procesando una recepción internacional "};
if (vicio_din < 25000) exitwith {hint "No tienes 25.000 € necesarios para darte acceso a la mercancía ... no es que no fie ... pero no."};
	_lvl = "ti" call ica_fnc_expToLevel;
		if (_lvl < 4) exitWith { hint "Necesitas conocimientos de marinero para hacer este trabajo. Ve a la universidad."};
		if !({side _x == WEST} count playableUnits >= 5) exitWith {hint "Tienen que estar al menos 5 policías conectados, sino, no es divertido."};
vicio_din = vicio_din - 25000;

NPC_AXE_ROSARIO setVariable ["rosario",true,true];

[] spawn {
sleep 60;
NPC_AXE_ROSARIO setVariable ["rosario",false,true];
};

_liderrosario = name player;

mercancia_rosario_tomada = 0;

_paquete = selectRandom [
	["mafia","articulos Discretos","tienda de mafia",zona_1,1,"482"],
	["terro","articulos Chungos","tienda terrorista",tienda_terro,2,"4833"],
	["bf","articulos Sospechosos","tienda de bajos fondos",tienda_bf,3,"4833"],
	["droga","Cocaína","tienda del camello",camello,4,"483"]
	];

trans_rosario = _paquete select 4;	

_pos = selectRandom [
	[7470.44,499.476,0],
	[8509.86,918.121,0],
	[9754.96,1413.78,0],
	[7930.53,733.178,0]
];	


_markerID = format["marker_%1",round (random 100)];
_marker = createMarkerLocal [ _markerID, _pos];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTextLocal "Paquete Aereo Rosario";
_marker setMarkerTypeLocal "c_plane";

_pic1 = ["C_Plane_Civil_01_racing_F"] call ica_fnc_classToPic;

hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Rosario Enterprise: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Hola %2 ... pareces estar interesado en uno de nuestros trabajillos ...  <br/>dejame consultar con mi secretaria para ver que importaciones tenemos pendientes.</t>",_pic1, _liderrosario];

sleep round(random 20);

_posairdrop = mapGridPosition _pos;


_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Transporte de mercancías - Isla del Rosario </t><br/><t size=""1"">Bienvenido a la isla del rosario, la puerta de Lakeside, donde llegan todas aquellas mercancías que por su naturaleza deben pasar un poco desapercibidas.</t>";

("La Isla del Rosario") hintC [
	_paraf,
	"Debes esperar el paquete y tomar todo su contenido desde el fondo del mar para evitar los radares y controles policiales.",
	"Ten cuidado, son mercancías de mucho valor y muchas personan estarán buscandote para robarlas.",
	"El inventario del paquete esta controlado al detalle, ante cualquier faltante o evidencia de uso en la mercancía al momento de la entrega avisaremos por un lado a la Policia y por otro a nuestros amigos de la Empresa para que te pongan en lista negra.",
	(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""https://www.empirerpg.es/"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};
sleep 10 + round(random 40);

hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Transporte de mercancías - Isla del Rosario</t><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Una avioneta de R.E llegara procedente del exterior en los próximos minutos, dejara caer una caja con %2 sobre aguas de la isla del rosario en coordenadas %3</t>",_pic1,_paquete select 1,_posairdrop];
sleep 20;
hintSilent parseText format["<t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'>Debes llevar las mercancías a la %1 que estará esperando para distribuirlas al destinatario final.</t>",_paquete select 2];

rosario_avioneta_main = "C_Plane_Civil_01_racing_F";

_dest = _pos;
avioneta1 = CreateVehicle [rosario_avioneta_main, [10218.8,24.3356, 0], [], 0, "FLY"];
avioneta1 allowDamage false;
avioneta1 setvariable ["persistent", true, true];

_mygroup1 = [[10218.8,24.3356, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{_x moveInDriver avioneta1} forEach units _mygroup1;
sleep 220;
_mygroup1 addWaypoint [_dest, 0];
_mygroup1 addWaypoint [[10218.8,24.3356,0], 0];

_containerdummy = createVehicle ["CargoNet_01_box_F", [10218.8,24.3356, 90], [], 0, "CAN_COLLIDE"];
_containerdummy setvariable ["persistent", true, true];
_containerdummy attachTo [avioneta1,[0,0,-3.5]];
_containerdummy setDir 90;

while { _dest distance avioneta1 > 250 } do { sleep 1; };

deleteVehicle _containerdummy;
sleep 0.1;
_container = createVehicle ["CargoNet_01_box_F", [10218.8,24.3356, 90], [], 0, "CAN_COLLIDE"];
_container setvariable ["persistent", true, true];
_para = createVehicle ["O_Parachute_02_F", [getPos avioneta1 select 0, getPos avioneta1 select 1, getPos avioneta1 select 2], [], 0, ""];
_para setPosATL (avioneta1 modelToWorld[0,0,100]);
_para attachTo [avioneta1,[0,0,-10]];
detach _para;
_container attachTo [_para,[0,0,-2]];
_container setDir 90;
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container];
_smoke="SmokeShellGreen" createVehicle [getpos _container select 0, getpos _container select 1,0];
_smoke attachTo [_container,[0,0,0]];
_light = "Chemlight_green" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare = "F_40mm_Green" createVehicle getPos _container;
_flare attachTo [_container,[0,0,0]];
sleep 0.1;
while { (getPosATL _container select 2) > 2 } do { sleep 1; };
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _container];
sleep 3;
_container allowDamage false;
_smoke="SmokeShellGreen" createVehicle [getpos _container select 0,getpos _container select 1,0];
_flare = "F_40mm_Green" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare attachTo [_container,[0,0,0]];
clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearItemCargoGlobal _container;
accionpaqueterosario = _container addAction ["Tomar Mercancía",{
	_argumentos = _this select 3;
	_containerx = _argumentos select 1;
	_containerx removeAction accionpaqueterosario;
	if ( mercancia_rosario_tomada > 0.5) exitWith {};
		0 spawn {mercancia_rosario_tomada = 1;
		sleep 60;
		mercancia_rosario_tomada = 0;
		};
	_n = 2 + floor(random 2);
	[_n, "Tomando mercancía..."] call ica_fnc_barrita;
	sleep _n;
	  switch (_argumentos select 0 select 0) do
	{
	case "mafia" :
		{
		["pop_taladro", 1] call ica_fnc_item;
		["pop_c4", 1] call ica_fnc_item;
		["hakiador_puertas", 1] call ica_fnc_item;
		["soplete", 1] call ica_fnc_item;		
		};
	case "terro" :
		{
		["hlc_rifle_ak74", 1] call ica_fnc_item;
		};
	case "bf" :
		{
		["RH_m9", 1] call ica_fnc_item;
		};	
	case "droga" :
		{
		["pop_cocaina_f", 5] call ica_fnc_item;
		};
	};
	
},[_paquete,_container]];


sleep 30;
deleteVehicle avioneta1;
[_container, 260] spawn ica_fnc_borrame;

WaitUntil {
	sleep 1;
	_distbox =  player distance (getPos _container);
	_distbox < 50;
};
  _time = 60 * 30;
  _destino = _paquete select 2;
  _posDestino = getPos (_paquete select 3);
  _metros =  player distance _posDestino;  

  while {_time > 0} do {
	_vehicle = vehicle player;
      if(_vehicle isKindOf "Air")then{
		if!(typeOf _vehicle isEqualTo "C_Plane_Civil_01_racing_F" or typeOf _vehicle isEqualTo "C_Heli_Light_01_civil_F") then {
			titleText["Has fallado ... los radares te han detectado ... ya sabes cuales son las consecuencias", "PLAIN"]; 
			player setvariable ["rosario",0,true];
			profileNamespace setVariable ["lista_negra",1];
			if (life_HC_isActive) then {
			[getPlayerUID player,profileName,_paquete select 5] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
			} else {
			[getPlayerUID player,profileName,_paquete select 5] remoteExecCall ["life_fnc_wantedAdd",2];
			};			
			_time = 0;
		};
    };

      _metros =  player distance _posDestino;

      sleep 1;
      _time = _time - 1;
      hintSilent format["Rosario Enterprise \n Destino: %3 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];

      if !(alive player) then {
        player setvariable ["rosario",0,true];
		_time = 0;     
      };
    
      if (_time <= 0 ) then {
		player setvariable ["rosario",0,true];
		profileNamespace setVariable ["lista_negra",1];
		[getPlayerUID player,profileName,_paquete select 5] remoteExec ["life_fnc_wantedAdd",2];
        hint "Has tardado mucho en llegar y la mercancía ha sido rechazada ... ahora ya sabes cuales son las consecuencias";
        _time = 0;
      };

    if(_metros < 20 )then{
	hint "Has logrado llegar, entrega la mercancía y ojalá no te falte nada";
	player setvariable ["entregar_rosario",1,true];
	player setvariable ["tiempo_rosario",_time,true];	
		0 spawn {
		sleep 60;
			if ((player getvariable "entregar_rosario") isEqualTo 1) exitwith {
			player setvariable ["entregar_rosario",0,true];			
			profileNamespace setVariable ["lista_negra",1];
			[getPlayerUID player,profileName,"483"] remoteExec ["life_fnc_wantedAdd",2];
			hint "Ya te he dado mucho tiempo para entregar mi mercancía ... reportare esto a Rosario Enterprise ... ";
			};
		};
    _time = 0;
    
	deleteMarkerLocal _markerID;
	
	};
};

};


if (_p isEqualTo "entrega") exitWith {

if ((count (nearestObjects [player, ["man"], 5]))>1) exitwith {hint "Espera a que estemos más solos..."};

if ((player getvariable "entregar_rosario") isEqualTo 0) exitwith {hint "Mercancías ?? tu ? no se nada, nada de nada."};

_paga = false;
// comprobamos que no haya entregado ya en este NPC
_a = cursorTarget;
if(_a getvariable "entregueYa") exitWith {hint "Ya has entregado en este NPC, no me seas Corleone";};
[] spawn {
	_a = cursorTarget; 
	_a setVariable["entregueYa", true];
	sleep(60*3);
	_a setVariable["entregueYa", false];
};

  switch (_paquetex) do
	{
	case "mafia" :
		{
	    _cnt = ["pop_taladro"] call ica_fnc_tengo;
		_cnt1 = ["pop_c4"] call ica_fnc_tengo;
		_cnt2 = ["hakiador_puertas"] call ica_fnc_tengo;
		_cnt3 = ["soplete"] call ica_fnc_tengo;
			if(_cnt < 1 OR _cnt1 < 1 OR _cnt2 < 1 OR _cnt3 < 1)exitWith{
			hint "Eh !! amigo ... aqui falta mercancía ... te doy 30 segundos para entregarme todo completo o lo reportare a R.E";
			};
		["pop_taladro", -1] call ica_fnc_item;
		["pop_c4", -1] call ica_fnc_item;
		["hakiador_puertas", -1] call ica_fnc_item;
		["soplete", -1] call ica_fnc_item;
		_paga = true;
			_stock = zona_1 getVariable "stock";
			zona_1 setVariable ["stock",(_stock + 2),true];		
		};
	case "terro" :
		{
	    _cnt = ["hlc_rifle_ak74"] call ica_fnc_tengo;
			if(_cnt < 1)exitWith{
			hint "Eh !! amigo ... aqui falta mercancía ... te doy 30 segundos para entregarme todo completo o lo reportare a R.E";
			};
			["hlc_rifle_ak74", -1] call ica_fnc_item;
			_paga = true;
			_stock = tienda_terro getVariable "stock";
			tienda_terro setVariable ["stock",(_stock + 2),true];
		};
	case "bf" :
		{
		_cnt = ["RH_m9"] call ica_fnc_tengo;
		if(_cnt < 1)exitWith{
			hint "He !! amigo ... aqui falta mercancía ... te doy 30 segundos para entregarme todo completo o lo reportare a R.E";
		};	
		["RH_m9", -1] call ica_fnc_item;
		_paga = true;
		_stock = tienda_bf getVariable "stock";
		tienda_bf setVariable ["stock",(_stock + 2),true];		
		};	
	case "droga" :
		{
		_cnt1 = ["pop_cocaina_f"] call ica_fnc_tengo;
			if !(_cnt1 > 4) exitWith {
			hint "He !! amigo ... aqui falta mercancía ... te doy 30 segundos para entregarme todo completo o lo reportare a R.E";
			};
		["pop_cocaina_f", -5] call ica_fnc_item;
		_paga = true;		
		};
	};

	if !(_paga) exitWith {};
	
	_pic2 = ["POP_npc_mafioso3"] call ica_fnc_classToPic;
	_userHack = HW getvariable ["nombre",""];
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Cliente: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Muy bien %2 ... Agradezco mucho tu trabajo ...  <br/>pagaré la tarifa plana más un poco por el tiempo que hayas ahorrado, ha por cierto el usuario actual deepweb es %3</t>",_pic2, name player, _userHack];
         
    _exp = round (random 60);      
    _pago = 48000 + (player getvariable ["tiempo_rosario",0]);
	if (!(typeName _pago isEqualTo "SCALAR") OR _pago < 0) then {_pago = 48000};
    vicio_din = vicio_din + _pago;
	_organizacion = cursorObject getVariable["controlado_por",grpNull];
	if(!isNull _organizacion) then 
	{ 
	[(round (_pago * 0.01)),_organizacion] call life_fnc_gangExtorsion;  
	};	
		_lvl = cursorObject getVariable ["negociolvl",0];
		_lvl = _lvl + 2;
		if (_lvl > 100) then {
		_lvl = 100;
		};
		cursorObject setVariable ["negociolvl",_lvl, true];		
    ["exp",_exp] call ica_fnc_arrayexp;

	player setvariable ["entregar_rosario",0,true];
	player setVariable ["rosario",0,true];


};

if (_p isEqualTo "alquilar") exitWith {

    _piloto = "tl" call ica_fnc_expToLevel;
    if !(license_civ_piloto)exitWith{ hint "No eres piloto, para que quieres una avioneta ? para estrellarla ?." };
       
if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor."};

    if (vicio_din < 4000) exitwith {hint "La fianza de la avioneta son 4.000€"};
    vicio_din = vicio_din - 4000;
    _veh = "C_Plane_Civil_01_racing_F" createvehicle [9116.34,187.388,0.00143909];
    _veh setvariable ["propietario",name player,true];
	player addHeadgear "H_PilotHelmetHeli_O";
 
};

if (_p isEqualTo "alquilarh") exitWith {


    if !(license_civ_piloto)exitWith{ hint "No eres piloto, para que quieres una avioneta ? para estrellarla ?." };
       
	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor."};

    if (vicio_din < 25000) exitwith {hint "La fianza del Helicoptero son 25.000€"};
    vicio_din = vicio_din - 25000;
    _veh = "C_Heli_Light_01_civil_F" createvehicle [9116.34,187.388,0.00143909];
    _veh setvariable ["propietario",name player,true];
	player addHeadgear "H_PilotHelmetHeli_O";
 
};

if (_p isEqualTo "devolver") exitWith {


    if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor."};
    _veh = nearestObject [player, "C_Plane_Civil_01_racing_F"];
    if (isnil "_veh") exitwith {hint "No veo cerca ningúna avioneta."};
    if ((player distance _veh)>10) exitwith {hint "Acerca la avioneta"};
    _propietario = _veh getvariable "propietario";
    if (name player != _propietario) exitwith {hint "Esta avioneta no está registrada a tu nombre."};
    deletevehicle _veh;
    removeHeadgear player;
    vicio_din = vicio_din + 3500;
    hint "Todo listo, avioneta guardada en el hangar, vuelve siempre que quieras otro paseito, recuerda ... estas avionetas no son detectadas por los radares de Lakeside, podrían servirte para algún transporte de aquellos..";
};

if (_p isEqualTo "devolverh") exitWith {


    if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor."};
    _veh = nearestObject [player, "C_Heli_Light_01_civil_F"];
    if (isnil "_veh") exitwith {hint "No veo cerca ningúna avioneta."};
    if ((player distance _veh)>10) exitwith {hint "Acerca la avioneta"};
    _propietario = _veh getvariable "propietario";
    if (name player != _propietario) exitwith {hint "Esta avioneta no está registrada a tu nombre."};
    deletevehicle _veh;
    removeHeadgear player;
    vicio_din = vicio_din + 10000;
    hint "Todo listo, heli guardado en el hangar, obviamente he cobrado el alquiler y la gasolina de heli ... la situacion esta chunga ... vuelve siempre que quieras otro paseito, recuerda ... estos helis no son detectados por los radares de Lakeside, podrían servirte para algún transporte de aquellos..";
};


if (_p isEqualTo "comprarbuzo") exitWith {

       
	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor."};

    if (vicio_din < 10000) exitwith {hint "La compra del traje de buzo son 10.000€"};
    vicio_din = vicio_din - 10000;
	
	player forceAddUniform "U_B_Wetsuit";
	player addVest "V_RebreatherB";
 
};