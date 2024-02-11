/*
	File: fn_civLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the civs out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};


_uni = ["PACMAN_Pop", "JWORLD_Pop", "RAPTORS_Pop", "RAPTORS2_Pop", "KITKAT_Pop", "MARITRINI_Pop", "APIPAS_Pop", "ET_Pop", "PICAPIEDRA_Pop", "IDIOTA_Pop", "NOENTIENDO_Pop", "TITTY_Pop", "MADURANDO_Pop", "CEDA_Pop", "IBERDROGA_Pop", "MORCILLA_Pop", "PUMBA_Pop", "LOGOPOP_Pop", "TRONOS_Pop"] call bis_fnc_selectRandom;
player forceAddUniform _uni;


{
	player addItem _x;
	player assignItem _x;
} forEach ["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio","ItemGPS"];

[] call life_fnc_saveGear;

