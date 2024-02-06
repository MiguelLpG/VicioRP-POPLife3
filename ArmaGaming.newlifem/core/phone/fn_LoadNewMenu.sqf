params [["_toOpen", "", [""]]];

if (_toOpen isEqualTo "") exitWith {};
private _newControls = [];
private _classes = getArray (missionConfigfile >> _toOpen >> "controls");

private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];
if (isNull _display) exitWith {};
{
  _x params ["_class", "_idc"];
  private _ctrl = _display ctrlCreate [_class, _idc];
  _ctrl ctrlSetFade 1;
  _ctrl ctrlCommit 0;
  _ctrl ctrlSetFade 0;
  _ctrl ctrlCommit 0.2;
  _newControls pushBack _ctrl;
} forEach _classes;

_newControls;
