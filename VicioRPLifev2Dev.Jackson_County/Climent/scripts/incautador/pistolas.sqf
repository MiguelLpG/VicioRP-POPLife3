//_pWeap = primaryWeapon player;
  _hgWeapon= handgunWeapon player; 


        if(_hgWeapon == "" ) exitWith{

           titleText["No tienes armas que vender", "PLAIN"];
		closeDialog  0;

        };

        if(_hgWeapon == "hgun_P07_F" ) exitWith{

           titleText["QUE HACES INTENTANDO VENDER ESTE ARMA CAPULLO", "PLAIN"];
		closeDialog  0;

        };

_pago = 0;

if(  _hgWeapon =="RH_m9" or _hgWeapon =="RH_m9c" or _hgWeapon =="CSW_FN57_Ballistic_Shield" or _hgWeapon =="R3F_PAMAS" or _hgWeapon =="RH_p226" or  _hgWeapon =="RH_p226" or _hgWeapon =="RH_kimber" or   _hgWeapon =="RH_fn57" or   _hgWeapon=="RH_gsh18" or   _hgWeapon =="RH_g17" or   _hgWeapon =="RH_g18" or  _hgWeapon =="RH_mak" or   _hgWeapon =="RH_sw659" or   _hgWeapon =="RH_mk2" or   _hgWeapon =="RH_bull" or   _hgWeapon =="RH_tec9" or   _hgWeapon =="hgun_007_SW_M10_gold" or   _hgWeapon =="RH_Deagleg" or   _hgWeapon =="RH_Deagles" or   _hgWeapon =="RH_Deaglem" or   _hgWeapon =="RH_deagle" or   _hgWeapon =="RH_vp70" or   _hgWeapon =="RH_cz75" or   _hgWeapon =="RH_uspm" or   _hgWeapon =="RH_g19" or   _hgWeapon =="RH_fnp45") then{

           _pago = _pago + 2000;
           player removeWeapon _hgWeapon;
      
       vicio_din = vicio_din + _pago;
  
      closeDialog  0;
       titleText["Gracias por devolver el arma, buen servicio", "PLAIN"];
       sleep 2;

           ["Dinero",format [
	    "%1 - (%2) ha incautado %6 por %3€  - Dinero en banco : %4€ - Dinero en mano %5€ (Incautaciones)",
	    profileName,
	    (getPlayerUID player),
	    _pago,
	    vicio_atmdin,
	    vicio_din,
	    _hgWeapon
	]
	] remoteexeccall ["ica_fnc_customlog",2];

        };


