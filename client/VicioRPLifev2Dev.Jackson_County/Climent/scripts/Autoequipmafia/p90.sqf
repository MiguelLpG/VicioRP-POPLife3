if ("maf" call ica_fnc_expToLevel < 5) exitwith {hint "No tienes aprendido eso"}; 

_din = 90000; //precio
if(vicio_din - _din < 0) exitWith { hint "No tienes suficiente dinero, Muerto de hambre!";closeDialog  0;};
	vicio_din = vicio_din - _din;
	[format ["- %1€", _din]] call ica_fnc_infolog;
closeDialog  0;
titleText ["Geovesse in da house", "BLACK", 2];
sleep 3;


//comment "Remove existing items";
//removeAllWeapons player;

comment "Add weapons";
player addWeapon "chakFNP90_50rnd_skin1";
player addPrimaryWeaponItem "RH_eotech553mag";
player addPrimaryWeaponItem "chakFNP90_57x28_B_skin1";

comment "Add items to containers";
for "_i" from 1 to 20 do {player addItemToBackpack "chakFNP90_57x28_B_skin1";};


titleText ["A mochear calvos", "BLACK IN", 2];

