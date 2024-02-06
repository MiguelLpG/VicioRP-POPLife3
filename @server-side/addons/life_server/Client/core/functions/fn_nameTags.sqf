if (life_settings_tagson isEqualTo false) exitWith {};

private _obj = missionnamespace getvariable ["BIS_fnc_camera_cam",cameraOn];

private _nearObjects = nearestObjects [_obj, ["Man"], 8] select {isPlayer _x && {alive _x} && {!(_x isEqualTo _obj)} && {lineIntersectsSurfaces [eyePos _obj, eyePos _x, vehicle _obj, _x] isEqualTo []} && (vehicle _x isEqualTo _x)} apply {[_x, getPlayerUID _x]};
_tags = [];
_saved = profileNamespace getVariable ["AnzusLife_NameTags",[]];
{
	_x params ["_player", "_olduid"];
	
    _savedName = "";
    {
        _sUID = _x select 0;
        _sName = _x select 1;

        if(_sUID isEqualTo _olduid) exitWith {_savedName = _sName;};
    } forEach _saved;

    _color = _player getVariable ["AnzusLife_NametagColor",[1,1,1,1]]; 
    if (_player call TFAR_fnc_isSpeaking) then {
        _color = [0, 0.5, 0.94, 1];
    };

    _cansee = (([objNull, "VIEW"] checkVisibility [eyePos _obj, eyePos _player]) > 0) && (!isObjectHidden _player) && (life_settings_tagson);
    if (_cansee) then
    {
        _id = ((getPlayerUID _player) select [7, 10]);

        _name = "No Name Registered";
        _tagged = "";
        if (_player getVariable ["parole", false]) then {
            _tagged = "[TAGGED] ";
        };

        if !(_savedName isEqualto "") then {
          _name = format["%1 %3- %2",_id,_savedName,_tagged];
        } else {
          _name = format["%1",_id];
        };

        _tags pushback [_player,_name,_color];
    };
} foreach _nearObjects;

AnzusLife_TagsArray = _tags;