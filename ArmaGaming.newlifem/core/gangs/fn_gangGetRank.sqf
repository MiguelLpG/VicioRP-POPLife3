params [["_unit", objNull, [objNull]]];

private _members = group _unit getVariable ["gang_members", []];
if (_members isEqualTo []) exitWith {-1};

private _unitUID = getPlayerUID _unit;
private _memberMatches = _members select {
    _x params [
        ["_name", "", [""]],
        ["_uid", "", [""]],
        ["_rank", 0, [0]]
    ];

    _uid isEqualTo _unitUID
};

if (count _memberMatches > 1) exitWith {0};
_memberMatches params [["_memberElement", [], [[]]]];
_memberElement params [
    ["_name", "", [""]],
    ["_uid", "", [""]],
    ["_rank", 0, [0]]
];

_rank