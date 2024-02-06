private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

private _vehList = _display displayCtrl 140002;
private _pList = _display displayCtrl 140003;

lbClear _plist;
lbClear _vehList;

_saved = profileNamespace getVariable ["AnzusLife_NameTags",[]];
{
  if (((player distance _x) < 10) && (!isNull _x) && (alive _x) && (!(_x isEqualTo player)) && !(isObjectHidden _x)) then {
    _ply = _x;
    _savedName = "";
    {
        _sUID = _x select 0;
        _sName = _x select 1;

        if(_sUID isEqualTo (getPlayerUID _ply)) exitWith {_savedName = " - " + _sName;};
    } forEach _saved;

    private _index = _plist lbAdd format ["%1%2",((getPlayerUID _x) select [7, 10]),_savedName];
    _plist lbSetData [_index,(str _x)];
  };
} forEach playableUnits;

	
if ((lbSize _plist) <= 0) then {
  private _index = _plist lbAdd "No-one Near!";
};

_plist lbSetCurSel 0;

for "_i" from 0 to (count life_vehicles)-1 do {
    private _veh = life_vehicles select _i;
    if (!isNull _veh && alive _veh) then {
        private _color = ((getArray (missionConfigFile >> "LifeCfgVehicles" >> (typeOf _veh) >> "textures")) select (_veh getVariable "Life_VEH_color")) select 0;
        if (isNil "_color") then {_color = ""};
        _text = format ["(%1)",_color];
        if (_text == "()") then {
            _text = "";
        };

        _name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
        if (count _name > 31) then { 
            _name = _name select [0, 29]; 
            _name = _name + "..."; 
        };

        _pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
        _vehList lbAdd format ["%1 %3 - [%2m]",_name,round(player distance _veh),_text];
        if (_pic != "pictureStaticObject") then {
            _vehList lbSetPicture [(lbSize _vehList)-1,_pic];
        };
        _vehList lbSetData [(lbSize _vehList)-1,str(_i)];
    };
};

if (((lbSize _vehList)-1) isEqualTo -1) then {
    _vehList lbAdd localize "STR_NOTF_noVehOwned";
    _vehList lbSetData [(lbSize _vehList)-1,""];
};
