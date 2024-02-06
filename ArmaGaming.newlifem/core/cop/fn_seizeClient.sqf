#include "..\..\script_macros.hpp"
	
private ["_exempt","_uniform","_vest","_headgear"];
_exempt = ["Binocular", "ItemWatch", "ItemCompass", "ItemGPS", "ItemMap"];

{
    if (!(_x in _exempt)) then {
        player removeWeapon _x;
    };
} forEach weapons player;

{
    if (!(_x in _exempt)) then {
        player removeItemFromUniform _x;
    };
} forEach uniformItems player;

{
    if (!(_x in _exempt)) then {
        player removeItemFromVest _x;
    };
} forEach vestItems player;

{
    if (!(_x in _exempt)) then {
        player removeItemFromBackpack _x;
    };
} forEach backpackItems player;

{
    if (!(_x in _exempt)) then {
            player removeMagazine _x;
    };
} forEach magazines player;

[] call ANZUS_fnc_updateRequest;
titleText[localize "STR_NOTF_SeizeIllegals","PLAIN"];
