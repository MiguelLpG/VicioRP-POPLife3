
/*


*/

_param = _this select 0;

switch (_param) do {
	// Compra
	case "Tienda general": { ["ToolKit","ItemGPS","Binocular","pop_note","pop_iphone","pop_nokia","pop_vendas_c","ItemMap","pop_armariop","pop_portatil","cl_axe","cl_pick_axeweap","pop_Ganzua","pop_linterna","cl_picket_rtp","cl_picket_mlnw","cl_picket_ftp", "cl_shovel"]	};
	case "Tienda de taxista": { ["Binocular","ItemGPS","ToolKit"] };
	case "Paqueteria correos": { ["pop_correos"] };
	case "Tienda del periodista": { ["Press_Mic_AAN_F","Tv_Camera","Press_Mic_CNN_F","ItemGPS","ToolKit","POPTV_Pop","H_Cap_press","V_Press_F"] };
	case "Tienda de los chinos": { ["pop_P_Barbacoa","pop_P_Queso","pop_P_Originales","pop_R_Pepsi","pop_R_Superstar","pop_R_Pepper","pop_pringles","pop_H_Fresa","pop_alcohol"] };
	case "super": { ["pop_G_Chocolate","pop_G_Oreo","pop_G_Ahoy","pop_R_Pepsi","pop_R_Superstar","pop_R_Pepper","pop_H_Fresa","ToolKit"] };
	case "oldterro": { ["chakFNP90_50rnd_skin54","chakFNP90_57x28_B_skin1","optic_DMS","optic_AMS","R3F_FRF2_DES","R3F_10Rnd_762x51_FRF2","RH_Hk416M","R3F_30Rnd_556x45_HK416","RH_m9","RH_15Rnd_9x19_M9"] };
	case "Economato": { ["pop_P_Clasica","pop_G_Chocolate","pop_R_Naranja","pop_pringles","pop_H_vainilla","pop_kiwi","ToolKit","pop_note","pop_iphone","pop_nokia","ItemMap","ItemGPS","CL_extinguisher"] };
	case "Pizzeria hamburgueseria": { ["pop_cheseburge","pop_pizza","pop_tostada","pop_banana","pop_kiwi","pop_pistacho","pop_apple","pop_R_Pepsi","pop_R_Naranja"] };
	case "Farmacia EMS": { ["pop_bisturi_item","pop_vendas","pop_vendas_c","pop_morfina","pop_epinefrina","pop_tramadol","pop_desfibrilador","pop_bolsadesangre","pop_csi","POP_senal_stop_i","POP_senal_derecha_i","POP_senal_izquierda_i","POP_senal_estrechamiento_i","POP_senal_velocidad20_i","POP_senal_velocidad40_i","POP_banda_i","POP_tetrapodo_i","POP_tetrapodo_x3_i","POP_tetrapodo_x5_i","POP_tetrapodo_x7_i","POP_electroflare_i"] };
	case "Supermercado para polis": { ["pop_P_Oliva","pop_G_Oreo","pop_vendas_c","pop_kiwi","pop_R_7up","pop_portatil","pop_pringles","pop_llaves","pop_H_Napolitana","pop_Ganzua","pop_esposas","ToolKit","pop_note","pop_iphone","pop_nokia","ItemMap","ItemGPS"] };
	case "Tienda chunga": { ["pop_P_Originales","pop_G_Oreo","pop_R_monster","pop_pringles","pop_H_Napolitana","pop_vendas_c","pop_Ganzua","pop_portatil","pop_esposas","pop_llaves","ToolKit","pop_note","pop_iphone","pop_nokia","ItemMap","ItemGPS"] };
	case "Armeria": {	["RH_cz75","RH_16Rnd_9x19_cz", 0,"RH_gsh18","RH_18Rnd_9x19_gsh", 0,"RH_kimber_nw","RH_7Rnd_45cal_m1911", 0,"RH_mak","RH_8Rnd_9x18_Mak", 0,"RH_mk2","RH_10Rnd_22LR_mk2", 0,"RH_mp412","RH_6Rnd_357_Mag", 0,"hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder", 0,"RH_tt33","RH_8Rnd_762_tt33", 0,"RH_ttracker","RH_6Rnd_45ACP_Mag"] };
	case "Armeria 2": { ["RH_cz75","RH_16Rnd_9x19_cz", 0,"RH_gsh18","RH_18Rnd_9x19_gsh", 0,"RH_kimber_nw","RH_7Rnd_45cal_m1911", 0,"RH_mak","RH_8Rnd_9x18_Mak", 0,"RH_mk2","RH_10Rnd_22LR_mk2", 0,"RH_mp412","RH_6Rnd_357_Mag", 0,"hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder", 0,"RH_tt33","RH_8Rnd_762_tt33", 0,"RH_ttracker","RH_6Rnd_45ACP_Mag"] };
	case "Tienda de semillas": { ["pop_rabano_s","pop_bamboo_s","pop_algodon_s","pop_maiz_s","pop_cannabis_s","pop_trigo_s","pop_girasol_s"] };
	case "Tienda de Mecanicos": { ["soplete","pop_granlingote","pop_oxigeno","pop_componentes","ItemGPS","pop_pintura"] };


	// Venta
	case "Planta de reciclaje": { ["pop_basura_item"] };
	case "Wiki Wiki": { ["pop_pez","pop_pez2","pop_pez3","pop_pez4","pop_tiburon"] };
	case "Tienda de tesoros": { ["pop_diamante_t"] };
	case "Pescaderia": { ["pop_pez","pop_pez2","pop_pez3","pop_pez4","pop_tiburon"] };
    case "Tienda de incautaciones": { ["pop_coca_b","pop_efedrina_b","pop_opio_b","pop_cannabis_i","pop_cocaina_f","pop_metanfetamina_f","pop_heroina_f","pop_marihuana_f"] };
};