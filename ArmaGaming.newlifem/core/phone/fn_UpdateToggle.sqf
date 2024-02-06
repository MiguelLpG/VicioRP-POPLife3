params ["_btn"];
private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];
private _offX = (0.5495 * safezoneW + safezoneX);
private _onX = (0.558 * safezoneW + safezoneX);

private _backgroundOnX = (0.548 * safezoneW + safezoneX);
private _backgroundOffX = (0.52 * safezoneW + safezoneX);

private _idc = switch (_btn) do {
	case 1 : {90013};
	case 2 : {90015};
	case 3 : {90017};
	case 4 : {90019};
	case 5 : {90021};
};

private _backgroundIDC = switch (_btn) do {
	case 1 : {90003};
	case 2 : {90005};
	case 3 : {90007};
	case 4 : {90009};
	case 5 : {90011};
};

switch (_btn) do {
	case 1 : {
		if (life_settings_tagson) then {
			life_settings_tagson = false;
			profileNamespace setVariable ["life_settings_tagson",false];
			[ANZUS_ID_VehicleTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		} else {
			life_settings_tagson = true;
			profileNamespace setVariable ["life_settings_tagson",true];
			ANZUS_ID_VehicleTags = ["ANZUS_VehicleTags","onEachFrame",{{_p = _x select 0; _pos = visiblePositionASL _p; _pos set [2, ((_p modelToWorld [0,0,0]) select 2) + 1]; drawIcon3D ["", [0.267,0.549,1,1],_pos, 1, 1, 0, _x select 1, 1, 0.03, "PuristaMedium", "center", false];} foreach (missionNameSpace getVariable ["ANZUS_TagsArray",[]]);}] call BIS_fnc_addStackedEventHandler;
			LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame",{{_p = _x select 0; _pos = visiblePositionASL _p; _pos set [2, ((_p modelToWorld [0,0,0]) select 2) + 2]; drawIcon3D ["", _x select 2,_pos, 0.2, 0.2, 45, _x select 1, 1, 0.03, "PuristaBold"];} foreach (missionNameSpace getVariable ["AnzusLife_TagsArray",[]]);}] call BIS_fnc_addStackedEventHandler;
		};
	};

	case 2 : {
		if (life_settings_enableNewsBroadcast) then {
			life_settings_enableNewsBroadcast = false;
			profileNamespace setVariable ["life_settings_enableNewsBroadcast",false];
		} else {
			life_settings_enableNewsBroadcast = true;
			profileNamespace setVariable ["life_settings_enableNewsBroadcast",true];
		};
	};

	case 3 : {
		if (life_settings_revealObjects) then {
			life_settings_revealObjects = false;
			profileNamespace setVariable ["life_settings_revealObjects",false];
		} else {
			life_settings_revealObjects = true;
			profileNamespace setVariable ["life_settings_revealObjects",true];
		};
	};

	case 4 : {
		if (life_settings_enableSidechannel) then {
			life_settings_enableSidechannel = false;
			profileNamespace setVariable ["life_settings_enableSidechannel",false];
		} else {
			life_settings_enableSidechannel = true;
			profileNamespace setVariable ["life_settings_enableSidechannel",true];
		};
	};

	case 5 : {
		if (life_settings_showinPhonebook) then {
			life_settings_showinPhonebook = false;
			profileNamespace setVariable ["life_settings_showinPhonebook",false];
		} else {
			life_settings_showinPhonebook = true;
			profileNamespace setVariable ["life_settings_showinPhonebook",true];
		};
	};
};

saveprofilenamespace;

private _toggle = _display displayCtrl _idc;
private _pos = ctrlPosition _toggle;

private _togglebackground = _display displayCtrl _backgroundIDC;
private _togglebackgroundPos = ctrlPosition _togglebackground;

_pos params ["_x","","",""];
_togglebackgroundPos params ["_backgroundx","","",""];

private _newBackgroundX = if (_backgroundx isEqualto _backgroundOffX) then {_backgroundOnX} else {_backgroundOffX};

private _newBackgroundPos = [
	_newBackgroundX,
	(_togglebackgroundPos select 1)
];

private _newX = if (_x isEqualto _offX) then {_onX} else {_offX};
private _newPos = [
	_newX,
	(_pos select 1)
];

_togglebackground ctrlSetPosition _newBackgroundPos;
_togglebackground ctrlCommit 0.1;
_toggle ctrlSetPosition _newPos;
_toggle ctrlCommit 0.1;