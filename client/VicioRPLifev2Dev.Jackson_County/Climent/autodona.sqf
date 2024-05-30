_din = 10000; 

if (call life_donator == 0) exitwith {titleText ["<t color='#ff0000' size='2'>No eres donador, abre un ticket de donación en Discord.</t><br/>", "PLAIN", -1, true, true];};
if(vicio_din - _din < 0) exitWith { hint "No tienes suficiente dinero, Muerto de hambre!";};

_result = [format ["¿Seguro que quieres vestirte? Te borrará tu equipación y te pondrá una para farmear"], "Ropa Farmer Donador","Aceptar","Cancelar"] call BIS_fnc_guiMessage;
	if (_result) then {
		
		vicio_din = vicio_din - _din;
[format ["- %1€", _din]] call ica_fnc_infolog;


removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "TRYK_U_denim_jersey_blk";
player addVest "pop_chaleco_carga";
player addBackpack "mochila_grande";

comment "Add items to containers";
for "_i" from 1 to 4 do {this addItemToBackpack "pop_Ganzua";};
for "_i" from 1 to 3 do {this addItemToBackpack "pop_kiwi";};
player addItemToBackpack "pop_iphone";
player addHeadgear "TRYK_H_woolhat";
player addGoggles "G_Balaclava_TI_blk_F";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "Itemwatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
	};



