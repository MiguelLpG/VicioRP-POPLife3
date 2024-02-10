/*

AxE was Always on Top.

*/
_param = _this select 0;


if (_param isEqualTo "init") exitWith {

    //misiones

  	[MEtransporteDrogaagua, [".::: Transporte de Drogas Marítimo ::: Drug Dealer", {["solicito"] spawn ica_fnc_drogaMar}]] remoteExec ["addAction", 0,true];
	[CLtransporteDrogaagua, [".::: Entrega de Drogas ::: Drug Dealer", {["misionTransporteDrogasMarCobrar"] spawn ica_fnc_drogaMar}]] remoteExec ["addAction", 0,true];
	[CLtransporteDrogaagua, [".::: Entrega de Jetski ::: Drug Dealer", {["fianza"] spawn ica_fnc_drogaMar}]] remoteExec ["addAction", 0,true];

};



if (_param isEqualTo "misionTransporteDrogasMar") exitWith {




if !({side _x == WEST} count playableUnits >= 3) exitWith {hint "Tienen que estar al menos 3 policias conectados, si no, no es divertido."};


        if (("ti" call ica_fnc_expToLevel) < 5) exitWith {
            titleText["Quién eres?? No serás policía?? fuera de aquí...", "PLAIN"];
    };



  if ((player distance MEtransporteDrogaagua)>37) exitwith {hint "Estás muy lejos de tu contacto."};

  if ((player getvariable "trabajo_transporte_droga_mar_activo") > 0) exitwith {};


    _coste_mision = 2000;

	if (vicio_din < _coste_mision) exitwith {hint "No tienes los 2.000€ necesarios para este trabajo"};
    vicio_din = vicio_din - 2000;
    
player setvariable ["trabajo_transporte_droga_mar_activo",1,true];

_time = 60 * 25;

_destinoRandom = "desembarcoDrogas_" +  str (round random 5 );
_destino =_destinoRandom;


_pos = getMarkerPos _destino;
_markerID = format["marker_%1",floor(random 1000)];
_marker = createMarkerLocal [ _markerID, _pos];
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerTextLocal "!Zona de Entrega!";
_marker setMarkerTypeLocal "mil_warning";


  _metros =  player distance _pos;
    
  
		[player,format ["Hola %1, el tema es sencillo ... vas en la jetsky a mar abierto ... recoges un paquetillo con polvo blanco que te dejara caer un avion ... lo llevas a nuestro distribuidor en el muelle de ClownTown, le entregas la droga ... punto. Hay huevos ? ",profileName],
		"NarcoTraficante Maritimo"] call ica_fnc_axeMsg;


  while {_time > 0} do {


      if !(vehicle player isKindOf "Ship")then{

          titleText["Cagada - No puedes ir en helicóptero para realizar el transporte.", "PLAIN"]; 
         player setvariable ["trabajo_transporte_droga_mar_activo",0,true];

        _time = 0;

      };


      _metros =  player distance _pos;

      sleep 1;
      _time = _time - 1;

	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Narcotrafico Maritimo </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Transporte de Drogas<br/>Tiempo restante: %2<br/>Distancia: %3</t><br/>Destino: Mar abierto</t>",["pop_coca_b"] call ica_fnc_classToPic,[((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros)];

      if !(alive player) then {   
        _time = 0;     
      };


    
      if (_time <= 0 ) then {
         
		[player,"Has tardado mucho en llegar, no queremos tratos con gente incompetente.", 
		"NarcoTraficante Maritimo"] call ica_fnc_axeMsg;
        player setvariable ["trabajo_transporte_droga_mar_activo",0,true];

        _time = 0;
     
      };

	 
    if(_metros < 200 )exitWith{

		[player,"Bien, el paquete ha sido lanzado, ahora recogelo en el agua y que no te falte nada droga", 
		"NarcoTraficante Maritimo"] call ica_fnc_axeMsg;
		_container = createVehicle ["CargoNet_01_box_F", [999,0,0], [], 0, "CAN_COLLIDE"];
		_container setvariable ["persistent", true, true];
		_para = createVehicle ["O_Parachute_02_F", [_pos select 0, _pos select 1, 100], [], 0, ""];
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
		_containerx = _this select 0;
		_containerx removeAction accionpaqueterosario;
		if ( mercancia_rosario_tomada > 0.5) exitWith {};
		0 spawn {mercancia_rosario_tomada = 1;
		sleep 20;
		mercancia_rosario_tomada = 0;
		};
		_n = 2 + floor(random 2);
		[_n, "Tomando mercancía..."] call ica_fnc_barrita;
		sleep _n;
		["pop_coca_b", 25] call ica_fnc_item;
		player setvariable ["pagar_transporte_droga_mar",1,true];
		}];

		[_container, 260] spawn ica_fnc_borrame;

        


    };	 
	 

};

