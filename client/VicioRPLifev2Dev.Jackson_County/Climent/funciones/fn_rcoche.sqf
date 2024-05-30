
_param = _this select 0;

if (_param isEqualTo "robar") exitwith {


if (side player != CIVILIAN) exitwith {hint "¿Que intentas marciano?"};
if (call mafia <= 0 && call terrorista <= 0) exitWith {hint "Necesitas estar en una mafia o tener un grupo terrorista para poder capturar esta zona"}; 
_policias = (west countSide playableUnits);
if !(alive player) exitWith {};
//if(_policias < 8) exitWith{hintSilent "Hacen falta 8 policias";}
if ((robosactivos + 1.5) >= 3) exitWith {hint "Hay muchos robos en progreso, espera a que terminen"};
if (cocherob getVariable ["Robo", false]) exitWith {hintSilent "El robo esta en progreso!"};


////// INICIO ROBO //////
enmision = true;
cocherob setVariable ["Robo", true, true];
robosactivos = robosactivos + 1.5;
publicVariable "robosactivos";

[10,"Robo",[1,0,0,1],2,("Alarma! - Están robando un coche lujoso !"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",west];


_coche = selectRandom ["458_gris","pop_laferrari_negro","pop_jeep_grandcherokee3","FFlu_civ","POP_porche911_gris"];


_veh = _coche createVehicle position robo_coche;

hint "Trás amenazar al dependiente, le has robado las llaves de tu nuevo coche, ves a la posición marcada y vendelo. Te daremos €€€€€€";

_Pos = cochevend;
				                _marker = createMarkerLocal ["cocherob", _Pos];
				                "cocherob" setMarkerColorLocal "ColorRed";
				                "cocherob" setMarkerTextLocal "!!ATENCION!! Tienes que venderlo aquí";
				                "cocherob" setMarkerTypeLocal "mil_warning";

if !(alive player) exitWith {deleteMarker "cocherob";_rip = false;5 cutText ["","PLAIN"];};

_time = time + 1200;
if (_time > 1201) exitwith {

	deleteVehicle _veh;
	deleteMarkerLocal "cocherob";
	hint "Has tardado demasiado, espabila";
	enmision = false;
};

};


if (_param isEqualTo "vender") exitwith {


if (isNil "enmision") exitwith {hint "No tienes ningún coche para mi"};
hint "Hola amigo, que carraso me has traido. Toma tu dinero.";
vicio_din = vicio_din + 150000;
deleteVehicle _veh;
deleteMarkerLocal "cocherob";


};
