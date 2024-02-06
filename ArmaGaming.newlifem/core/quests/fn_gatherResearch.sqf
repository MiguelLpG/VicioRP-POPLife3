#include "..\..\script_macros.hpp"
if (ITEM_VALUE("unknown") >= 22) exitWith { ["You cannot possibly gather any more of this... shit. Try and find out who needs it and bring it to them",true,"slow"] call ANZUS_fnc_notificationSystem; };
if ((missionNameSpace getVariable ["mav_ttm_var_relicReward",0]) isEqualTo 0) exitwith {["You need to complete the first quest before completing this!",true,"slow"] call ANZUS_fnc_notificationSystem;}; 
if ((missionNameSpace getVariable ["mav_ttm_var_relicReward2",0]) isEqualTo 0) exitwith {["You need to complete the second quest before completing this!",true,"slow"] call ANZUS_fnc_notificationSystem;}; 
if ((missionNameSpace getVariable ["mav_ttm_var_satellite",0]) isEqualTo 0) exitwith {["You need to complete the third quest before completing this!",true,"slow"] call ANZUS_fnc_notificationSystem;}; 

[true,"unknown",1,"misc"] call ANZUS_fnc_handleInv;
["You have collected some sort of odd substance...",true,"slow"] call ANZUS_fnc_notificationSystem;