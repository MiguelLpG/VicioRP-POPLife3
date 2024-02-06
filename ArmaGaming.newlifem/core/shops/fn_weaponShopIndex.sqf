params [
	["_string", "", [""]],
	["_array", [], [[]]]
];

if (_string isEqualTo -1 || {_array isEqualTo []}) exitWith {-1};

_index = -1;
{
	_x params ["_str"];
	if (_string isEqualTo _str) then {
		_index = _forEachIndex;
	};
} forEach _array;

_index