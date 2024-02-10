
/*
by: Icaruk

	["menu"] call ica_fnc_tiendaPolicia;
	Rellenada por Juan :D

*/

_param = _this select 0;

_tiendaLVL0 = [
	["No estoy autorizado a suministrarte equipamiento Policial", 0]
];

If ( side player != west ) exitWith { hint "No estoy autorizado a suministrarte equipamiento Policial"; };

_tiendaComun = [
	["----- Equipamiento Básico -----", 0],
	["pop_porra_h",50],
	["CSW_M26C",50],
	["CSW_Taser_Probe_Mag",5],
	["Binocular",50],
	["pop_linterna",50],
	["", 0],
	["", 0],
	["----- Señalización Tráfico -----", 0],
	["pop_tetrapodo_i",10],
	["pop_tetrapodo_x3_i",10],
	["pop_tetrapodo_x5_i",10],
	["pop_tetrapodo_x7_i",10],
	["POP_banda_i",10],
	["POP_electroflare_i",10],
	["POP_senal_alcoholemiagc_i",10],
	["POP_senal_control_policia_i",10],
	["POP_senal_izquierda_i",10],
	["POP_senal_derecha_i",10],
	["POP_senal_stop_i",10],
	["POP_senal_estrechamiento_i",10],
	["POP_senal_velocidad20_i",10],
	["POP_senal_velocidad40_i",10],
	["POP_BandaClavos_i",10],
	//["NVGoggles",6000],	
	["", 0],
	["----- Gafas y esas cosas -----", 0],
	["G_Shades_Black",50],
	["G_Shades_Blue",50],
	["G_Sport_Blackred",50],
	["G_Sport_Checkered",50],
	["G_Sport_Blackyellow",50],
	["G_Sport_BlackWhite",50],
	["G_Aviator",50],
	["G_Squares",50],
	["G_Lowprofile",50],
	["G_Combat",50],
	["G_Diving",50],
	["", 0]
];
_tiendaLVL1 = [
	["-----> Cadete <-----", 0],
	["", 0], 
	["----- Pistolas -----", 0],
	["RH_g17", 100],
	["RH_17Rnd_9x19_g17", 10],
	["RH_cz75", 100],
	["RH_16Rnd_9x19_CZ", 10],
	["", 0] // esto es un espacio
];
_tiendaLVL2 = [
	["-----> Agente <-----", 0],
	["", 0], 
	["----- Pistolas -----", 0],
	["RH_m9", 100],
	["RH_15Rnd_9x19_M9", 10],
	["RH_g19", 100],
	["RH_19Rnd_9x19_g18", 10],
	["RH_fnp45", 100],
	["RH_15Rnd_45cal_fnp", 10],
	["----- Subfusiles -----", 0],
	["hlc_smg_mp5a2", 100],
	["hlc_30Rnd_9x19_GD_MP5", 100],
	["hlc_30Rnd_9x19_SD_MP5", 100],
	["hlc_30Rnd_9x19_B_MP5", 100],
	["----- Visores y accesorios -----", 0],
	["iansky_deltapoint", 25],
    ["RH_M6X", 25],
	["RH_X2", 25],
	["RH_X300", 25],
	["", 0]
];
_tiendaLVL3 = [
	["-----> Cabo <-----", 0],
	["", 0], 
	["----- Pistolas -----", 0],
	["RH_p226", 100],
	["RH_15Rnd_9x19_SIG", 10],
	["----- Subfusiles -----", 0],
	["hlc_smg_mp5a4", 250],
	["hlc_30Rnd_9x19_GD_MP5", 10],
	["hlc_30Rnd_9x19_SD_MP5", 10],
	["hlc_30Rnd_9x19_B_MP5", 10],
	["KA_MP7_Rifle_Black_20Rnd", 250],
	["KA_20Rnd_46x30_FMJ", 10],
	["----- Visores y accesorios -----", 0],
	["FHQ_optic_AC12136", 25],
	["iansky_cmore", 25],
	["", 0]
];
_tiendaLVL4 = [
	["-----> Sargento <-----", 0],
	["", 0], 	
	["----- Pistolas -----", 0],
	["RH_usp", 100],
	["RH_12Rnd_45cal_usp", 10],
	["RH_uspm", 100],
	["RH_16Rnd_40cal_usp", 10],
	["----- Subfusiles -----", 0],
	["hlc_smg_mp510", 300],
	["hlc_30Rnd_10mm_B_MP5", 10],
	["SmokeShell",  20],
	["----- Visores y accesorios -----", 0],
	["KA_MP7_Laser_IR", 100],
	["iansky_rx01", 100],
	["FHQ_acc_LLM01F", 100],
	["", 0]
];
_tiendaLVL5 = [
	["-----> Sargento Mayor <-----", 0],
	["", 0], 
	["----- Pistolas -----", 0],
	["R3F_PAMAS", 100],
	["R3F_15Rnd_9x19_PAMAS", 10],
	["----- Rifles de asalto -----", 0],
	["hlc_rifle_hk53RAS", 1000],
	["hlc_30rnd_556x45_b_HK33", 10],
	["hlc_rifle_G36KA1", 1000],
	["hlc_30rnd_556x45_EPR_G36", 10],
   	["R3F_HK416M_HG", 1000],
    ["R3F_30Rnd_556x45_HK416", 10],
	["----- Visores -----", 0],
	["iansky_specterdrkf_2D", 25],
	["FHQ_acc_LLM01F", 25],
	["R3F_SILENCIEUX_HK416", 25],
	["R3F_POINTEUR_SURB", 25],
	["R3F_J4", 25],
	["HLC_Optic_G36Dualoptic15x2d", 10],
	["", 0]
];
_tiendaLVL6 = [
	["-----> Teniente <-----", 0],
	["", 0], 
	["----- Pistolas -----", 0],
	["RH_fn57", 100],
	["RH_20Rnd_57x28_FN", 10],
	["KA_MP7_Pistol_Black_20Rnd", 200],
	["KA_20Rnd_46x30_FMJ", 10],
	["----- Rifles de asalto -----", 0],
	["hlc_rifle_G36C", 12000],
	["hlc_rifle_G36A1", 12000],
	["hlc_rifle_G36KA1", 12000],
	["hlc_rifle_G36KV", 12000],
	["SG553_CQB", 12000],
	["30Rnd_56x45_GP90", 10],
	["SMG_03C_black", 1500],
	["30Rnd_570x28_SMG_03", 10],
	["hlc_30rnd_556x45_EPR_G36", 10],
	["HLC_Optic_G36Dualoptic15x2d", 175],
	["HLC_Optic_G36dualoptic35x2d", 175],
	["optic_MRCO", 175],
	["optic_Aco_smg", 175],
	["----- Solo GEOS -----", 0],
	["----- Subfusiles -----", 0],
	["SMG_03_black", 1500],
	["50Rnd_570x28_SMG_03", 10],
	["SMG_03C_black", 1500],
	["50Rnd_570x28_SMG_03", 10],
	["hlc_smg_mp5sd5", 2000],
	["hlc_30Rnd_9x19_SD_MP5", 10],
	["----- Especial -----", 0],
	["U_bombsuit", 1200],
	["CUP_hgun_BallisticShield_Armed", 1200],
	["CUP_15Rnd_9x19_M9", 10],
	["CUP_glaunch_6G30", 15000],
	["CUP_1Rnd_SMOKE_GP25_M", 150],
	["SmokeShell",  20],
	["----- Rifles de asalto -----", 0],
	["hlc_rifle_G36E1", 12000],
	["hlc_rifle_G36KA1", 12000],
	["hlc_rifle_G36C", 12000],
	["hlc_rifle_G36KV", 12000],
	["hlc_30rnd_556x45_EPR_G36", 10],
	["SG553", 12000],
	["SG553_CQB", 12000],
	["30Rnd_56x45_GP90", 10],
	["----- Rifles de francotirador -----", 0],
	["hlc_rifle_G36V", 15000],
	["hlc_rifle_G36TAC", 15000],
	["hlc_30rnd_556x45_EPR_G36", 10],
	["hlc_rifle_hk33a2RIS", 15000],
	["hlc_30rnd_556x45_b_HK33", 10],
	["R3F_HK417L", 15000],
	["R3F_20Rnd_762x51_HK417", 15000],
	["hlc_rifle_psg1", 20000],
	["hlc_rifle_PSG1A1_RIS", 20000],
	["hlc_20rnd_762x51_b_G3", 10],
	["----- Visores y accesorios -----", 0],
	["----- Silenciadores -----", 0],
	["hlc_muzzle_Tundra", 150],
	["hlc_muzzle_Agendasix10mm", 150],
	["muzzle_snds_570", 150],
	["KA_MP7_Silencer", 150],
	["hlc_muzzle_556NATO_KAC", 150],
	["hlc_muzzle_snds_HK33", 150],
	["R3F_SILENCIEUX_HK417", 150],
	["muzzle_snds_btrotex556", 150],
	["bipod_02_F_blk", 150],
	["R3F_BIPIED_HK417", 150],
	["----- Visores -----", 0],
	["optic_Aco_smg", 175],
	["optic_MRCO", 175],
	["optic_Hamr", 175],
	["iansky_specterdr_2d", 175],
	["iansky_specterdrkf_2D", 175],
	["FHQ_optic_HWS_G33", 175],
	["iansky_nfbeast", 175],
	["HLC_Optic_G36Dualoptic15x2d", 175],
	["HLC_Optic_G36dualoptic35x2d", 175],
	["R3F_NF", 175],
	//["RH_M4A6", 12000],
	//["RH_m110sd", 20000],
	["", 0]
];

