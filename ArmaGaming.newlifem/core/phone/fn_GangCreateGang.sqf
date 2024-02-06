#include "..\..\script_macros.hpp"

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];
if (isNull _display) exitWith {};

private _gangNameCtrl = _display displayCtrl 160003;
private _gangNameText = ctrlText _gangNameCtrl;

private _bannedWords = [_gangNameText] call ANZUS_fnc_bannedWords;

if (_bannedWords) exitWith {
  ["You can't use that gang name as it contains banned words.",true,"slow"] call ANZUS_fnc_notificationSystem;
};

_gangSettings = MAIN_SETTINGS("GameSettings","Gangs");
private _creationCost = getNumber(_gangSettings >> "gang_price");

if (albank < _creationCost) exitWith {
	["You do not have enough in your bank account to do this.",true,"slow"] call ANZUS_fnc_notificationSystem;
};

	
private _text = format["Are you sure you want to create a gang with the name %1, this will cost you $%2",_gangNameText,[_creationCost] call ANZUS_fnc_numberText];
private _title = "Gang Creation";
private _response = [_title,_text] call ANZUS_fnc_sendWarning;

if (_response) then {
  closeDialog 0;
  [player,getPlayerUID player,_gangNameText] remoteExec ["TON_fnc_insertGang",RSERV];
} else {	
  ["You have canceled creating a gang.",true,"slow"] call ANZUS_fnc_notificationSystem;
};
