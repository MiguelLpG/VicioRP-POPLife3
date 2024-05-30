
/* Transporte y Distribución de Mercancías legales

By AxE.
["init"] spawn ica_fnc_axeTrans

super array trabajos = [[int id, str titulo, str info, int precio, obj tiendaqrecibe, obj playerqhapujado]]

*/

_p = _this select 0;

if (_p isEqualTo "init") exitWith {

	axeTrans1 setVariable ["trabajos",[[0,"No hay trabajos disponibles de momento","Subscribite para que te informemos cuando haya alguno",0,"",""]],true];
	axeTrans1 setVariable ["Pujas",[],true];
	axeTrans1 setVariable ["suscritos",[],true];
	Transnuclear setVariable ["nombre","Bahia Planta Nuclear",true];
	Transesperanza setVariable ["nombre","Bahia Nueva Esperanza",true];
	Transvictoria setVariable ["nombre","Bahia Victoria Peek",true];
	Transagua setVariable ["nombre","Bahia Planta Agua",true];
	
    //Acciones de inicio
	[axeTrans1, [".::: Ver Trabajos Disponibles ::: Transportadora de Lakeside", {["menu"] spawn ica_fnc_axeTrans}]] remoteExec ["addAction", 0,true];	
	[axeTrans2, [".::: Ver Trabajos Disponibles ::: Transportadora de Lakeside", {["menu"] spawn ica_fnc_axeTrans}]] remoteExec ["addAction", 0,true];	
	[axeTrans3, [".::: Ver Trabajos Disponibles ::: Transportadora de Lakeside", {["menu"] spawn ica_fnc_axeTrans}]] remoteExec ["addAction", 0,true];	
	[axeTrans4, [".::: Ver Trabajos Disponibles ::: Transportadora de Lakeside", {["menu"] spawn ica_fnc_axeTrans}]] remoteExec ["addAction", 0,true];
	
	[axeTrans1, [".::: Subscribirse ::: Transportadora de Lakeside", {["sub"] spawn ica_fnc_axeTrans}]] remoteExec ["addAction", 0,true];	
	[axeTrans2, [".::: Subscribirse ::: Transportadora de Lakeside", {["sub"] spawn ica_fnc_axeTrans}]] remoteExec ["addAction", 0,true];	
	[axeTrans3, [".::: Subscribirse ::: Transportadora de Lakeside", {["sub"] spawn ica_fnc_axeTrans}]] remoteExec ["addAction", 0,true];	
	[axeTrans4, [".::: Subscribirse ::: Transportadora de Lakeside", {["sub"] spawn ica_fnc_axeTrans}]] remoteExec ["addAction", 0,true];	
	
	[Transnuclear, ["Entregar mercancía .:: Transportadora de Lakeside ::.", {["entrega"] spawn ica_fnc_axeTrans},nil,6,true,true,"","_target isEqualTo call compile (profileNamespace getVariable [""npcAxeT"",""ObjNull""])"]] remoteExec ["addAction", 0,true];
	[Transesperanza, ["Entregar mercancía .:: Transportadora de Lakeside ::.", {["entrega"] spawn ica_fnc_axeTrans},nil,6,true,true,"","_target isEqualTo call compile (profileNamespace getVariable [""npcAxeT"",""ObjNull""])"]] remoteExec ["addAction", 0,true];
	[Transvictoria, ["Entregar mercancía .:: Transportadora de Lakeside ::.", {["entrega"] spawn ica_fnc_axeTrans},nil,6,true,true,"","_target isEqualTo call compile (profileNamespace getVariable [""npcAxeT"",""ObjNull""])"]] remoteExec ["addAction", 0,true];
	[Transagua, ["Entregar mercancía .:: Transportadora de Lakeside ::.", {["entrega"] spawn ica_fnc_axeTrans},nil,6,true,true,"","_target isEqualTo call compile (profileNamespace getVariable [""npcAxeT"",""ObjNull""])"]] remoteExec ["addAction", 0,true];
	
	//trabajos = [[0 int id, 1 str titulo, 2 str info, 3 int precio, 4 obj tiendaqrecibe, 6 classmerca]]	
	while {true} do {
	
		sleep round (random [200,460,500]);
		_trabajos = axeTrans1 getVariable ["trabajos",[[0,"No hay trabajos disponibles de momento","Subscribite para que te informemos cuando haya alguno",0,"",""]]];
		
		if (count _trabajos > 6) then {} else {
		
			if (round (random 100) > 30) then {} else{
				_trabajos = axeTrans1 getVariable "trabajos";
				_mult = 1;
				if (count allplayers >= 70) then {
				_mult = 1.5;
				};
				
				_mercancia = selectRandom ["mercancia_pesada","pop_mercancia_volatil","pop_mercancia_fragil"];
				
				_pago = selectRandom [280,290,200,330];
				_pago = _pago * _mult;
				
				_npc = selectRandom [Transnuclear, Transesperanza, Transvictoria, Transagua];
				
				_info = format [" Transporte de %1 con un pago inicial sin pujas de %2 € por unidad entregada en la bahia de descarga de %3",[_mercancia] call ica_fnc_classToName, _pago,_npc getVariable ["nombre",str(_npc)]];
				
				_titulo = format ["-> %1",_npc getVariable ["nombre",str(_npc)]];
				
				_id = round (random [100,500,999]);
				
				_superArray = [_id,_titulo,_info,_pago,_npc,_mercancia];
				
				_pujasActuales = axeTrans1 getVariable "Pujas"; 
				_arr = [_id,objNull];
				_pujas = _pujasActuales + [_arr]; 

				axeTrans1 setVariable ["Pujas",_pujas,true];
						
				if ((_trabajos select 0 select 0) isEqualTo 0) then {
				
				axeTrans1 setVariable ["trabajos",[_superArray],true];
				
				} else {
				
				_trabajos = _trabajos + [_superArray];
				
				axeTrans1 setVariable ["trabajos",_trabajos,true];
				
				};
			};
		};
	
	};
	
};



