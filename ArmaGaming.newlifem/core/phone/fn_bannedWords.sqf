params ["_string"];

private _stringLower = toLower _string;
private _stringArr = _string splitString " ";
private _tempString = _stringArr joinString "";
private _hasBadwords = false;
private _tempStringLower = toLower _tempString;

{
  if !(_tempStringLower find (toLower _x) isEqualto -1) then {
    _hasBadwords = true;
  };
} forEach AnzusLife_BannedWords;

_hasBadwords;