/*
    File: fn_3dPreviewDisplay.sqf
    Author: KLM

    Description:
    Called to change the object in the 3d preview.
*/

if ((lbCurSel 2302) isEqualTo -1) exitWith {[localize "STR_Shop_Veh_DidntPick",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};

private _className = lbData[2302,(lbCurSel 2302)];
if (isNil "life_3dPreview_camera") then {[(findDisplay 2300)] call ANZUS_fnc_3dPreviewInit;};

[_className] call ANZUS_fnc_3dPreviewDisplay;