if !("maf" call ica_fnc_expToLevel == 500) exitwith {hint "Tu mafia no ha donado"}; 

_din = 12500; //precio
if(vicio_din - _din < 0) exitWith { hint "No tienes suficiente dinero, Muerto de hambre!";closeDialog  0;};
	vicio_din = vicio_din - _din;
	[format ["- %1€", _din]] call ica_fnc_infolog;
closeDialog  0;
titleText ["Corlefudra in da house", "BLACK", 2];
sleep 3;

comment "Remove existing items";
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "U_C_Polo_Barcelona";
player addVest "V_PlateCarrier2_blk";
player addBackpack "PGS_mochila_mediana";

comment "Add items to containers";
player addItemToBackpack "ToolKit";
for "_i" from 1 to 10 do {player addItemToBackpack "pop_vendas_c";};
for "_i" from 1 to 4 do {player addItemToBackpack "pop_esposas";};
for "_i" from 1 to 4 do {player addItemToBackpack "pop_Ganzua";};
for "_i" from 1 to 5 do {player addItemToBackpack "pop_kiwi";};
player addItemToBackpack "pop_llaves";
player addItemToBackpack "pop_note";
player addHeadgear "nexus";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "Itemwatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";



titleText ["mas bambis que geno pero gueno", "BLACK IN", 2];
