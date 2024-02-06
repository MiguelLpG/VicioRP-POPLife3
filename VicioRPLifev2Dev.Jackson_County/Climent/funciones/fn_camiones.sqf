#include "script_macros.hpp"
_param = param [0];



if (_param isEqualTo "menuu") exitWith {

	/*if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>Farmeo suspendido</t>";
};*/

createDialog "camionesedu";

};

//////////////////////////////////////////////////////// LAKESIDE - MORRISON  //////////////////////////////////////////

if (_param isEqualTo "comienzomorri") exitWith {

morri = true;
if (trabajandocamion == true) exitwith {hint "Ya estas trabajando";};
if (license_civ_truck == false) exitwith {hint "No tienes la licencia requerida (Carnet de Camion)"};
if (side player != civilian) exitwith {hint "¿Que haces trabajando de esto?"};
Costemisionca = 30000;
if (vicio_din - Costemisionca < 0) exitwith {hint "No tienes suficiente dinero";};
if ((player distance Lakemorri)>2) exitwith {hint "Acercate a mi, me tienes que pagar."};


trabajandocamion = true;
_spawn = selectRandom [spawnvehcamioon1,spawnvehcamioon2,spawnvehcamioon3];



Camion = "pop_Man_TGXsin_negro" createVehicle(position _spawn);
Camion setdir 197.83;

_color = selectRandom ["Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F","Land_Cargo20_red_F","Land_Cargo20_white_F"];

carga = _color createVehicle (getMarkerPos "");

_carga = nearestObjects [(position player), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F"
	], 15];
	
carga attachTo [Camion, [0 ,-2.6, 2.5]];
carga setdir 270;

vicio_din = vicio_din - Costemisionca;
hint "Has comenzado tu ruta, entrega este cargamento en Morrison.";
sleep 3;
hint "Te hemos marcado la zona en el mapa, ve hasta allí";

_Pos = entregalakemorri;
				                _marker = createMarkerLocal ["entregam", _Pos];
				                "entregam" setMarkerColorLocal "ColorRed";
				                "entregam" setMarkerTextLocal "¡¡Entrega Aqui!!";
				                "entregam" setMarkerTypeLocal "hd_flag";

};



if (_param isEqualTo "entregamorri") exitWith {

if (devolvercamion) exitwith {hint "Ya lo has entregado"};

if !(morri) exitwith {hint "Aqui no te han mandado"};
if !(trabajandocamion) exitwith {hint "Trabaja primero retrasado";};
if ((Camion distance entregalakemorri)>15) exitwith {hint "Acerca el camion que lo descarguemos"};


hint "Gracias por la entrega, vuelve a Lakeside a devolver el camión.";
deleteMarkerLocal "entregam";

devolvercamion = true;

deleteVehicle carga;


};

//////////////////////////////////////////////////////// FIN LAKESIDE - MORRISON //////////////////////////////////////////





//////////////////////////////////////////////////////// LAKESIDE - DIABLOS //////////////////////////////////////////
if (_param isEqualTo "comienzodiablo") exitWith {
	
if ((player distance Lakemorri)>2) exitwith {hint "Acercate a mi, me tienes que pagar."};
if (trabajandocamion == true) exitwith {hint "Ya estas trabajando";};
if (license_civ_truck == false) exitwith {hint "No tienes la licencia requerida (Carnet de Camion)"};
if (side player != civilian) exitwith {hint "¿Que haces trabajando de esto?"};
Costemisionca = 30000;
if (vicio_din - Costemisionca < 0) exitwith {hint "No tienes suficiente dinero";};


lakediablo = true;
trabajandocamion = true;
//_spawn = selectRandom [spawnvehcamioon1,spawnvehcamioon2,spawnvehcamioon3];



Camion = "pop_Man_TGXsin_negro" createVehicle(position player);
Camion setdir 197.83;

_color = selectRandom ["Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F","Land_Cargo20_red_F","Land_Cargo20_white_F"];

carga = _color createVehicle (getMarkerPos "");

_carga = nearestObjects [(position player), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F"
	], 15];
	
carga attachTo [Camion, [0 ,-2.6, 2.5]];
carga setdir 270;

vicio_din = vicio_din - Costemisionca;
hint "Has comenzado tu ruta, entrega este cargamento en Morrison.";
sleep 3;
hint "Te hemos marcado la zona en el mapa, ve hasta allí";

