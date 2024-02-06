#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Departamento Policial - VicioRP"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
		_ret set[count _ret,["","-------- CNP --------",1]];
		_ret set[count _ret,["CNP_Pop","Manga Corta",500]];
		_ret set[count _ret,["CNP2_Pop","Remangado",500]];
		_ret set[count _ret,["CNP3_Pop","Manga Larga",500]];
		_ret set[count _ret,["","-- Especialidades --",1]];
		_ret set[count _ret,["CNP7","Unidad de Asuntos Internos",500]];
		_ret set[count _ret,["GEO_Pop","GEO",500]];
		_ret set[count _ret,["GOES","GOES",500]];
		_ret set[count _ret,["CNP4","UIP",500]];
		_ret set[count _ret,["CNP3","UIP Manga Larga",500]];
		_ret set[count _ret,["UPR_Pop","UPR",500]];
		_ret set[count _ret,["","-------- GC --------",1]];
		_ret set[count _ret,["GC","Manga Corta",500]];
		_ret set[count _ret,["GC2","Remangado",500]];
		_ret set[count _ret,["GC3_Pop","Manga Larga",500]];
		_ret set[count _ret,["","-- Especialidades --",1]];
		_ret set[count _ret,["GCT_Pop","Tráfico Corto",500]];
		_ret set[count _ret,["TRAFICO_Pop","Tráfico Largo",500]];
		_ret set[count _ret,["ATGC2","Tráfico Motorista",500]];
		_ret set[count _ret,["GRS1","GRS Polo",500]];
		_ret set[count _ret,["gar","GAR",500]];
		_ret set[count _ret,["UEI","UEI",500]];
		_ret set[count _ret,["","-------- Otros --------",1]];
		_ret set[count _ret,["U_B_Wetsuit","Uniforme de Buzo",1000]];
    };

	//Hats
	case 1:
	{
			_ret set[count _ret,["H_Beret_blk_POLICE",nil,15]];
			_ret set[count _ret,["Casque_Moto",nil,15]];
			_ret set[count _ret,["H_RacingHelmet_1_green_F",nil,15]];
			_ret set[count _ret,["H_RacingHelmet_1_white_F",nil,15]];
			_ret set[count _ret,["H_RacingHelmet_1_black_F",nil,15]];			
			_ret set[count _ret,["H_Beret_02",nil,15]];
			_ret set[count _ret,["H_Cap_press",nil,15]];
			_ret set[count _ret,["GORRA_CNP",nil,15]];
			_ret set[count _ret,["GORRA_GC",nil,15]];
			_ret set[count _ret,["BOINA1_GC",nil,15]];
			_ret set[count _ret,["GORRA_GC_M",nil,15]];
			_ret set[count _ret,["BOINA_CNP",nil,15]];
			_ret set[count _ret,["BOINA1_CNP",nil,15]];
			_ret set[count _ret,["BOINA_CNP2",nil,15]];
			_ret set[count _ret,["BOINA_CNP3",nil,15]];  
			_ret set[count _ret,["BOINA_GC",nil,15]];
			_ret set[count _ret,["BOINA_GC2",nil,15]];
			_ret set[count _ret,["H_PilotHelmetHeli_B",nil,20]];
			_ret set[count _ret,["POP_tricornio","tricornio",15]];
			_ret set[count _ret,["CASCO_GEO",nil,100]];
			_ret set[count _ret,["CASCO_GEO2",nil,100]];
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,100],
			["G_Shades_Blue",nil,100],
			["G_Sport_Blackred",nil,100],
			["TRYK_kio_balaclava_BLK",nil,100],
			["G_Sport_Checkered",nil,100],
			["G_Sport_Blackyellow",nil,100],
			["G_Sport_BlackWhite",nil,100],
			["G_Aviator",nil,100],
			["G_Squares",nil,100],
			["G_Lowprofile",nil,100],
			["G_Balaclava_blk",nil,100],
			["G_Combat",nil,100],
			["G_Diving",nil,100],
			["G_EWK_Cigar1", "Puro",100 * Desc],
			["G_EWK_Cig1", "Cigarrillo",100 * Desc],
			["G_EWK_Cig2", "Cigarrillo Quemado 1",100 * Desc],
			["G_EWK_Cig3", "Cigarrillo Consumido",100 * Desc],
			["G_EWK_Cig6", "Cigarrillo Quemado Encendido",100 * Desc],
			["G_EWK_Cig4", "Cigarrillo Encendido",100 * Desc],
			["SFG_Tac_ChopsB", "Barba Corta Rubia",100 * Desc],
			["SFG_Tac_ChopsD", "Barba Corta Castaña",100 * Desc],
			["SFG_Tac_ChopsO", "Barba Corta Canosa",100 * Desc],
			["SFG_Tac_smallBeardD", "Barba Mediana Castaña",100 * Desc],
			["SFG_Tac_BeardD", "Barba Larga Castaña",100 * Desc],
			["SFG_Tac_chinlessbD", "Barba & Bigote Castaño",100 * Desc],
			["SFG_Tac_moustacheD", "Bigote Castaño",100 * Desc],
			["TRYK_Beard_BK", "Barba & Perilla Negra Corta",100 * Desc],
			["TRYK_Beard", "Barba & Perilla Castaña 1 Corta",100 * Desc],
			["TRYK_Beard_BK3", "Barba & Perilla Negra Larga",100 * Desc],
			["TRYK_Beard3", "Barba & Perilla Castaña 1 Larga",100 * Desc],
			["TRYK_Beard_BW3", "Barba & Perilla Castaña 2 Larga",100 * Desc],
			["TRYK_Beard_Gr3", "Barba & Perilla Larga",100 * Desc]			
		];
	};

	//Vest
	case 3:
	{
		_ret set[count _ret,["","----- Cinturones -----",1]];
		_ret set[count _ret,["GCMOD_cinturon","Cinturón",100]];
		_ret set[count _ret,["S_VHO_PB_3","Cinturón",100]];
		_ret set[count _ret,["CNP_BELT","Cinturón",100]];
		_ret set[count _ret,["pop_cinturon_p1","Cinturón",100]];
		_ret set[count _ret,["","----- CNP -----",1]];
		_ret set[count _ret,["pop_chaleco_nacional_1","Chaleco Anticortes",1000]];
		_ret set[count _ret,["pop_chaleco_tela_cnp","Chaleco Reflectante",1000]];
		_ret set[count _ret,["pop_chaleco_cnp1","Chaleco Entrenamientos",1000]];
		_ret set[count _ret,["CNP_CHALECO","Chaleco CNP ",1000]];
		_ret set[count _ret,["S_VHO_OV_BLK_2","Chaleco Intervenciones 1",1000]];
		_ret set[count _ret,["S_VHO_PV_OD1","Chaleco Intervenciones 2",1000]];
		_ret set[count _ret,["CNP_CHALECO2","Chaleco Negociador",1000]];
		_ret set[count _ret,["","----- GC -----",1]];
		_ret set[count _ret,["GCMOD_chaleco_gcivil_1","Chaleco Anticortes",1000]];
		_ret set[count _ret,["GCMOD_chaleco_antibalas_gc_1","Chaleco Antibalas",1000]];
		_ret set[count _ret,["GCMOD_chaleco_antibalas_gc_2","Chaleco Antibalas Bolsillo",1000]];
		_ret set[count _ret,["S_VHO_OV_BLK_3","Chaleco Intervención",1000]];
		_ret set[count _ret,["S_VHO_PV_OD","Chaleco Intervención 2",1000]];
		_ret set[count _ret,["pop_chaleco_gct_reflectante","Chaleco De Trafico",1000]];
		_ret set[count _ret,["pop_chaleco_tela_atgc","Chaleco de Tráfico",1000]];
		_ret set[count _ret,["GCMOD_chaleco_tela_atgc","Chaleco de Tráfico",1000]];
		_ret set[count _ret,["GCMOD_chaleco_gar","Chaleco GAR",1000]];
		_ret set[count _ret,["GCMOD_chaleco_tela_uco","Chaleco UCO",1000]];
		_ret set[count _ret,["UEI_CHALECO","Chaleco UEI",1000]];
		_ret set[count _ret,["","----- Otros -----",1]];
		_ret set[count _ret,["GAP_CNP","Chaleco Piloto CNP",2000]];
		_ret set[count _ret,["GAP_GC","Chaleco Piloto GC",2000]];
		_ret set[count _ret,["V_RebreatherB","Respirador",2000]];
		_ret set[count _ret,["pop_chaleco_pocient2","Chaleco de UDEV",1000]];
		_ret set[count _ret,["pop_chaleco_polcient","Chaleco de Científica",1000]];
		_ret set[count _ret,["GEO_CHALECO","Chaleco de GEO",1000]];
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Parachute","Paracaidas",3000],
			["mochila_grande","Mochila grande",1000]
		];
	};
};

_ret;