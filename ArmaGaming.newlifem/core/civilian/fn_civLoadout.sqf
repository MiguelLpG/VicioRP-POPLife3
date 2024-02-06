private ["_handle"];
_handle = [] spawn ANZUS_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_hats = ["d3s_CAP_beanie_1_c","d3s_CAP_beanie_1_h","d3s_CAP_beanie_1_m","d3s_CAP_beanie_2_o","d3s_CAP_beanie4","d3s_CAP_beanie_2_a","d3s_CAP_beanie_1_l","d3s_CAP_beanie_1_b","d3s_CAP_christmas_head_b","d3s_CAP_christmas_head_e","d3s_CAP_christmas_head_g","d3s_CAP_christmas_head2_b","d3s_CAP_christmas_head3_b","d3s_CAP_christmas_head4_d","d3s_CAP_christmas_head_f","d3s_CAP_furcap"];
	
player addHeadgear (selectRandom _hats);
player addUniform "kojixus_spawnclothing";

player addItem "RoleplayRadio"; 
player assignItem "RoleplayRadio";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemGPS";

[] call ANZUS_fnc_saveGear;