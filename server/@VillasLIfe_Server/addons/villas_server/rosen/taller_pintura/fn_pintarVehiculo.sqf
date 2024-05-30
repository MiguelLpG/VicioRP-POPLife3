/* Creado por Rosen */

if(side player != civilian) exitwith {["Solo los civiles tienen acceso al taller de pintura."] call BIS_fnc_guiMessage;};
if(vehicle player == player && !(pop_mecanico)) exitwith {hint "Montese en el vehiculo para pintarlo."};
if(vicio_atmdin < 15000 && !(pop_mecanico)) exitWith {["El coste por pintar el vehiculo es de 8000 €, vuelve cuando tengas fondos en tu cuenta."] call BIS_fnc_guiMessage;};
_color = param [0];
if(isNil "_color") exitWith {hint "Elija un color."};
_v = vehicle player;
if (pop_mecanico) then {

_taller = nearestObject [player, "POP_npc_mecanico"];
_pos = [0,0,0];

if (isNull _taller) exitWith {
hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>No estas cerca a ningun taller <br/>Solo puedes trabajar en los talleres de Lakeside y morrison</t>"];
};

switch (_taller) do {

	case NPC_TALLER : {

	_pos = [8156.55,6896.64,0.00143909];

	};

	case NPC_TALLER_2 : {

	_pos = [8480.96,6376.93,0.00143814];

	};

};

_coche = nearestObject [_pos, "LandVehicle"];

if (isNull _coche) exitWith {
hintSilent parseText format["<t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Taller de Lakeside</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>No hay ningun vehiculo en la rampa del taller <br/>Debes aparcaar el coche en las rampas del taller</t>"];
};

_v = _coche;

} else {
_v = vehicle player;
};

_posi = getPos _v;
_tiempo = 4;
[10, "Pintando"] spawn ica_fnc_barrita;
sleep 10;
_posf = getPos _v;
if(((_posi select 2) - (_posf select 2)) != 0) exitWith {hint "Si te llevas el vehiculo, como quieres que lo pinte merluzo.";};
if (pop_mecanico) then {} else {
vicio_atmdin = vicio_atmdin - 15000;
};

_v setObjectTextureGlobal [0,_color];
_v setObjectTextureGlobal [1,_color];
_v setObjectTextureGlobal [2,_color];
_v setObjectTextureGlobal [3,_color];
_v setObjectTextureGlobal [4,_color];
_v setObjectTextureGlobal [5,_color];

_vid = _v getVariable ["vehicle_info_owners",[]];
_vid = (_vid select 0) select 2;
//[_v, _color] remoteExec ["pintar", -2, true];
if (pop_mecanico) then {
[format ["-------> antes de pintoDB mando : %1,%2",_vid, _color],player] call ica_fnc_axeLog;
[_vid, _color] remoteExec ["ica_fnc_pintoDB", 2];
};
["MecaAxE te desea que disfrutes de tu nuevo color!"] call BIS_fnc_guiMessage;
