#include "..\..\script_macros.hpp"
if (!(playerSide isEqualTo civilian)) exitWith {["You need to be a civilian to take this test.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if (missionNamespace getVariable LICENSE_VARNAME("driver","civ")) exitwith {["You already have a drivers license",false,"slow"] call ANZUS_fnc_notificationSystem;};

createDialog "Life_yesnoMenu";