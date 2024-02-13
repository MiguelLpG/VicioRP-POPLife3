#include <macro.h>
/*
Tienda de la mafia
by: Icaruk

	["menu"] call ica_fnc_tiendaMafia;
*/

_param = _this select 0;

_tiendaLVL0 = [
	["Si no eres de la familia no eres bienvenido...!", 0]
];
_tiendaLVL1 = [
	["----- Mascaras -----", 0],
	["H_AntmanMask", 1500 * Desc],
	["H_BobaMask", 1500 * Desc],
	["Masque_Dallas", 1500 * Desc],
	["Masque_Incendiaire", 1500 * Desc],
	["Masque_Chuck", 1500 * Desc],
	["kio_vfv_mask", 1500 * Desc],
	["H_KermitMask", 1500 * Desc],
	["Masque_Mempo", 1500 * Desc],
	["H_JasonMask", 1500 * Desc],
	["Masque_forceAlpha", 1500 * Desc],
	["kio_skl_msk_pun", 1500 * Desc],
	["Masque_Wolfv2", 1500 * Desc],
	["pop_mascara", 1500 * Desc],
	["TAC_SF10H", 1500],
	["----- Gorros -----", 0],
	["TRYK_R_CAP_BLK", 1000 * Desc],
	["TRYK_R_CAP_TAN", 1000 * Desc],
	["TRYK_R_CAP_OD_US", 1000 * Desc],
	["TRYK_H_woolhat", 1000 * Desc],
	["rds_Villager_cap1", 1000 * Desc],
	["rds_worker_cap2", 1000 * Desc],
	["TRYK_H_woolhat", 1000 * Desc],
	["TRYK_H_woolhat_br", 1000 * Desc],
	["TRYK_H_woolhat_cu", 1000 * Desc],
	["TRYK_H_woolhat_CW", 1000 * Desc],
	["TRYK_H_woolhat_tan", 1000 * Desc],
	["TRYK_H_woolhat_WH", 1000 * Desc],
	["----- Boinas Exclusivas ----", 0 * Desc],
	["H_AN_Killa", 1000 * Desc],
	//["comando_Beret2", 1000 * Desc],
	//["Force_Beret2", 1000 * Desc],	
	//["gnv_Beret2", 1000 * Desc],
	//["Force_Beret2", 1000 * Desc],
	["----- Ropa -----", 0],
	["KAEL_SUITS_BR_F15", 3000 * Desc],
    ["KAEL_SUITS_BR_F16", 3000 * Desc],
	["KAEL_SUITS_BR_F26", 3000 * Desc],
	["KAEL_SUITS_BR_F30", 3000 * Desc],
	["KAEL_SUITS_BR_F34", 3000 * Desc],
	["TRYK_U_B_BLKBLK_CombatUniform", 3000 * Desc],
	["TRYK_U_B_BLKBLK_R_CombatUniform", 3000 * Desc],
	["TRYK_U_B_BLKTAN_CombatUniform", 3000 * Desc],
	["TRYK_U_B_fleece", 3000 * Desc],
	["TRYK_U_B_GRTAN_CombatUniform", 3000 * Desc],
	["TRYK_U_B_GRYOCP_CombatUniform", 3000 * Desc],
	["TRYK_U_B_PCUHs", 3000 * Desc],
	["TRYK_U_B_PCUGHs", 3000 * Desc],
	["TRYK_U_B_PCUGs_BLK_R", 3000 * Desc],
	["TRYK_U_B_PCUGs_gry_R", 3000 * Desc],
	["A3LJumperCIDBlack", 3000 * Desc],
	["A3LJumperCIDDigi", 3000 * Desc],
	["A3LJumperCIDGreen", 3000 * Desc],
	["A3LJumperUKBlack", 3000 * Desc],
	["A3LJumperUSBlack", 3000 * Desc],
	["rds_uniform_Woodlander1", 3000 * Desc],
	["----- Ropa Exclusiva ----", 0 * Desc],
	["U_AN_Killa", 3000 * Desc],
	["Ropa_Matias_Nuñez", 3000 * Desc], // EQUIPA MATIAS 
	["Vlk_DZShirt", 3000 * Desc] // EQUIPA BETIS	
















	//["uniforme_sisuka_remangado", 3000 * Desc],
//["uniforme_cacos", 3000 * Desc],
///	["uniforme_cacos_remangado", 3000 * Desc],
//["uniforme_luis_campos", 3000 * Desc],
	//["uniforme_luis_campos_remangado", 3000 * Desc],
//["uniforme_street", 3000 * Desc],
	//["uniforme_street_remangado", 3000 * Desc],
	//["uniforme_priscos", 3000 * Desc],
	//["uniforme_priscos_remangado", 3000 * Desc],
	//["uniforme_genov", 3000],
//	["uniforme_genov_remangado", 3000]
	//["uniforme_fly", 3000 * Desc],
	//["uniforme_fly_remangado", 3000 * Desc]
];
_tiendaLVL2 = [ // chalecos
	["----- Chalecos -----", 0],
	["k_hrebel_1", 5500 * Desc],
	["k_hrebel_5", 5000 * Desc],
	["V_TacVest_camo", 5000],
	["V_TacVestIR_blk", 5000 * Desc],
	["V_BandollierB_khk", 5000 * Desc],
	["TRYK_V_Sheriff_BA_TB", 8000 * Desc],
	["TRYK_V_Sheriff_BA_TC", 8000 * Desc],
	["TRYK_V_Sheriff_BA_T", 8000 * Desc],
	["TRYK_V_Sheriff_BA_TB2", 8000 * Desc],
	["TRYK_V_Sheriff_BA_TC2", 8000 * Desc],
	["TRYK_V_Sheriff_BA_T2", 8000 * Desc],
	["V_PlateCarrier2_rgr_noflag_F", 10000],
	["V_PlateCarrier1_rgr_noflag_F", 10000],
	["V_PlateCarrierSpec_rgr", 20000 * Desc],
	["----- Chaleco Invisible-----", 0],
	["CG_SERT_Vests", 8000 * Desc],
	["----- Chalecos Exclusivos -----", 0 * Desc],
	["V_AN_Killa", 8000 * Desc],	
	//["chaleco_riku", 8000 * Desc],
	//["chaleco_street", 8000 * Desc],
	//["chaleco_cacos", 8000 * Desc],
	//["chaleco_comando", 8000 * Desc],
	//["chaleco_gnv", 8000 * Desc],
	//["chaleco_priscos", 8000 * Desc],
	//["chaleco_flymen", 8000 * Desc],
	//["chaleco_dora_black", 8000 * Desc],
	//["chaleco_forcerp", 8000 * Desc],
	["----- Mochilas -----", 0],
	["B_Parachute", 10000 * Desc],
	["mochila_mediana", 3000 * Desc]
];
_tiendaLVL3 = [
	["----- Pistolas -----", 0],
	["RH_m9", 30000],
	["RH_15Rnd_9x19_M9", 500],
	["----------------------------------", 0],
	["RH_p226", 20000 * Desc],
	["RH_15Rnd_9x19_SIG", 500 * Desc],
	["----------------------------------", 0],
	["RH_python", 20000 * Desc],
	["RH_6Rnd_357_Mag", 500 * Desc],
	["----------------------------------", 0],
	["RH_kimber", 20000 * Desc],
	["RH_7Rnd_45cal_m1911", 500 * Desc],
	["----------------------------------", 0],
	["RH_fn57", 25000  * Desc],
	["RH_20Rnd_57x28_FN", 500 * Desc],
	["----------------------------------", 0],
	["RH_gsh18", 20000 * Desc],
	["RH_18Rnd_9x19_gsh", 500 * Desc],
	["----------------------------------", 0],
	["RH_g17", 20000 * Desc],
	["RH_17Rnd_9x19_g17", 500 * Desc],
	["----------------------------------", 0],
	["RH_g18", 30000 * Desc],
	["RH_19Rnd_9x19_g18", 500 * Desc],
	["RH_33Rnd_9x19_g18", 500 * Desc],
	["----------------------------------", 0],
	["RH_mak", 20000 * Desc],
	["RH_8Rnd_9x18_Mak", 500 * Desc],
	["----------------------------------", 0],
	["RH_sw659", 20000 * Desc],
	["RH_14Rnd_9x19_sw", 500],
	["----------------------------------", 0],
	["RH_mk2", 20000 * Desc],
	["RH_10Rnd_22LR_mk2", 500 * Desc],
	["----------------------------------", 0],
	["RH_bull", 30000 * Desc],
	["RH_6Rnd_454_Mag", 500 * Desc],
	["----------------------------------", 0],
	["RH_tec9", 25000 * Desc],
	["RH_32Rnd_9x19_tec", 500 * Desc],
	["----------------------------------", 0],
	["hgun_007_SW_M10_gold", 15000 * Desc],
	["6Rnd_45ACP_Cylinder", 500 * Desc],
	["----------------------------------", 0],
	["RH_Deagleg", 30000 * Desc],
	["RH_Deagles", 30000 * Desc],
	["RH_Deaglem", 30000 * Desc],
	["RH_deagle", 30000 * Desc],
	["RH_7Rnd_50_AE", 500 * Desc],
	["optic_Yorris", 2500 * Desc],
	["----------------------------------", 0],
	["RH_vp70", 80000 * Desc],
	["RH_18Rnd_9x19_VP", 500 * Desc]
];
_tiendaLVL4 = [
	["----- Subfusiles Nº1 -----", 0],
	["RH_muzi", 50000 * Desc],
	["RH_30Rnd_9x19_UZI", 700 * Desc],
	["----------------------------------", 0],
	["hlc_smg_mp5k", 55000 * Desc],
	["hlc_30Rnd_9x19_B_MP5", 700 * Desc],
	["RH_LTdocterl", 3200 * Desc],
	["hlc_muzzle_Tundra", 3200 * Desc],
	["----------------------------------", 0],
	["pop_thomson",45000 * Desc],
	["pop_thomson_45",700 * Desc],
	["pop_thomson_9x19",700 * Desc],
	["----------------------------------", 0],
	["hlc_smg_mp510", 55000],
	["hlc_30Rnd_10mm_B_MP5", 700],
	["hlc_30Rnd_10mm_JHP_MP5", 700]
];
_tiendaLVL5 = [
	["----- Subfusiles Nº2 -----", 0],
	["C1987_MP7_ucp", 70000 * Desc],
	["C1987_40Rnd_46x30_mp7", 800 * Desc],
	["----------------------------------", 0],
	["C1987_MP7_folded2", 70000 * Desc],
	["C1987_40Rnd_46x30_mp7", 800 * Desc],
	["----------------------------------", 0],
	["C1987_MP7_nwu", 70000 * Desc],
	["C1987_40Rnd_46x30_mp7", 800 * Desc],
	["----------------------------------", 0],
	["AG_MP9_peq", 60000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 800 * Desc],
	["----------------------------------", 0],
	["AG_MP9_wcam", 60000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 800 * Desc],
	["----------------------------------", 0],
	["chakFNP90_50rnd_skin1", 75000 * Desc],
	["chakFNP90_57x28_B_skin1", 800 * Desc],
	["----------------------------------", 0],
	["RH_eotech553mag"            , 10000],
	["optic_hamr"            , 10000]
];
_tiendaLVL6 = [
	["----- Vehículos -----", 0],
	["Mercedes_Pullman_negra", 830000 * Desc],
	["POP_jeep_blinde_negro", 678000 * Desc],
	["POP_jeep_blinde_negro_mate", 800000 * Desc],
	["pop_cherokee_negro", 855000 * Desc],
	["pop_cherokee_negro_mate", 865000 * Desc],
	["pop_lincoln_negro", 835000 * Desc]
];
_tiendaLVL7 = [
	["----- Carabinas -----", 0],
	["hlc_rifle_ak12", 89000 * Desc],
	["hlc_rifle_aek971worn", 91000 * Desc],
	["hlc_30Rnd_545x39_B_AK", 900 * Desc],
	["----------------------------------", 0],
	["R3F_Famas_surb_HG", 92000 * Desc],
	["R3F_Famas_G2", 92000 * Desc],
	["R3F_30Rnd_556x45_FAMAS", 900 * Desc],
	["R3F_30Rnd_556x45_TRACER_HK416", 1200 * Desc]
];
_tiendaLVL8 = [
	["----- Fusiles de asalto -----", 0],
	["RH_Hk416c", 120000 * Desc],
	["RH_M4m", 122000 * Desc],
	["RH_M4sbr", 125000 * Desc],
	["RH_M4sbr_g", 121000 * Desc],
	["RH_M4_moe", 125000 * Desc],
	["RH_m4_des", 120000 * Desc],
	["RH_m4_tg", 121000 * Desc],
	["RH_m4_wdl", 125000 * Desc],
	["RH_30Rnd_556x45_M855A1", 900],
	["----------------------------------", 0],
	["R3F_HK416M", 150000], // SBR9 (Hk416)
	["R3F_30Rnd_556x45_HK416", 500], // hk416 Mag
	["----------------------------------", 0],
	["R3F_HK416M_DES", 150000], // SBR9 (Hk416)
	["R3F_30Rnd_556x45_HK416", 500], // hk416 Mag
	["----------------------------------", 0],
	["R3F_FRF2_DES", 150000], // FRF2
	["R3F_10Rnd_762x51_FRF2", 500], // FRF2 Mag
	["----- Accesorios -----", 0],
	["bipod_01_F_snd"            , 10000],
	["optic_Aco"                 , 10000],
	["optic_Holosight_smg"       , 10000],
	["optic_Yorris"              , 10000],
//	["optic_AMS",           15000],
	//["optic_Arco",          15000],
	//["optic_DMS",           15000],
	//["optic_ERCO_snd_F",    15000],
	//["optic_KHS_old",       15000],
	//["optic_LRPS_ghex_F",   25000],
	//["optic_SOS",           15000],
	//["optic_LRPS",    		25000],
	//["optic_MRCO",          15000],
	["pop_c4", 				75000]
];

