/*
por: quickskill pop to next level, 

La empresa - misiones - 

["generarmisionesINIT"] spawn ica_fnc_misionesLaEmpresa;

this addaction ["Cobrar Mision Empresa Armas I 200.000 I Nivel de Dificultad 2","aarmas_entregar.sqf"];

this addaction ["Empezar Mision Empresa Armas I 200.000 I Nivel de Dificultad 2","aarmas_recojer.sqf"];

*/

_param = _this select 0;


if (_param isEqualTo "generarmisionesINIT") exitWith {

    //misiones

    [[NPC_EMPRESA_MISIONES, ["¿Qué es -La Empresa-?",{["empresaInfo"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;

    [[NPC_EMPRESA_MISIONES_2, ["¿Qué es -La Empresa-?",{["empresaInfo"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;

    [[NPC_EMPRESA_MISIONES_3, ["¿Qué es -La Empresa-?",{["empresaInfo"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;

    [[NPC_EMPRESA_MISIONES_4, ["¿Qué es -La Empresa-?",{["empresaInfo"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;

  
    ////

  [[NPC_EMPRESA_MISIONES, ["Vender armas a  -La Empresa- Pistolas: 2.500€ Otras: 4.000€",{["misionVenderArmas"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
 
    [[NPC_EMPRESA_MISIONES_2, ["La Empresa: Transporte de Drogas - Coste:50.000€ - Recompensa:80.000€ - Dificultad: 1",{["misionTransporteDrogas"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
   
    [[NPC_EMPRESA_MISIONES_3, ["La Empresa: Transporte de Armas - Coste:100.000€ - Recompensa:1500.000€ - Dificultad: 2",{["misionTransporteArmas"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
   
    [[NPC_EMPRESA_MISIONES_4, ["La Empresa: Médico Clandestino - Coste:0€ - Recompensa:5.000€ - Dificultad: 3",{["misionMedicoClandestino"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
  

 
     //cobros 
    [[NPC_EMPRESA_COBROS, ["Cobrar trabajo Transporte de Armas - Recompensa:150.000€",{["misionTransporteArmasCobrar"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
   
    [[NPC_EMPRESA_COBROS_DROGA, ["Cobrar trabajo Transporte de Drogas - Recompensa:80.000€",{["misionTransporteDrogasCobrar"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
   
    [[NPC_EMPRESA_COBROS_MEDICO, ["Cobrar trabajo Médico Clandestino - Recompensa:5.000€ ",{["misionMedicoClandestinoCobrar"] spawn ica_fnc_misionesLaEmpresa;}]],"addAction",true,true] call BIS_fnc_MP;
  
 



};

//quien es la empresa

if (_param isEqualTo "empresaInfo") exitWith {

[[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Originalmente fundada por -Alberto Borrego- es una organización criminal internacional, en algún momento su fundador perdió el control de esta y ahora se ha convertido en la organización más peligrosa a nivel mundial, entre sus actos favoritos está el robo, extorsión y asesinato, sin dejar de lado tráfico de armas y drogas y todo tipo de delitos, algunos piensan que ésta organización controla la mayoría de empresas referentes a nivel mundial: Goggly, microshit y apllee entre ellas, ten mucho cuidado si decides trabajar con ellos, no toleraran ningún contratiempo.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

};

 //////////////
// missiones//
/////////////




//////////////////VENTA DE ARMAS //////////////////////////////////////////////////////////////////

if (_param isEqualTo "misionVenderArmas") exitWith {

//filtro nivel
  _lvl = "ti" call ica_fnc_expToLevel;
  if (_lvl < 4) exitWith { hint "No se quien eres, vete de aqui."};


  //cheeks
  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

   

  //compramos armas equipadas
  _pWeap = primaryWeapon player;
  _hgWeapon= handgunWeapon player; 


      //vendemos el fusil

        if( _pWeap == "" and _hgWeapon == "" ) exitWith{

           titleText["No tienes armas para vender.", "PLAIN"];


        };

         //si es un item troll caña linterna pancarta etc lo matamos
          if(_pWeap == "pop_linterna" or _pWeap=="cl_fishing_rod" or _hgWeapon=="cl_picket_rtp" or _hgWeapon=="cl_picket_mlnw" or _hgWeapon=="cl_picket_ftp") exitWith{


  hint "¿Te estás riendo de mi?";
  sleep 1;
  hint "Con -La Empresa- no se juega.";
  sleep 1;
  player setDamage 1;



          };


        if( _pWeap != "") then{

         

      //quitar fusil

      player removeWeapon _pWeap;

            _exp = 3;
            _pago = 4000;

            //pagamos y damos exp

            vicio_din = vicio_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;

            titleText["Buen arma, aquí tienes tus 4.000€", "PLAIN"];
            sleep 2;


          };

   



          //vendemos la pistola

        if( _hgWeapon != "") then{     

    

          //quitar pistola y pagar
           player removeWeapon _hgWeapon;

            _exp = 2;
            _pago = 2500;

            //pagamos y damos exp
            vicio_din = vicio_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;

                titleText["Ésta pistola nos vendrá bien, toma 2.500€", "PLAIN"];
         


        }; 






};

///////////////////TRANSPORTES //////////////////////////

if (_param isEqualTo "misionTransporteDrogas") exitWith {




//if !({side _x == WEST} count playableUnits >= 10) exitWith {hint "Tienen que estar al menos 10 policías conectados, sino, no es divertido."};
if (side player == WEST) exitWith {hint "Puto policía corrupto, ¡se lo voy a decir a todo el mundo!"};
if (side player == INDEPENDENT) exitWith {hint "Puto EMS corrupto, ¡se lo voy a decir a todo el mundo!"};

  if ((player getvariable "trabajo_transporte_droga_activo") > 0) exitwith {};



      _coste_mision = 50000;

   if (vicio_din < _coste_mision) exitwith {hint "No tienes 40.000€"};

    //pagar mision
    vicio_din = vicio_din - _coste_mision;
    
    
    player setvariable ["trabajo_transporte_droga_activo",1,true];

  //vars


  _time = 60 *  20;
  _droga = "pop_coca_b";
  _drogaCantidad = 25;  

  //punto entrega
  _destino = "Muelle de La Empresa";
  _posDestino = NPC_EMPRESA_COBROS_DROGA;
  _metros =  player distance _posDestino;
    
  //hint info mision bonito
  
[[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Coge la droga de la caja y llévala al punto de entrega, está pesada al miligramo, por tu bien que no falte nada.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;

//delitos
//[[getPlayerUID player,profileName,"483"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
       
// add caja 
_cajaCliment =  "Box_NATO_Grenades_F" createVehicle position NPC_EMPRESA_MISIONES_2;

clearMagazineCargoGlobal _cajaCliment;
clearItemCargoGlobal _cajaCliment;
clearWeaponCargoGlobal _cajaCliment; 

  //agregar droga a la caja
  _cajaCliment addItemCargoGlobal [_droga, _drogaCantidad];
  
[_cajaCliment, 120] spawn ica_fnc_borrame;

  //timer mision
  while {_time > 0} do {


    //si voy en heli o avion  a tomar x culo


      if(  vehicle player isKindOf "Air")then{

          titleText["Misión Fallida - No puedes ir en helicóptero para realizar el transporte.", "PLAIN"]; 
         player setvariable ["trabajo_transporte_droga_activo",0,true];

        _time = 0;

      };

   
  

      //distancia   
      _metros =  player distance _posDestino;

  
      //tiempo
      sleep 1;
      _time = _time - 1;

      hintSilent format["Destino: %3 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];
  

      /// si muere paramos el contador
      if !(alive player) then {   
        _time = 0;     
      };

    
    
      // el tio se toca los huevos pues no cobras
    
      if (_time <= 0 ) then {
            
         hint "Has tardado mucho en llegar, no queremos tratos con gente incompetente.";
         player setvariable ["trabajo_transporte_droga_activo",0,true];

        _time = 0;
     
      };


     //llegamos al destino

    if(_metros < 10 )then{ 

    titleText["Bien, ahora entrega la droga", "PLAIN"]; 

         
  

        //ha llegado a su destino final ya puede cobrar

        player setvariable ["pagar_transporte_droga",1,true];

        _time = 0;

        hint "";

    };



};//end while timer mision


 
};

if (_param isEqualTo "misionTransporteDrogasCobrar") exitWith {

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "pagar_transporte_droga") == 0) exitwith {hint "Trabaja primero, ¿qué te crees que eres político?"};



   
    if ((player getvariable "pagar_transporte_droga") > 0) exitwith {

      _cocaCantidad = ["pop_coca_b"] call ica_fnc_tengo;
      if(_cocaCantidad < 25)exitWith{

        [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Falta droga...","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
        titleText["Toma paliza HIJO DE PUTA", "PLAIN"];
        sleep 1;
        player setDamage 0.7;
        sleep 1;
        player setvariable ["trabajo_transporte_droga_activo",0,true];
        player setvariable ["pagar_transporte_droga",0,true];
        
  

      };

      //eliminar la coca
      ["pop_coca_b", -25] call ica_fnc_item;


          [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Fantástico, has trabajado duro, -La empresa- siempre cumple, aquí está tu recompensa.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

         //quickskill 
         
          _exp = 8;      
            _pago = 80000;

            //pagamos y damos exp

            vicio_din = vicio_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;

          player setvariable ["pagar_transporte_droga",0,true];
          player setvariable ["trabajo_transporte_droga_activo",0,true];
        
    };




};



//////////////TRANSPORTE DE ARMAS/////////////////

if (_param isEqualTo "misionTransporteArmas") exitWith {



  //cheeks
  if !({side _x == WEST} count playableUnits >= 3) exitWith {hint "Tienen que estar al menos 3 policías conectados, si no esto es muy facil..."};
  if (side player == WEST) exitWith {hint "Puto policía corrupto, ¡se lo voy a decir a todo el mundo!"};
  if (side player == INDEPENDENT) exitWith {hint "Puto EMS corrupto, ¡se lo voy a decir a todo el mundo!"};

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor."};

  if ((player getvariable "trabajo_transporte_armas_activo") > 0) exitwith {};



    _coste_mision = 100000;

   if (vicio_din < _coste_mision) exitwith {hint "No tienes 100.000 €"};

        vicio_din = vicio_din - _coste_mision;
    
    
    player setvariable ["trabajo_transporte_armas_activo",1,true];

  //vars


  _time = 60 *  20;
  _arma = "R3F_PAMAS";
  _armaCantidad = 2;
 
  _destino = "Muelle de La Empresa";
  //punto entrega
  _posDestino = NPC_EMPRESA_COBROS;
  _metros =  player distance _posDestino;
    
  //hint info mision bonito
  
[[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Coge las armas de la caja y llévalas al punto de entrega, están contadas, por tu bien que no falte nada","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;

//delitos
//[[getPlayerUID player,profileName,"4833"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;

// add caja 
_cajaCliment =  "Box_NATO_Grenades_F" createVehicle position NPC_EMPRESA_MISIONES_3;

clearMagazineCargoGlobal _cajaCliment;
clearItemCargoGlobal _cajaCliment;
clearWeaponCargoGlobal _cajaCliment;   

  //agregar droga a la caja
  _cajaCliment addItemCargoGlobal [_arma, _armaCantidad];
  
 [_cajaCliment, 120] spawn ica_fnc_borrame;

  //timer mision
  while {_time > 0} do {

    
        //si voy en heli o avion  a tomar x culo
      if(  vehicle player isKindOf "Air")then{

          titleText["Mision Fallida - No puedes ir en helicóptero para realizar el transporte.", "PLAIN"]; 
         player setvariable ["trabajo_transporte_armas_activo",0,true];

        _time = 0;

      };

      //distancia   
      _metros =  player distance _posDestino;

  
      //tiempo
      sleep 1;
      _time = _time - 1;

      hintSilent format["Destino: %3 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];
  

      /// si muere paramos el contador
      if !(alive player) then {   
        _time = 0;     
      };

    
    
      // el tio se toca los huevos pues no cobras
    
      if (_time <= 0 ) then {
            
         hint "Has tardado mucho en llegar, no queremos tratos con gente incompetente.";
         player setvariable ["trabajo_transporte_armas_activo",0,true];

        _time = 0;
     
      };
    
  


     //llegamos al destino

    if(_metros < 10 )then{  

           titleText["Bien, ahora entrega las armas.", "PLAIN"]; 

        //ha llegado a su destino final ya puede cobrar

        player setvariable ["pagar_transporte_armas",1,true];

        _time = 0;

        hint "";

    };



};//end while timer mision


 
};

if (_param isEqualTo "misionTransporteArmasCobrar") exitWith {

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "pagar_transporte_armas") == 0) exitwith {hint "Trabaja primero, ¿qué te crees que eres político?"};


 _pWeap = primaryWeapon player;
  _hgWeapon= handgunWeapon player; 

        if( _pWeap != "" or _hgWeapon != "" ) exitWith{

           titleText["Pon tus armas en la mochila, no te pagaremos mientras lleves armas equipadas.", "PLAIN"];
         };


   
    if ((player getvariable "pagar_transporte_armas") > 0) exitwith {

  _arma = "R3F_PAMAS";
  _armaCantidad = 2;
            _armaCantidad = ["R3F_PAMAS"] call ica_fnc_tengo;
      if(_armaCantidad < 4)exitWith{

        [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Faltan armas en tu mochila...","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;   
        sleep 1;
        player setvariable ["pagar_transporte_armas",0,true];
        player setvariable ["trabajo_transporte_armas_activo",0,true];
        sleep 1;
  

      };

      //eliminar las armas
      [_arma, -2] call ica_fnc_item;


          [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Fantástico, has trabajado duro, -La empresa- siempre cumple, aquí está tu recompensa.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

            //quickskill 

            _exp = 8;
            _pago = 150000;

            //pagamos y damos exp

            vicio_din = vicio_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;

          player setvariable ["pagar_transporte_armas",0,true];
          player setvariable ["trabajo_transporte_armas_activo",0,true];
        
    };




};


//////////////Médico Clandestino/////////////////

if (_param isEqualTo "misionMedicoClandestino") exitWith {

  if !({side _x == WEST} count playableUnits >= 10) exitWith {hint "Tienen que estar al menos 10 policías conectados, sino, no es divertido."};


  //cheeks
  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "trabajo_medico_clandestino_activo") > 0) exitwith {};


    
    player setvariable ["trabajo_medico_clandestino_activo",1,true];

  //vars


  _time = 60 * 20;

 

  //punto entrega
  _posDestino = getMarkerPos "LaEmpresaHospital";
  _metros =  player distance _posDestino;
   _destino = "Hospital de La Empresa";
    
  //hint info mision bonito
  
[[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Necesitamos ojos con urgencia, consigue 3 y serás recompensado.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  
  sleep 3;   

titleText["Lleva 3 ojos a -La Empresa-", "PLAIN"];

  //timer mision
  while {_time > 0} do {

      //distancia   
      _metros =  player distance _posDestino;

  
      //tiempo
      sleep 1;
      _time = _time - 1;

      hintSilent format["Destino: %3 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];
  

      /// si muere paramos el contador
      if !(alive player) then {   
        _time = 0;     
      };

    
    
      // el tio se toca los huevos pues no cobras
    
      if (_time <= 0 ) then {
            
         hint "Has tardado mucho en llegar, no queremos tratos con gente incompetente.";
         player setvariable ["trabajo_medico_clandestino_activo",0,true];

        _time = 0;
     
      };


     //llegamos al destino

    if(_metros < 10 )then{  

        titleText["Bien, ahora entrega los órganos.", "PLAIN"]; 

      
        //ha llegado a su destino final ya puede cobrar

        player setvariable ["pagar_trabajo_medico_clandestino",1,true];

        _time = 0;

    };



};//end while timer mision


 
};

if (_param isEqualTo "misionMedicoClandestinoCobrar") exitWith {

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "pagar_trabajo_medico_clandestino") == 0) exitwith {hint "Trabaja primero, ¿qué te crees que eres político?"};


   
    if ((player getvariable "pagar_trabajo_medico_clandestino") > 0) exitwith {

      _organos = "pop_ojos_item";
      _organosCantidad = [_organos] call ica_fnc_tengo;
      if(_organosCantidad < 3)exitWith{

        [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Faltan ojos, queremos 3 pares...","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

      };

      //eliminar los ojos
      [_organos, -3] call ica_fnc_item;


          [[["- La Empresa -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Fantástico, has trabajado duro, -La empresa- siempre cumple aquí está tu recompensa.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
  

            //quickskill 

            _exp = 5;
            _pago = 5000;

            //pagamos y damos exp

            vicio_din = vicio_din + _pago;
            ["exp",_exp] call ica_fnc_arrayexp;

          player setvariable ["pagar_trabajo_medico_clandestino",0,true];
          player setvariable ["trabajo_medico_clandestino_activo",0,true];

        
    };




};
