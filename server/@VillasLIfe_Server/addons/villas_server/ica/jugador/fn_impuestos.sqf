
/*
por: Icaruk
*/

while {true} do {
	sleep (60 * 10);
	_i = floor (vicio_atmdin * 0.0005);
	vicio_atmdin = vicio_atmdin - _i;

	systemChat format ["Se te han deducido %1€ de impuestos, hacienda somos todos.", _i];
};