deleteMarkerLocal _marker;
 
};





if (_param isEqualTo "misionTransporteDrogasMarCobrar") exitWith {

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "pagar_transporte_droga_mar") == 0) exitwith {hint "Trabaja primero, ¿qué te crees que eres político?"};


  if ((player getvariable "trabajo_transporte_droga_mar_activo") == 0) exitwith {hint "¿Qué haces aquí?¿?"};

   
    if ((player getvariable "pagar_transporte_droga_mar") > 0) exitwith {

      _cocaCantidad = ["pop_coca_b"] call ica_fnc_tengo;
      if(_cocaCantidad < 25)then {

        [player,"Falta droga compadre ...", 
		"NarcoTraficante Maritimo"] call ica_fnc_axeMsg;
  

      }else{

		["pop_coca_b", -25] call ica_fnc_item;

		[player,"Muy bien mijo ... excelente trabajo parce ... el patron no olvida a los que trabajan eficientemente.", 
		"NarcoTraficante Maritimo"] call ica_fnc_axeMsg;
         
		_exp = 12;      
		_pago = 12500;

		vicio_din = vicio_din + _pago;
		["exp",_exp] call ica_fnc_arrayexp;

		player setvariable ["pagar_transporte_droga",0,true];
		player setvariable ["trabajo_transporte_droga_activo",0,true];	  
	  
		};

        
    };




};


if (_param isEqualTo "solicito") exitWith {

if !({side _x == WEST} count playableUnits >= 3) exitWith {hint "Tienen que estar al menos 3 policias conectados, si no, no es divertido."};


    if (("ti" call ica_fnc_expToLevel) < 4) exitWith {
        titleText["Quién eres?? No serás policía?? fuera de aquí... o almenos APRENDE como va esto", "PLAIN"];
    };

if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

    if (vicio_din < 1000) exitwith {hint "La fianza de la JetSki son 1.000€"};
    vicio_din = vicio_din - 1000;
    _veh = "C_Scooter_Transport_01_F" createvehicle [8659.52,5658.1,-2.30909];
	_veh removeItems "FirstAidKit";
    player setvariable ["pagar_transporte_droga_mar",0,true];
    _veh setvariable ["propietario",name player,true];
    
	_veh addAction["Empezar transporte de drogas por mar.", {["misionTransporteDrogasMar"] spawn ica_fnc_drogaMar}];

};


if (_param isEqualTo "fianza") exitWith {



    if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor."};
    _veh = nearestObject [player, "C_Scooter_Transport_01_F"];
    if (isnil "_veh") exitwith {hint "No veo cerca ninguna Jetski."};
    if ((player distance _veh)>10) exitwith {hint "Acerca la Jetski."};
    _propietario = _veh getvariable "propietario";
    if (name player != _propietario) exitwith {hint "Ésta moto no está registrada a tu nombre."};
    deletevehicle _veh;

    vicio_din = vicio_din + 1000;
    hint "Todo listo, Jetski guardada, vuelve a por más trabajo cuando quieras.";
    player setvariable ["trabajo_transporte_droga_mar_activo",0,true];
};