if (_p isEqualTo "menu") exitWith {
	
	disableSerialization;
	createDialog "axeTrans";
	_ui = uiNameSpace getVariable "axeTrans";
	_listaTrabajos = (_ui displayCtrl 6043);
	_listaInfo = (_ui displayCtrl 6045);
	_boton = (_ui displayCtrl 6048);
	_listaTrabajos ctrlSetEventHandler ["LBSelChanged", "['rellena'] call ica_fnc_axeTrans; "];
	_boton ctrlEnable false;
	
	_trabajos = axeTrans1 getVariable ["trabajos",[[0,"No hay trabajos disponibles de momento","Subscribite para que te informemos cuando haya alguno",0,""]]];
	//trabajos = [[0 int id, 1 str titulo, 2 str info, 3 int precio, 4 obj tiendaqrecibe, 5 obj playerqhapujado, 6 classmerca]]
	if (_trabajos isEqualTo []) exitWith {
		[player,"No hay encargos para transportar ahora mismo, vuelve luego por mas", 
		"Transportadora de Lakeside"] call ica_fnc_axeMsg;
	};	
	
	_idx = 0;
	lbClear _listaTrabajos;
	while {_idx < (count _trabajos)} do {
		_trabajo = _trabajos select _idx;
		_listaTrabajos lbAdd format ["%1  (%2€/u)", _trabajo select 1, _trabajo select 3];
		_listaTrabajos lbSetData [_idx, str(_trabajo)];
		_listaTrabajos lbSetValue [_idx, (_trabajo select 0)];
		_listaTrabajos lbSetPicture [_idx, "\pop_icons\ico\tl"];
		
	_idx = _idx + 1;
	};
	_listaTrabajos lbSetCurSel -1;

};

