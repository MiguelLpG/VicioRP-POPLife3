params[["_string", "", [""]]];
private _filter = "'/\`:|;,{}-""<>";

_string = toArray _string;
_filter = toArray _filter;

{
    if (_x in _filter) then {
        _string deleteAt _forEachIndex;
    };
} forEach _string;

toString _string;
