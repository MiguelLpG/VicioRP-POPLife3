#include "..\..\script_macros.hpp"
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
_gameSettings = MAIN_SETTINGS("GameSettings","Player");

if ((count life_gear) == 2) then {
    private _gearArray = life_gear select 0;
    private _itemsArray = life_gear select 1;
    waitUntil {!(isNull (findDisplay 46))};

    _handle = [] spawn ANZUS_fnc_stripDownPlayer;
    waitUntil {scriptDone _handle};

    if ((count _gearArray) isEqualTo 0) then {
        switch (playerSide) do {
            case west: {
                [] spawn ANZUS_fnc_copLoadout;
            };

            case civilian: {
                [] spawn ANZUS_fnc_civLoadout;
            };

            case independent: {
                [] spawn ANZUS_fnc_medicLoadout;
            };
        };
    } else {
        player setUnitLoadout _gearArray;  
    };

    life_maxWeight = if (backpack player isEqualTo "") then {getNumber(_gameSettings >> "nobag_maxWeight")} else {(getNumber(_gameSettings >> "nobag_maxWeight")) + round(FETCH_CONFIG2(getNumber,"CfgVehicles",(backpack player),"maximumload") / 4)};
    {
        if ((isClass(missionConfigFile >> "VirtualItems" >> (_x select 0)))) then {
            [true,(_x select 0),floor (_x select 1),"load"] call ANZUS_fnc_handleInv;
        };
    } forEach _itemsArray;
} else {
    switch (playerSide) do
    {
        case west: {
            _handle = [] spawn ANZUS_fnc_copLoadout;
        };
        case civilian: {
            _handle = [] spawn ANZUS_fnc_civLoadout;
        };
        case independent: {
            _handle = [] spawn ANZUS_fnc_medicLoadout;
        };
        waitUntil {scriptDone _handle};
    };
};