if (_p isEqualTo "menu1") exitWith {
	
	disableSerialization;
	_ui = uiNameSpace getVariable "axeTrans";
	_listaTrabajos = (_ui displayCtrl 2506);
	_listaInfo = (_ui displayCtrl 2507);
	_boton = (_ui displayCtrl 3004);
	_listaTrabajos ctrlSetEventHandler ["LBSelChanged", "['rellena'] call ica_fnc_axeTrans; "];
	_boton ctrlEnable false;
	
	_trabajos = axeTrans1 getVariable ["trabajos",[[0,"No hay trabajos disponibles de momento","Subscribite para que te informemos cuando haya alguno",0,""]]];
	//trabajos = [[0 int id, 1 str titulo, 2 str info, 3 int precio, 4 obj tiendaqrecibe, 5 obj playerqhapujado, 6 classmerca]]
	if (_trabajos isEqualTo []) exitWith {
		[player,"No hay encargos para transportar ahora mismo, vuelve luego por mas", 
		"Transportadora de Lakeside"] call ica_fnc_axeMsg;
	};	
	
	_idx = 0;
	lbClear _listaTrabajos;
	while {_idx < (count _trabajos)} do {
		_trabajo = _trabajos select _idx;
		_listaTrabajos lbAdd format ["%1  (%2€/u)", _trabajo select 1, _trabajo select 3];
		_listaTrabajos lbSetData [_idx, str(_trabajo)];
		_listaTrabajos lbSetValue [_idx, (_trabajo select 0)];
		_listaTrabajos lbSetPicture [_idx, "\pop_icons\ico\tl"];
		
	_idx = _idx + 1;
	};
	_listaTrabajos lbSetCurSel -1;

};

if (_p isEqualTo "rellena") exitWith {
	
	disableSerialization;
	_ui = uiNameSpace getVariable "axeTrans";
	_listaTrabajos = (_ui displayCtrl 6043);
	_listaInfo = (_ui displayCtrl 6045);
	_boton = (_ui displayCtrl 6048);
	
	_idxLista = lbCurSel 6043;
	if ((lbCurSel 6043) == -1) exitWith {};
	_trabajo = _listaTrabajos lbData _idxLista;
	_trabajo = call compile _trabajo;
	//"[552,""-> Bahia Industrial"","" Transporte de mercancia_volatil con un pago de 50 € por unidad entregada en la bahia de descarga de Bahia Industrial"",50,axeTrans3,<NULL-object>,""pop_mercancia_volatil""]"	
	//[[0,"No hay trabajos disponibles de momento","Subscribite para que te informemos cuando haya alguno",0,"",""]]
	_id = _listaTrabajos lbValue _idxLista;
	//trabajos = [[0 int id, 1 str titulo, 2 str info, 3 int precio, 4 obj tiendaqrecibe, 5 obj playerqhapujado]]
	if (isNil "_trabajo") exitWith {};
	//systemchat format ["%1 %2",_trabajo,typename _trabajo];

	_txt1 = format ["<br/><t size='0.8' color='#FFFF00'>%1 --> Pago por Unidad entregada: %2€</t>", _trabajo select 2, _trabajo select 3];
	_listaInfo ctrlSetStructuredText parseText _txt1;
	
	if ((_trabajo select 3) isEqualto 0) then {_boton ctrlEnable false} else {
	
		axeTtrabajo = _trabajo;
		//axeTidx = _idxLista;
	
		_boton ctrlEnable true;
		_boton buttonSetAction '
		["puja"] spawn ica_fnc_axeTrans;
		';
	};
	
};


