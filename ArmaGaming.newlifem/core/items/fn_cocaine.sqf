closeDialog 0;
AnzusLife_CocaineIsActive = true;

life_cocaine_effect = time;
["You have snorted some cocaine, and will now run faster for 30 minutes and you have super thirsty.",false,"slow"] call ANZUS_fnc_notificationSystem;
player enableFatigue false;
waitUntil {!alive player || ((time - life_cocaine_effect) > (30 * 60))};
if (mav_ttm_var_stamina isEqualTo 0) then {player enableFatigue true;};

AnzusLife_CocaineIsActive = false;