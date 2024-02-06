if (side player == CIVILIAN) exitWith {hint "No veo tu placa retrasado"};
if (side player == independent) exitWith {hint "Puto EMS corrupto, ¡se lo voy a decir a todo el mundo!"};

if (call life_donator == 0) exitwith {titleText ["<t color='#ff0000' size='2'>No eres donador, abre un ticket de donación en Discord.</t><br/>", "PLAIN", -1, true, true];};
if((call life_coplevel) < 7) exitWith {hint "No eres GEO , ¡GARRULO!";closeDialog 0;};

_din = 8000; //precio
if(vicio_din - _din < 0) exitWith { hint "No tienes suficiente dinero, Muerto de hambre!";closeDialog  0;};
	vicio_din = vicio_din - _din;
	[format ["- %1€", _din]] call ica_fnc_infolog;
closeDialog  0;
titleText ["Equipandote de GEO ,tienes humos y flashes", "BLACK", 2];
sleep 3;
comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "R3F_HK416M";
player addPrimaryWeaponItem "RH_fa556";
player addPrimaryWeaponItem "RH_SFM952V";
player addPrimaryWeaponItem "optic_DMS";
player addPrimaryWeaponItem "R3F_30Rnd_556x45_HK416";
player addPrimaryWeaponItem "RH_TD_ACB_b";

comment "Add containers";
player forceAddUniform "GEO";
player addVest "GEO_CHALECO";
player addBackpack "mochila_grande";

comment "Add items to containers";
for "_i" from 1 to 3 do {player addItemToUniform "RH_30Rnd_556x45_M855A1";};
player addItemToBackpack "ToolKit";
for "_i" from 1 to 6 do {player addItemToBackpack "SUPER_flash";};
for "_i" from 1 to 6 do {player addItemToBackpack "SmokeShellPurple";};
for "_i" from 1 to 10 do {player addItemToBackpack "pop_vendas_c";};
for "_i" from 1 to 3 do {player addItemToBackpack "pop_esposas";};
for "_i" from 1 to 2 do {player addItemToBackpack "pop_Ganzua";};
for "_i" from 1 to 2 do {player addItemToBackpack "pop_kiwi";};
player addItemToBackpack "pop_note";
player addItemToBackpack "pop_llaves";
for "_i" from 1 to 20 do {player addItemToBackpack "RH_30Rnd_556x45_M855A1";};
player addHeadgear "H_Orel_Swat";
player addGoggles "G_Balaclava_TI_blk_F";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "Itemwatch";
player linkItem "ItemGPS";


titleText ["Ya estas equipado, buen servicio", "BLACK IN", 2];

