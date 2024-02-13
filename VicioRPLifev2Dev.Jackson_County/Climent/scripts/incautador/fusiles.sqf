//_pWeap = primaryWeapon player;
  _hgWeapon= primaryWeapon player; 


        if(_hgWeapon == "" ) exitWith{

           titleText["No tienes armas que vender", "PLAIN"];
		closeDialog  0;

        };
        if(_hgWeapon == "arifle_MX_F" ) exitWith{

           titleText["QUE COÑO HACES INTENTANDO VENDER ESTE ARMA CAPULLO", "PLAIN"];
		closeDialog  0;

        };

_pago = 0;

if(  _hgWeapon =="RH_sbr9" or _hgWeapon =="R3F_HK416M" or _hgWeapon =="RH_M4sbr_b" or  _hgWeapon =="arifle_SDAR_F" or   _hgWeapon =="RH_M4_ris_m" or   _hgWeapon=="R3F_Famas_G2_HG" or   _hgWeapon =="RH_SAMR" or   _hgWeapon =="RH_hb_b" or  _hgWeapon =="srifle_LRR_F" or   _hgWeapon =="R3F_HK417L" or   _hgWeapon =="RH_Hk416c" or   _hgWeapon =="RH_M4m" or   _hgWeapon =="RH_M4sbr" or   _hgWeapon =="RH_M4sbr_g" or   _hgWeapon =="RH_M4_moe" or   _hgWeapon =="RH_m4_des" or   _hgWeapon =="RH_m4_tg" or   _hgWeapon =="RH_m4_wdl" or _hgWeapon =="hlc_rifle_ak12" or _hgWeapon =="hlc_rifle_aek971worn" or _hgWeapon =="R3F_Famas_surb_HG" or _hgWeapon =="hlc_rifle_aks74" or _hgWeapon =="hlc_rifle_aks74u" or _hgWeapon =="hlc_rifle_aku12" or _hgWeapon =="Cha_AK74" or _hgWeapon =="Cha_AK107" or _hgWeapon =="Cha_AKS74U") then{

           _pago = _pago + 10000;
           closeDialog  0;
           player removeWeapon _hgWeapon;
      
      vicio_din = vicio_din + _pago;
  
      
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



if(  _hgWeapon =="RH_muzi" or _hgWeapon =="hlc_smg_mp5k" or _hgWeapon =="pop_thomson" or  _hgWeapon =="hlc_smg_mp510" or _hgWeapon =="C1987_MP7_ucp" or _hgWeapon =="C1987_MP7" or   _hgWeapon =="C1987_MP7_folded2" or   _hgWeapon=="C1987_MP7_nwu" or   _hgWeapon =="AG_MP9_peq" or   _hgWeapon =="AG_MP9_wcam" or  _hgWeapon =="chakFNP90_50rnd_skin1" or   _hgWeapon =="chakFNP90_50rnd_skin5" or   _hgWeapon =="chakFNP90_50rnd_skin20" or   _hgWeapon =="chakFNP90_50rnd_skin23" or   _hgWeapon =="chakFNP90_50rnd_skin28" or   _hgWeapon =="chakFNP90_50rnd_skin48" or   _hgWeapon =="chakFNP90_50rnd_skin49" or   _hgWeapon =="chakFNP90_50rnd_skin52" or   _hgWeapon =="chakFNP90_50rnd_skin52" or   _hgWeapon =="chakFNP90_50rnd_skin54" or   _hgWeapon =="chakFNP90_57x28_B_skin1" or   _hgWeapon =="hlc_smg_mp5a3" or   _hgWeapon =="RH_uspm" or   _hgWeapon =="RH_g19" or   _hgWeapon =="RH_fnp45") exitwith{

           hint "Eso es un subfusil";
           closeDialog 0;

        };


      