if (_p isEqualTo "puja") exitWith {
    if (!isNil {pujeAxeT}) exitWith {hint "Debes esperar entre pujas... almenos 20 segundos" };
    [] spawn {
        pujeAxeT = true;
        sleep 5;	
        pujeAxeT = nil;
    };

	if !(license_civ_transportista) exitWith {
		[player,"No tienes los conocimientos ni certificaciones necesarias para pujar en este trabajo.", 
		"Transportadora de Lakeside"] call ica_fnc_axeMsg;
	};	
	
_id = axeTtrabajo select 0;

_trabajos = axeTrans1 getVariable ["trabajos",[[0,"No hay trabajos disponibles de momento","Subscribite para que te informemos cuando haya alguno",0,""]]];
if (_trabajos isEqualTo []) exitWith {
	[player,"No hay encargos para transportar ahora mismo, vuelve luego por mas", 
	"Transportadora de Lakeside"] call ica_fnc_axeMsg;
};
_yaPuje = false;

_pujas = axeTrans1 getVariable ["Pujas",[]];

{
	if ((_x select 0) isEqualTo _id) then {
		if (_x select 1 isEqualTo player) then {_yaPuje = true};
	};
} forEach _pujas;

if (_yaPuje) exitWith {
	[player,"Ya has pujado por este trabajo", 
	"Transportadora de Lakeside"] call ica_fnc_axeMsg;
};

{

	if ((_x select 0) isEqualTo _id) then {
		_x set [3,(_x select 3) - 25];
	};

} forEach _trabajos;

{
	if ((_x select 0) isEqualTo _id) then {
		_x set [1,player];
	};
} forEach _pujas;

axeTrans1 setVariable ["Pujas",_pujas,true];

axeTrans1 setVariable ["trabajos",_trabajos,true];


_suscritos = axeTrans1 getVariable ["suscritos",[objNull]];
if !(_suscritos isEqualTo []) then {

	if !(isNull (_suscritos select 0)) then {
	
		{
			[_x,"Se ha realizado una puja por un trabajo disponible en la central de Transporte, en 3 minutos sera adjudicada si no hay mas pujas", 
			"Transportadora de Lakeside"] call ica_fnc_axeMsg;
		} forEach _suscritos;
	
	};

};

[player,"Has realizado una puja por un trabajo disponible en la central de Transporte, en 3 minutos sera adjudicada si no hay mas pujas", 
"Transportadora de Lakeside"] call ica_fnc_axeMsg;

sleep (60 * 3); 

_trabajos = axeTrans1 getVariable ["trabajos",[]];
if (_trabajos isEqualTo []) exitWith {
	[player,"No hay encargos para transportar ahora mismo, vuelve luego por mas", 
	"Transportadora de Lakeside"] call ica_fnc_axeMsg;
};

_go = false;
_go2 = false; 

_pujas = axeTrans1 getVariable ["Pujas",[]];

{
	if ((_x select 0) isEqualTo _id) then {
		if (_x select 1 isEqualTo player) then {_go = true};
	};
} forEach _pujas;

{

	if ((_x select 0) isEqualTo _id) then {
		if (_go) then {_go2 = true; axeTtrabajo = _x;};
	};

} forEach _trabajos;

if (_go2) then {

	_trabajos = _trabajos - [axeTtrabajo];
	_pujas = _pujas - [[_id,player]];
	if (count _trabajos < 1) then {
		axeTrans1 setVariable ["trabajos",[[0,"No hay trabajos disponibles de momento","Subscribite para que te informemos cuando haya alguno",0,""]],true];
	}else{
		axeTrans1 setVariable ["trabajos",_trabajos,true];
		axeTrans1 setVariable ["Pujas",_pujas,true];
	};

	[player,format ["Has ganado el encargo # %1 en la transportadora",_id], 
	"Transportadora de Lakeside"] call ica_fnc_axeMsg;
	accionAxeT = player addAction [".:: Iniciar Carga de Mercancia ::.",{ ["carga"] spawn ica_fnc_axeTrans }];
	
};

};


