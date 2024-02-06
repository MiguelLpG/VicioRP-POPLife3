/*
    File: fn_taladro.sqf
    Author: LoSantosYT
    Description:
    Hace aparecer y desaparecer el taladro
*/

_robo = typeOf cursorObject;

private _taladro = "taladro_" + _robo;
_taladro = call (compile _taladro);

removeBackpack player;

[_taladro, false] remoteExec ["hideObjectGlobal", 2]; //Mostrar taladro
timer = 300; //5 min
while {0 <= timer } do {

    // ejecutar sonido
    _taladro say3D "pdrill";

    //Resta 1s
    timer = timer -4;
    sleep 4;
};

[_taladro, true] remoteExec ["hideObjectGlobal", 2]; //Ocultar taladro

[_robo] call lsyt_fnc_puerta; //Abrir camara acorazada