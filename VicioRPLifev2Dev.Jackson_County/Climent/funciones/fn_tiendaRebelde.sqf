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
	["----- Mochilas-----", 0],
	["PGS_mochila_mediana", 2000 * Desc],
	["", 0],	
	["----- Gorros / Mascaras-----", 0],
	["H_Bandanna_surfer_blk", 1000 * Desc],
	["H_Booniehat_taiga", 1000 * Desc], 
	["H_Hat_brown", 1000 * Desc], 
	["pop_mascara_22", 1000 * Desc], 
	["pop_mascara_26", 1000 * Desc],
	["pop_mascara_7", 1000 * Desc], 
	["H_Shemag_olive", 1000 * Desc],
	["H_ShemagOpen_tan", 1000 * Desc], 
	["H_Hat_Tinfoil_F", 1000 * Desc], 
	["", 0],
	["----- Gafas / Balaclavas -----", 0],
	["G_Bandanna_beast", 1000 * Desc],
	["G_EWK_Glasses_Cig6", 1000 * Desc], 
	["G_EWK_Glasses_Shemag_tan_Cig6", 1000 * Desc], 
	["G_Balaclava_lowprofile", 1000 * Desc], 
	["Payday_Cagoule", 1000 * Desc],
	["", 0],
	["----- Ropa -----", 0],
	["CHAQUETANEGRA_Pop", 1000 * Desc],
    ["CHAQUETAMARRON_Pop", 1000 * Desc], 
	["rds_uniform_citizen1", 1000 * Desc],
	["U_BG_Guerilla3_1", 1000 * Desc],
	["U_C_E_LooterJacket_01_F", 1000 * Desc],
	["U_Marshal", 1000 * Desc],
	["TRYK_U_B_PCUGs_BLK_R", 1000 * Desc],
	["TRYK_shirts_DENIM_BK_Sleeve", 1000 * Desc],
	["TRYK_U_pad_hood_Cl_blk", 1000 * Desc],
	["", 0],
	["----- Chalecos -----", 0],
	["V_Chestrig_rgr", 2000 * Desc],
	["k_rebel_5", 8000 * Desc],
	["", 0],
	["----- Pistolas -----", 0],
	["RH_ttracker", 40000],
	["RH_6Rnd_45ACP_Mag", 500],
	["----------------------------------", 0],
	["RH_p226", 45000 * Desc],
	["RH_15Rnd_9x19_SIG", 500 * Desc],
	["----------------------------------", 0],
	["RH_cz75", 45000 * Desc],
	["RH_16Rnd_9x19_CZ", 500 * Desc],
	["----------------------------------", 0],
	["RH_g17", 50000 * Desc],
	["RH_17Rnd_9x19_g17", 500 * Desc],
	["----------------------------------", 0],
	["", 0]
	
];
_tiendaLVL2 = [ //NADA
	["----- Mochilas-----", 0],
	["PGS_mochila_mediana", 2000 * Desc],
	["", 0],	
	["----- Chalecos -----", 0],
	["hk_rebel_11", 5000 * Desc],
	["hk_rebel_18", 5000 * Desc],
	["k_nhrebel_9", 5000 * Desc],
	["", 0],
	["----- Pistolas -----", 0],
	["RH_python", 40000],
	["RH_6Rnd_357_Mag", 500],
	["----------------------------------", 0],
	["RH_fn57_t", 50000 * Desc],
	["RH_20Rnd_57x28_FN", 500 * Desc],
	["----------------------------------", 0],
	["", 0]	

];
_tiendaLVL3 = [ //NADA

	["----- Explosivos -----", 0],
	["pop_c4", 				75000],
	["----------------------------------", 0],
	["pop_molotov", 		40000],
	["----------------------------------", 0],
	["", 0],	
	["----- Materiales Crafteo -----", 0],
	["pop_R_monster", 				50],
	["----------------------------------", 0],
	["pop_silicio", 				10000],
	["----------------------------------", 0],
	["pop_cristal", 				10000],
	["----------------------------------", 0],
	["pop_paneldecristal", 				10000],
	["----------------------------------", 0],
	["pop_botella", 				10000],
	["----------------------------------", 0],
	["pop_lingotehierro", 				10000],
	["----------------------------------", 0],
	["pop_granlingote", 				10000],
	["----------------------------------", 0],
	["pop_componentes", 				10000],
	["----------------------------------", 0],
	["pop_polvora", 				10000],
	["----------------------------------", 0],
	["", 0]	

];	
_tiendaLVLdonadores = [ //NADA
	["----- Mochilas Donadores -----", 0],
	["mochila_grande", 2000 * Desc],
	["B_Hello_Kitty", 2000 * Desc],
	["", 0],
	["----- Ropa Donadores -----", 0],
	["U_C_Polo_Barcelona", 2000 * Desc],
	["U_O_R_Gorka_01_black_F", 2000 * Desc],
	["TRYK_U_denim_hood_blk", 2000 * Desc],
	["TRYK_U_denim_jersey_blk", 2000 * Desc],
	["U_B_GEN_Commander_F", 2000 * Desc],
	["", 0],
	["----- Chalecos Donadores -----", 0],
	["pop_chaleco_cmd_cmd_11", 5000 * Desc],
	["pop_chaleco_cmd_cmd_13", 5000 * Desc],
	["pop_chaleco_cmd_cmd_14", 5000 * Desc],
	["pop_chaleco_cmd_cmd_16", 5000 * Desc],
	["pop_chaleco_cmd_cmd_23", 5000 * Desc],
	["pop_chaleco_cmd_cmd_47", 5000 * Desc],
	["pop_chaleco_cmd_cmd_55", 5000 * Desc],
	["pop_chaleco_cmd_cmd_57", 5000 * Desc],
	["", 0],
	["----- Armas Donadores -----", 0],
	["RH_ttracker_g", 40000 * Desc],
	["RH_6Rnd_45ACP_Mag", 500 * Desc],
	["----------------------------------", 0],
	["RH_p226s", 45000 * Desc],
	["RH_15Rnd_9x19_SIG", 500 * Desc],
	["----------------------------------", 0],
	["RH_g19", 50000 * Desc],
	["RH_17Rnd_9x19_g17", 500 * Desc],
	["----------------------------------", 0],
	["", 0]

];
// ---------------------------------------------------------------------------
_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_nivel = "tir" call ica_fnc_expToLevel;
	


	if (_nivel == 0)  then { _arrayTienda append _tiendaLVL0 };
    if (_nivel >= 1) then { _arrayTienda append _tiendaLVL1 };
    if ((_nivel >= 1) and (license_civ_donator)) then { _arrayTienda append _tiendaLVLdonadores };
    if (_nivel >= 2) then { _arrayTienda append _tiendaLVL2 };
    if (_nivel >= 3) then { _arrayTienda append _tiendaLVL3 };
	
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

	/* ["Dinero",format [
	"%1 - (%2) ha comprado %6 por %3€  - Dinero en banco : %4€ - Dinero en mano %5€ (Tienda mafia)",
	 profileName,
	(getPlayerUID player),
	_precio,
	vicio_atmdin,
	vicio_din,
	_cosa
	]
	] remoteexeccall ["ica_fnc_customlog",2]; */

	/* SISTEMA DE LOGS DE VILLAS */
	Villas_EnviarLogDinero = format [":dollar:  El usuario **%1** (%2) ha comprado `%3` por `%4` - Dinero en mano: %5 / Dinero en banco: %6 - `Tienda Rebelde`", profileName, (getPlayerUID player), _cosa, _precio, vicio_din, vicio_atmdin];
    publicVariableServer "Villas_EnviarLogDinero";
	
};

