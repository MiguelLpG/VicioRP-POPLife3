#include <macro.h>
/*
Tienda de la mafia
by: tupadre37 y deivid jimenez

	["menu"] call ica_fnc_tiendaRebelde;
*/

_param = _this select 0;

_tiendaLVL0 = [
	["Vete a aprender la rama de rebelde a universidad que pareces gilipollas...!", 0],
	["", 0],
	["Te vendemos un ToolKit que Rafiti robo unos gitanos monte abajo...", 0],
	["", 0],
	["ToolKit", 300 * Desc],
	["", 0]

];
_tiendaLVL1 = [ //NADA
["----- Mascaras -----", 0],
	["H_AntmanMask", 0 * Desc],
	["H_BobaMask", 0 * Desc],
	["Masque_Dallas", 0 * Desc],
	["Masque_Incendiaire", 0 * Desc],
	["Masque_Chuck", 0 * Desc],
	["kio_vfv_mask", 0 * Desc],
	["H_KermitMask", 0 * Desc],
	["Masque_Mempo", 0 * Desc],
	["H_JasonMask", 0 * Desc],
	["Masque_forceAlpha", 0 * Desc],
	["kio_skl_msk_pun", 0 * Desc],
	["Masque_Wolfv2", 0 * Desc],
	["pop_mascara", 0 * Desc],
	["TAC_SF0H", 0],
	["----- Gorros -----", 0],
	["TRYK_R_CAP_BLK", 0 * Desc],
	["TRYK_R_CAP_TAN", 0 * Desc],
	["TRYK_R_CAP_OD_US", 0 * Desc],
	["TRYK_H_woolhat", 0 * Desc],
	["rds_Villager_cap1", 0 * Desc],
	["rds_worker_cap2", 0 * Desc],
	["TRYK_H_woolhat", 0 * Desc],
	["TRYK_H_woolhat_br", 0 * Desc],
	["TRYK_H_woolhat_cu", 0 * Desc],
	["TRYK_H_woolhat_CW", 0 * Desc],
	["TRYK_H_woolhat_tan", 0 * Desc],
	["TRYK_H_woolhat_WH", 0 * Desc],
	["----- Boinas Exclusivas ----", 0 * Desc],
	["H_AN_Killa", 0 * Desc],
	["----- Ropa -----", 0],
	["KAEL_SUITS_BR_F15", 0 * Desc],
    ["KAEL_SUITS_BR_F16", 0 * Desc],
	["KAEL_SUITS_BR_F26", 0 * Desc],
	["KAEL_SUITS_BR_F30", 0 * Desc],
	["KAEL_SUITS_BR_F34", 0 * Desc],
	["TRYK_U_B_BLKBLK_CombatUniform", 0 * Desc],
	["TRYK_U_B_BLKBLK_R_CombatUniform", 0 * Desc],
	["TRYK_U_B_BLKTAN_CombatUniform", 0 * Desc],
	["TRYK_U_B_fleece", 0 * Desc],
	["TRYK_U_B_GRTAN_CombatUniform", 0 * Desc],
	["TRYK_U_B_GRYOCP_CombatUniform", 0 * Desc],
	["TRYK_U_B_PCUHs", 0 * Desc],
	["TRYK_U_B_PCUGHs", 0 * Desc],
	["TRYK_U_B_PCUGs_BLK_R", 0 * Desc],
	["TRYK_U_B_PCUGs_gry_R", 0 * Desc],
	["A3LJumperCIDBlack", 0 * Desc],
	["A3LJumperCIDDigi", 0 * Desc],
	["A3LJumperCIDGreen", 0 * Desc],
	["A3LJumperUKBlack", 0 * Desc],
	["A3LJumperUSBlack", 0 * Desc],
	["rds_uniform_Woodlander1", 0 * Desc],
	["----- Chalecos -----", 0],
	["k_hrebel_1", 50 * Desc],
	["k_hrebel_5", 0 * Desc],
	["V_TacVest_camo", 0],
	["V_TacVestIR_blk", 0 * Desc],
	["V_BandollierB_khk", 0 * Desc],
	["TRYK_V_Sheriff_BA_TB", 00 * Desc],
	["TRYK_V_Sheriff_BA_TC", 00 * Desc],
	["TRYK_V_Sheriff_BA_T", 00 * Desc],
	["TRYK_V_Sheriff_BA_TB2", 00 * Desc],
	["TRYK_V_Sheriff_BA_TC2", 00 * Desc],
	["TRYK_V_Sheriff_BA_T2", 00 * Desc],
	["V_PlateCarrier2_rgr_noflag_F", 0],
	["V_PlateCarrier1_rgr_noflag_F", 0],
	["V_PlateCarrierSpec_rgr", 00 * Desc],
	["----- Chaleco Invisible-----", 0],
	["CG_SERT_Vests", 00 * Desc],
	["----- Chalecos Exclusivos -----", 0 * Desc],
	["V_AN_Killa", 00 * Desc],	
	["----- Mochilas -----", 0],
	["B_Parachute", 0 * Desc],
	["mochila_mediana", 0 * Desc],
	["----- Pistolas -----", 0],
	["RH_m9", 00],
	["RH_15Rnd_9x19_M9", 0],
	["----------------------------------", 0],
	["RH_p226", 00 * Desc],
	["RH_15Rnd_9x19_SIG", 0 * Desc],
	["----------------------------------", 0],
	["RH_python", 00 * Desc],
	["RH_6Rnd_357_Mag", 0 * Desc],
	["----------------------------------", 0],
	["RH_kimber", 00 * Desc],
	["RH_7Rnd_45cal_m1911", 0 * Desc],
	["----------------------------------", 0],
	["RH_gsh18", 00 * Desc],
	["RH_18Rnd_9x19_gsh", 0 * Desc],
	["----------------------------------", 0],
	["RH_g17", 00 * Desc],
	["RH_17Rnd_9x19_g17", 0 * Desc],
	["----------------------------------", 0],
	["RH_g18", 00 * Desc],
	["RH_19Rnd_9x19_g18", 0 * Desc],
	["RH_33Rnd_9x19_g18", 0 * Desc],
	["----------------------------------", 0],
	["RH_mak", 00 * Desc],
	["RH_8Rnd_9x18_Mak", 0 * Desc],
	["----------------------------------", 0],
	["RH_sw659", 00 * Desc],
	["RH_14Rnd_9x19_sw", 0],
	["----------------------------------", 0],
	["----------------------------------", 0],
	["RH_bull", 00 * Desc],
	["RH_6Rnd_454_Mag", 0 * Desc],
	["----------------------------------", 0],
	["RH_tec9", 0 * Desc],
	["RH_32Rnd_9x19_tec", 0 * Desc],
	["----------------------------------", 0],
	["hgun_007_SW_M0_gold", 00 * Desc],
	["6Rnd_45ACP_Cylinder", 0 * Desc],
	["----------------------------------", 0],
	["RH_Deagleg", 00 * Desc],
	["RH_Deagles", 00 * Desc],
	["RH_Deaglem", 00 * Desc],
	["RH_deagle", 00 * Desc],
	["RH_7Rnd_50_AE", 0 * Desc],
	["optic_Yorris", 0 * Desc],
	["----------------------------------", 0],
	["RH_vp0", 000 * Desc],
	["RH_18Rnd_9x19_VP", 0 * Desc],
	["----- Subfusiles Nº1 -----", 0],
	["RH_muzi", 00 * Desc],
	["RH_30Rnd_9x19_UZI", 00 * Desc],
	["----------------------------------", 0],
	["hlc_smg_mp5k", 50 * Desc],
	["hlc_30Rnd_9x19_B_MP5", 00 * Desc],
	["RH_LTdocterl", 0 * Desc],
	["hlc_muzzle_Tundra", 0 * Desc],
	["----------------------------------", 0],
	["pop_thomson",0 * Desc],
	["pop_thomson_45",00 * Desc],
	["pop_thomson_9x19",00 * Desc],
	["----------------------------------", 0],
	["hlc_smg_mp50", 50],
	["hlc_30Rnd_0mm_B_MP5", 00],
	["hlc_30Rnd_0mm_JHP_MP5", 00],
	["----- Subfusiles Nº2 -----", 0],
	["C1987_MP7_ucp", 0000 * Desc],
	["C1987_0Rnd_46x30_mp7", 0 * Desc],
	["----------------------------------", 0],
	["C1987_MP7_folded2", 0000 * Desc],
	["C1987_0Rnd_46x30_mp7", 0 * Desc],
	["----------------------------------", 0],
	["C1987_MP7_nwu", 0000 * Desc],
	["C1987_0Rnd_46x30_mp7", 0 * Desc],
	["----------------------------------", 0],
	["AG_MP9_peq", 00000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 0 * Desc],
	["----------------------------------", 0],
	["AG_MP9_wcam", 0000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 0 * Desc],
	["----------------------------------", 0],
	["chakFNP90_0rnd_skin1", 0 * Desc],
	["chakFNP90_57x28_B_skin1", 0 * Desc],
	["----------------------------------", 0],
	["RH_eotech553mag"            , 0],
	["optic_hamr"            , 0],
	["----- Carabinas -----", 0],
	["hlc_rifle_ak12", 0 * Desc],
	["hlc_rifle_aek971worn", 0 * Desc],
	["hlc_30Rnd_545x39_B_AK", 0 * Desc],
	["----------------------------------", 0],
	["R3F_Famas_surb_HG", 0 * Desc],
	["R3F_Famas_G2", 0 * Desc],
	["R3F_30Rnd_556x45_FAMAS", 0 * Desc],
	["R3F_30Rnd_556x45_TRACER_HK416", 0 * Desc],
	["----- Fusiles de asalto -----", 0],
	["RH_Hk416c", 0000 * Desc],
	["RH_M4m", 0000 * Desc],
	["RH_M4sbr", 0 * Desc],
	["RH_M4sbr_g", 0000 * Desc],
	["RH_M4_moe", 0 * Desc],
	["RH_m4_des", 0000 * Desc],
	["RH_m4_tg", 0000 * Desc],
	["RH_m4_wdl", 0 * Desc],
	["RH_30Rnd_556x45_M855A1", 0],
	["----------------------------------", 0],
	["R3F_HK416M", 0], // SBR9 (Hk416)
	["R3F_30Rnd_556x45_HK416", 0], // hk416 Mag
	["----------------------------------", 0],
	["R3F_HK416M_DES", 000], // SBR9 (Hk416)
	["R3F_30Rnd_556x45_HK416", 0], // hk416 Mag
	["----------------------------------", 0],
	["R3F_FRF2_DES", 0], // FRF2
	["R3F_0Rnd_762x51_FRF2", 0], // FRF2 Mag
	["----- Accesorios -----", 0],
	["bipod_01_F_snd"            , 0],
	["optic_Aco"                 , 0],
	["optic_Holosight_smg"       , 0],
	["optic_Yorris"              , 0],
	["optic_AMS",           0],
	["optic_Arco",          0],
	["optic_DMS",           0],
	["optic_ERCO_snd_F",    0],
	["optic_KHS_old",       0],
	["optic_LRPS_ghex_F",   0],
	["optic_SOS",           0],
	["optic_LRPS",    		0],
	["optic_MRCO",          0],
	["pop_c4", 				0]
];

