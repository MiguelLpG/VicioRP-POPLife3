/*
Taller de mecánica por AxE para Pop4
Dialogo by Adamuz Systems

pop_oxigeno,pop_pintura,
*/

_param = _this select 0;
_mod = _this select 1;

if (_param isEqualTo "init") exitWith {


NPC_TALLER setVariable ["moding",false,true];
NPC_TALLER_2 setVariable ["moding",false,true];

[NPC_TALLER, ["Mecanico: Modificar Vehiculo", {["menu","abrir"] spawn ica_fnc_meca},nil,6,true,true,"","license_civ_mecanico"]] remoteExec ["addAction", 0,true];
[NPC_TALLER_2, ["Mecanico: Modificar Vehiculo", {["menu","abrir"] spawn ica_fnc_meca},nil,6,true,true,"","license_civ_mecanico"]] remoteExec ["addAction", 0,true];
};


if (_param isEqualTo "menu") exitWith {

disableserialization;
_cajero = uiNamespace getVariable "taller";

	if (_mod == "abrir") exitwith {closedialog 0; mod_meca = "nada"; createdialog "tallermetropolis";};
	if (_mod == "red") exitwith {mod_meca = "red";(_cajero displayCtrl 2407) ctrlSetText "REDUCCION DE DAÑO";};
	if (_mod == "rue") exitwith {mod_meca = "rue";(_cajero displayCtrl 2407) ctrlSetText "RUEDAS BLINDADAS";};
	if (_mod == "bli") exitwith {mod_meca = "bli";(_cajero displayCtrl 2407) ctrlSetText "BLINDAJE ADICIONAL";};
	if (_mod == "con") exitwith {mod_meca = "con";(_cajero displayCtrl 2407) ctrlSetText "CONSUMO REDUCIDO";};
	if (_mod == "nit") exitwith {mod_meca = "nit";(_cajero displayCtrl 2407) ctrlSetText "NITRO MEJORADO";};
	if (_mod == "loc") exitwith {mod_meca = "loc";(_cajero displayCtrl 2407) ctrlSetText "LOCALIZADOR PERSONAL";};
	if (_mod == "pin") exitwith {mod_meca = "pin";(_cajero displayCtrl 2407) ctrlSetText "PINTAR VEHICULO";};
	if (_mod == "cam") exitwith {mod_meca = "cam";(_cajero displayCtrl 2407) ctrlSetText "CAMBIAR MATRICULA";};

	if (_mod == "aplicar") exitwith {["mod",mod_meca] call ica_fnc_meca};

};


