#include "..\..\script_macros.hpp"

if (ITEM_VALUE("relic4") isEqualTo 1) exitWith { ["You do not need more than one of each relic",true,"slow"] call ANZUS_fnc_notificationSystem; };
[true,"relic4",1,"misc"] call ANZUS_fnc_handleInv;
["You have collected a Lewni Relic",true,"slow"] call ANZUS_fnc_notificationSystem;