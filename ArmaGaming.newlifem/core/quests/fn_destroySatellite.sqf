#include "..\..\script_macros.hpp"

if ((missionNamespace getVariable ['mav_ttm_var_satellite',0]) isEqualTo 1) exitwith {["You have already started and or completed the quest!",true,"slow"] call ANZUS_fnc_notificationSystem;}; 
if (ITEM_VALUE("satellite") isEqualTo 1) exitWith { ["You have already taken the required part out of the satellite!",true,"slow"] call ANZUS_fnc_notificationSystem; };

[true,"satellite",1,"misc"] call ANZUS_fnc_handleInv;
[player,"satelliteOff"] remoteexeccall ["say3D",-2];

["You have collected the proper satellite part, bring it to the Archeologist.",true,"slow"] call ANZUS_fnc_notificationSystem;