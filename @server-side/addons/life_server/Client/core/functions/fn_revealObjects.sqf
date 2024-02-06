/*
    File: fn_revealObjects.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Reveals nearest objects within 15 automatically to help with picking
    up various static objects on the ground such as money, water, etc.
    
    Can be taxing on low-end systems or AMD CPU users.
*/
if (!life_settings_revealObjects) exitWith {};
private "_objects";
_objects = nearestObjects[visiblePositionASL player, ["Land_CargoBox_V1_F","Man"], 15];

_objects = _objects + ((allSimpleObjects ["Land_CargoBox_V1_F","Land_Money_F","Land_Suitcase_F"]) select {(_x distance player) <= 15});
{
    player reveal _x;
    (group player) reveal _x;
} forEach _objects;
