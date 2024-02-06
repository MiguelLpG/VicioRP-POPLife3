#include "..\..\script_macros.hpp"
	
params [
    "_value",
    ["_array",[[]],[[]]]
];

_return = -1;
{
    if (_value in _x) then {
        _return = _forEachIndex;
        breakOut "";
    };
} forEach _array;

_return;