


_player = player;


if (side _player != civilian) exitWith {hintSilent "¿Quieres una paguita también tu? Anda por ahí facha!"};
if (call mafia <= 1 && call terrorista <= 1) exitWith {hint "¿Quieres una paguita también tu? Tienes pinta de kallejero"};
if (paguitas == 5) exitwith {hint "El estado no da más paguitas por ahora, a trabajar podemista."};
if (paguitarecogida) exitwith {hint "Ya has recogido tu paguita, estafador."};



paguitas = paguitas + 1;
publicVariable "paguitas";

_dinero = 10000 + round(random 10000);
titleText[format["Has recibido una paguita %1 € firmada por el coletas",[_dinero] call life_fnc_numberText],"PLAIN"];


vicio_din = vicio_din + _dinero;

paguitarecogida = true;

