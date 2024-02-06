/*
  Confiscar objetos

*/



if !(cursortarget isKindOf "Man") exitwith {hint "No estas apuntando al esposado, intentalo de nuevo";
closeDialog 0;
};

_player = cursortarget;
closeDialog 0;
_tiempoParaAbrir = 5;
[_tiempoParaAbrir, "QUITANDO GPS ..."] spawn ica_fnc_barrita;

_player unassignItem "ItemGPS";
sleep 0.1;
_player removeItem "ItemGPS";
sleep 0.1;
_player unassignItem "ItemRadio";
sleep 0.1;
_player removeItem "ItemRadio";
sleep 0.1;

parseText format ["Te han confiscado el GPS"] remoteExec ["hintSilent",_player];



