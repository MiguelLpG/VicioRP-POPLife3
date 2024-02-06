#include "..\..\script_macros.hpp"
	
private ["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {[localize "STR_GNOTF_TransferSelect",true,"slow"] call ANZUS_fnc_notificationSystem;};
_unit = call compile format ["%1",CONTROL_DATA(2621)];

if (isNull _unit) exitWith {};	
if (_unit == player) exitWith {[localize "STR_GNOTF_TransferSelf",true,"slow"] call ANZUS_fnc_notificationSystem;};

_action = [
    format [localize "STR_GNOTF_TransferMSG",name _unit],
    localize "STR_Gang_Transfer"
] call ANZUS_fnc_sendWarning;

if (_action) then {
    _unitID = getPlayerUID _unit;
    if (_unitID isEqualTo "") exitWith {[localize "STR_GNOTF_badUID",true,"slow"] call ANZUS_fnc_notificationSystem;};	
    group player setVariable ["gang_owner",_unitID,true];
    group player selectLeader _unit;
    [_unit,group player] remoteExec ["TON_fnc_clientGangLeader",_unit];	

    if (life_HC_isActive) then {
        [3,group player] remoteExec ["HC_fnc_updateGang",HC_Life];	
    } else {
        [3,group player] remoteExec ["TON_fnc_updateGang",RSERV];	
    };

} else {
    [localize "STR_GNOTF_TransferCancel",true,"slow"] call ANZUS_fnc_notificationSystem;
};
[] remoteExec ["ANZUS_fnc_loadGangMenu", _group];
