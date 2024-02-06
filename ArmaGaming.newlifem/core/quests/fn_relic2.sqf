#include "..\..\script_macros.hpp"
if (ITEM_VALUE("relic2") isEqualTo 1) exitWith { ["You do not need more than one of each relic",true,"slow"] call ANZUS_fnc_notificationSystem; };
[true,"relic2",1,"misc"] call ANZUS_fnc_handleInv;

["You have collected a Arkhan Relic",true,"slow"] call ANZUS_fnc_notificationSystem;