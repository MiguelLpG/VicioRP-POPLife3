_param = param [0];

if !(hayevento) exitwith {hint "No hay ningún evento activo"};
if (todosconequipa) {hint "Ya has cogido tu equipa"};

if (_param isEqualTo "equipo1") exitwith {

todosconequipa = true;
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "U_I_CombatUniform_shortsleeve";
player addVest "V_PlateCarrier2_tna_F";

comment "Add items to containers";
player addItemToUniform "FirstAidKit";
player addHeadgear "TRYK_H_Helmet_JSDF";
player addGoggles "TRYK_kio_balaclavas";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "Itemwatch";
player linkItem "ItemRadio";

hint "Te has equipado para el evento";


};

if (_param isEqualTo "equipo2") exitwith {

todosconequipa = true;
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "U_I_CombatUniform_shortsleeve";
player addVest "V_PlateCarrier2_tna_F";

comment "Add items to containers";
player addItemToUniform "FirstAidKit";
player addHeadgear "TRYK_H_Helmet_JSDF";
player addGoggles "TRYK_kio_balaclavas";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "Itemwatch";
player linkItem "ItemRadio";
player linkitem "ItemGPS";

hint "Te has equipado para el evento";


};