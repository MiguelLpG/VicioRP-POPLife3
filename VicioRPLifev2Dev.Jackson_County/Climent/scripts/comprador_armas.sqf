_hgWeapon= currentWeapon player; 

if(_hgWeapon == "" ) exitWith{

           titleText["No tienes armas que vender", "PLAIN"];
		

        };
		armasnovender23 = ["cl3_crossbow","SMG_01_F","RH_M16A4_m","RH_sbr9","hlc_rifle_augsrcarb_b","SMG_03_TR_khaki","prpl_benelli_14_rail","R3F_M4S90","arifle_MSBS65_Mark_camo_F","arifle_SPAR_03_blk_F","arifle_ARX_hex_F","SMG_02_F","hlc_rifle_m14sopmod","arifle_SPAR_01_GL_khk_F"];
		if !(currentWeapon player in armasnovender23) exitwith {titleText["Estas armas no son de calidad , no me interesan...", "PLAIN"];};

_pago = 0;

if(  _hgWeapon =="cl3_crossbow" or _hgWeapon =="SMG_01_F" or _hgWeapon =="RH_M16A4_m" or  _hgWeapon =="RH_sbr9" or   _hgWeapon =="hlc_rifle_augsrcarb_b" or   _hgWeapon=="SMG_03_TR_khaki" or   _hgWeapon =="prpl_benelli_14_rail" or _hgWeapon =="R3F_M4S90" or _hgWeapon =="arifle_MSBS65_Mark_camo_F" or _hgWeapon =="arifle_SPAR_03_blk_F" or _hgWeapon =="arifle_ARX_hex_F" or _hgWeapon =="SMG_02_F" or _hgWeapon =="hlc_rifle_m14sopmod" or _hgWeapon =="arifle_SPAR_01_GL_khk_F") then{

           _pago = _pago + 100000;
           player removeWeapon _hgWeapon;
      
      vicio_din = vicio_din + _pago;
  
      
       titleText["Gracias por vender el arma", "PLAIN"];
       sleep 2;
       ["Dinero",format [
	    "%1 - (%2) ha vendido el arma %6 por %3€  - Dinero en banco : %4€ - Dinero en mano %5€ (Venta de armas)",
	    profileName,
	    (getPlayerUID player),
	    _pago,
	    vicio_atmdin,
	    vicio_din,
	    _hgWeapon
	]
	] remoteexeccall ["ica_fnc_customlog",2];

        };
