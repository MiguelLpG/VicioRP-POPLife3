#include <macro.h>
/*
Tienda de la terrorista
by: Icaruk

	["menu"] call ica_fnc_tiendaterrorista;
*/

_param = _this select 0;

_tiendaLVL0 = [
	["Si no te inmolas no eres bienvenido", 0]
];
_tiendaLVL1 = [
	["----- Boinas Exclusivas ----", 0],
	//["Force_Beret", 1000],
	["gnv_Beret2", 1000],
	["----- Ropa -----", 0],
	["U_Afghan01", 5000],
    ["U_Afghan01NH", 5000],
	["U_Afghan02", 5000],
	["U_Afghan02NH", 5000],
	["U_Afghan03", 5000],
	["U_Afghan03NH", 5000],
	["U_Afghan04", 5000],
	["U_Afghan05", 5000],
	["U_Afghan06", 5000],
	["TAC_SF10H", 1000 ],
	["TRYK_H_woolhat", 1000],
	["TRYK_H_woolhat_br", 1000],
	["TRYK_H_woolhat_cu", 1000],
	["TRYK_H_woolhat_CW", 1000],
	["TRYK_H_woolhat_tan", 1000],
	["TRYK_H_woolhat_WH", 1000],
	["KAEL_SUITS_BR_F15", 3000],
    ["KAEL_SUITS_BR_F16", 3000],
	["KAEL_SUITS_BR_F26", 3000],
	["KAEL_SUITS_BR_F30", 3000],
	["KAEL_SUITS_BR_F34", 3000],
	["TRYK_U_B_BLKBLK_CombatUniform", 3000],
	["TRYK_U_B_BLKBLK_R_CombatUniform", 3000],
	["TRYK_U_B_BLKTAN_CombatUniform", 3000],
	["TRYK_U_B_fleece", 3000],
	["TRYK_U_B_GRTAN_CombatUniform", 3000],
	["TRYK_U_B_GRYOCP_CombatUniform", 3000],
	["TRYK_U_B_PCUHs", 3000],
	["TRYK_U_B_PCUGHs", 3000],
	["TRYK_U_B_PCUGs_BLK_R", 3000],
	["TRYK_U_B_PCUGs_gry_R", 3000],
	["U_Afghan06NH", 5000],
	["----- Ropa Exclusiva ----", 0],
	//["uniforme_force", 3000],
	//["uniforme_force_remangado", 3000],
	["uniforme_genov", 3000],
	["uniforme_genov_remangado", 3000]
	//["uniforme_los_zetas", 3000],	
	//["uniforme_los_zetas_remangado", 3000]
];
_tiendaLVL2 = [
	["----- Chalecos -----", 0],
	["k_hrebel_1", 5500],
	["V_Chestrig_blk", 5000],
	["V_PlateCarrier2_rgr", 5000],
	["V_PlateCarrierIA2_dgtl", 5000],
	["V_BandollierB_khk", 5000],
	["V_TacVestIR_blk", 5000],
	["V_TacVest_camo", 5000],
	["V_PlateCarrierSpec_rgr", 20000],
	["V_PlateCarrier_Kerry", 20000],
    ["V_PlateCarrierH_CTRG", 20000],
	["----- Chaleco Invisible-----", 0],
	["CG_SERT_Vests", 8000],
	["----- Chaleco Donadores-----", 0],
	//["chaleco_forcerp", 8000],
	//["chaleco_loszetas", 8000],
	["chaleco_gnv", 8000],
	["----- Mochilas -----", 0],
	["B_Parachute", 10000],
	["mochila_mediana", 3000]
];
_tiendaLVL3 = [
	["----- Pistolas -----", 0],
	["RH_m9", 30000],
	//["RH_m9c", 30000],
	["RH_15Rnd_9x19_M9", 500],
	["----------------------------------", 0],
	["RH_python", 20000],
	["RH_6Rnd_357_Mag", 500],
	["----------------------------------", 0],
	["RH_g17", 20000],
	["RH_17Rnd_9x19_g17", 500],
	["----------------------------------", 0],
	["RH_gsh18", 20000],
	["RH_18Rnd_9x19_gsh", 500],
	["----------------------------------", 0],
	["RH_g18", 30000],
	["RH_19Rnd_9x19_g18", 500],
	["RH_33Rnd_9x19_g18", 500],
	["----------------------------------", 0],
	["RH_mak", 15000],
	["RH_8Rnd_9x18_Mak", 500],
	["----------------------------------", 0],
	["RH_mp412", 30000],
	["RH_6Rnd_357_Mag", 500],
	["----------------------------------", 0],
	["RH_mk2", 25000],
	["RH_10Rnd_22LR_mk2", 500],
	["----------------------------------", 0],
	["RH_bull", 30000],
	["RH_6Rnd_454_Mag", 500],
	["----------------------------------", 0],
	["RH_tec9", 25000],
	["RH_32Rnd_9x19_tec", 500],
	["----------------------------------", 0],
	["hgun_007_SW_M10_gold", 30000],
	["6Rnd_45ACP_Cylinder", 500],
	["----------------------------------", 0],
	["RH_Deagleg", 35000],
	["RH_Deagles", 35000],
	["RH_Deaglem", 35000],
	["RH_deagle", 35000],
	["RH_7Rnd_50_AE", 500],
	["optic_Yorris", 2500],
	["----------------------------------", 0],
	["RH_vp70", 70000],
	["RH_18Rnd_9x19_VP", 500]
];
_tiendaLVL4 = [
	["----- Subfusiles Nº1 -----", 0],
	["RH_muzi", 50000],
	["RH_30Rnd_9x19_UZI", 700],
	["----------------------------------", 0],
	["hlc_smg_mp5k", 55000],
	["hlc_30Rnd_9x19_B_MP5", 700],
	["RH_LTdocterl", 3200],
	["hlc_muzzle_Tundra", 3200],
	["----------------------------------", 0],
	["pop_thomson",50000],
	["pop_thomson_45",700],
	["pop_thomson_9x19",700],
	["----------------------------------", 0],
	["hlc_smg_mp510", 55000],
	["hlc_30Rnd_10mm_B_MP5", 700],
	["hlc_30Rnd_10mm_JHP_MP5", 700]
];
_tiendaLVL5 = [
	["----- Subfusiles Nº2 -----", 0],
	["C1987_MP7_ucp", 70000],
	["C1987_40Rnd_46x30_mp7", 800],
	["----------------------------------", 0],
	["C1987_MP7_folded2", 70000],
	["C1987_40Rnd_46x30_mp7", 800],
	["----------------------------------", 0],
	["C1987_MP7_nwu", 70000],
	["C1987_40Rnd_46x30_mp7", 800],
	["----------------------------------", 0],
	["AG_MP9_peq", 75000],
	["30Rnd_45ACP_Mag_SMG_01", 800],
	["----------------------------------", 0],
	["chakFNP90_50rnd_skin1", 75000],
	["chakFNP90_57x28_B_skin1", 800],
	["----------------------------------", 0],
	["AG_MP9_wcam", 75000],
	["30Rnd_45ACP_Mag_SMG_01", 800]
];
_tiendaLVL6 = [
	["----- Vehículos -----", 0],
	["Mercedes_Pullman_negra", 830000],
	["POP_jeep_blinde_negro", 800000],
	["POP_jeep_blinde_negro_mate", 800000],
//	["pop_cherokee_negro", 855000],
//	["pop_cherokee_negro_mate", 865000], 
	["pop_lincoln_negro", 835000]
];
_tiendaLVL7 = [
	["----- Carabinas -----", 0],
	["hlc_rifle_ak12", 89000],
	["hlc_rifle_aek971worn", 91000],
	["hlc_30Rnd_545x39_B_AK", 900]
];
_tiendaLVL8 = [
	["----- Fusiles de asalto -----", 0],
	["hlc_rifle_aks74", 127000],
	["hlc_rifle_aks74u", 128000],
	["hlc_rifle_aku12", 130000],
	["hlc_30Rnd_545x39_B_AK", 900],
	["----------------------------------", 0],
	["Cha_AK74", 139000],
	["Cha_AK107", 139000],
	["Cha_AKS74U", 139000],
	["Cha_30Rnd_545x39_AK", 900],
	["----- Explosivos -----", 0],
	//["DemoCharge_Remote_Mag", 50000],
	["A3L_SuicideVest", 250000],
	["----- Accesorios -----", 0],
	["optic_AMS_snd",       15000],
	["optic_AMS_khk",       15000],
	["optic_AMS",           15000],
	["optic_Arco",          15000],
	["optic_Arco_ghex_F",   15000],
	["optic_Arco_blk_F",    15000],
	["optic_DMS",           15000],
	["optic_DMS_ghex_F",    15000],
	["optic_ERCO_snd_F",    15000],
	["optic_ERCO_khk_F",    15000],
	["optic_ERCO_blk_F",    15000],
	["optic_KHS_hex",       15000],
	["optic_KHS_blk",       15000],
	["optic_KHS_tan",       15000],
	["optic_KHS_old",       15000],
	["optic_LRPS_ghex_F",   25000],
	["optic_SOS",           15000],
	["optic_SOS_khk_F",     15000],
	["optic_LRPS",    		25000],
	["optic_MRCO",          15000]
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
	 ctrlSetText [5005, "\pop_iconos\paa\tiendaterrorista.paa"];
	_lista = (_ui displayCtrl 5007);
	_nivel = "maf" call ica_fnc_expToLevel;
	_bd = call terrorista;

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
	if (_cosa isEqualTo "A3L_SuicideVest") then {[] spawn life_fnc_comprarChalecoBomba;};
	hint format ["Has comprado %1 por %2€", _cosa, _precio];
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	
	["Dinero",format [
	"%1 - (%2) ha comprado %6 por %3€  - Dinero en banco : %4€ - Dinero en mano %5€ (Tienda terro)",
	 profileName,
	(getPlayerUID player),
	_precio,
	vicio_atmdin,
	vicio_din,
	_cosa
	]
	] remoteexeccall ["ica_fnc_customlog",2];
	
};

