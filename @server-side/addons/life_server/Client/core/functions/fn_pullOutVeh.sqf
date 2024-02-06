/*
    File: fn_pullOutVeh.sqf
    Author: Bryan "Tonic" Boardwine

    Description:

*/
params [["_unit",objNull,[objNull]]];

if (isNull _unit) exitWith {};

if (isNull objectParent player) exitWith {};
if (player getVariable ["restrained", false]) then {
    detach player;
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    life_disable_getOut = false;
    player action ["Eject", objectParent player];
    titleText[format [localize "STR_NOTF_PulledOut",name _unit],"PLAIN"];
    titleFadeOut 4;
    life_disable_getIn = true;
} else {
    player action ["Eject", objectParent player];
    titleText[format [localize "STR_NOTF_PulledOut",name _unit],"PLAIN"];
    titleFadeOut 4;
};
