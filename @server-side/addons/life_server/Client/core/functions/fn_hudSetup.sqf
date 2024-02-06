#include "..\..\script_macros.hpp"
if (isServer) exitWith {};
disableSerialization;

2 cutRsc ["AL_Hud","PLAIN"];
[] call ANZUS_fnc_hudUpdate;

[] spawn
{
	while {true} do
	{
		[] call ANZUS_fnc_hudUpdate;
		sleep 1;
	};
};

_version = MAIN_SETTINGS_TYPE(getNumber,"Branch","serverVersion");

private _display = uiNamespace getVariable ["AL_Hud",displayNull];