
/*
Sistema de ganzuado por Icaruk
	["menu", 0.9, "concesionario"] spawn ica_fnc_ganzua

	0 = test
	0.9 = fácil
	0.92 = medio
	0.94 = dificil
	0.96 = muy dificil
	0.99 = imposible

*/
//onMouseButtonDown = " hint format ['%1 \n %2 \n %3 \n %4 \n %5 \n %6', _this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 5]; ";

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {

if (("baj" call ica_fnc_expToLevel) < 1 && playerside != WEST) exitWith {
            titleText["No sabes ganzuar...", "PLAIN"];
};

	if !((["pop_ganzua"] call ica_fnc_tengo) >= 1) exitWith {hint "Necesitas una ganzúa"};



	// tipo de robo
	ganzuando = param [2, nil];
	param3 = param [3, nil];
	_nopuedo = false;
		if (typeName ganzuando != "OBJECT") then {
			if (ganzuando == "cas") then {
				_veh = cursorObject;
				_grupo = _veh getVariable ["controlado_por",grpNull];
				if !(isNull _grupo) then {
				if(_grupo != (group player)) exitWith {
					titleText["Te encuentras con un sistema de seguridad adicional propio de las organizaciones... Quizas han sido alertados!","PLAIN"];
					[10, "Vigalancia de la Organización", [1,0,0], 1.5, "Una casa en la zona que controlamos esta siendo robada", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", _grupo];
					_nopuedo = true;
					[] spawn {sleep 1; closeDialog 0;};
					};
				};
				_uidpropietario = (_veh getVariable "house_owner") select 0;
				[10, "Securitas Direct Informa", [1,0,0], 1.5, "Se ha disparado la alarma silenciosa en su casa... sería bueno ir a checar.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", _uidpropietario];
			};
		};
	if (_nopuedo) exitWith {};
	private "_dificultad";

	_dificultad = param [1, 0.9];
	if (_dificultad < 0.9) then {_dificultad = 0.9};
	if (_dificultad > 0.99) then {_dificultad = 0.99};
	if !(player setvariable ["liberoesposas", false]) then {player playMoveNow "CL3_anim_lockpick"};

	disableSerialization;
	createDialog "ganzua";

	pernos = [_dificultad];
	for "_x" from 1 to 6 do {
		pernos pushBack (random 10);
	};
};


// declaro dialogs
disableSerialization;
_ui = uiNamespace getVariable "ganzua";
_barrita = _ui displayCtrl 5082;
_p1 = _ui displayCtrl 5070;
_p2 = _ui displayCtrl 5071;
_p3 = _ui displayCtrl 5072;
_p4 = _ui displayCtrl 5073;
_p5 = _ui displayCtrl 5074;
_p6 = _ui displayCtrl 5075;
_slider1 = _ui displayCtrl 5076;
_slider2 = _ui displayCtrl 5077;
_slider3 = _ui displayCtrl 5078;
_slider4 = _ui displayCtrl 5079;
_slider5 = _ui displayCtrl 5080;
_slider6 = _ui displayCtrl 5081;


if ((typeName _param) == "SCALAR") exitWith {
	_dificultad = _this select 1;

	// if !(ctrlShown _barrita) then {_barrita ctrlShow true};
	_barrita ctrlShow true;

	// recibo num de sliders
	_s1 = _this select 0;
	_s2 = _this select 1;
	_s3 = _this select 2;
	_s4 = _this select 3;
	_s5 = _this select 4;
	_s6 = _this select 5;

	// coloco pernos
	_p1 progressSetPosition (_s1 / 10);
	_p2 progressSetPosition (_s2 / 10);
	_p3 progressSetPosition (_s3 / 10);
	_p4 progressSetPosition (_s4 / 10);
	_p5 progressSetPosition (_s5 / 10);
	_p6 progressSetPosition (_s6 / 10);

	_acierto = 0;
	_acierto = _acierto + ([((pernos select 1) - _s1)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 2) - _s2)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 3) - _s3)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 4) - _s4)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 5) - _s5)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 6) - _s6)] call ica_fnc_negToPos);

	_acierto = 1 - (_acierto / 60);


	[] spawn {
		if (!dialog) exitWith {};

		// declaro dialogs
		disableSerialization;
		_ui = uiNamespace getVariable "ganzua";
		_barrita = _ui displayCtrl 5082;
		_p1 = _ui displayCtrl 5070;
		_p2 = _ui displayCtrl 5071;
		_p3 = _ui displayCtrl 5072;
		_p4 = _ui displayCtrl 5073;
		_p5 = _ui displayCtrl 5074;
		_p6 = _ui displayCtrl 5075;
		_slider1 = _ui displayCtrl 5076;
		_slider2 = _ui displayCtrl 5077;
		_slider3 = _ui displayCtrl 5078;
		_slider4 = _ui displayCtrl 5079;
		_slider5 = _ui displayCtrl 5080;
		_slider6 = _ui displayCtrl 5081;


		if ((pernos select 0) >= 0.9) then {

			if (isNil {loop}) then {
				loop = true;

				while {true} do {
					if (isNil {pernos}) exitWith {};
					if (((pernos select 0) >= 0.92) AND ((pernos select 0) < 0.99)) then { // fácil hasta imposible
						{_x progressSetPosition ((progressPosition _x) - 0.01)	} forEach [_p1, _p2, _p3, _p4, _p5, _p6];
						{sliderSetRange [_x, 0, 10]	} forEach [5076, 5077, 5078, 5079, 5080, 5081];
						{sliderSetPosition [_x, ((sliderPosition _x) - 0.1)]	} forEach [5076, 5077, 5078, 5079, 5080, 5081];
					};

					sleep 8;
				};
			};
		};
	};

	if (((pernos select 0) >= 0.94) AND ((pernos select 0) < 0.96)) then { // dificil
		[_barrita] spawn {
			disableSerialization;
			_barrita = _this select 0;
			sleep 2;
			if (ctrlShown _barrita) then {_barrita ctrlShow false};
		};
	};

	if (((pernos select 0) >= 0.96) AND ((pernos select 0) < 0.99)) then { // muy dificil
		[_barrita] spawn {
			disableSerialization;
			_barrita = _this select 0;
			sleep 1;
			if (ctrlShown _barrita) then {_barrita ctrlShow false};
		};
	};
	if ((pernos select 0) >= 0.99) then { // imposible
		[_barrita] spawn {
			disableSerialization;
			_barrita = _this select 0;
			sleep 0.5;
			if (ctrlShown _barrita) then {_barrita ctrlShow false};
		};

		{_x progressSetPosition ((progressPosition _x) - 0.01)	} forEach [_p1, _p2, _p3, _p4, _p5, _p6];
		{sliderSetRange [_x, 0, 10]	} forEach [5076, 5077, 5078, 5079, 5080, 5081];
		{sliderSetPosition [_x, 0]	} forEach [5076, 5077, 5078, 5079, 5080, 5081];
	};

	_barrita progressSetPosition _acierto;
	_objetivo = if ((pernos select 0) > 0.94) then {0.90} else {pernos select 0}; // si no, es muy jodido
	if (_acierto >= _objetivo) then {
		closeDialog 0;
		titleText ["Has abierto la cerradura", "PLAIN", 0.4];
		//systemchat str ganzuando;
		switch (ganzuando) do {

			case "robo_coche_lujo": {

			_veh = nearestObjects [player, ["Car"], 2];
    		_veh = _veh select 0;


			_veh setVariable ["robable", true, true];
			_veh lock 0;

			//[[_veh,player,profileName], "TON_fnc_clientGetKey",player,false] call life_fnc_MP;
			[_veh,player,profileName] remoteExec ["TON_fnc_clientGetKey",player];


				life_vehicles pushBack _veh;

				if (life_HC_isActive) then {
					[getPlayerUID player,profileName,"488"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
				} else {
					[getPlayerUID player,profileName,"488"] remoteExecCall ["life_fnc_wantedAdd",2];
				};
			};


			case "veh": {
				_veh = param3;
				life_vehicles pushBack _veh;
				if (life_HC_isActive) then {
					[getPlayerUID player,profileName,"488"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
				} else {
					[getPlayerUID player,profileName,"488"] remoteExecCall ["life_fnc_wantedAdd",2];
				};
			};
			case "cas": {
				_veh = param3;
				_grupo = _veh getVariable ["controlado_por",grpNull];
				if !(isNull _grupo) then {
				if(_grupo != (group player)) exitWith {titleText["Aunque has abierto la cerradura ... te encuentras con un sistema de seguridad adicional propio de las organizaciones... Quizas han sido alertados!","PLAIN"];
					[10, "Vigalancia de la Organización", [1,0,0], 1.5, "Una casa en la zona que controlamos esta siendo robada", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", _grupo];
					};
				};
				//[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
				if (life_HC_isActive) then {
					[getPlayerUID player,profileName,"459"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
				} else {
					[getPlayerUID player,profileName,"459"] remoteExecCall ["life_fnc_wantedAdd",2];
				};
				_uidpropietario = (_veh getVariable "house_owner") select 0;
				if ((typeof _veh) in apartamentos) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if (_door isEqualTo 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_arrDueno = _veh getVariable [format ["%1_owner",_door],[]];
					if (_arrDueno isEqualto []) exitWith { systemChat "Este apartamento no parece tener propietario."; };
					_uidpropietario = _arrDueno select 0;
					roboApto = _apto;
				};
				life_vehicles pushBack _veh;

				_nombrepropietario = (_veh getVariable "house_owner") select 1;

				[10, "Securitas Direct Informa", [1,0,0], 1.5, "Los sensores de movimiento de su casa se han disparado", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", _uidpropietario];
				[10, "Securitas Direct Informa", [1,0,0], 1.5, format["La casa de %1 esta siendo robada. Coordenadas %2",_nombrepropietario, str(mapGridPosition _veh)], [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];
			};
			case "concesionario": {
				//[[getPlayerUID player,profileName,"487"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
				if (life_HC_isActive) then {
					[getPlayerUID player,profileName,"487"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
				} else {
					[getPlayerUID player,profileName,"487"] remoteExecCall ["life_fnc_wantedAdd",2];
				};
				if ({side _x == WEST} count playableUnits < 4) exitWith {hint "Buen intento, pero sin 4 policias conectados esto no es divertido..."};
				ganzuando = nil;
				_veh = (nearestObjects [player, ["pop_488GT3Civil","pop_laferrari_negro"], 4]) select 0;
				_veh lock 0;
				_veh setVariable ["robable", true, true]; // indicador de que es vendible
				HW setVariable ["robosPeque",(time + (15 * 60)),true];
				[10, "ALARMA EN EL CONCESIONARIO", [1,0,0], 1.5, "Se estan llevando el Ferrari del concesionario!", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];

			};

			case "naufragios": {
				//systemchat "llego a naufragios";
				_tengoJoyas = cursorObject getVariable["tengoJoyas",false];
				if !(_tengoJoyas)exitWith{
				hint "Este cofre esta vacío.";
				};
				_ca = round (random [2,3,5]);
				["pop_diamante_t",_ca] call ica_fnc_item;
				[player,format ["Muy bien ! has encontrado %1 diamantes !!.",_ca],
				"Nafragios"] call ica_fnc_axeMsg;
				cursorObject setVariable["tengoJoyas", false ,true];

			};

			case contenedores1: {
				contenedores1 animate ["door1", 1];
			};
			case contenedores2: {
				contenedores2 animate ["door1", 1];
			};
			case contenedores3: {
				contenedores3 animate ["door1", 1];
			};
			case contenedores4: {
				contenedores4 animate ["door1", 1];
			};
			case contenedores5: {
				contenedores5 animate ["door1", 1];
			};
			case contenedores6: {
				contenedores6 animate ["door1", 1];
			};
			case contenedores7: {
				contenedores7 animate ["door1", 1];
			};
			case contenedores7: {
				contenedores7 animate ["door1", 1];
			};
			case contenedores8: {
				contenedores8 animate ["door1", 1];
			};
			case "joyeria": {
				if ({side _x == WEST} count playableUnits < 6) exitWith {hint "Buen intento, pero sin 6 policias conectados esto no es divertido...."};
					_next = HW getVariable ["robosGrandes",1];
					if (_next > time) exitWith {
					[player,
					format ["Se esta realizando ya otro robo mayor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)],
					"Administracion",
					"pop_portatil"
					] call ica_fnc_axeMsg;
					};
					HW setVariable ["robosGrandes",(time + (40 * 60)),true];
				hint "Tienes 2 minutos hasta que se cierren las puertas";
				["serverNoche"] remoteExec ["ica_fnc_roboJoyeria", 2];
			};
			case "casino": {
				//["guardia_2",player] spawn ica_fnc_casino;
				["alarma","3"] spawn ica_fnc_casino;
				["pagar"] spawn ica_fnc_casino;
			};
			case "banco": {
				//if ({side _x == WEST} count playableUnits < 8) exitWith {hint "Buen intento, pero sin 8 policias conectados esto no es divertido..."};
				cursorObject animate ["Door_17",1];
			};
			case "esposas": {
				player setVariable["restrained",false, true];
				player setVariable["Escorting",false, true];
				player setVariable["transporting",false, true];
				detach player;
				hint "Te has liberado de las esposas...";
				player setvariable ["liberoesposas", nil, true];
			};
		};

	};

	_rnd = round random 100; // 3% de cerrar el menú
	if (_rnd <= 3) exitWith {
		closeDialog 0;
		titleText ["Se ha roto la ganzúa", "PLAIN", 0.4];
		["pop_ganzua", -1] call ica_fnc_item;
		player setvariable ["liberoesposas", nil, true];
	};

	/*
	// hint format ["%1 y %2", _acierto, pernos select 0];
	hint format ['
		%1 \n
		%2 \n
		%3 \n
		%4 \n
		%5 \n
		%6 \n
		%7\n\n\n
		%8',
	_s1, _s2, _s3, _s4, _s5, _s6, _acierto, pernos];
	*/
};