_tiendaRopaCivil = [
	["----- Ropa de civil (Solo Policía de Incognito y UDEV) -----", 0],
	["TRYK_U_B_PCUGs_OD", 30],
	["CUP_U_I_GUE_Anorak_01", 30],
	["A3L_CivShirtBillabong2", 30],
	["CUP_U_C_Citizen_01", 30],
	["A3L_CivShirtHollister", 30],
	["KAEL_SUITS_BR_F12", 30],
	["CUP_O_TKI_Khet_Jeans_02", 30],
	["A3L_Lacoste_T", 30],
	["A3L_CivShirtNikeDoIt", 30],
	["POP_Metro", 30],
	["CUP_U_C_Profiteer_02", 30],
	["CUP_U_C_Rocker_02", 30],
	["CUP_U_O_RUS_Gorka_Green", 30],
	["CUP_U_O_SLA_Overalls_Pilot", 30],
	["TRYK_U_B_BLK_Tshirt", 30],
	["TRYK_U_B_AOR2_Rollup_CombatUniform", 30],
	["TRYK_shirts_DENIM_BK_Sleeve", 30],
	["TRYK_U_denim_hood_nc", 30],
	["POP_Cowboy_hat", 30],
	["ALE_H_NewEra_Black", 30],
	["H_Hat_grey", 30],
	["H_StrawHat_dark", 30],
	["TRYK_H_Bandana_wig", 30],
	["TRYK_R_CAP_BLK", 30],
	["", 0]
];


