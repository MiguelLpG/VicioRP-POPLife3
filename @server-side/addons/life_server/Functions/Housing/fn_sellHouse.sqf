
private ["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers"];
_house = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _house) exitWith {[":SERVER:sellHouse: House is null",true,"slow"] call ANZUS_fnc_notificationSystem;};

_houseID = _house getVariable ["house_id",-1];
if (_houseID isEqualTo -1) then {
    _housePos = getPosATL _house;
    _ownerID = (_house getVariable "house_owner") select 0;
    _query = format ["UPDATE houses SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_housePos];
} else {
    _query = format ["UPDATE houses SET owned='0', pos='[]' WHERE id='%1'",_houseID];
};

_house setVariable ["house_id",nil,true];
_house setVariable ["house_owner",nil,true];

[_query,1] call ANZUS_fnc_asyncCall;
_house setVariable ["house_sold",nil,true];
_house setVariable ["house_tax",nil,true];
["CALL deleteOldHouses",1] call ANZUS_fnc_asyncCall;