_tiendaLVL2 = [ //NADA
	["----- Armas Donadores -----", 0],
	["mochila_grande", 0 * Desc],
	["RH_m9c", 00],
	["RH_15Rnd_9x19_M9", 0 * Desc], // BERETTA Mag
	["RH_bullb", 00], // TAURUS MODDEADA
	["RH_6Rnd_454_Mag", 0 * Desc], // Taurus Mag
	["TRYK_V_harnes_TAN_L", 0 * Desc],
	["chakFNP90_50rnd_skin1", 0 * Desc],
	["chakFNP90_50rnd_skin5", 0 * Desc],
	["chakFNP90_50rnd_skin0", 0 * Desc],
	["chakFNP90_50rnd_skin23", 0 * Desc],
	["chakFNP90_50rnd_skin28", 0 * Desc],
	["chakFNP90_550rnd_skin48", 0 * Desc],
	["chakFNP90_50rnd_skin49", 0 * Desc],
	["chakFNP90_50rnd_skin52", 0 * Desc],
	["chakFNP90_50rnd_skin53", 0 * Desc],
	["chakFNP90_50rnd_skin54", 0 * Desc],
	["chakFNP90_57x28_B_skin1", 0 * Desc]
];
_tiendaLVL3 = [ //NADA

	["----- Explosivos -----", 0],
	["pop_c4", 				0],
	["----------------------------------", 0],
	["pop_molotov", 		0],
	["----------------------------------", 0]

];	
_tiendaLVLdonadores = [ //NADA
	["----- Mochilas Donadores -----", 0],
	["mochila_grande", 0 * Desc],
	["B_Hello_Kitty", 0 * Desc],
	["", 0],
	["----- Ropa Donadores -----", 0],
	["U_C_Polo_Barcelona", 0 * Desc],
	["U_O_R_Gorka_01_black_F", 0 * Desc],
	["TRYK_U_denim_hood_blk", 0 * Desc],
	["TRYK_U_denim_jersey_blk", 0 * Desc],
	["U_B_GEN_Commander_F", 0 * Desc],
	["", 0],
	["----- Chalecos Donadores -----", 0],
	["pop_chaleco_cmd_cmd_11", 0 * Desc],
	["pop_chaleco_cmd_cmd_13", 0 * Desc],
	["pop_chaleco_cmd_cmd_14", 0 * Desc],
	["pop_chaleco_cmd_cmd_16", 0 * Desc],
	["pop_chaleco_cmd_cmd_23", 0 * Desc],
	["pop_chaleco_cmd_cmd_47", 0 * Desc],
	["pop_chaleco_cmd_cmd_55", 0 * Desc],
	["pop_chaleco_cmd_cmd_57", 0 * Desc],
	["", 0],
	["----- Armas Donadores -----", 0],
	["RH_ttracker_g", 0 * Desc],
	["RH_6Rnd_45ACP_Mag", 0 * Desc],
	["----------------------------------", 0],
	["RH_p226s", 0 * Desc],
	["RH_15Rnd_9x19_SIG", 0 * Desc],
	["----------------------------------", 0],
	["RH_g19", 0 * Desc],
	["RH_17Rnd_9x19_g17", 0 * Desc],
	["----------------------------------", 0],
	["", 0]

];
// ---------------------------------------------------------------------------
_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 07);
	_nivel = "tir" call ica_fnc_expToLevel;
	


	if (_nivel >= 0)  then { _arrayTienda append _tiendaLVLdonadores };
	
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
	_lista = (_ui displayCtrl 07);
	_boton = (_ui displayCtrl 06);
	_idxLista = lbCurSel 07;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call climent_fnc_tiendaRebelde;
	';
};

if (_param isEqualTo "compro") exitWith {
	_cosa = _this select 1;
	_precio = _this select 2;

	private "_fuera";
	//if (_cosa isEqualto "Vete a aprender la rama de rebelde a universidad que pareces gilipollas...!") exitWith {hint "¿Que intentas comprar? Ya te he dicho que te largues.";closeDialog 0;};
	if (_precio > vicio_din) exitWith {hint "Vete a sacar perras a un cajero puto pobre."; };	

	/* // va raro
	if !(isClass (configFile >> "CfgVehicles" >> _cosa)) then { // si no es veh, pregunta si te cabe en el inventario
		if !(player canAdd _cosa ) exitWith {hint "Haz hueco en la mochila majete"; _fuera = true; };
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
	if (_cosa isEqualTo "A3L_SuicideVest") then {[] spawn ica_fnc_comprarChalecoBomba};
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

