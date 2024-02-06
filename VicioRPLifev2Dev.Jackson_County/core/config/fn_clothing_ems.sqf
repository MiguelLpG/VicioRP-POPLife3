/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Departamento Medico - PoPLife"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["","----- SAMUR -----",0],
			//["VOLUNTARIO_Pop","Uniforme de CRUZ ROJA",1000],	
			//["CRUZROJA_Pop","Uniforme de CRUZ ROJA [2]",1000],
			["POP_EMS10","Uniforme de Voluntario",1000],
			["POP_EMS2","Uniforme de Auxiliar",1000],
			["POP_EMS3","Uniforme de Tecnico",1000],
			["POP_EMS4","Uniforme de Medico / Supervisor",1000],
			["POP_EMS5","Uniforme de MIR",1000],
			["POP_EMS6","Uniforme de Enfermero / Supervisor",1000],
			["RDS_UNIFORM_DOCTOR","Uniforme de Cirujano",1000],
			["POP_EMS7","Uniforme de Doctor",1000],
			["POP_EMS8","Uniforme de Jefatura",1000],
			
			
			//["SAMUR1_Pop","Uniforme de Manga larga",1000],			
			["","----- Otros -----",0],
			["U_C_FireFighter","Uniforme de Bombero",1000],
			["POP_EMS1","Uniforme SAR",1000],
			["CG_EMS9","Uniforme de Buzo",1000]
		];
	};
	
	//Hats
	case 1:
	{
		[	
			["","----- Cascos -----",0],
			["H_CrewHelmetHeli_O","Casco de Piloto [1]",300],
			["H_PilotHelmetHeli_O","Casco de Piloto [2]",300],
			["H_Orel_FireFighter","Casco de Bombero [1]",300],
			["H_Orel_FireFighter_Gaz","Casco de Bombero [2]",300]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,100],
			["G_Shades_Blue",nil,100],
			["G_Sport_Blackred",nil,100],
			["G_Sport_Checkered",nil,100],
			["G_Sport_Blackyellow",nil,100],
			["G_Sport_BlackWhite",nil,100],
			["G_Squares",nil,100],
			["G_Aviator",nil,100],
			["G_Diving", nil,100],
			["","----- Jefatura -----",0],	
			["Masque_Chirurgical",nil,100],			
			["G_Respirator_blue_F","Mascarilla azul",1000],				
			["G_Respirator_white_F","Mascarilla blanca",1000],				
			["G_Respirator_yellow_F","Mascarilla amarilla",1000]
					
			
		];
	};
	
	//Vest
	case 3:
	{
		[
			["","----- SAMUR -----",0],
			["PGS_chaleco_tela_ems_1","Chaleco de EMS",2000],
			["","----- Jefatura -----",0],
			["PGS_chaleco_tela_ems_4","Chaleco de Jefatura",2000],
			["","----- Otros -----",0],
			["PGS_chaleco_tela_ems_2","Chaleco de VIR",2000],
			["PGS_chaleco_tela_ems_3","Chaleco de SAR",2000],
			["V_Firefighter","Chaleco de Bombero",2000],			
			["V_RebreatherB","Respirador",3000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Parachute",nil,3000],
			["mochila_grande",nil,1000]
		];
	};
};
