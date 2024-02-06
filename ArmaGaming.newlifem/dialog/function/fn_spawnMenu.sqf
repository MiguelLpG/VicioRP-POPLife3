/*
    File: fn_spawnMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the spawn point selection menu.
*/
if (life_is_arrested) exitWith {[] call ANZUS_fnc_respawned;};
if (life_respawned) then {[] call ANZUS_fnc_respawned;};

closeDialog 0;
createDialog "AnzusLife_SpawnMenu";

private _display = findDisplay 8999720;
private _ctrlButtonLobby = _display displayCtrl 10;
_ctrlButtonLobby ctrlSetEventHandler ["ButtonClick", "endMission 'AnzusLife_End'"];
_display displaySetEventHandler ["keyDown","_this call ANZUS_fnc_displayHandler"];


// Get spawn class for side of world§
_side = switch (playerSide) do {
    case west: {"Cop"};
    case independent: {"Medic"};
    default {"Civilian"};
};

private _spawnConfig = missionConfigFile >> "CfgSpawnPoints" >> worldName >> _side;
if !(isClass _spawnConfig) throw "No config found for given side";

// Setup tree
private _ctrlTree = _display displayCtrl 1;
private _treeEntrySpawns = _ctrlTree tvAdd [[], "Towns"];
private _treeEntryProperties = _ctrlTree tvAdd [[], "Properties"];
private _treeEntryUnlockedSpawns = _ctrlTree tvAdd [[], "Unlocked spawns"];
_ctrlTree tvSetPicture [[_treeEntrySpawns], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];
_ctrlTree tvSetData [[_treeEntrySpawns], ""];
_ctrlTree tvSetPicture [[_treeEntryProperties], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];
_ctrlTree tvSetPicture [[_treeEntryUnlockedSpawns], "a3\3den\Data\Cfg3DEN\Layer\iconDisabled_ca.paa"];

_ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
    params [["_ctrl", controlNull, [controlNull]], ["_path", [], [[]]]];

    private _display = ctrlParent _ctrl;
    private _ctrlButtonSpawn = _display displayCtrl 4;

    private _ctrlSpawnName = _display displayCtrl 9;
    private _ctrlSpawnDescription = _display displayCtrl 3;
    private _tvData = _ctrl tvData _path;

    if !(_tvData isEqualTo "") then
    {
        private _dataArray = parseSimpleArray _tvData;
        _dataArray params
        [
        	["_spawnName", "", [""]],
            ["_spawnDescription", "", [""]],
            ["_position", [], [[]], 3]
        ];

        private _ctrlMap = _display displayCtrl 2;
        _ctrlMap ctrlMapAnimAdd [0.8, 0.1, _position];
        ctrlMapAnimCommit _ctrlMap;


        cameratarget = _position;
        _ctrlSpawnName ctrlSetText _spawnName;
        _ctrlSpawnDescription ctrlSetText _spawnDescription;
        _ctrlButtonSpawn ctrlEnable true;
    }
    else
    {
        _ctrlButtonSpawn ctrlEnable false;
        _ctrlSpawnName ctrlSetText "";
        _ctrlSpawnDescription ctrlSetText "";
    };
}];

{
    private _spawnName = getText (_x >> "displayName");
    private _spawnDescription = getText (_x >> "description");
    private _spawnIcon = getText (_x >> "icon");
    private _conditions = getText(_x >> "conditions");
    private _flag = [_conditions] call ANZUS_fnc_levelCheck;

    if (_flag) then {
        private _spawnMarker = call compile format ["%1",getArray (_x >> "spawnMarker")];
        if (_spawnMarker isEqualTo []) then {_spawnMarker = getText (_x >> "spawnMarker")} else {_spawnMarker = selectRandom _spawnMarker};

	   	private _index = _ctrlTree tvAdd [[_treeEntrySpawns], _spawnName];
	    private _position = getMarkerPos _spawnMarker;

	    // Add town and icon
	    _ctrlTree tvSetData [[_treeEntrySpawns, _index], format ["%1", [_spawnName, _spawnDescription, _position, markerDir _spawnMarker]]];
	    _ctrlTree tvSetPicture [[_treeEntrySpawns, _index], _spawnIcon];
    };

    true
} count ("true" configClasses _spawnConfig);

if (playerSide isEqualTo civilian) then {
  if (count life_houses > 0) then {
    {
		private _pos = call compile format ["%1",(_x select 0)];
		private _house = nearestObject [_pos, "House"];
		private _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		private _spawnPos = [_pos select 0, _pos select 1, ((_pos select 2) + 2)];

		private _index = _ctrlTree tvAdd [[_treeEntryProperties], _houseName];
		_ctrlTree tvSetData [[_treeEntryProperties, _index], format ["%1", [_houseName, "This is your cassa!", _spawnPos, getDir _house]]];
		_ctrlTree tvSetPicture [[_treeEntryProperties, _index], "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\villa.paa"];
      
		true
    } count life_houses;
  };
};

private _ctrlButtonSpawn = _display displayCtrl 4;
_ctrlButtonSpawn ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrl;
    private _ctrlTree = _display displayCtrl 1;
    private _tvSelection = tvCurSel _ctrlTree;
    private _tvData = _ctrlTree tvData _tvSelection;
    private _array = parseSimpleArray _tvData;

    _array params
    [
        ["_spawnName", "", [""]],
        ["_spawnDescription", "", [""]],
        ["_position", [], [[]], 3],
        ["_direction", 0, [0]]
    ];

    // Set players position
    player allowDamage false;
    player setPos _position;
    player setDir _direction;
    player allowDamage true;
    Camrunning = false;

    [] call ANZUS_fnc_spawnConfirm;
}];

private _ctrlButtonExpand = _display displayCtrl 7;
private _ctrlButtonCollapse = _display displayCtrl 7;
_ctrlButtonExpand ctrlAddEventHandler ["ButtonClick", {tvExpandAll _ctrlTree;}];
_ctrlButtonCollapse ctrlAddEventHandler ["ButtonClick", {tvCollapseAll _ctrlTree;}];

// Expand tree and set default selection
tvExpandAll _ctrlTree;
_ctrlTree tvSetCurSel [0, 0];

_tvData = _ctrlTree tvData (tvCurSel _ctrlTree);
_array = parseSimpleArray _tvData;

[_array select 2] spawn ANZUS_fnc_spawnCamera;