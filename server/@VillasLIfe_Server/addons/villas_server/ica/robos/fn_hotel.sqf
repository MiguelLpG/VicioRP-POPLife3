private["_ladron","_shop","_dinero","_ui","_progress","_pgText","_cP","_rip","_pos","_dineroextra"];

_shop = hotel;
_ladron = player;

if(side _ladron != civilian) exitWith {hintSilent "¿Como me estas intentando robar tu?"};
if(_ladron distance _shop > 20) exitWith {hintSilent "No puedo estar a mas de 20 metros!"};


if (hotel getVariable ["Robo", false]) exitWith {hintSilent "El robo esta en progreso!"};
if (vehicle player != _ladron) exitWith {hintSilent "No puedo robar si estoy dentro del vehiculo!"};

if (call mafia <= 0 && call terrorista <= 0) exitWith {hint "Necesitas estar en una mafia o tener un grupo terrorista para poder robar esto"}; 
if !(alive _ladron) exitWith {};
if ({alive _x} count (nearestObjects [player, ["man"], 20]) > 1) exitwith {hint "Aleja a tu amigo, esto ya no se puede hacer"};
if (currentWeapon _ladron in ["","pop_linterna","Binocular","Rangefinder","cl_fishing_rod","cl_axe","cl_pick_axeweap","cl_shovel","cl_picket_ftp","cl_picket_mlnw","cl_picket_rtp","pop_linterna"]) exitWith {hint "No me amenaces , fuera de aqui muerto de hambre!"};
_policias = (west countSide playableUnits);
if(_policias < 13) exitWith{hintSilent "Hacen falta 13 policias";};
if ((robosactivos + 1.5) >= 3) exitWith {hint "Hay muchos robos en progreso, espera a que terminen"};

if (hotel getVariable ["Robo", false]) exitwith {hint "Ya esta robando tu colega, ayudale"};

//heisen
_metros_cancelar_robo = 75;
//heisen
_rip = true;




_dinero = 400000 + round(random 500000);




_chance = random(100);



//[_shop,"robo"] remoteExec ["say3D",-2];









