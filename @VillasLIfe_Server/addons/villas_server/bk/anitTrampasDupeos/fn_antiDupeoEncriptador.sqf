
// ***********************************************************
// Encriptador y desencriptador de matriz por Blakord
// xx = [true,_cadena] call ica_fnc_antiDupeoEncriptador ; // parametro true significa encriptar -- false para desencriptar // parametro cadena es la variable o cadena a enciptar o desencriptar
// ***********************************************************

ica_fnc_antiDupeoEncriptador = {


private ["_return","_encript","_modo","_cadena","_tempEncripted","_TempArray"] ;

_modo	= param[0];
_cadena = param[1];

_TempArray = [];
_encript = 17;

If ( _modo ) Then {
	_tempEncripted = toArray (str _cadena) ;
	bktest2 = _tempEncripted;
	{
		_TempArray pushBack (_x + _encript) ;
	} forEach _tempEncripted ;
	_return = _TempArray;
} else {
	{
		_TempArray pushBack (_x - _encript) ;
	} forEach _cadena ;
	_tempEncripted = call compilefinal  (toString _TempArray) ;
	_return = _tempEncripted;
};

_return
};