#include "..\..\script_macros.hpp"

//---------------------------------
//By Nick
//---------------------------------

disableSerialization;
if(isNull LIFEdisplay) then {[] call ANZUS_fnc_hudSetup;};

private "_espacio";
_espacio = [(life_carryWeight / life_maxWeight), 2] call BIS_fnc_cutDecimals;


if(!isNil "life_thirst") then
{
		LIFEctrl(700411) progressSetPosition (life_thirst / 100);
};

if (damage player >= 0) then
{
	LIFEctrl(700412) progressSetPosition (1 - (damage player));
};

if(!isNil "life_hunger") then
{
		LIFEctrl(700410) progressSetPosition (life_hunger / 100);
};

if(!isNil "_espacio") then
{
		LIFEctrl(700413) progressSetPosition ([(life_carryWeight / life_maxWeight), 2] call BIS_fnc_cutDecimals);
};

_text = ""; 
_color = [];
switch (missionNameSpace getVariable ["AnzusLife_ThreatLevel",0]) do { 
	case 0: {
		_text = "CODE GREEN";
		_color = [0.063,0.776,0,1];
	}; 
	case 1: {
		_text = "CODE AMBER";
		_color = [0.776,0.424,0,1];
	}; 
	case 2: {
		_text = "CODE RED";
		_color = [0.776,0,0,1];
	}; 
	case 3: {
		_text = "MARTIAL LAW";
		_color = [0.569,0,0,1];
	}; 
};

_major = floor ((time - (missionNameSpace getVariable ["AnzusLife_MajorCrime", time])) / 60);
_text = format["%1 - %2m", _text, _major];
_hora = format["%1/%2/%3 - %4:%5", systemTime select 2, systemTime select 1, systemTime select 0, systemTime select 3, systemTime select 4];
_dinero = [alcash] call BIS_fnc_numberText;
_dinero = format [" %1 €",_dinero];

LIFEctrl(600213) ctrlSetText _hora;
LIFEctrl(1251) ctrlSetText _text;
LIFEctrl(1251) ctrlSetTextColor _color;
LIFEctrl(600212) ctrlSetText _dinero;