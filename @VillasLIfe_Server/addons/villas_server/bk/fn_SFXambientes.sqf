
// ***********************************************************
// PoP Police framework by Blakord
// Play ambient SFK
// Se ejecuta para sonidos de ambiente que se van a repetir en bucle no continuo
// ["Sonido", posicion, duracion, delay, fuerza, minRandom, maxRandom, Loops] 
// ["barcoHornGigante", [8740.93,5785.12,74.5068], 32, 0, 1, 0.5, 1, 0] execVM "ruta\fn_SFXambientes"
// ***********************************************************

If !(isServer) exitWith {};

private ["_sfx","_position","_length","_Delay","_Strong","_minRandom","_maxRandom","_Loops","_inCicle","_Counter","_sndArray"];

_sfx = 			param[0]; // Sonido SFX xonfigurado como alarma
_position = 	param[1]; // Posicion (array) del sonido
_length = 		param[2]; // Duracion en SEGS del sonido para borrar
_Delay = 		param[3]; // Tiempo en MIN para comenzar a reproducir
_Strong = 		param[4]; // Fuerza del sonido, 1 es normal una sola vez, si se pone 2 indica que se ejecuta 2 veces superpuesto
_minRandom = 	param[5]; // Tiempo random en MIN minimo para iniciar de nuevo despues de terminar
_maxRandom = 	param[6]; // Tiempo random en MIN maximo para iniciar de nuevo despues de terminar
_Loops = 		param[7]; // Numero de loops que se va a ejecutar, 0 indica que es indefinido

_inCicle = true;
_Counter = 0;

sleep (_Delay*60);

While { _inCicle } do {
	[_sfx, _position, _length, _Strong] spawn {
		private ["_sndArray"];
		_sndArray = [];
		for "_i" from 1 to (_this select 3) do {
			_ambientSFX = createSoundSource [_this select 0, _this select 1, [], 0];
			_sndArray append [_ambientSFX];
		};
		sleep (_this select 2);
		{deleteVehicle _x; } forEach _sndArray;
	};
	If (_minRandom > 0 and _maxRandom > _minRandom) Then {
		sleep ( (floor random ((_maxRandom*60) - _minRandom*60) + _minRandom*60) );
	} Else {
		sleep ( _minRandom*60 );
	};
	_Counter = _Counter + 1;
	If ( _Loops > 0 and _Counter >= _Loops ) Then { _inCicle = false; };
	sleep 1;
};