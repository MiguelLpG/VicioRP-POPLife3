
private ["_groupID","_bank","_maxMembers","_members","_membersFinal","_query","_owner"];
params [
    ["_mode",0,[0]],
    ["_group",grpNull,[grpNull]]
];

if (isNull _group) exitWith {};

_groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

switch (_mode) do {
    case 0: {
        _bank = [(_group getVariable ["gang_bank",0])] call ANZUS_fnc_numberSafe;
        _maxMembers = _group getVariable ["gang_maxMembers",50];
        _members = [(_group getVariable "gang_members")] call ANZUS_fnc_mresArray;
        _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};

        _query = format ["UPDATE gangs SET bank='%1', maxmembers='%2', owner='%3' WHERE id='%4'",_bank,_maxMembers,_owner,_groupID];
    };

    case 1: {
        _query = format ["UPDATE gangs SET bank='%1' WHERE id='%2'",([(_group getVariable ["gang_bank",0])] call ANZUS_fnc_numberSafe),_groupID];
    };

    case 2: {
        _query = format ["UPDATE gangs SET maxmembers='%1' WHERE id='%2'",(_group getVariable ["gang_maxMembers",50]),_groupID];
    };

    case 3: {
        _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};
        _query = format ["UPDATE gangs SET owner='%1' WHERE id='%2'",_owner,_groupID];
    };

    case 4: {
        _members = _group getVariable "gang_members";
        if (count _members > (_group getVariable ["gang_maxMembers",50])) then {
            _membersFinal = [];
            for "_i" from 0 to _maxMembers -1 do {
                _membersFinal pushBack (_members select _i);
            };
        } else {
            _membersFinal = _group getVariable "gang_members";
        };

        {
            _x set [0,[_x select 0] call ANZUS_fnc_mresString];
            _membersFinal set[_forEachIndex,_x];
        } forEach _membersFinal;
        
        _membersFinal = [_membersFinal] call ANZUS_fnc_mresArray;
        _query = format ["UPDATE gangs SET members='%1' WHERE id='%2'",_membersFinal,_groupID];
    };

    case 5: {
        _query = format ["UPDATE gangs SET tasks='%1' WHERE id='%2'",(_group getVariable ["gang_role",[0,[0,0,0,0,0,0]]]),_groupID];
    };
};

if (!isNil "_query") then {
    [_query,1] call ANZUS_fnc_asyncCall;
};
