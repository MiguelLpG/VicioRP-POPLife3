if ("maf" call ica_fnc_expToLevel < 3) exitwith {hint "No tienes aprendido eso"}; 

_din = 40000; //precio
if(vicio_din - _din < 0) exitWith { hint "No tienes suficiente dinero, Muerto de hambre!";closeDialog  0;};
	vicio_din = vicio_din - _din;
	[format ["- %1€", _din]] call ica_fnc_infolog;
closeDialog  0;
titleText ["Equipando beretta", "BLACK", 2];
sleep 3;


//comment "Remove existing items";
//removeAllWeapons player;

comment "Add weapons";
player addWeapon "RH_m9";
player addHandgunItem "RH_15Rnd_9x19_M9";

comment "Add items to containers";
for "_i" from 1 to 20 do {player addItemToBackpack "RH_15Rnd_9x19_M9";};


titleText ["A mochear calvos", "BLACK IN", 2];


