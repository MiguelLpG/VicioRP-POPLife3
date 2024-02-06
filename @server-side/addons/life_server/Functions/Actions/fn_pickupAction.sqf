#include "\life_server\script_macros.hpp"

params [
    ["_obj",objNull,[objNull]],
    ["_client",objNull,[objNull]],
    ["_cash",false,[true]]
];

if (isNull _obj || {isNull _client}) exitWith {["Obj or client is null?",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!(_obj getVariable ["inUse",false])) exitWith {
    _client = owner _client;
    _obj setVariable ["inUse",true,true];
    if (_cash) then {
        _obj remoteExecCall ["ANZUS_fnc_pickupMoney",_client];
    } else {
        [_obj] remoteExecCall ["ANZUS_fnc_pickupItem",_client];
    };
};