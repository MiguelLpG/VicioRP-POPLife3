["AnzusLife_InteractionButton",{
	params[["_value",0,[0]]];

	if(_value > ((count AnzusLife_actionList)-1)) exitWith {};

	closeDialog 0;

	_action = AnzusLife_actionList select _value select 1;
	call compile _action;
}] call AnzusLife_ClientCompile;

["AnzusLife_LoadInteraction",{
	disableSerialization;

	params[["_target",objNull,[objNull]]];

	MB_Interaction_Target = _target;
	AnzusLife_actionList = [];
	AnzusLife_overflowList = [];

	_interactionOptions = (missionConfigFile >> "cfgInteractions") call BIS_fnc_getCfgSubClasses;
	{
		_check = (missionConfigFile >> "cfgInteractions" >> _x >> "check") call BIS_fnc_getCfgData;

		if((call compile _check)) then {
			_action = (missionConfigFile >> "cfgInteractions" >> _x >> "action") call BIS_fnc_getCfgData;
			_title = (missionConfigFile >> "cfgInteractions" >> _x >> "title") call BIS_fnc_getCfgData;

			if(count AnzusLife_actionList >= 7) then {
				AnzusLife_overflowList pushBack [_title,_action];
			} else {
				AnzusLife_actionList pushBack [_title,_action];
			};
		};
	} forEach _interactionOptions;

	if(count AnzusLife_overflowList > 0) then {
		if(count AnzusLife_overflowList < 2) then {
			AnzusLife_actionList pushBack [(AnzusLife_overflowList select 0 select 0),(AnzusLife_overflowList select 0 select 1)];
		} else {
			AnzusLife_actionList pushBack ["More Options","[] call AnzusLife_LoadMoreInteractions;"];
		};
	};

	if(count AnzusLife_actionList < 1) exitWith {};

	closeDialog 0;
	life_vInact_curObject = call ANZUS_fnc_nearestInteraction;
	createDialog "AnzusLife_InteractionMenu";

	_idd = 1001;
	{
		ctrlSetText[_idd,(_x select 0)];
		_idd = _idd + 1;
	} forEach AnzusLife_actionList;
}] call AnzusLife_ClientCompile;

["AnzusLife_LoadMoreInteractions",{
	closeDialog 0;
	createDialog "AnzusLife_InteractionMenu";
	AnzusLife_actionList = [];

	_idd = 1001;
	{
		ctrlSetText[_idd,(_x select 0)];
		_idd = _idd + 1;

		AnzusLife_actionList pushBack _x;
	} forEach AnzusLife_overflowList;
}] call AnzusLife_ClientCompile;
