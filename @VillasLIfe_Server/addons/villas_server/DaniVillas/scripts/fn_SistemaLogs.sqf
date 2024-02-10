// By FuRixX Lamborghini \\

_variables = [
	["vicio_din", "vicio_atmdin", 50000]
];

Checker = {

	_variable = _this select 0;
	_variable2 = _this select 1;
	_nombrevar = _this select 2;
	_nombrevar2 = _this select 3;
	_valor = _this select 4;

	[_variable, _variable2, _nombrevar, _nombrevar2, _valor] spawn {

		_variable = _this select 0;
		_variable2 = _this select 1;
		_nombrevar = _this select 2;
		_nombrevar2 = _this select 3;
		_valor = _this select 4;

		while {true} do {

			FuRixX_EnviarLog = "";
			
			_inicial = (call _variable) + (call _variable2); 
			sleep 5;
			_despues = (call _variable) + (call _variable2); 

			_diferencia = _despues - _inicial;

			if (_diferencia > _valor) then {
				FuRixX_EnviarLog = format [':arrow_right: La suma de las variables "__%1__" y "__%2__" del usuario **%3** (`%4`) ha aumentado bruscamente **%5** valores', _nombrevar, _nombrevar2, name player, getPlayerUID player, str (_diferencia)];
				publicVariableServer "FuRixX_EnviarLog";
			};
		};

	};

};

waitUntil{!isNull findDisplay 46};
waitUntil{!isNil "vicio_din"};
waitUntil{([] call FuRixX_fnc_TiempoConectado) > 0.2};
waitUntil {life_session_completed};


{

	_nil1 = !isNil (_x select 0);
	_nil2 = !isNil (_x select 1);

	if (_nil1 and _nil2) then {
		_variable = compile (_x select 0);
		_variable2 = compile (_x select 1);
		[_variable, _variable2, _x select 0, _x select 1, _x select 2] spawn Checker;
	} else {
		FuRixX_EnviarLog = format [':arrow_right: La variable _%1_ o _%2_ no está definida en el usuario **%3** (`%4`)', _x select 0, _x select 1, name player, getPlayerUID player];
		publicVariableServer "FuRixX_EnviarLog";
	};
	

} forEach _variables;

// By FuRixX Lamborghini \\