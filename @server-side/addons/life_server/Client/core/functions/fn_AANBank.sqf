#include "..\..\script_macros.hpp"
	
private ["_header","_line","_sender","_display","_textHeader","_textLine","_textLinePos","_textClock","_robType","_temp"];
 
params [
	["_robType","",[""]]
];

if (_robType isEqualTo "") exitWith {};
_header = "";
_line = "";
_sender = "";
 

switch (_robType) do {
	case "Fed": {
		_header = "Federal Reserve Robbery";
		_line = "The Federal Reserve is being robbed! The police have urged all civilians to evacuate the area or they will be detained!";
		_sender = "The AAN, in co-operation with the MPD";
	};
	case "Bank": {
		_header = "Bank Robbery";
		_line = "The Bank is being robbed! The police have urged calmness as they respond to the matter, any civilians are to evacuate the area as police will be setting up a perimeter and detaining anyone close";
		_sender = "The AAN, in co-operation with the MPD";
	};
	case "Doc": {
		_header = "Department of Corrections Under Attack!";
		_line = "The Evidence Locker is being robbed! The police have urged calmness as they respond to the matter, any civilians are to evacuate the island as police will be setting up a perimeter and detaining anyone close.";
		_sender = "The AAN, in co-operation with the MPD";
	};
	case "Casino": {
		_header = "The Casino is being robbed!";
		_line = "The police have urged calmness as they respond to the matter, any civilians are to evacuate the area of the casino as police will be setting up a perimeter and detaining anyone close.";
		_sender = "The AAN, in co-operation with the MPD";
	};
};
disableSerialization;
_temp = profileNamespace getVariable ["life_enableNewsBroadcast",true];

if (!_temp) exitWith {};
 
30 cutRsc ["rscAAN","plain"];
_display = uiNamespace getVariable "BIS_AAN";
_textHeader = _display displayCtrl 3001;
_textHeader ctrlSetStructuredText parseText format ["<t size='2'>%1</t><br/>Broadcasted by: %2",_header,_sender];
_textHeader ctrlCommit 0;
 
_textLine = _display displayCtrl 3002;
_textLine ctrlSetStructuredText parseText format ["                         %1                         %1                         %1                         %1",_line];
_textLine ctrlCommit 0;
_textLinePos = ctrlPosition _textLine;
_textLinePos set [0,-100];
_textLine ctrlSetPosition _textLinePos;
_textLine ctrlCommit 1500;
 
_textClock = _display displayctrl 3003;
_textClock ctrlSetText ([daytime,"HH:MM"] call bis_fnc_timetostring);
_textClock ctrlCommit 0;
 
sleep 30;
30 cutText ["","plain"];