#include "\life_server\script_macros.hpp"
/*
    File: fn_clientDisconnect.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    When a client disconnects this will remove their corpse and
    clean up their storage boxes in their house. Also, saves player infos & position.
*/

params [
    ["_unit",objNull,[objNull]],
    "",
    ["_uid","",[""]]
];
if (isNull _unit) exitWith {};

if (side _unit isEqualTo civilian) then {
	if (isNil "HC_UID" || {!(_uid isEqualTo HC_UID)}) then {
	    _position = getPosATL _unit;
	    if ((getMarkerPos "respawn_civilian" distance _position) > 300) then {
	        if (life_save_civilian_position && _side isEqualTo civilian) then {
	            _alive = alive _unit;
	            if (life_HC_isActive) then {[_uid,_side,_alive,4,_position] remoteExec ["HC_fnc_updatePartial",HC_Life]} else {[_uid,_side,_alive,4,_position] spawn ANZUS_fnc_updatePartialServer};
	        };
	    };
	};
};

if !(alive _unit) then {
    diag_log format["%1 disconnected while dead.",_uid];
    [format["%1 has combat logged.",_uid], "medical.log"] remoteExec ["AH_LogInterface",2];
} else {
    {
        _x params [
            ["_corpseName","",[""]],
            ["_corpseUID","",[""]],
            ["_corpse",objNull,[objNull]]
        ];

        if (_corpseUID isEqualTo _uid) exitWith {
            if (isNull _corpse) exitWith {server_corpses deleteAt _forEachIndex};
            [format["%1/%2 has combat logged at %3",_corpseName,_corpseUID,position _corpse], "medical.log"] remoteExec ["AH_LogInterface",2];
            deleteVehicle _corpse;
            server_corpses deleteAt _forEachIndex;
        };
    } forEach server_corpses;
};

private _containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x} forEach _containers;
deleteVehicle _unit;

[_uid] spawn TON_fnc_houseCleanup;