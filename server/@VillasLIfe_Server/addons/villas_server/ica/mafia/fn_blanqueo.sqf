
/*
por: Icaruk
	call ica_fnc_blanqueo;
*/

_n = vicio_din;
if (_n <= 0) exitWith {hint "No tienes dinero"};
vicio_din = 0;
[format ["-%1 €", _n]] call ica_fnc_infolog;

_n = _n * 0.7;
_n spawn {
	sleep 450; // PENDIENTE
	vicio_atmdin = vicio_atmdin + _this;
	[6] call SOCK_fnc_updatePartial;
};

hint "Dentro de unos 5-10 minutos, tendrás tu dinero en tu cuenta, de forma segura, pero con intereses aplicados.";
