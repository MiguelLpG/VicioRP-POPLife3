/*
    File: fn_progressBar.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the progress bar.
*/
disableSerialization;
private ["_ui","_progress"];
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNameSpace getVariable "AnzusLife_Progress";
_group = _ui displayCtrl 1;
_progress = _group controlsGroupCtrl 3;
_progress progressSetPosition 0.5;
