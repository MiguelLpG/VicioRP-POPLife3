/*
	By KevinRoldan
	Edit by Dani Villas
*/

addMissionEventHandler ["Draw3D", 
{
 if (granja distance player > 10) exitWith {};
 if ([granja, "VIEW", player] checkVisibility [eyePos granja, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition granja vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GRANJA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (alquilertrabajo distance player > 10) exitWith {};
 if ([alquilertrabajo, "VIEW", player] checkVisibility [eyePos alquilertrabajo, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition alquilertrabajo vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHICULOS DE TRABAJO", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (npc_roldan_1 distance player > 10) exitWith {};
 if ([npc_roldan_1, "VIEW", player] checkVisibility [eyePos npc_roldan_1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition npc_roldan_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "NPC ADMIN", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (cop_cars distance player > 10) exitWith {};
 if ([cop_cars, "VIEW", player] checkVisibility [eyePos cop_cars, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition cop_cars vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHICULOS POLICIALES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (granja_2 distance player > 10) exitWith {};
 if ([granja_2, "VIEW", player] checkVisibility [eyePos granja_2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition granja_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "FARMEO MAIZ", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (camionero distance player > 10) exitWith {};
 if ([camionero, "VIEW", player] checkVisibility [eyePos camionero, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition camionero vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CAMIONERO", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_SEGURIDAD_PRIVADA distance player > 10) exitWith {};
 if ([NPC_SEGURIDAD_PRIVADA, "VIEW", player] checkVisibility [eyePos NPC_SEGURIDAD_PRIVADA, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_SEGURIDAD_PRIVADA vectorAdd [0,0,2.1], 0.2, 0.2, 45, "SEGURIDAD PRIVADA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (armeria distance player > 10) exitWith {};
 if ([armeria, "VIEW", player] checkVisibility [eyePos armeria, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition armeria vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ARMERIA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (armeria2 distance player > 10) exitWith {};
 if ([armeria2, "VIEW", player] checkVisibility [eyePos armeria2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition armeria2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ARMERIA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (armeria3 distance player > 10) exitWith {};
 if ([armeria3, "VIEW", player] checkVisibility [eyePos armeria3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition armeria3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ARMERIA", 2, 0.07, "RobotoCondensed"];
}];

//Gasolineras
addMissionEventHandler ["Draw3D", 
{
 if (gasolinera distance player > 10) exitWith {};
 if ([gasolinera, "VIEW", player] checkVisibility [eyePos gasolinera, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera20 distance player > 10) exitWith {};
 if ([gasolinera20, "VIEW", player] checkVisibility [eyePos gasolinera20, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera20 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera2 distance player > 10) exitWith {};
 if ([gasolinera2, "VIEW", player] checkVisibility [eyePos gasolinera2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera3 distance player > 10) exitWith {};
 if ([gasolinera3, "VIEW", player] checkVisibility [eyePos gasolinera3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera4 distance player > 10) exitWith {};
 if ([gasolinera4, "VIEW", player] checkVisibility [eyePos gasolinera4, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera5 distance player > 10) exitWith {};
 if ([gasolinera5, "VIEW", player] checkVisibility [eyePos gasolinera5, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera5 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera6 distance player > 10) exitWith {};
 if ([gasolinera6, "VIEW", player] checkVisibility [eyePos gasolinera6, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera6 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (mafia2_2 distance player > 10) exitWith {};
 if ([mafia2_2, "VIEW", player] checkVisibility [eyePos mafia2_2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafia2_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA MAFIOSA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera8 distance player > 10) exitWith {};
 if ([gasolinera8, "VIEW", player] checkVisibility [eyePos gasolinera8, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera8 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera9 distance player > 10) exitWith {};
 if ([gasolinera9, "VIEW", player] checkVisibility [eyePos gasolinera9, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera9 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (gasolinera10 distance player > 10) exitWith {};
 if ([gasolinera10, "VIEW", player] checkVisibility [eyePos gasolinera10, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera10 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];
/*
addMissionEventHandler ["Draw3D", 
{
 if (gasolinera11 distance player > 10) exitWith {};
 if ([gasolinera11, "VIEW", player] checkVisibility [eyePos gasolinera11, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera11 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];
*/
/*
addMissionEventHandler ["Draw3D", 
{
 if (gasolinera12 distance player > 10) exitWith {};
 if ([gasolinera12, "VIEW", player] checkVisibility [eyePos gasolinera12, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera12 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];
*/
addMissionEventHandler ["Draw3D", 
{
 if (gasolinera13 distance player > 10) exitWith {};
 if ([gasolinera13, "VIEW", player] checkVisibility [eyePos gasolinera13, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera13 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];
/*
addMissionEventHandler ["Draw3D", 
{
 if (gasolinera14 distance player > 10) exitWith {};
 if ([gasolinera14, "VIEW", player] checkVisibility [eyePos gasolinera14, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera14 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];
*/
addMissionEventHandler ["Draw3D", 
{
 if (gasolinera15 distance player > 10) exitWith {};
 if ([gasolinera15, "VIEW", player] checkVisibility [eyePos gasolinera15, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera15 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];
/*
addMissionEventHandler ["Draw3D", 
{
 if (gasolinera16 distance player > 10) exitWith {};
 if ([gasolinera16, "VIEW", player] checkVisibility [eyePos gasolinera16, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera16 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];
*/
addMissionEventHandler ["Draw3D", 
{
 if (gasolinera17 distance player > 10) exitWith {};
 if ([gasolinera17, "VIEW", player] checkVisibility [eyePos gasolinera17, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera17 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];
//Tienda coches

addMissionEventHandler ["Draw3D", 
{
 if (coches distance player > 10) exitWith {};
 if ([coches, "VIEW", player] checkVisibility [eyePos coches, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition coches vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE COCHES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (coches2 distance player > 10) exitWith {};
 if ([coches2, "VIEW", player] checkVisibility [eyePos coches2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition coches2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE COCHES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (coches3 distance player > 10) exitWith {};
 if ([coches3, "VIEW", player] checkVisibility [eyePos coches3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition coches3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE COCHES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (coches4 distance player > 10) exitWith {};
 if ([coches4, "VIEW", player] checkVisibility [eyePos coches4, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition coches4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE COCHES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (coches5 distance player > 10) exitWith {};
 if ([coches5, "VIEW", player] checkVisibility [eyePos coches5, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition coches5 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE COCHES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (coches6 distance player > 10) exitWith {};
 if ([coches6, "VIEW", player] checkVisibility [eyePos coches6, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition coches6 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE CAMIONES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (coches7 distance player > 10) exitWith {};
 if ([coches7, "VIEW", player] checkVisibility [eyePos coches7, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition coches7 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE AUTOBUSES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (coches8 distance player > 10) exitWith {};
 if ([coches8, "VIEW", player] checkVisibility [eyePos coches8, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition coches8 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE COCHES", 2, 0.07, "RobotoCondensed"];
}];
//Tienda de helicopteros
addMissionEventHandler ["Draw3D", 
{
 if (helis distance player > 10) exitWith {};
 if ([helis, "VIEW", player] checkVisibility [eyePos helis, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition helis vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE HELICOPTEROS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (helis1 distance player > 10) exitWith {};
 if ([helis1, "VIEW", player] checkVisibility [eyePos helis1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition helis1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE HELICOPTEROS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (helis3 distance player > 10) exitWith {};
 if ([helis3, "VIEW", player] checkVisibility [eyePos helis3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition helis3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE HELICOPTEROS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (barcos distance player > 10) exitWith {};
 if ([barcos, "VIEW", player] checkVisibility [eyePos barcos, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition barcos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE BARCOS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (barcos2 distance player > 10) exitWith {};
 if ([barcos2, "VIEW", player] checkVisibility [eyePos barcos2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition barcos2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE BARCOS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_AXE_CORREOS distance player > 10) exitWith {};
 if ([NPC_AXE_CORREOS, "VIEW", player] checkVisibility [eyePos NPC_AXE_CORREOS, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_AXE_CORREOS vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CORREOS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (ems_1 distance player > 10) exitWith {};
 if ([ems_1, "VIEW", player] checkVisibility [eyePos ems_1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE EMS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (fumigar distance player > 10) exitWith {};
 if ([fumigar, "VIEW", player] checkVisibility [eyePos fumigar, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition fumigar vectorAdd [0,0,2.1], 0.2, 0.2, 45, "FUMIGACIONES", 2, 0.07, "RobotoCondensed"];
}];
//garage
addMissionEventHandler ["Draw3D", 
{
 if (garage distance player > 10) exitWith {};
 if ([garage, "VIEW", player] checkVisibility [eyePos garage, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garage vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (garage20 distance player > 10) exitWith {};
 if ([garage20, "VIEW", player] checkVisibility [eyePos garage20, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garage20 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (garage2 distance player > 10) exitWith {};
 if ([garage2, "VIEW", player] checkVisibility [eyePos garage2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garage2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (garage4 distance player > 10) exitWith {};
 if ([garage4, "VIEW", player] checkVisibility [eyePos garage4, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garage4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (garage5 distance player > 10) exitWith {};
 if ([garage5, "VIEW", player] checkVisibility [eyePos garage5, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garage5 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (garage6 distance player > 10) exitWith {};
 if ([garage6, "VIEW", player] checkVisibility [eyePos garage6, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garage6 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "RobotoCondensed"];
}];
//other
addMissionEventHandler ["Draw3D", 
{
 if (paco distance player > 10) exitWith {};
 if ([paco, "VIEW", player] checkVisibility [eyePos paco, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition paco vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (Manolo distance player > 10) exitWith {};
 if ([Manolo, "VIEW", player] checkVisibility [eyePos Manolo, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Manolo vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (licencias distance player > 10) exitWith {};
 if ([licencias, "VIEW", player] checkVisibility [eyePos licencias, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition licencias vectorAdd [0,0,2.1], 0.2, 0.2, 45, "LICENCIAS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (procesador distance player > 10) exitWith {};
 if ([procesador, "VIEW", player] checkVisibility [eyePos procesador, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition procesador vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PROCESADOR DE AGUA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (procesador3 distance player > 10) exitWith {};
 if ([procesador3, "VIEW", player] checkVisibility [eyePos procesador3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition procesador3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PROCESADOR", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (procesado distance player > 10) exitWith {};
 if ([procesado, "VIEW", player] checkVisibility [eyePos procesado, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition procesado vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MADERA FARMING", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (basurero distance player > 10) exitWith {};
 if ([basurero, "VIEW", player] checkVisibility [eyePos basurero, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition basurero vectorAdd [0,0,2.1], 0.2, 0.2, 45, "FARMEO BASURERO", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (ems distance player > 10) exitWith {};
 if ([ems, "VIEW", player] checkVisibility [eyePos ems, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA EMS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (ems2 distance player > 10) exitWith {};
 if ([ems2, "VIEW", player] checkVisibility [eyePos ems2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA EMS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (emscura distance player > 10) exitWith {};
 if ([emscura, "VIEW", player] checkVisibility [eyePos emscura, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition emscura vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MEDICO", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm2 distance player > 10) exitWith {};
 if ([atm2, "VIEW", player] checkVisibility [eyePos atm2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm23_1 distance player > 10) exitWith {};
 if ([atm23_1, "VIEW", player] checkVisibility [eyePos atm23_1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm23_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm11 distance player > 10) exitWith {};
 if ([atm11, "VIEW", player] checkVisibility [eyePos atm11, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm11 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_BOMBEROS distance player > 10) exitWith {};
 if ([NPC_BOMBEROS, "VIEW", player] checkVisibility [eyePos NPC_BOMBEROS, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_BOMBEROS vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MASTER BOMBERO", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm20 distance player > 10) exitWith {};
 if ([atm20, "VIEW", player] checkVisibility [eyePos atm20, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm20 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm21 distance player > 10) exitWith {};
 if ([atm21, "VIEW", player] checkVisibility [eyePos atm21, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm21 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm22 distance player > 10) exitWith {};
 if ([atm22, "VIEW", player] checkVisibility [eyePos atm22, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm22 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm23 distance player > 10) exitWith {};
 if ([atm23, "VIEW", player] checkVisibility [eyePos atm23, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm23 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm3 distance player > 10) exitWith {};
 if ([atm3, "VIEW", player] checkVisibility [eyePos atm3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm4 distance player > 10) exitWith {};
 if ([atm4, "VIEW", player] checkVisibility [eyePos atm4, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm5 distance player > 10) exitWith {};
 if ([atm5, "VIEW", player] checkVisibility [eyePos atm5, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm5 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm6 distance player > 10) exitWith {};
 if ([atm6, "VIEW", player] checkVisibility [eyePos atm6, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm6 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm7 distance player > 10) exitWith {};
 if ([atm7, "VIEW", player] checkVisibility [eyePos atm7, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm7 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm8 distance player > 10) exitWith {};
 if ([atm8, "VIEW", player] checkVisibility [eyePos atm8, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm8 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (atm9 distance player > 10) exitWith {};
 if ([atm9, "VIEW", player] checkVisibility [eyePos atm9, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm9 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (tragaperra distance player > 10) exitWith {};
 if ([tragaperra, "VIEW", player] checkVisibility [eyePos tragaperra, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tragaperra vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TRAGAPERRAS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (tragaperra2 distance player > 10) exitWith {};
 if ([tragaperra2, "VIEW", player] checkVisibility [eyePos tragaperra2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tragaperra2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TRAGAPERRAS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (organos distance player > 10) exitWith {};
 if ([organos, "VIEW", player] checkVisibility [eyePos organos, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition organos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CIRUJANO", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (general distance player > 10) exitWith {};
 if ([general, "VIEW", player] checkVisibility [eyePos general, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition general vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA GENERAL", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (general2 distance player > 10) exitWith {};
 if ([general2, "VIEW", player] checkVisibility [eyePos general2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition general2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA GENERAL", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (uni distance player > 10) exitWith {};
 if ([uni, "VIEW", player] checkVisibility [eyePos uni, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition uni vectorAdd [0,0,2.1], 0.2, 0.2, 45, "UNIVERSIDAD", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (uni_2 distance player > 10) exitWith {};
 if ([uni_2, "VIEW", player] checkVisibility [eyePos uni_2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition uni_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "UNIVERSIDAD", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (uni_1 distance player > 10) exitWith {};
 if ([uni_1, "VIEW", player] checkVisibility [eyePos uni_1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition uni_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "UNIVERSIDAD", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (loteria distance player > 10) exitWith {};
 if ([loteria, "VIEW", player] checkVisibility [eyePos loteria, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition loteria vectorAdd [0,0,2.1], 0.2, 0.2, 45, "LOTERIAS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (ayunta distance player > 10) exitWith {};
 if ([ayunta, "VIEW", player] checkVisibility [eyePos ayunta, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ayunta vectorAdd [0,0,2.1], 0.2, 0.2, 45, "AYUNTAMIENTO", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (furgon distance player > 10) exitWith {};
 if ([furgon, "VIEW", player] checkVisibility [eyePos furgon, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition furgon vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TRANSPORTE FURGON BLINDADO", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (poli distance player > 10) exitWith {};
 if ([poli, "VIEW", player] checkVisibility [eyePos poli, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition poli vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA POLICIAL", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (poli2 distance player > 10) exitWith {};
 if ([poli2, "VIEW", player] checkVisibility [eyePos poli2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition poli2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA POLICIAL", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (poli3 distance player > 10) exitWith {};
 if ([poli3, "VIEW", player] checkVisibility [eyePos poli3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition poli3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CONCESIONARIO POLICIAL", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (poli4 distance player > 10) exitWith {};
 if ([poli4, "VIEW", player] checkVisibility [eyePos poli4, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition poli4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA POLICIAL", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_POLICIA_DEVOLVER_ARMAS distance player > 10) exitWith {};
 if ([NPC_POLICIA_DEVOLVER_ARMAS, "VIEW", player] checkVisibility [eyePos NPC_POLICIA_DEVOLVER_ARMAS, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_POLICIA_DEVOLVER_ARMAS vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ALERTAS POLICIALES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (Autoescuela distance player > 10) exitWith {};
 if ([Autoescuela, "VIEW", player] checkVisibility [eyePos Autoescuela, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Autoescuela vectorAdd [0,0,2.1], 0.2, 0.2, 45, "AUTOESCUELA PERMISO B", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (Autoescuela_1 distance player > 10) exitWith {};
 if ([Autoescuela_1, "VIEW", player] checkVisibility [eyePos Autoescuela_1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Autoescuela_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "AUTOESCUELA PERMISO C", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (tioa2 distance player > 10) exitWith {};
 if ([tioa2, "VIEW", player] checkVisibility [eyePos tioa2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tioa2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ALMACEN", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_EMPRESA_TALLER distance player > 10) exitWith {};
 if ([NPC_EMPRESA_TALLER, "VIEW", player] checkVisibility [eyePos NPC_EMPRESA_TALLER, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_EMPRESA_TALLER vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TALLER", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_EMPRESA_TALLER_2 distance player > 10) exitWith {};
 if ([NPC_EMPRESA_TALLER_2, "VIEW", player] checkVisibility [eyePos NPC_EMPRESA_TALLER_2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_EMPRESA_TALLER_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TALLER", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (ropa distance player > 10) exitWith {};
 if ([ropa, "VIEW", player] checkVisibility [eyePos ropa, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ropa vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ZARA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (diamantes distance player > 10) exitWith {};
 if ([diamantes, "VIEW", player] checkVisibility [eyePos diamantes, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition diamantes vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VENTA DE DIAMANTES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (tv distance player > 10) exitWith {};
 if ([tv, "VIEW", player] checkVisibility [eyePos tv, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tv vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ROYALTV", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (qqwe distance player > 10) exitWith {};
 if ([qqwe, "VIEW", player] checkVisibility [eyePos qqwe, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition qqwe vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ROYALTV", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (mac distance player > 10) exitWith {};
 if ([mac, "VIEW", player] checkVisibility [eyePos mac, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mac vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MCDONALS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (terro distance player > 10) exitWith {};
 if ([terro, "VIEW", player] checkVisibility [eyePos terro, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition terro vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA TERRORISTAS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (donador distance player > 10) exitWith {};
 if ([donador, "VIEW", player] checkVisibility [eyePos donador, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition donador vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DONADORES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (donador2 distance player > 10) exitWith {};
 if ([donador2, "VIEW", player] checkVisibility [eyePos donador2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition donador2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DONADORES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_EMPRESA_COBROS_MEDICO distance player > 10) exitWith {};
 if ([NPC_EMPRESA_COBROS_MEDICO, "VIEW", player] checkVisibility [eyePos NPC_EMPRESA_COBROS_MEDICO, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_EMPRESA_COBROS_MEDICO vectorAdd [0,0,2.1], 0.2, 0.2, 45, "COBROS EMPRESA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (discoteca distance player > 10) exitWith {};
 if ([discoteca, "VIEW", player] checkVisibility [eyePos discoteca, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition discoteca vectorAdd [0,0,2.1], 0.2, 0.2, 45, "DISCOTECA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (cana distance player > 10) exitWith {};
 if ([cana, "VIEW", player] checkVisibility [eyePos cana, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition cana vectorAdd [0,0,2.1], 0.2, 0.2, 45, "COMPRAR CAÑA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (wiki distance player > 10) exitWith {};
 if ([wiki, "VIEW", player] checkVisibility [eyePos wiki, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition wiki vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PESCADERIA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (peaje distance player > 10) exitWith {};
 if ([peaje, "VIEW", player] checkVisibility [eyePos peaje, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition peaje vectorAdd [0,0,2.1], 0.2, 0.2, 45, "COBRADOR DEL PEAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (peaje_1 distance player > 10) exitWith {};
 if ([peaje_1, "VIEW", player] checkVisibility [eyePos peaje_1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition peaje_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "COBRADOR DEL PEAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (peaje_2 distance player > 10) exitWith {};
 if ([peaje_2, "VIEW", player] checkVisibility [eyePos peaje_2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition peaje_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "COBRADOR DEL PEAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (peaje_3 distance player > 10) exitWith {};
 if ([peaje_3, "VIEW", player] checkVisibility [eyePos peaje_3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition peaje_3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "COBRADOR DEL PEAJE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (minero distance player > 10) exitWith {};
 if ([minero, "VIEW", player] checkVisibility [eyePos minero, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition minero vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MINERIA", 2, 0.07, "RobotoCondensed"];
}];

//Tienda mafia
addMissionEventHandler ["Draw3D", 
{
 if (mafia1 distance player > 10) exitWith {};
 if ([mafia1, "VIEW", player] checkVisibility [eyePos mafia1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafia1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA MAFIOSA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (mafia3 distance player > 10) exitWith {};
 if ([mafia3, "VIEW", player] checkVisibility [eyePos mafia3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafia3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA MAFIOSA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (mafia2 distance player > 10) exitWith {};
 if ([mafia2, "VIEW", player] checkVisibility [eyePos mafia2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafia2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA MAFIOSA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (mafia4 distance player > 10) exitWith {};
 if ([mafia4, "VIEW", player] checkVisibility [eyePos mafia4, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafia4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA MAFIOSA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_EMPRESA_COBROS distance player > 10) exitWith {};
 if ([NPC_EMPRESA_COBROS, "VIEW", player] checkVisibility [eyePos NPC_EMPRESA_COBROS, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_EMPRESA_COBROS vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ENTREGAS ROLDAN", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (semillas distance player > 10) exitWith {};
 if ([semillas, "VIEW", player] checkVisibility [eyePos semillas, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition semillas vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA SEMILLAS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (semillas2 distance player > 10) exitWith {};
 if ([semillas2, "VIEW", player] checkVisibility [eyePos semillas2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition semillas2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA SEMILLAS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (semillas3 distance player > 10) exitWith {};
 if ([semillas3, "VIEW", player] checkVisibility [eyePos semillas3, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition semillas3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA SEMILLAS", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (taxi distance player > 10) exitWith {};
 if ([taxi, "VIEW", player] checkVisibility [eyePos taxi, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition taxi vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TAXISTA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (ventamaterial distance player > 10) exitWith {};
 if ([ventamaterial, "VIEW", player] checkVisibility [eyePos ventamaterial, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ventamaterial vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VENTA MUEBLES", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (ikea distance player > 10) exitWith {};
 if ([ikea, "VIEW", player] checkVisibility [eyePos ikea, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ikea vectorAdd [0,0,2.1], 0.2, 0.2, 45, "IKEA", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (carshop1_1_1_2 distance player > 10) exitWith {};
 if ([carshop1_1_1_2, "VIEW", player] checkVisibility [eyePos carshop1_1_1_2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition carshop1_1_1_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VENDER FERRARI", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (traficanteDeDroga2 distance player > 10) exitWith {};
 if ([traficanteDeDroga2, "VIEW", player] checkVisibility [eyePos traficanteDeDroga2, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition traficanteDeDroga2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "NARCOTRAFICANTE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (camello_1 distance player > 10) exitWith {};
 if ([camello_1, "VIEW", player] checkVisibility [eyePos camello_1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition camello_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "NARCOTRAFICANTE", 2, 0.07, "RobotoCondensed"];
}];

addMissionEventHandler ["Draw3D", 
{
 if (NPC_ROBOS_MENORES_RICOS_1 distance player > 10) exitWith {};
 if ([NPC_ROBOS_MENORES_RICOS_1, "VIEW", player] checkVisibility [eyePos NPC_ROBOS_MENORES_RICOS_1, eyePos player] < 0.3) exitWith {};
 drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_ROBOS_MENORES_RICOS_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CASA RICOS", 2, 0.07, "RobotoCondensed"];
}];