/*
    File: fn_Oro.sqf
    Author: LoSantosYT
    Description:
	Genera una cantidad aleatoria de Oro y cada vez que se saquea se vuelve a generar el oro a los 20min
*/
params ["_action"];
if (_action isEqualTo "init") then {
	// Generar cantidad aleatoria de oro y publicar la variable
	_cantidadOro = floor random [150,200,250];
	missionNamespace setVariable ["cantidadOro", _cantidadOro, true];
	uiSleep 150;
	
	// Verificacion de que esta a 0
	_cantidadOro = missionNamespace getVariable "cantidadOro";
	waitUntil {_cantidadOro <= 0};
	uiSleep 1200; //20 min
	["init"] spawn lsyt_fnc_Oro; //Reinicio 
} else {
	// Obtener la cantidad de oro
	_cantidadOro = missionNamespace getVariable "cantidadOro";
	
	//Variables de control de error
	_item = 'goldbar';
	_pesoOro = [_item] call ANZUS_fnc_itemWeight;
	_espacioLibre = life_carryWeight - life_maxWeight;
	
	//Obtener cantidad random de oro recolectado,
	_OroRecolectado = (floor random (15)) + 1;
	
	// Verificar que es mayor de 0
	if (_cantidadOro <= 0) exitWith {["Los suministros de oro estan vacios, debes volver a robar para conseguir más oro",true,"slow"] call ANZUS_fnc_notificationSystem;};
	
	// Espacio insuficiente
	if (_espacioLibre < (_OroRecolectado * _pesoOro )) then {
		["No puedes cargar tanto oro, por tanto se ha cogido solo la cantidad que te cabe",true,"slow"] call ANZUS_fnc_notificationSystem;
		_OroRecolectado = floor(_espacioLibre / _pesoOro);
	};

	// Restar y publicar variable
	_cantidadOro = _cantidadOro - _OroRecolectado;
	missionNamespace setVariable ["cantidadOro", _cantidadOro, true];

	// Añadir al inventario la cantidad
	[true, _item, _OroRecolectado, _item] call ANZUS_fnc_handleInv;

	// Texto en pantalla
	_OroF = format ["Has cogido %1  lingotes de oro ",_OroRecolectado]; 
    titleText [_OroF, "PLAIN", 2, true, true];
};