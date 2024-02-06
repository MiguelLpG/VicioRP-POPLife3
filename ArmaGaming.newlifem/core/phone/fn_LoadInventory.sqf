#include "..\..\script_macros.hpp"

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

	
private _itemList = _display displayCtrl 130002;
private _plist = _display displayCtrl 130004;

lbClear _plist;
lbClear _itemList;

{
    _val = ITEM_VALUE(configName _x);

    if (_val > 0) then {
        private _index = _itemList lbAdd format ["%1 - [x%2]",localize (getText(_x >> "displayName")),_val];
        _itemList lbSetData [_index,configName _x];
        _icon = (getText(_x >> "icon"));
	    if (!(_icon isEqualTo "")) then {
	        _itemList lbSetPicture [_index,_icon];
	    };
    };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

if ((lbSize _itemList) <= 0) then {
  _index = _itemList lbAdd "No Items";
};

diag_log format ["%1",(lbSize _itemList)];
_saved = profileNamespace getVariable ["AnzusLife_NameTags",[]];
{
  if (((player distance _x) < 10) && (!isNull _x) && (alive _x) && (!(_x isEqualTo player)) && !(isObjectHidden _x)) then {
    _ply = _x;

    _savedName = "";
    {

        _sUID = _x select 0;
        _sName = _x select 1;

        if(_sUID isEqualTo (getPlayerUID _ply)) exitWith {_savedName = " - " + _sName;};
    } forEach _saved;
    private _index = _plist lbAdd format ["%1%2",((getPlayerUID _x) select [7, 10]),_savedName];
    _plist lbSetData [_index,(str _x)];
  };
} forEach playableUnits;

	
if ((lbSize _plist) <= 0) then {
  private _index = _plist lbAdd "No-one Near!";
};

_plist lbSetCurSel 0;
