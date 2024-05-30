
// ***********************************************************
// PoP Police framework by Blakord
// efectos de sonido ["tipo de play", "sonido o categoria random", "fuente objeto o pos"] call ica_fnc_SFX
// ***********************************************************

private ["_play","_fx","_fuente","_return","_sound","_isObj","_sPos","_Volume","_Distance"];

_play 		= toLower param[0];
_fx 		= param[1];
_fuente 	= param[2];
_Volume		= param[3]; // Only for play3d and playIn3d
_Distance	= param[4, 10]; // Only for play3d and playIn3d

If ( isNil "_Volume" ) Then { _Volume = 2 };
If ( isNil "_Distance" ) Then { _Volume = 30 };
_Volume = _Volume + 5;

_return = false;

switch (typename _fuente) do {
	case "OBJECT": {
		_isObj = true;
		_sPos = position _fuente;
	};
	case "ARRAY": {
		_isObj = false;
		_sPos = _fuente;
	};
	default 	{
		_fuente = player;
		_isObj = true;
		_sPos = position player;
	};
};

switch (_fx) do {
    case "golpeold":{ _sound = selectRandom ["punch1","punch2","punch3","punch4"] ; };
    case "golpe": 	{ _sound = selectRandom ["cuerpoGolpe1","cuerpoGolpe2","cuerpoGolpe3","cuerpoGolpe4","cuerpoGolpe5"]; };
    case "patada": 	{ _sound = selectRandom ["cuerpoPatada1","cuerpoPatada2","cuerpoPatada3"]; };
	case "epico": 	{ _sound = selectRandom ["cuerpoEpicHit1","cuerpoEpicHit2","cuerpoEpicHit3"]; };
	case "caer": 	{ _sound = selectRandom ["cuerpoCaer1","cuerpoCaer2","cuerpoCaer3","cuerpoCaer4"]; };
	case "ko": 		{ _sound = selectRandom ["cuerpoKO1","cuerpoKO2","cuerpoKO3","cuerpoKO4"] ; };
	case "madera": 	{ _sound = selectRandom ["cortarMadera1","cortarMadera2","cortarMadera3","cortarMadera4"] ; };
	case "maderacae":{_sound = selectRandom ["cortarMaderaCae1","cortarMaderaCae2","cortarMaderaCae3","cortarMaderaCae4"] ; };
    default 		{ _sound = _fx; };
};

If ( _play == "random" ) exitWith { _sound; };

switch (_play) do {
    case "dice": { 
		If (_isObj) Then {
			_fuente say _sound;
			_return = true;
		};
	};
    case "dice2d": { 
		If (_isObj) Then {
			_fuente say2D _sound;
			_return = true;
		};
	};
    case "dice3d": { 
		If (_isObj) Then {
			_fuente say3D _sound;
			_return = true;
		};
	};
	case "global": { 
		If (_isObj) Then {
			_return = true;
			[_fuente, _sound] call CBA_fnc_globalSay3d;
		};
	};
	case "play": { 
		playSound _sound;
		_return = ASLToAGL _sPos nearestObject "#soundonvehicle";
		// deleteVehicle _return; ----- parar sonido
	};
	case "play3d": { 
		_sound = "pop_blakordSounds\Sonidos\"+_sound+".ogg";
		playSound3D [_sound, _fuente, false, getPosASL _fuente, _Volume, 1, _Distance];
		_return = ASLToAGL _sPos nearestObject "#soundonvehicle";
		// deleteVehicle _return; ----- parar sonido (no probado)
	};
	case "playin3d": {
		_sound = "pop_blakordSounds\Sonidos\"+_sound+".ogg";
		playSound3D [_sound, _fuente, true, getPosASL _fuente, _Volume, 1, _Distance];
		_return = ASLToAGL _sPos nearestObject "#soundonvehicle";
		// deleteVehicle _return; ----- parar sonido (no probado)
	};
	case "medi3d": { 
		_sound = "pop_blakordSounds\Sonidos\Medico\"+_sound+".ogg";
		playSound3D [_sound, _fuente, false, getPosASL _fuente, 2, 1, 40];
		_return = ASLToAGL _sPos nearestObject "#soundonvehicle";
		// deleteVehicle _return; ----- parar sonido (no probado)
	};
	case "ambiente": { 
		_return = createSoundSource [_sound, position _fuente, [], 0];
		// deleteVehicle _return; ----- parar sonido
	};
	case "musica": { 
		playMusic _sound;
		_return = true;
		// playMusic ""; ----- parar musica
	};
};


_return