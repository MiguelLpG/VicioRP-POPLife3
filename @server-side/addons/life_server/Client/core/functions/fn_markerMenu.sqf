#include "..\..\script_macros.hpp"

if (dialog) then {closeDialog 0};
createDialog "AnzusLife_MarkerMenu";

fillMarkerList = {
	params[["_filter", ""]];
	_filter = toLower _filter;
	_display = findDisplay 1020;
	_markers = [allMapMarkers, [], { player distance (getMarkerPos _x) }, "ASCEND", { !((markerType _x) isEqualTo "Empty") && !((markerText _x) isEqualTo "") }] call BIS_fnc_sortBy;
	_lbCtrl = _display displayCtrl 22;
	lbClear _lbCtrl;
	{
		_text = (markerText _x);
		if ((_text select [0,1]) isEqualTo "@") then {_text = localize (_text select [1,count _text]);};
		if (((toLower _text) find _filter > -1) || ((toLower _x) find _filter > -1)) then {
			_lb = _lbCtrl lbAdd format["%1 - %2m",_text,(getPos player) distance (getMarkerPos _x)];
			_icon = getText (configFile >> "CfgMarkers" >> markerType _x >> "icon");
			_lbCtrl lbSetPicture [_lb,_icon];
			_lbCtrl lbSetData [_lb,_x];
		};
	} forEach _markers;
	_lbCtrl lbSetCurSel 0;
};
call fillMarkerList;

_display = findDisplay 1020;
_list = _display displayCtrl 22;
_map = _display displayCtrl 20;
_search = _display displayCtrl 23;

_list ctrlSetEventHandler ["LBSelChanged","
	_display = findDisplay 1020;
	_map = _display displayCtrl 20;
	_marker = (_this select 0) lbData (_this select 1);
	_pos = getMarkerPos _marker;
	if (_pos isEqualTo [0,0,0]) exitWith {};
	_map ctrlMapAnimAdd [0.4, 0.1, _pos];
	ctrlMapAnimCommit _map;
"];

_search ctrlSetEventHandler ["KeyUp","
	params ['_displayorcontrol'];
	[ctrlText _displayorcontrol] call fillMarkerList;
"];