if (_p isEqualTo "carga") exitWith {

	/*if (profileNamespace getVariable ["axeT",false]) exitWith {
		[player,"Ya tienes asignado un encargo, terminalo primero", 
		"Transportadora de Metropolis"] call ica_fnc_axeMsg;
	};*/
	
	if !(license_civ_transportista) exitWith {
		[player,"No tienes los conocimientos ni certificaciones necesarias para este trabajo.", 
		"Transportadora de Lakeside"] call ica_fnc_axeMsg;
	};
	
	if(isNull objectParent player) exitWith {
	[player,"Debes montarte en tu poderoso camion para empezar.", 
	"Transportadora de Lakeside"] call ica_fnc_axeMsg;	
	};
	
	if !( (["pop_scania",typeof vehicle player] call ica_fnc_inString) OR (["dikeman_haulier",typeof vehicle player] call ica_fnc_inString) OR (["midlum",typeof vehicle player] call ica_fnc_inString) OR (["pop_iveco",typeof vehicle player] call ica_fnc_inString) ) exitWith {
		[player,"Tu vehiculo no esta autorizado por el ministerio de transporte para este tipo de carga ... debes traer camiones modelo mas recientes.", 
		"Transportadora de Lakeside"] call ica_fnc_axeMsg;
	};	
	
	_npcInicia = [axeTrans1, axeTrans2, axeTrans3, axeTrans4] call ica_fnc_masCercano;
	if (player distance _npcInicia > 20) exitWith {
	[player,"Debes acercarte mas a la bahia de carga para iniciar.", 
	"Transportadora de Lakeside"] call ica_fnc_axeMsg;
	};

	_trabajo = axeTtrabajo;
	_npc = _trabajo select 4;
	_dinero = _trabajo select 3;
	_mercancia = axeTtrabajo select 5;
	
	_maxCarga = getNumber (configFile >> "CfgVehicles" >> (typeof vehicle player) >> "maximumLoad");
	_cargaU = getNumber (configFile >> "CfgMagazines" >> _mercancia >> "mass");
	
	_agrego = _maxCarga / _cargaU;
	
	/*if !(vehicle player canAdd [_mercancia, _agrego]) exitWith {
	
	[player,"Tienes cosas ocupando espacio en tu camion, necesitas el maximo de carga para este encargo.", 
	"Transportadora de Metropolis"] call ica_fnc_axeMsg;
	};*/
	
	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};
	
	player removeAction accionAxeT;
	
	profileNamespace setVariable ["npcAxeT",str(_npc)];
	profileNamespace setVariable ["axeT",true];
	
	_tiempo = 60 * 20;
	profileNamespace setVariable ["axeTtiempo",_tiempo];
	
	_nombreNpc = _npc getVariable ["nombre",[str (_npc)]];
	
	_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Transporte de mercancías - Transportadora de Lakeside </t><br/><t size=""1"">Eres el ganador de la subasta publica para el transporte de esta mercancia, tienes que entregarla en menos de 20 minutos o tendras fuertes multas.</t>";

	("Transportadora de Lakeside") hintC [
		_paraf,
		format ["Debes tomar la mercancía y llevarla a salvo a la bahia de descarga de %1.",_nombreNpc],
		"Dependiendo del tipo de mercancia y carga que lleves tendras que tener cuidado con choques o accidentes ... incluso podrias explotar por los aries.",
		"No puedes usar aeronaves, o cualquier otro vehiculo no autorizado por el ministerio de transporte.",
		(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""https://www.empirerpg.es/"">pagina web</a></t>.")
	];
	hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
		0 = _this spawn {
			_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
			hintSilent "";
		};
	}];
	waituntil {isNull (findDisplay 72)};
	
	_n = 8 + floor(random 2);
	[12, "Cargando Mercancia..."] call ica_fnc_barrita;
	sleep _n;
	
	vehicle player addItemCargoGlobal [_mercancia, _agrego];
	
	_pos = position _npc;
	markerAxeT = format["marker_%1",str(_npc)];
	_marker = createMarkerLocal [markerAxeT, _pos];
	_marker setMarkerColorlocal "ColorBlue";
	_marker setMarkerTextlocal "Bahia de Entrega TransMetro";
	_marker setMarkerTypelocal "c_car";	
	
	["loop"] spawn ica_fnc_axeTrans;

};



