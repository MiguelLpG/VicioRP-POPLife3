#include "..\..\script_macros.hpp"

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

	
if (isNull _display) exitWith {};

	
private _cashCtrl = _display displayCtrl 120004;
private _bankCtrl = _display displayCtrl 120005;
private _plist = _display displayCtrl 120002;

lbClear _plist;

	
private _cash = CASH;
private _bank = BANK;

private _cashFormat = format["$%1", ([_cash] call ANZUS_fnc_numberText)];
private _bankFormat = format["$%1", ([_bank] call ANZUS_fnc_numberText)];

	
_cashCtrl ctrlSetText _cashFormat;
_bankCtrl ctrlSetText _bankFormat;

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
