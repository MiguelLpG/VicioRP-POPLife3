params [
  ["_input","",[""]],
  ["_type","",[""]]
];

if (_input isEqualto "") exitWith {
  ["A Number as string must be passed through with this function"] call BIS_fnc_error;
};

	
_numberString = ["0","1","2","3","4","5","6","7","8","9"];

	
private _type = toLower(_type);

	
private _stringArr = _input splitString "";

	
private _newArr = [];

	
{
  if (_x in _numberString) then {
    _newArr pushBack _x;
  };
}forEach _stringArr;

	
private _newString = _newArr joinString "";

	
private _output = switch (_type) do {
  case ("numbertext") : {[(parseNumber _newString)] call bis_fnc_numbertext};
  case ("money") : {format["$%1",(([(parseNumber _newString)] call bis_fnc_numbertext) splitString " ") joinString ","]};
  case ("int") : {parseNumber _newString};
  default {_newString};
};

_output;