_tiendaLVLdonadores = [
	["----- Armas Donadores -----", 0],
	["mochila_grande", 5000 * Desc],
	["RH_m9c", 30000],
	["RH_15Rnd_9x19_M9", 500 * Desc], // BERETTA Mag
	["RH_bullb", 30000], // TAURUS MODDEADA
	["RH_6Rnd_454_Mag", 500 * Desc], // Taurus Mag
	["TRYK_V_harnes_TAN_L", 5000 * Desc],
	["chakFNP90_50rnd_skin1", 75000 * Desc],
	["chakFNP90_50rnd_skin5", 75000 * Desc],
	["chakFNP90_50rnd_skin20", 75000 * Desc],
	["chakFNP90_50rnd_skin23", 75000 * Desc],
	["chakFNP90_50rnd_skin28", 75000 * Desc],
	["chakFNP90_50rnd_skin48", 75000 * Desc],
	["chakFNP90_50rnd_skin49", 75000 * Desc],
	["chakFNP90_50rnd_skin52", 75000 * Desc],
	["chakFNP90_50rnd_skin53", 75000 * Desc],
	["chakFNP90_50rnd_skin54", 75000 * Desc],
	["chakFNP90_57x28_B_skin1", 500 * Desc]

];

_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_nivel = "maf" call ica_fnc_expToLevel;
	_bd = call mafia;

	if (_bd == 0)    then { _arrayTienda append _tiendaLVL0 };
	if ((_nivel >= 1) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL1 };
	if ((_nivel >= 2) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL2 };
	if ((_nivel >= 3) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL3 };
	if ((_nivel >= 4) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL4 };
	if ((_nivel >= 5) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL5 };
	if ((_nivel >= 5) and !(_bd == 0) and (license_civ_donator)) then { _arrayTienda append _tiendaLVLdonadores };
	if ((_nivel >= 6) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL6 };
	if ((_nivel >= 7) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL7 };
	if ((_nivel >= 8) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL8 };

	private ["_nom", "_pre"];
	_idx = 0;
	while {_idx < (count _arrayTienda)} do {

		// Hallo su nombre visual
		_nom = [_arrayTienda select _idx select 0] call ica_fnc_classToName;
		_pic = [_arrayTienda select _idx select 0] call ica_fnc_classToPic;

		// Hallo su precio
		_precio = (_arrayTienda select _idx select 1); // pillo el precio
		if (_precio != 0) then { // si es 0, es un espaciador
			_pre = format ["(%1€)", ([_precio, 3] call ica_fnc_numToStr)];
		} else {_pre = ""; };

		// Creo cada elemento de la lista
		_lista lbAdd format ["%1 %2", _nom, _pre];
		_lista lbSetPicture [_idx, _pic];
		_lista lbSetData [_idx, (_arrayTienda select _idx select 0)];
		_lista lbSetValue [_idx, (_arrayTienda select _idx select 1)];
		if ((_arrayTienda select _idx select 1) == 0) then { // si es separador le cambio de color
			_lista lbSetColor [_idx, [0, 0.6, 0, 1]];
		};

		_idx = _idx + 1;
	};


	// _lista lbSetCurSel 0;
};

