params [
  ["_oldControls", [], [[]]]
];

if (_oldControls isEqualTo []) exitWith {};
if !(_oldControls isEqualTo []) then {
  {
    _x ctrlSetFade 1;
    _x ctrlCommit 0.2;
  } forEach _oldControls;
  private _lastControl = _oldControls select ((count _oldControls) -1);
  waitUntil {ctrlCommitted _lastControl};
  {
    ctrlDelete _x;
  } forEach _oldControls;
};