if(_chance >= 0) then {[1,format["Alarma! - Hotel Fantasma: %1 Esta siendo robado!", _shop]] remoteExec ["life_fnc_broadcast",west]};
[10,"Robo",[1,0,0,1],2,("Alarma! - Hotel Fantasma: Esta siendo robado!"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",west];
//"AlarmCar" remoteExec ["playSound",west];
hotel setVariable ["Robo", true, true];
[32,hotel,1] remoteExec ["ica_fnc_robodesconexion",2];
robosactivos = robosactivos + 1.5;
publicVariable "robosactivos";


disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_cP = 0.01;
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["APERTURA: (%1 %2) Estas a %3 Metros de %4 Metros",round(_cP * 100),"%",round (_distancia),_metros_cancelar_robo];
_progress progressSetPosition 0.01;

//"SmokeShellPurple" createVehicle [6150.18,16205.6,0];
//"SmokeShellYellow" createVehicle [6150.18,16205.6,0];
//"SmokeShellPurple" createVehicle [6156.27,16212.6,0];
//"SmokeShellYellow" createVehicle [6156.27,16212.6,0];
//"SmokeShellPurple" createVehicle [6156.59,16203.8,0];
//"SmokeShellYellow" createVehicle [6156.59,16203.8,0];
if(_rip) then
{
while{true} do

{

uiSleep 1.5;


_cP = _cP + 0.0023165;





if (_solo1Vez == 0) then {
if (_cp > 0.6) then {
//"SmokeShellYellow" createVehicle [6150.18,16205.6,0];
//"SmokeShellPurple" createVehicle [6156.27,16212.6,0];
//"SmokeShellYellow" createVehicle [6156.27,16212.6,0];
//"SmokeShellPurple" createVehicle [6156.59,16203.8,0];
//"SmokeShellYellow" createVehicle [6156.59,16203.8,0];
_solo1Vez = 1;
};
};
_progress progressSetPosition _cP;
_distancia = _ladron distance _shop;
_pgText ctrlSetText format["APERTURA: (%1 %2) Estas a %3 Metros de %4 Metros",round(_cP * 100),"%",round (_distancia),_metros_cancelar_robo];


_Pos = position player;
				                _marker = createMarker ["hotel", _Pos];
				                "hotel" setMarkerColor "ColorRed";
				                "hotel" setMarkerText "!!ATENCION!!Estan Robando aqui!";
				                "hotel" setMarkerType "mil_warning";
if(_cP >= 1) exitWith {};
if !(alive _ladron) exitWith {deleteMarker "hotel";_rip = false;5 cutText ["","PLAIN"];};
if((_ladron distance _shop > _metros_cancelar_robo) || (!isPlayer _ladron)) exitWith {};
};

if((_ladron distance _shop > _metros_cancelar_robo) || (!isPlayer _ladron)) exitWith {deleteMarker "hotel"; hintSilent "Necesitas estar a menos de 10 metros de el dependiente! - El dependiente a bloqueado la caja registradora"; 5 cutText ["","PLAIN"]; _rip = false; };
_dineroextra = _dinero + (_dinero * 0.25);
if!(alive _ladron) exitWith {_cp = 1;deleteMarker "hotel";_rip = false;5 cutText ["","PLAIN"];};
5 cutText ["","PLAIN"];

titleText[format["Has robado %1 € hasta la proxima",[_dinero] call life_fnc_numberText],"PLAIN"];


deleteMarker "hotel";
vicio_din = vicio_din + _dinero;


[] call life_fnc_hudUpdate;
_rip = false;
life_use_atm = false;


sleep (30 + random(180));

life_use_atm = true;
if!(alive _ladron) exitWith {};
[[getPlayerUID _ladron,name _ladron,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};

sleep 30 * 60;
_shop setVariable ["Robo",false,true];

/* ["Dinero",format [
	    "%1 - ha robado %2 (ROBOS)",
	    profileName,
	    _shop
	]
	] remoteexeccall ["ica_fnc_customlog",2]; */

Villas_EnviarLogAlert = format [":bomb: El usuario **%1** (%2) ha robado %3", profileName, (getPlayerUID player), _shop];
publicVariableServer "Villas_EnviarLogAlert";



	//Casa Borja
	//    "[[`pop_caja_armariop_box`,[[[`R3F_FRF2_DES`,`RH_m9`,`chakFNP90_50rnd_skin48_aco`,`R3F_HK416M`],[1,1,1,1]],[[`30Rnd_762x39_AK12_Mag_F`,`R3F_10Rnd_762x51_FRF2`,`RH_15Rnd_9x19_M9`,`R3F_30Rnd_556x45_HK416`,`chakFNP90_57x28_B_skin1`],[1,21,7,8,17]],[[`R3F_SILENCIEUX_HK416`,`R3F_BIPIED_HK417`,`optic_AMS`,`RH_eotech553mag_tan`,`optic_LRPS`,`R3F_SILENCIEUX_FRF2`],[1,1,2,1,1,1]],[[],[]]]],[`pop_caja_armariop_box`,[[[`chakFNP90_50rnd_skin1`],[1]],[[`RH_18Rnd_9x19_VP`],[31]],[[],[]],[[],[]]]],[`pop_caja_armariop_box`,[[[`RH_SAMR`,`C1987_MP7`,`RH_m9`,`RH_vp70`,`chakFNP90_50rnd_skin52`,`chakFNP90_50rnd_skin48_aco`,`hlc_rifle_ak12`],[1,1,11,2,2,2,4]],[[`RH_60Rnd_556x45_Mk262`,`RH_60Rnd_556x45_M855A1`,`pop_kiwi`,`RH_15Rnd_9x19_M9`,`hlc_30Rnd_545x39_B_AK`],[3,23,12,12,22]],[[`C1987_o_suppressor`,`RH_eotech553mag`,`RH_eotech553mag_tan`,`optic_Hamr`,`optic_AMS`],[1,1,3,1,1]],[[],[]]]]]"

