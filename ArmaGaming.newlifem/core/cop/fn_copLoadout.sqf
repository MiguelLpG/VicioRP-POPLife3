/*
    File: fn_copLoadout.sqf
    Author: Bryan "Tonic" Boardwine
    Edited: Itsyuka

    Description:
    Loads the cops out with the default gear.
*/
private ["_handle"];
_handle = [] spawn ANZUS_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "AL_Police0";
player addBackpack "AL_PoliceBelt";
player addHeadGear "AL_PoliceHat";
player addWeapon "crow_x26";
player addMagazines ["X26_Cartridge",5];

player linkItem "RoleplayRadio";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemGPS";

[true,"keyCard",1,"jail"] call ANZUS_fnc_handleInv;
[true,"panicbutton",1,"jail"] call ANZUS_fnc_handleInv;
[true,"toolkit",1,"jail"] call ANZUS_fnc_handleInv;
[true,"donuts",2,"jail"] call ANZUS_fnc_handleInv;
[true,"waterBottle",2,"jail"] call ANZUS_fnc_handleInv;
[true,"spikeStrip",1,"jail"] call ANZUS_fnc_handleInv;

player setVariable ["copLevel",1,true];
call ANZUS_fnc_setFreq;
