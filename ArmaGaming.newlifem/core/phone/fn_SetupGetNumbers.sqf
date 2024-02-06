
private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];

if (isNull _display) exitWith {};

private _config = (missionconfigfile >> "AnzusLife_Core_Settings");
private _numberPrefix = getText(_config >> "phoneNumberPrefix");
private _numberLength = getNumber(_config >> "phoneNumberLength");
private _numberStart = getNumber(_config >> "phoneNumberStart");
private _numberSetupCombo = _display displayCtrl 180010;
lbClear _numberSetupCombo;
for "_j" from 0 to 100 step 1 do {
  private _numberTemp = (str _numberStart);
  private _uidArr = (getPlayerUID player) splitString "";
  private _numberTempArr = _numberTemp splitString "";
  private _numberCount = (count _numberTempArr);

  for "_i" from _numberCount to _numberLength step 1 do {
    private _thisNumber = (selectRandom _uidArr);
    _numberTempArr pushBack _thisNumber;
    _uidArr deleteAt (_uidArr find _thisNumber);
    if ((count _numberTempArr) isEqualto _numberLength) exitWith {};
  };

  private _numberTemp = _numberTempArr joinString "";
  private _index = _numberSetupCombo lbAdd format ["%1%2",_numberPrefix,_numberTemp];
  _numberSetupCombo lbSetData [_index,_numberTemp];
};

_numberSetupCombo lbSetCurSel 0;
