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