if (_param isEqualTo "mod") exitWith {

//_lvl = "tl" call ica_fnc_expToLevel;
if !(license_civ_mecanico) exitWith {hint "El ser Mecanico es una profesión, deja de ser vago y pasa por la universidad primero."};

pop_mecanico = true;

_taller = nearestObject [player, "POP_npc_mecanico"];
_pos = [0,0,0];

if (isNull _taller) exitWith {
hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>No estas cerca a ningún taller <br/>Solo puedes trabajar en los talleres de Lakeside y morrison</t>"];
};

switch (_taller) do {

	case NPC_TALLER : {

	_pos = [8156.55,6896.64,0.00143909];

	};

	case NPC_TALLER_2 : {

	_pos = [8481.44,6376.9,0.00143814];

	};

};

_coche = nearestObject [_pos, "LandVehicle"];

if (isNull _coche) exitWith {
hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>No hay ningún vehiculo en la rampa del taller <br/>Debes aparcaar el coche en las rampas del taller</t>"];
};

_clase_coche = typeof _coche;
_pic = [_clase_coche] call ica_fnc_classToPic;
_nom = [_clase_coche] call ica_fnc_classToName;


switch (_mod) do {


	case "nada" : {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>No has seleccionado modificación para el %2 <br/>Selecciona alguna del menú</t>",_pic,_nom];
	pop_mecanico = false;
	};

	case "red" : {

	closedialog 0;
	_accion = [
		format["Vas a aplicar una modificación al vehiculo %1<br/>Necesitas 2 Gran Lingotes y un Soplete",_nom],
		"Taller de Lakeside",
		"Aplicar",
		"Cancelar"
	] call BIS_fnc_guiMessage;
	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado","PLAIN"];};

    _cnt = ["soplete"] call ica_fnc_tengo;
	_cnt1 = ["pop_granlingote"] call ica_fnc_tengo;
	if(_cnt < 1 OR _cnt1 < 2 )exitWith{
	hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Te faltan materiales <br/>Algunas son herramientas otros materiales crafteables</t>"];
	};

[8, "Aplicando las modificaciones..."] spawn ica_fnc_barrita;
[player, "soplete"] remoteExec ["life_fnc_say3D",0];
sleep 7;
if (_coche distance _pos > 2) exitWith {
hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has movido el %2 <br/>No debes mover el coche mientras lo modificas</t>",_pic,_nom];
};

	["pop_granlingote", -2] call ica_fnc_item;

_coche removeAllEventHandlers "handleDamage";
_coche addEventHandler
[
 "HandleDamage",
 {
_damageold = _this select 2;
_damagex = _damageold * 0.2;
_unit = _this select 0;
_damage = getDammage _unit;
_fuente = _this select 3;
_final = _damage + _damagex;
	if (_fuente isKindOf "Man") then {
	_damageold
	} else {
	_damagex
	};
}
];

hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has reforzado el chasis del %2 con titanio<br/>Todas las modificaciones anteriores fueron quitadas.</t>",_pic,_nom];
	pop_mecanico = false;
	["exp",2] call ica_fnc_arrayexp;
	};



case "rue" : {

	closedialog 0;
	_accion = [
		format["Vas a aplicar una modificación al vehiculo %1<br/>Necesitas 1 Gran Lingotes y un Soplete",_nom],
		"Taller de lakeside",
		"Aplicar",
		"Cancelar"
	] call BIS_fnc_guiMessage;
	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado","PLAIN"];};

    _cnt = ["soplete"] call ica_fnc_tengo;
	_cnt1 = ["pop_granlingote"] call ica_fnc_tengo;
	if(_cnt < 1 OR _cnt1 < 1 )exitWith{
	hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Te faltan materiales <br/>Algunas son herramientas otros materiales crafteables</t>"];
	};

[8, "Aplicando las modificaciones..."] spawn ica_fnc_barrita;
sleep 7;
[player, "soplete"] remoteExec ["life_fnc_say3D",-2];
if (_coche distance _pos > 2) exitWith {
hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has movido el %2 <br/>No debes mover el coche mientras lo modificas</t>",_pic,_nom];
};

["pop_granlingote", -1] call ica_fnc_item;

_coche removeAllEventHandlers "handleDamage";
_coche addEventHandler
[
 "HandleDamage",
 {
_damageold = _this select 2;
_damagex = _damageold * 0.3;
_unit = _this select 0;
_damage = getDammage _unit;
_fuente = _this select 3;
_final = _damage + _damagex;
	if (["wheel_",_this select 1] call ica_fnc_inString) then {
	_damagex
	} else {
	_damageold
	};
}
];

hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has Blindado las ruedas del %2<br/>Todas las modificaciones anteriores fueron quitadas.</t>",_pic,_nom];
	pop_mecanico = false;
	["exp",2] call ica_fnc_arrayexp;
};


case "bli" : {

	closedialog 0;
	_accion = [
		format["Vas a aplicar una modificación al vehiculo %1<br/>Necesitas 1 Gran Lingote y un Soplete",_nom],
		"Taller de lakeside",
		"Aplicar",
		"Cancelar"
	] call BIS_fnc_guiMessage;
	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado","PLAIN"];};

    _cnt = ["soplete"] call ica_fnc_tengo;
	_cnt1 = ["pop_granlingote"] call ica_fnc_tengo;
	if(_cnt < 1 OR _cnt1 < 1 )exitWith{
	hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Te faltan materiales <br/>Algunas son herramientas otros materiales crafteables</t>"];
	};

[8, "Aplicando las modificaciones..."] spawn ica_fnc_barrita;
sleep 7;
[player, "soplete"] remoteExec ["life_fnc_say3D",0];
if (_coche distance _pos > 2) exitWith {
hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has movido el %2 <br/>No debes mover el coche mientras lo modificas</t>",_pic,_nom];
};

["pop_granlingote", -1] call ica_fnc_item;

_coche removeAllEventHandlers "handleDamage";
_coche addEventHandler
[
 "HandleDamage",
 {
_damageold = _this select 2;
_damagex = _damageold * 0.5;
_unit = _this select 0;
_damage = getDammage _unit;
_fuente = _this select 3;
_final = _damage + _damagex;
	if (_fuente isKindOf "Man") then {
	_damagex
	} else {
	_damageold
	};
}
];
hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has reforzado el Blindaje del %2<br/>Todas las modificaciones anteriores fueron quitadas.</t>",_pic,_nom];
	pop_mecanico = false;
	["exp",2] call ica_fnc_arrayexp;

};


case "con" : {


	closedialog 0;
	_accion = [
		format["Vas a aplicar una modificación al vehiculo %1<br/>Necesitas un Oxigeno y un Soplete",_nom],
		"Taller de Lakeside",
		"Aplicar",
		"Cancelar"
	] call BIS_fnc_guiMessage;
	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado","PLAIN"];};

    _cnt = ["soplete"] call ica_fnc_tengo;
	_cnt1 = ["pop_oxigeno"] call ica_fnc_tengo;
	if(_cnt < 1 OR _cnt1 < 1 )exitWith{
	hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Te faltan materiales <br/>Algunas son herramientas otros materiales crafteables</t>"];
	};

	[8, "Aplicando las modificaciones..."] spawn ica_fnc_barrita;
	sleep 7;
	["play3d", "reparar", player,1,160] call ica_fnc_SFX;
	if (_coche distance _pos > 2) exitWith {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has movido o no estaba en rampa el <br/>No debes mover el coche mientras lo modificas</t>",_pic,_nom];
	};
	["pop_oxigeno", -1] call ica_fnc_item;
	_coche setVariable ["consumo_red",true,true];

	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has aplicado el sistema de consumo reducido al %2</t>",_pic,_nom];

	pop_mecanico = false;
	["exp",2] call ica_fnc_arrayexp;
};


case "nit" : {


	closedialog 0;
	_accion = [
		format["Vas a aplicar una modificación al vehiculo %1<br/>Necesitas 1 Oxigeno y un Soplete",_nom],
		"Taller de Lakeside",
		"Aplicar",
		"Cancelar"
	] call BIS_fnc_guiMessage;
	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado","PLAIN"];};

    _cnt = ["soplete"] call ica_fnc_tengo;
	_cnt1 = ["pop_oxigeno"] call ica_fnc_tengo;
	if(_cnt < 1 OR _cnt1 < 1 )exitWith{
	hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Te faltan materiales <br/>Algunas son herramientas otros materiales crafteables</t>"];
	};

	[8, "Aplicando las modificaciones..."] spawn ica_fnc_barrita;
	sleep 7;
	["play3d", "reparar", player,1,160] call ica_fnc_SFX;
	if (_coche distance _pos > 2) exitWith {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has movido o no estaba en rampa el <br/>No debes mover el coche mientras lo modificas</t>",_pic,_nom];
	};
	["pop_oxigeno", -1] call ica_fnc_item;
	_coche setVariable ["nit_red",true,true];

	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has aplicado un sistema mejorado de Nitro al %2</t>",_pic,_nom];
	pop_mecanico = false;
	["exp",2] call ica_fnc_arrayexp;
};


case "loc" : {


	closedialog 0;
	_accion = [
		format["Vas a aplicar una modificación al vehiculo %1<br/>Necesitas 1 Componente y 1 GPS",_nom],
		"Taller de Lakeside",
		"Aplicar",
		"Cancelar"
	] call BIS_fnc_guiMessage;
	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado","PLAIN"];};

    _cnt = ["pop_componentes"] call ica_fnc_tengo;
	_cnt1 = ["ItemGPS"] call ica_fnc_tengo;
	if(_cnt < 1 OR _cnt1 < 1 )exitWith{
	hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Te faltan materiales <br/>Algunas son herramientas otros materiales crafteables</t>"];
	};

	[8, "Aplicando las modificaciones..."] spawn ica_fnc_barrita;
	sleep 7;
	["play3d", "reparar", player,1,160] call ica_fnc_SFX;
	if (_coche distance _pos > 2) exitWith {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has movido o no estaba en rampa el <br/>No debes mover el coche mientras lo modificas</t>",_pic,_nom];
	};

	["pop_componentes", -1] call ica_fnc_item;
	["ItemGPS", -1] call ica_fnc_item;
	_id_owner = (_coche getVariable ["vehicle_info_owners",[]]) select 0 select 0;

	_objeto_owner = objNull;

	{if(getPlayerUID _x == _id_owner) then {_objeto_owner = _x};} foreach allPlayers;

	[[_coche],{coche_gps = _this select 0}] remoteExec ["BIS_fnc_spawn",_objeto_owner];

	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has aplicado un sistema de seguimiento GPS al %2<br/>Es visible en el mapa del propietario si tiene GPS.</t>",_pic,_nom];
	pop_mecanico = false;
	["exp",2] call ica_fnc_arrayexp;
};


case "pin" : {


	closedialog 0;
	_accion = [
		format["Vas a aplicar una modificación al vehiculo %1<br/>Necesitas 2 botes de pintura",_nom],
		"Taller de Lakeside",
		"Aplicar",
		"Cancelar"
	] call BIS_fnc_guiMessage;
	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado","PLAIN"];};

    _cnt = ["pop_pintura"] call ica_fnc_tengo;
	if(_cnt < 2)exitWith{
	hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Te faltan materiales <br/>Algunas son herramientas otros materiales crafteables</t>"];
	};

	[8, "Aplicando las modificaciones..."] spawn ica_fnc_barrita;
	sleep 7;
	["play3d", "reparar", player,1,160] call ica_fnc_SFX;
	if (_coche distance _pos > 2) exitWith {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has movido o no estaba en rampa el <br/>No debes mover el coche mientras lo modificas</t>",_pic,_nom];
	};
	["pop_pintura", -2] call ica_fnc_item;
	[] spawn {
	sleep 20;
	pop_mecanico = false;
	["exp",2] call ica_fnc_arrayexp;
	};
	[] spawn ica_fnc_dialogoPintar;
};

case "cam" : {
	closedialog 0;
	_accion = [
		format["Vas a aplicar una modificación al vehiculo %1<br/>Necesitas 1 Componente",_nom],
		"Taller de Lakeside",
		"Aplicar",
		"Cancelar"
	] call BIS_fnc_guiMessage;
	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado","PLAIN"];};

    _cnt = ["pop_componentes"] call ica_fnc_tengo;
	if(_cnt < 1)exitWith{
	hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Te faltan materiales <br/>Algunas son herramientas otros materiales crafteables</t>"];
	};

	[8, "Aplicando las modificaciones..."] spawn ica_fnc_barrita;
	sleep 7;
	["play3d", "reparar", player,1,160] call ica_fnc_SFX;
	if (_coche distance _pos > 2) exitWith {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has movido o no estaba en rampa el <br/>No debes mover el coche mientras lo modificas</t>",_pic,_nom];
	};
	["pop_componentes", -1] call ica_fnc_item;

	_nombre = ["Vladimir","Berto","Frank","Alvaro","Oscar","Antonio", "Frank", "Manolo", "Paco","Nico","Jesus","Ruben","Frank","Santiago","Joseph","Hassin","Joseph","Akdabr"] call BIS_fnc_selectRandom;
	_apellido = ["Costello", "Gonzalez", "Romero", "Puertas","Nhialo","Makarov","Heredia","Esparta","Perez","Costello","Hamed","Petrov","Capone","Costello","Delgado","Costello","Sanchez"] call BIS_fnc_selectRandom;
	_infoOwner = _nombre +" "+ _apellido;

	_placa = _coche getVariable ["vehicle_info_owners",[]];
	(_placa select 0) set [1,_infoOwner];
	_coche setVariable ["vehicle_info_owners",_placa,true];

	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has cambiado la matricula del %2 a:<br/>%3.</t>",_pic,_nom,_infoOwner];
	pop_mecanico = false;
	["exp",2] call ica_fnc_arrayexp;
};


};

//[[_damage,_damageold, _final,_this select 3],{hint format ["fuente : %4 daño con mod: %1 -- daño sin mod : %2 -- final : %3",_this select 0, _this select 1, _this select 2,typeof (_this select 3)]}] remoteExec ["BIS_fnc_spawn",0];


};
