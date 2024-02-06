if ("maf" call ica_fnc_expToLevel < 8) exitwith {hint "No tienes aprendido eso"}; 

_din = 7500; //precio
if(vicio_din - _din < 0) exitWith { hint "No tienes suficiente dinero, Muerto de hambre!";closeDialog  0;};
	vicio_din = vicio_din - _din;
	[format ["- %1€", _din]] call ica_fnc_infolog;
closeDialog  0;
titleText ["Añadidos 20 cargadores en la mochila", "BLACK", 2];
sleep 3;

comment "Add weapons";
player addHandgunItem "R3F_30Rnd_556x45_HK416";

comment "Add items to containers";
for "_i" from 1 to 20 do {player addItemToBackpack "R3F_30Rnd_556x45_HK416";};


titleText ["A mochear calvos", "BLACK IN", 2];