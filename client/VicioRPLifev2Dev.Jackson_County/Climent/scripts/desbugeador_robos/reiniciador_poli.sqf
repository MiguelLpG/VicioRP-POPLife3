if (robosactivos == 0) exitwith {hint "Los robos ya estan al 0";
closeDialog 0;};
[{robosactivos=0;}] remoteExec ["call"];
["<t size='0.8' shadow='1' color='#FF4D00'>Se han reiniciado los robos</t>"] remoteExec ["life_fnc_mensajeBonito", 0];
closeDialog 0;

