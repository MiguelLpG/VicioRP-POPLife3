/*
	By KevinRoldan
	Edit by Dani Villas
*/

_p = param[0];

switch (playerSide) do {
    case west: {
		if (_p isEqualTo "peaje1") exitWith {
			titleText ["<t color='#ffffff' size='3'>VillasLife</t><br/><t color='#ff0000' size='2'>Buenas agente! te hemos abierto la barrera!</t>", "PLAIN", -1, true, true];
			peajeals animate ["barre4", 1];
			sleep 10;
			peajeals animate ["barre4", 0];
		};

		if (_p isEqualTo "peaje2") exitWith {
			titleText ["<t color='#ffffff' size='3'>VillasLife</t><br/><t color='#ff0000' size='2'>Buenas agente! te hemos abierto la barrera!</t>", "PLAIN", -1, true, true];
			peajeals animate ["barre3", 1];
			sleep 10;
			peajeals animate ["barre3", 0];
		};

		if (_p isEqualTo "peaje3") exitWith {
			titleText ["<t color='#ffffff' size='3'>VillasLife</t><br/><t color='#ff0000' size='2'>Buenas agente! te hemos abierto la barrera!</t>", "PLAIN", -1, true, true];
			peajeals animate ["barre2", 1];
			sleep 10;
			peajeals animate ["barre2", 0];
		};

		if (_p isEqualTo "peaje4") exitWith {
			titleText ["<t color='#ffffff' size='3'>VillasLife</t><br/><t color='#ff0000' size='2'>Buenas agente! te hemos abierto la barrera!</t>", "PLAIN", -1, true, true];
			peajeals animate ["barre1", 1];
			sleep 10;
			peajeals animate ["barre1", 0];
		};
		
		if (_p isEqualTo "barrerader") exitWith {
			hint "Buenas Sr Agente, pase el estado le paga el peaje";
			barrerader animate ["barrier_rotation", 1];
			sleep 10;
			barrerader animate ["barrier_rotation", 0];
		};
		
		if (_p isEqualTo "barreraizq") exitWith {
			hint "Buenas Sr Agente, pase el estado le paga el peaje";
			barreraizq animate ["barrier_rotation", 1];
			sleep 10;
			barreraizq animate ["barrier_rotation", 0];
		};		
    };
    case civilian: {
		if (_p isEqualTo "peaje1") exitWith {
			if (vicio_atmdin < 1500) exitwith {hint "No tienes dinero para pasar el peaje, son 1500€"};
			vicio_atmdin = vicio_atmdin - 1500;
			hint "Has pagado el peaje, tienes 10 segundos para pasar la valla gracias";
			peajeals animate ["barre4", 1];
			sleep 10;
			peajeals animate ["barre4", 0];
		};

		if (_p isEqualTo "peaje2") exitWith {
			if (vicio_atmdin < 1500) exitwith {hint "No tienes dinero para pasar el peaje, son 1500€"};
			vicio_atmdin = vicio_atmdin - 1500;
			hint "Has pagado el peaje, tienes 10 segundos para pasar la valla gracias";
			peajeals animate ["barre3", 1];
			sleep 10;
			peajeals animate ["barre3", 0];
		};

		if (_p isEqualTo "peaje3") exitWith {
			if (vicio_atmdin < 1500) exitwith {hint "No tienes dinero para pasar el peaje, son 1500€"};
			vicio_atmdin = vicio_atmdin - 1500;
			hint "Has pagado el peaje, tienes 10 segundos para pasar la valla gracias";
			peajeals animate ["barre2", 1];
			sleep 10;
			peajeals animate ["barre2", 0];
		};

		if (_p isEqualTo "peaje4") exitWith {
			if (vicio_atmdin < 1500) exitwith {hint "No tienes dinero para pasar el peaje, son 1500€"};
			vicio_atmdin = vicio_atmdin - 1500;
			hint "Has pagado el peaje, tienes 10 segundos para pasar la valla gracias";
			peajeals animate ["barre1", 1];
			sleep 10;
			peajeals animate ["barre1", 0];
		};

		if (_p isEqualTo "barrerader") exitWith {
			if (vicio_atmdin < 1500) exitwith {hint "No tienes dinero para pasar el peaje, son 1500€"};
			vicio_atmdin = vicio_atmdin - 1500;
			hint "Has pagado el peaje, tienes 10 segundos para pasar la valla gracias";
			barrerader animate ["barrier_rotation", 1];
			sleep 10;
			barrerader animate ["barrier_rotation", 0];
		};
		
		if (_p isEqualTo "barreraizq") exitWith {
			if (vicio_atmdin < 1500) exitwith {hint "No tienes dinero para pasar el peaje, son 1500€"};
			vicio_atmdin = vicio_atmdin - 1500;
			hint "Has pagado el peaje, tienes 10 segundos para pasar la valla gracias";
			barreraizq animate ["barrier_rotation", 1];
			sleep 10;
			barreraizq animate ["barrier_rotation", 0];
		};
    };
	case independent: {
		if (_p isEqualTo "peaje1") exitWith {
			hint "Buenas Sr Medico, pase el estado le paga el peaje";
			peajeals animate ["barre4", 1];
			sleep 10;
			peajeals animate ["barre4", 0];
		};

		if (_p isEqualTo "peaje2") exitWith {
			hint "Buenas Sr Medico, pase el estado le paga el peaje";
			peajeals animate ["barre3", 1];
			sleep 10;
			peajeals animate ["barre3", 0];
		};

		if (_p isEqualTo "peaje3") exitWith {
			hint "Buenas Sr Medico, pase el estado le paga el peaje";
			peajeals animate ["barre2", 1];
			sleep 10;
			peajeals animate ["barre2", 0];
		};

		if (_p isEqualTo "peaje4") exitWith {
			hint "Buenas Sr Medico, pase el estado le paga el peaje";
			peajeals animate ["barre1", 1];
			sleep 10;
			peajeals animate ["barre1", 0];
		};

		if (_p isEqualTo "barrerader") exitWith {
			hint "Buenas Sr Medico, pase el estado le paga el peaje";
			barrerader animate ["barrier_rotation", 1];
			sleep 10;
			barrerader animate ["barrier_rotation", 0];
		};
		
		if (_p isEqualTo "barreraizq") exitWith {
			hint "Buenas Sr Medico, pase el estado le paga el peaje";
			barreraizq animate ["barrier_rotation", 1];
			sleep 10;
			barreraizq animate ["barrier_rotation", 0];
		};		
	};
};

