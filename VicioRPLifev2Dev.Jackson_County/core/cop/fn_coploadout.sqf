/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "Cadete_Pop";

/*// Add shortrange radio
player addItem "tf_anprc152";
player assignItem "tf_anprc152";

// Canales por defecto de TFAR

[(call TFAR_fnc_activeSwRadio), 1, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 2, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 3, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 4, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 5, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 6, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 7, "512"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 8, "512"] call TFAR_fnc_SetChannelFrequency;*/

player addBackpack "mochila_pequena";
player addWeapon "CSW_M26C";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";


/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] call life_fnc_saveGear;

