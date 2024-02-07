//Enviar Funciones

FuncionesVillas = [
	"PlayerProfileSystem",
	"InitCliente"
	];

FVillasTotal = count FuncionesVillas;

for "_idx" from 0 to FVillasTotal -1 do {
	VillasResultado = "";
	VillasResultado = format ["DaniVillas_fnc_%1", FuncionesVillas select _idx];
	publicVariable "VillasResultado";
};

///////////////////


//DiagLog
diag_log "*********************************************";
diag_log "***-Funciones Villas Enviadas Al Cliente-***";
diag_log "*********************************************";
/////////

// Todo Listo
Villas_Funciones_Enviadas = true;
publicVariable "Villas_Funciones_Enviadas";
/////////////


//[] spawn FuRixX_fnc_FuncionesRandomSV;
//[] spawn FuRixX_fnc_SistemaWhitelistSV;
// Whitelist de Acceso
//[] spawn FuRixX_fnc_Whitelist; 
