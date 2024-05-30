/*
	Creado por Dani Villas
	Cada X segundos, el servidor guarda la equipación del jugador como una variable en su pc, al entrar al server 
		le carga esa variable y le pone la ultima equipación que llevaba.	Esto solo se aplica si es civil.

	+ Pendiente:
		- Que guarde el dinero.
		- "" 	"" 	 "" experiencia.
		- Que también aplique a policía y EMS.
 */


waitUntil{!isNull findDisplay 46}; //Espera a que se cargue la misión
waitUntil{!isNil "vicio_din"}; 
waitUntil {life_session_completed};

	if(playerSide != CIVILIAN) exitWith {"[DaniVillas AntiDupeSystem] Jugador no es civil."}

	// Esto lo que hace es que cuando entras te carga la equipación DE CIVIL
	_PlayerEquip = profileNamespace getVariable ["DaniVillas_DataSync_19281272316346", getUnitLoadout player]; //getUnitLoadout player por si es su primera vez.
	player setUnitLoadout _PlayerEquip;
	systemChat "[DaniVillas AntiDupeSystem] Inventario cargado con éxito.";

	_PlayerHandDin = profileNamespace getVariable ["DaniVillas_DataSync_32141414223413", vicio_din];
	vicio_din = _PlayerHandDin;
	systemChat "[DaniVillas AntiDupeSystem] Dinero en mano cargado con éxito.";

	while {deServicioPoli == 0 && deServicioMed == 0} do { //Si no está de servicio como policía ni EMS
		profileNamespace setVariable ["DaniVillas_DataSync_19281272316346", getUnitLoadout player]; //Equipación
		profileNamespace setVariable ["DaniVillas_DataSync_32141414223413", vicio_din];	//Dinero
		sleep 0.5;
	};

	while {deServicioPoli == 1} do { // Si está de servicio como policía...
		profileNamespace setVariable ["DaniVillas_DataSync_8231764614641", getUnitLoadout player]; //Equipación
		sleep 0.5;
	};

	while {deServicioMed == 1} do { // Si está de servicio como médico...
		profileNamespace setVariable ["DaniVillas_DataSync_8834173432", getUnitLoadout player]; //Equipación
		sleep 0.5;
	};
