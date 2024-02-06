private "_group";
_group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {};	
if (!isNull (findDisplay 2620)) then {closeDialog 2620};

[localize "STR_GNOTF_DisbandWarn_2",true,"slow"] call ANZUS_fnc_notificationSystem;
[player] joinSilent (createGroup civilian);

if (units _group isEqualTo []) then {
    deleteGroup _group;
};

closeDialog 0;