if (_p isEqualTo "loop") exitWith {

_npc = profileNamespace getVariable ["npcAxeT",str(objNull)];
_npc = call compile _npc;

	while {profileNamespace getVariable "axeTtiempo" > 0} do {
		
		if (isNull _npc) exitWith {};
		_dist = player distance _npc;
		
		if (profileNamespace getVariable ["axeTok",false]) exitWith {
		profileNamespace setVariable ["axeTtiempo",0];
		profileNamespace setVariable ["npcAxeT",str(objNull)];
		profileNamespace setVariable ["axeT",false];
		profileNamespace setVariable ["axeTok",false];
		};
		
		hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Transportadora Metro: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Entrega de Mercancias<br/>Tiempo restante: %2<br/>Distancia: %3 metros</t><br/>Destino: %4</t>",["midlum_base_F"] call ica_fnc_classToPic,[((profileNamespace getVariable "axeTtiempo")/60)+.01,"HH:MM"] call BIS_fnc_timetostring,ceil (_dist),_npc getVariable "nombre"];
		
		if( objectParent player isKindOf "Air") exitWith {
			[player,"Te lo dije, solo puedes usar los vehiculos aprobados ... quedate con la mercancía ya no me interesa. ", 
			"Transportadora Metro","midlum_base_F"] call ica_fnc_axeMsg;
			profileNamespace setVariable ["axeTtiempo",0];
		};
		
		if !(alive player) exitWith {
			profileNamespace setVariable ["axeTtiempo",0];
			profileNamespace setVariable ["npcAxeT",str(objNull)];
			profileNamespace setVariable ["axeT",false];			
		};
		
		if (profileNamespace getVariable ["axeTtiempo",0] <= 0 ) exitWith {
			deleteMarkerLocal markerAxeT;
			[player,"Te has tardado demasiado, han comprado la mercancia a la compentecia ... quedate con la mercancía ya no me interesa. ", 
			"Transportadora Metro","midlum_base_F"] call ica_fnc_axeMsg; 
			profileNamespace setVariable ["npcAxeT",str(objNull)];
			profileNamespace setVariable ["axeT",false];			
		};
		
		profileNamespace setVariable ["axeTtiempo",(profileNamespace getVariable "axeTtiempo") - 1];
		sleep 1;
	
	};


};


if (_p isEqualTo "entrega") exitWith {

	if (isNull objectParent player) exitWith {
	[player,"Debes montarte en tu poderoso camion para descargar la merca.", 
	"Transportadora de Lakeside"] call ica_fnc_axeMsg;	
	};
	
	if !( (["pop_scania",typeof vehicle player] call ica_fnc_inString) OR (["dikeman_haulier",typeof vehicle player] call ica_fnc_inString) OR (["midlum",typeof vehicle player] call ica_fnc_inString) OR (["pop_iveco",typeof vehicle player] call ica_fnc_inString) ) exitWith {
		[player,"Tu vehiculo no esta autorizado por el ministerio de transporte para este tipo de carga ... debes usar camiones modelo mas recientes.", 
		"Transportadora de Lakeside"] call ica_fnc_axeMsg;
	};	
	
	profileNamespace setVariable ["axeTok",true];
	
	_trabajo = axeTtrabajo;
	_npc = _trabajo select 4;
	_dinero = _trabajo select 3;
	_mercancia = _trabajo select 5;	
	_tengo = [_mercancia, true] call ica_fnc_tengo;
	if (isNil "_dinero" OR _dinero isEqualTo 0) then {
	_dinero = 180;
	};
	_n = 8 + floor(random 2);
	[_n, "Descargando Mercancia..."] call ica_fnc_barrita;
	sleep _n;
	
	clearMagazineCargoGlobal vehicle player;
	clearItemCargoGlobal vehicle player;
	
	_exp = round (random [8,10,20]);
	_pago = _dinero * _tengo;
	
	vicio_din = vicio_din + _pago;
	["exp",_exp] call ica_fnc_arrayexp;
	
	[format ["EXP + %1", _exp]] call ica_fnc_infolog;
	[format ["+ %1€", _pago]] call ica_fnc_infolog;
	
	[player,format ["Gran trabajo %1, cada vez vas forjandote mas un nombre en el gremio de transportistas.",name player], 
	"Transportadora de Lakeside"] call ica_fnc_axeMsg;		
	
};


if (_p isEqualTo "sub") exitWith {

_arr = axeTrans1 getVariable ["suscritos",[]];
_salgo = false;
{
	if (_x isEqualTo player) then {_salgo = true};
} forEach _arr;

if (_salgo) exitWith {
_arr = _arr - [player];
axeTrans1 setVariable ["suscritos",_arr,true];

[player,format ["Hola %1, ya te hemos retirado de nuestra base de datos, no te notificaremos mas sobre las subastas.",name player], 
"Transportadora de Lakeside"] call ica_fnc_axeMsg;

};

_arr pushBack player;

axeTrans1 setVariable ["suscritos",_arr,true];

[player,format ["Hola %1, ya te hemos agregado a nuestra base de datos para enviarte SMS cada vez que se realicen pujas o hayan nuevos trabajos.",name player], 
"Transportadora de Lakeside"] call ica_fnc_axeMsg;

};