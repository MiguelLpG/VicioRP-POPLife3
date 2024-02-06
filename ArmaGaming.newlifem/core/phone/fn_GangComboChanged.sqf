private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

private _listbox = _display displayCtrl 150002;
private _combo = _display displayCtrl 150003;

private _ownerID = group player getVariable ["gang_owner",""];
private _selection = lbCurSel _combo;
private _data = _combo lbData _selection;

lbClear _listbox;

if (_data == "members") then {
	lbClear _listbox;
	{
		if ((getPlayerUID _x) == _ownerID) then {
			_listbox lbAdd format ["%1 " +(localize "STR_GNOTF_GangLeader"),(name _x)];
			_listbox lbSetData [(lbSize _listbox)-1,str(_x)];
		} else {
			_listbox lbAdd format ["%1",(name _x)];
			_listbox lbSetData [(lbSize _listbox)-1,str(_x)];
		};
	} forEach (units (group player));
} else {
	lbClear _listbox;
	private _grpMembers = (group player) getVariable ["gang_members",[]];
	private _allUnits = playableUnits;
	{
		if (((getPlayerUID _x) in _grpMembers) || (!(side _x isEqualTo civilian) && isNil {(group _x) getVariable "gang_id"})) then {
			_allUnits deleteAt (_allUnits find _x);
		};
	} forEach playableUnits;
	{
		_listbox lbAdd format ["%1",name _x];
		_listbox lbSetData [(lbSize _listbox)-1,str(_x)];
	} forEach _allUnits;

	if ((lbSize _listbox) <= 0) then {
		_listbox lbAdd "No Valid Players !";
	};
};