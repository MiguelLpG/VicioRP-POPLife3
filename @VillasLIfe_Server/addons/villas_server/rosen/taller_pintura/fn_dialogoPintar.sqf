/* Creado por Rosen */

createDialog "tallerRosen";
disableSerialization;
_display = findDisplay 8856;
_lista = _display displayCtrl 8857;
lbClear 8857;
_colores = ["Azul cielo", "Rosa", "Morado", "Azul oscuro", "Lila", "Verde", "Verde oscuro", "Turquesa", "Salmon", "Rojo fuerte", "Rojo", "Mandarina","Amarillo",
			"Naranja", "Blanco", "Gris", "Gris oscuro", "Morado oscuro", "Lima", "Borgona", "Rosa fuerte", "Negro"];
_texturas = ["#(argb,8,8,3)color(0.3,0.5,1,1.0,CO)", "#(argb,8,8,3)color(1,0.5,1,1.0,CO)", "#(argb,8,8,3)color(0.65,0.5,1,1.0,CO)", "#(argb,8,8,3)color(0.25,0.25,1,1.0,CO)",
			"#(argb,8,8,3)color(0.25,0.25,0.4,1.0,CO)", "#(argb,8,8,3)color(0.25,0.5,0.01,1.0,CO)", "#(argb,8,8,3)color(0.05,0.3,0.01,1.0,CO)", "#(argb,8,8,3)color(0.05,0.3,0.31,1.0,CO)",
			"#(argb,8,8,3)color(0.55,0.3,0.31,1.0,CO)", "#(argb,8,8,3)color(0.95,0.3,0.31,1.0,CO)", "#(argb,8,8,3)color(0.65,0.1,0.1,1.0,CO)", "#(argb,8,8,3)color(0.95,0.7,0.51,1.0,CO)",
			"#(argb,8,8,3)color(0.95,0.9,0.1,1.0,CO)", "#(argb,8,8,3)color(0.95,0.6,0.1,1.0,CO)", "#(argb,8,8,3)color(0.81,0.91,0.91,1.0,CO)", "#(argb,8,8,3)color(0.71,0.71,0.71,1.0,CO)",
			"#(argb,8,8,3)color(0.31,0.31,0.31,1.0,CO)", "#(argb,8,8,3)color(0.1,0.1,0.3,1.0,CO)", "#(argb,8,8,3)color(0.6,1,0,1.0,CO)", "#(argb,8,8,3)color(0.35,0.11,0.1,1.0,CO)",
			"#(argb,8,8,3)color(1,0,1,1,CO)", "#(argb,8,8,3)color(0.1,0.1,0.1,0.1,CO)"];
for "_i" from 0 to 21 do {
	_lista lbAdd (_colores select _i);
	_lista lbSetData [_i, _texturas select _i];
};
_lista ctrlAddEventHandler ["LBSelChanged",{_display = findDisplay 8856;_boton = _display displayCtrl 8858;
							_boton buttonSetAction "[lbData[8857,(lbCurSel 8857)]] spawn ica_fnc_pintarVehiculo;closeDialog 0;"}];