_Pos = entregadiabloo;
				                _marker = createMarkerLocal ["entregad", _Pos];
				                "entregad" setMarkerColorLocal "ColorRed";
				                "entregad" setMarkerTextLocal "¡¡Entrega Aqui!!";
				                "entregad" setMarkerTypeLocal "hd_flag";

};



if (_param isEqualTo "entregadiablo") exitWith {

if (devolvercamion) exitwith {hint "Ya lo has entregado"};
if !(lakediablo) exitwith {hint "Aqui no te han mandado"};
if !(trabajandocamion) exitwith {hint "Trabaja primero retrasado";};
if ((Camion distance entregadiabloo)>2) exitwith {hint "Acerca el camion que lo descarguemos"};


hint "Gracias por la entrega, vuelve a Lakeside a devolver el camión.";
deleteMarkerLocal "entregad";

devolvercamion = true;
lakediablo = true;

deleteVehicle carga;


};


////////////////////////////////////////////////////////  FIN LAKESIDE - DIABLOS //////////////////////////////////////////






//////////////////////////////////////////////////////// LAKESIDE - CERROS //////////////////////////////////////////


if (_param isEqualTo "comienzocerro") exitWith {

lakecerro = true;
if (trabajandocamion == true) exitwith {hint "Ya estas trabajando";};
if (license_civ_truck == false) exitwith {hint "No tienes la licencia requerida (Carnet de Camion)"};
if (side player != civilian) exitwith {hint "¿Que haces trabajando de esto?"};
Costemisionca = 30000;
if (vicio_din - Costemisionca < 0) exitwith {hint "No tienes suficiente dinero";};
if ((player distance Lakemorri)>2) exitwith {hint "Acercate a mi, me tienes que pagar."};


trabajandocamion = true;
//_spawn = selectRandom [spawnvehcamioon1,spawnvehcamioon2,spawnvehcamioon3];



Camion = "pop_Man_TGXsin_negro" createVehicle(position player);
Camion setdir 197.83;

_color = selectRandom ["Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F","Land_Cargo20_red_F","Land_Cargo20_white_F"];

carga = _color createVehicle (getMarkerPos "");

_carga = nearestObjects [(position player), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F"
	], 15];
	
carga attachTo [Camion, [0 ,-2.6, 2.5]];
carga setdir 270;

vicio_din = vicio_din - Costemisionca;
hint "Has comenzado tu ruta, entrega este cargamento en Morrison.";
sleep 3;
hint "Te hemos marcado la zona en el mapa, ve hasta allí";

_Pos = entregacerro;
				                _marker = createMarkerLocal ["entregac", _Pos];
				                "entregac" setMarkerColorLocal "ColorRed";
				                "entregac" setMarkerTextLocal "¡¡Entrega Aqui!!";
				                "entregac" setMarkerTypeLocal "hd_flag";

};



if (_param isEqualTo "entregacerro") exitWith {

if (devolvercamion) exitwith {hint "Ya lo has entregado"};

if !(lakecerro) exitwith {hint "Aqui no te han mandado"};
if !(trabajandocamion) exitwith {hint "Trabaja primero retrasado";};
if ((Camion distance entregacerro)>2) exitwith {hint "Acerca el camion que lo descarguemos"};


hint "Gracias por la entrega, vuelve a Lakeside a devolver el camión.";
deleteMarkerLocal "entregac";

devolvercamion = true;

deleteVehicle carga;


};













if (_param isEqualTo "cobrar") exitWith {
	
		if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>Farmeo suspendido</t>";
};



///////////////////////////////////////////////// PARA LOS DEMÁS /////////////////////////////
if ((Camion distance Lakemorri)>5) exitwith {hint "Acerca el camion que lo guardemos"};
if !(trabajandocamion) exitwith {hint "Trabaja primero retrasado";};
if !(devolvercamion) exitwith {hint "Ves primero a entregar la carga amigo."};

hint "Enhorabuena por el trabajo realizado, aqui tienes tus honorarios.";
deleteVehicle Camion;

vicio_din = vicio_din + Costemisionca + 60000;
["exp",15] call ica_fnc_arrayexp;
["+ 60.000€"] call ica_fnc_infolog;

devolvercamion = false;
trabajandocamion = false;

hint "Hemos guardado el camión en el almacén, cuando quieras puedes volver a por el";




};




if (_param isEqualTo "confirmar") exitWith {
if !(trabajandocamion) exitwith {hint "No has seleccionado ruta"; closeDialog 0;};

hint "Has seleccionado ruta correctamente, buen viaje";
closeDialog 0;

};