_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaPoli";
	_ui = uiNameSpace getVariable "tiendaPoli";
	//ctrlSetText [5005, "\pop_iconos\paa\tiendaPolicia.paa"];
	_lista = (_ui displayCtrl 5007);
	_nivel = call life_coplevel;

	if (_nivel >= 1) then {
		_arrayTienda append _tiendaComun;
	};

	switch (_nivel) do {
		case 0: {
			_arrayTienda append _tiendaLVL0;
		};
		case 1: {
			_arrayTienda append _tiendaLVL1;
		};
		case 2: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
		};
		case 3: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
		};
		case 4: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
		};
		case 5: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaRopaCivil;
		};
		case 6: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaLVL6;
			_arrayTienda append _tiendaRopaCivil;
		};
		case 7: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaLVL6;
			_arrayTienda append _tiendaRopaCivil;
		};
		case 8: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaLVL6;
			_arrayTienda append _tiendaRopaCivil;
		};
	};

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
	_ui = uiNameSpace getVariable "tiendaPoli";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call ica_fnc_tiendaPolicia;
	';
};

//////////////
if (_param isEqualTo "compro") then {
    if (isNil {autoclick}) then {
        autoclick = 0;
        [] spawn {sleep 1; autoclick = nil};
    };
    autoclick = autoclick + 1;
};
if !(isNil {autoclick}) then {
    _fuera = false;
    if (autoclick > 13) exitWith {
        player setDamage 1;
        _fuera = true;
    };
    if (_fuera) exitWith {};
};
////////////////

if (_param isEqualTo "compro") exitWith {
	_cosa = _this select 1;
	_precio = _this select 2;

	if (_precio > vicio_din) exitWith {hint "No hay nada gratis."; };
	if !(isClass (configFile >> "CfgVehicles" >> _cosa)) then { // si no es veh, pregunta si te cabe en el inventario
		if !(player canAdd _cosa ) exitWith {hint "No tienes suficiente espacio"; fuera = true; };
	};
	if (!isNil {fuera}) exitWith {fuera = nil};

	vicio_din = vicio_din - _precio;
	if (isNil {vicio_din}) then {vicio_din = 0};

	if (isClass (configFile >> "CfgVehicles" >> _cosa)) then {
		private "_mrk"; // ¿qué marcador tengo más cerca?
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3"] call ica_fnc_masCercano;

		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil "_veh"};
		_veh allowDamage false;
		_veh lock 2;
		_veh setVectorUp (surfaceNormal (getMarkerPos _mrk));
		_veh setDir (markerDir _mrk);
		_veh setPos (getMarkerPos _mrk);
		[[_veh,1],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
		[_veh] call life_fnc_clearVehicleAmmo;
		[[_veh,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		[[_veh,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		_veh disableTIEquipment true;
		_veh allowDamage true;

		life_vehicles pushBack _veh;
		[[getPlayerUID player,playerSide, _veh, 1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;
		[[(getPlayerUID player),playerSide, _veh, 0],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
		[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently
		closeDialog 0;
		hint format ["Has comprado %1 por %2€", _cosa, _precio];
	} else {
		[_cosa] call ica_fnc_item;
	};
};