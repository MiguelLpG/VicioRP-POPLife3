
// ***********************************************************
// Anti Dupeo guardar gear matriz por Blakord
// xx = [true] call fn_antiDupeoGuardarGear ; // parametro true significa guardar (retorna array de equipo) -- false significa leer (retorna la variable del equipo)
// ***********************************************************

ica_fnc_antiDupeoGuardarGear = {
private ["_return","_myGrar","_encripted","_modo"] ;

_modo	= param[0];

If ( _modo ) Then {
	_myGrar = getUnitLoadout player ;
	_encripted = [true,_myGrar] call ica_fnc_antiDupeoEncriptador ;
	profileNamespace setVariable ["condigpxpbakup",_encripted];
	_return = _myGrar ;
} else {
	_encripted = profileNamespace getVariable "condigpxpbakup";
	_myGrar = [false,_encripted] call ica_fnc_antiDupeoEncriptador ;
	_return = _myGrar ;
};

_return
};