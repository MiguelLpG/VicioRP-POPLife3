// By FuRixX Lamborghini \\

_entrada = _this select 0;
_Variable = 777;
if (isNil "_entrada") then {_entrada = ""};

if (_entrada == "Init") exitWith {

	player setVariable ["FuRixX_Tiempo_Jugado", time, true];

};

if (_entrada == "Jugador") then {

	_uid = _this select 1;
	{
		if (getPlayerUID _x == _uid) then {
			_Variable = _x getVariable ["FuRixX_Tiempo_Jugado", time];
		}

	} forEach allPlayers;
	

};

if (_entrada == "") then {
	_Variable = player getVariable ["FuRixX_Tiempo_Jugado", time];
};

_Diferencia = time - _Variable;
_Minutos = _Diferencia / 60;
_Minutos;

// By FuRixX Lamborghini \\