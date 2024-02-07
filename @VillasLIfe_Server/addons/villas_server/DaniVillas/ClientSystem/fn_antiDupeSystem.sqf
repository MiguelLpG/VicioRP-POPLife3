/*
	Creado por Dani Villas
	Cada X segundos, el servidor guarda la equipación del jugador como una variable en su pc, al entrar al server 
		le carga esa variable y le pone la ultima equipación que llevaba.	Esto solo se aplica si es civil.

	+ Pendiente:
		- Que guarde el dinero.
		- "" 	"" 	 "" experiencia.
		- Que también aplique a policía y EMS.
 */

/*
	fn_loadgear.sqf de la misión modificado
*/

waitUntil{!isNull findDisplay 46}; //Espera a que se cargue la misión
waitUntil{!isNil "vicio_din"}; 
waitUntil {life_session_completed};

if (playerSide != Civilian) exitWith {};

	_PlayerEquip = profileNamespace getVariable ["DaniVillas_DataSync_19281272316346", getUnitLoadout player]; //getUnitLoadout player por si es su primera vez.
	player setUnitLoadout _PlayerEquip;
	systemChat "[DaniVillas AntiDupeSystem] Inventario cargado con éxito.";

	_PlayerHandDin = profileNamespace getVariable ["DaniVillas_DataSync_32141414223413", vicio_din];
	vicio_din = _PlayerHandDin;
	systemChat "[DaniVillas AntiDupeSystem] Dinero en mano cargado con éxito.";

	while {true} do {
		profileNamespace setVariable ["DaniVillas_DataSync_19281272316346", getUnitLoadout player]; //Equipación
		profileNamespace setVariable ["DaniVillas_DataSync_32141414223413", vicio_din];	//Dinero
		sleep 0.5;
	};
