params [
  ["_number", "", [""]],
  ["_player", objNull,[objNull]]
];

if ((_number isEqualTo "") || (isNull _player)) exitWith {};

private _pNumber = [_number] call ANZUS_fnc_mresString;
private _pUID = [getplayerUID _player] call ANZUS_fnc_mresString;
private _query = format ["SELECT * FROM AnzusLife_PhoneNumbers WHERE number = '%1'",_pNumber];
private _queryResult = [_query,2,true] call ANZUS_fnc_asyncCall;

private _results = (count _queryResult);

if (_results > 0) exitWith {
  ["That phone number already exists, please select another one.",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_player];
};

private _query2 = format ["INSERT INTO AnzusLife_PhoneNumbers (uid, number) VALUES ('%1','%2')",_pUID,_pNumber];
[_query2,1] call ANZUS_fnc_asyncCall;

[_number] remoteExec ["ANZUS_fnc_SetupQueryNumberReturn", _player];
