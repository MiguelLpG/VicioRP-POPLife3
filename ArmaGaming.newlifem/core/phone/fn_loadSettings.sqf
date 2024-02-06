#include "..\..\script_macros.hpp"

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

private _options = ["life_settings_enableNewsBroadcast","life_settings_enableSidechannel","life_settings_tagson","life_settings_revealObjects","life_settings_showinPhonebook"];
{
  if (isNil _x) then {
    profileNamespace setVariable [_x, true];
  };
} forEach _options;

life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_settings_enableNewsBroadcast",true];
life_settings_enableSidechannel = profileNamespace getVariable ["life_settings_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects",true];
life_settings_showinPhonebook = profileNamespace getVariable ["life_settings_showinPhonebook",true];

private _offX = (0.5495 * safezoneW + safezoneX);
private _onX = (0.558 * safezoneW + safezoneX);
private _backgroundOnX = (0.548 * safezoneW + safezoneX);
private _backgroundOffX = (0.52 * safezoneW + safezoneX);

{

  private _bool = (_x select 0);
  private _ctrl = _display displayCtrl (_x select 1);
  private _backgroundCtrl = _display displayCtrl (_x select 2);

  private _ctrlPosition = ctrlPosition _ctrl;
  private _backgroundCtrlposition = ctrlPosition _backgroundCtrl;

  _ctrlPosition params ["_xPos","_yPos","_width","_height"];
  _backgroundCtrlposition params ["_bgxPos","_bgyPos","_bgwidth","_bgheight"];

  if (_bool) then {
    _ctrl ctrlSetPosition [_onX,_yPos];
    _backgroundCtrl ctrlSetPosition [_backgroundOnX,_bgyPos];
  } else {
    _ctrl ctrlSetPosition [_offX,_yPos];
    _backgroundCtrl ctrlSetPosition [_backgroundOffX,_bgyPos];
  };

  _ctrl ctrlCommit 0;
  _backgroundCtrl ctrlCommit 0;

} forEach [
  [life_settings_tagson,90013,90003],
  [life_settings_enableNewsBroadcast,90015,90005],
  [life_settings_revealObjects,90017,90007],
  [life_settings_enableSidechannel,90019,90009],
  [life_settings_showinPhonebook,90021,90011]
];

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];
{
  (_display displayCtrl (_x select 1)) ctrlSetText format ["%1",(_x select 0)];
  (_display displayCtrl (_x select 1)) setVariable ["distanceVar",_x select 2];
  (_display displayCtrl (_x select 1)) ctrladdEventhandler ["keyUp", {[((_this select 0) getVariable ["distanceVar",""]) call ANZUS_fnc_SettingsUpdateViewDistance]}];
} forEach [
  [life_settings_viewDistanceFoot, 90024, "foot"],
  [life_settings_viewDistanceCar, 90023, "ground"],
  [life_settings_viewDistanceAir, 90025, "air"]
];
