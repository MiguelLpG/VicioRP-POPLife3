	
private["_gagger"];
_gagger = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
[format["You have been gagged by %1.", name _gagger],true,"slow"] call ANZUS_fnc_notificationSystem;

titleText ["You have a gag over your mouth, you can no longer talk!", "PLAIN"];
player setVariable ["tf_globalVolume", 0];
waitUntil{!(player getVariable ["gagged",false])};
["The gag was removed, you can again speak!",true,"slow"] call ANZUS_fnc_notificationSystem;

titleText ["You're not gagged", "PLAIN"];
player setVariable ["tf_globalVolume", 1];