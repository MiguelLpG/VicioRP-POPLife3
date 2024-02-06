params [
  ["_numberText","",["",0]],
  ["_allowDecimal",false,[false]]
];

private _numbers = ["1","2","3","4","5","6","7","8","9","0"];
private _return = true;
private _hasDecimal = false;

if (_numberText isEqualType 0) then {
  _numberText = format ["%1",_numberText];
};

private _numberTextArr = _numberText splitString "";

{
  if !(_x in _numbers) then {	
    private _1 = (_x == "." && (!_allowDecimal));//if it has a decimal point , and decimals arent allowed	
    private _2 = (_x != ".");//if its not a number... and its not a decimal	
    private _3 = (_hasDecimal && (_x == "."));	
    private _4 = (_x == "." && _allowDecimal);	

    if (_4) then {
      if (_3) exitWith {
        _return = false;
      };
      _hasDecimal = true;
    } else {
      if (_1 || _2) exitWith {
        _return = false;
      };
    };
  };
} forEach _numberTextArr;

if (_numberText isEqualTo "") then {_return = false};

_return;
