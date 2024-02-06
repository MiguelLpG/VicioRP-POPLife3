params ["_type"];

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

private _idc = switch (_type) do {
  case ("foot") : {90024};
  case ("ground") : {90023};
  case ("air") :{90025};
};

private _control = _display displayCtrl _idc;
private _text = ctrlText _control;
private _isNumber = [_text] call ANZUS_fnc_isNumber;

if !(_isNumber) exitWith {};

private _distanceInt = (parseNumber _text);

if (_distanceInt >= 10000 && _type != "air") then {
  _control ctrlSetText "9999";
  _distanceInt = 9999;
} else {
	if (_distanceInt >= 1500 && _type isEqualTo "air") then {
		_control ctrlSetText "1500";
  		_distanceInt = 1500;
	};
};

switch (_type) do {
  case ("foot") : {
	life_settings_viewDistanceFoot = _distanceInt;
	profileNamespace setVariable ["life_viewDistanceFoot",_distanceInt];
};
  case ("ground") : {
  	life_settings_viewDistanceCar = _distanceInt;
    profileNamespace setVariable ["life_viewDistanceCar",_distanceInt];
};
  case ("air") :{
  	life_settings_viewDistanceAir = _distanceInt;
    profileNamespace setVariable ["life_viewDistanceAir",_distanceInt];
};
};

[] call ANZUS_fnc_updateViewDistance;
