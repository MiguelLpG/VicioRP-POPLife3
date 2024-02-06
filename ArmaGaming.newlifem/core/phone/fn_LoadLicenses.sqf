#include "..\..\script_macros.hpp"

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

	
if (isNull _display) exitWith {};

private _listbox = _display displayCtrl 110002;
lbClear _listbox;

private _side = switch (playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

{
    private _displayName = getText(_x >> "displayName");
    private _hasLicense = LICENSE_VALUE(configName _x,_side);

    if (_hasLicense) then {
        _index = _listbox lbAdd (localize _displayName);
    };

} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if ((lbSize _listbox) <= 0) then {
  _index = _listbox lbAdd "No Licenses";
};