if (_param isEqualTo "actualiza") exitWith {
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call ica_fnc_tiendaMafia;
	';
};

if (_param isEqualTo "compro") exitWith {
	_cosa = _this select 1;
	_precio = _this select 2;

	private "_fuera";
	if (_cosa isEqualto "Si no eres de la familia no eres bienvenido... fuera de aquí!") exitWith {hint "¿Que intentas comprar? Ya te he dicho que te largues.";closeDialog 0;};
	if (_precio > vicio_din) exitWith {hint "No tienes suficiente dinero."; };	

	/* // va raro
	if !(isClass (configFile >> "CfgVehicles" >> _cosa)) then { // si no es veh, pregunta si te cabe en el inventario
		if !(player canAdd _cosa ) exitWith {hint "No tienes suficiente espacio"; _fuera = true; };
	};
	if (!isNil {_fuera}) exitWith {};
	*/

	vicio_din = vicio_din - _precio;

	if (getNumber (configFile >> "CfgVehicles" >> _cosa >> "maxspeed") > 0) then {
		private "_mrk";
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3", "mrkmafia4", "mrkmafia5", "mrkmafia6","mrkmafia3_1","mrkmafia3_2","mrkmafia4_1","mrkmafia3_3"] call ica_fnc_masCercano;

		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil {_veh}};
		_veh allowDamage false;
		_veh lock 2;
		_veh setVectorUp (surfaceNormal (getMarkerPos _mrk));
		_veh setDir (markerDir _mrk);
		_veh setPos (getMarkerPos _mrk);
		[_veh,1] remoteexeccall ["life_fnc_colorVehicle",-2];
		[_veh] call life_fnc_clearVehicleAmmo;
		[_veh,"trunk_in_use",false,true] remoteexeccall ["TON_fnc_setObjVar",2];
		[_veh,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteexeccall ["TON_fnc_setObjVar",2];
		_veh disableTIEquipment true;
		_veh allowDamage true;
		_veh setVariable ["matricula", call ica_fnc_creaMatricula, true];

		life_vehicles pushBack _veh;
		[getPlayerUID player,playerSide, _veh, 1] remoteexeccall ["TON_fnc_keyManagement",2];
		[(getPlayerUID player),playerSide, _veh, 0] remoteexeccall ["TON_fnc_vehicleCreate",2];
		[0] call SOCK_fnc_updatePartial;
		closeDialog 0;
	} else {
		[_cosa] call ica_fnc_item;
	};

	//hint format ["Has comprado %1 por %2€", _cosa, _precio];
	hint parseText format["<t color='#ffffff' size='2'>PoP Life</t><br/><br/><img shadown='false' size='6' image=''/><br/><br/>Has comprado %1 por %2€", _cosa, _precio]; 
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	
	["Dinero",format [
	"%1 - (%2) ha comprado %6 por %3€  - Dinero en banco : %4€ - Dinero en mano %5€ (Tienda mafia)",
	 profileName,
	(getPlayerUID player),
	_precio,
	vicio_atmdin,
	vicio_din,
	_cosa
	]
	] remoteexeccall ["ica_fnc_customlog",2];
	
	
};

