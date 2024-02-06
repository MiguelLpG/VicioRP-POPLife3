
private["_query","_sql"];
params [
    "_uid",
    "_side",
    "_type",
    "_className",
    ["_color",[[1,1,1],[1,1,1],0.5],[[]]],
    ["_plate",-1,[0]],
    ["_insured",0,[0]]
];

	
if (_uid isEqualTo "" || _side isEqualTo "" || _type isEqualTo "" || _className isEqualTo "" || _color isEqualTo -1 || _plate isEqualTo -1) exitWith {};

	
_query = format["INSERT INTO vehicles (side, classname, type, pid, alive, active, inventory, color, plate, gear, damage, insured) VALUES ('%1', '%2', '%3', '%4', '1','1','""[[],0]""', '%5', '%6','""[]""','""[]""','%7')",_side,_className,_type,_uid,_color,_plate,_insured];

[_query,1] call ANZUS_fnc_asyncCall;