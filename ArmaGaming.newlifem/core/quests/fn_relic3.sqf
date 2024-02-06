#include "..\..\script_macros.hpp"
if (ITEM_VALUE("relic3") isEqualTo 1) exitWith { ["You do not need more than one of each relic",true,"slow"] call ANZUS_fnc_notificationSystem; };
[true,"relic3",1,"misc"] call ANZUS_fnc_handleInv;

["You have collected a Shakrhi Relic",true,"slow"] call ANZUS_fnc_notificationSystem;