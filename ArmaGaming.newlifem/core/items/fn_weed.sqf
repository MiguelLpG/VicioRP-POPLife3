closeDialog 0;

AnzusLife_WeedIsActive = true;
["You have smoked some weed, and now will regen health slowly. Altough your hunger is moving fast.",false,"slow"] call ANZUS_fnc_notificationSystem;
[player,"weed"] remoteexeccall ["say3D",-2];

sleep 300;
AnzusLife_WeedIsActive = false;