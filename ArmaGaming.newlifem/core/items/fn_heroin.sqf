closeDialog 0;
AnzusLife_HeroinIsActive = true;

["You have injected herion, and feel a lot stronger and feel a lot slower",false,"slow"] call ANZUS_fnc_notificationSystem;

sleep 300;
AnzusLife_HeroinIsActive = false;