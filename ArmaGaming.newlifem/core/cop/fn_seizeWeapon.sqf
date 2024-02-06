	
_clear = nearestObjects [player,["weaponholder"],3];
_clear = _clear + nearestObjects [player,["groundWeaponHolder"],3];
_destroyed = 0;

_xD = west countSide playableUnits;
if (_xD < 6) exitWith {
  for "_i" from 0 to count _clear - 1 do {
      _destroyed = _destroyed + 1;
      deleteVehicle (_clear select _i);
      uiSleep 0.056;
  };
  _destroyed = _destroyed - 1;
  [format["Seized %1 items, these items did not go into the container due to not enough cops being on duty.",_destroyed],false,"slow"] call ANZUS_fnc_notificationSystem;
};

for "_i" from 0 to count _clear - 1 do {
    _destroyed = _destroyed + 1;
    _item = _clear select _i;
		_mags = getMagazineCargo _item;
		_weapons = getWeaponCargo _item;
		clearBackpackCargo _item;

		if (count (_mags select 0) > 0) then {{evidencelocker addMagazineCargoGlobal [_mags select 0 select _forEachIndex,_mags select 1 select _forEachIndex]} forEach (_mags select 0); clearMagazineCargo _item;};
		if (count (_weapons select 0) > 0) then {{evidencelocker addWeaponCargoGlobal [_weapons select 0 select _forEachIndex,_weapons select 1 select _forEachIndex]} forEach (_weapons select 0);  clearWeaponCargo _item; };
    deleteVehicle (_clear select _i);
    uiSleep 0.056;
};
_destroyed = _destroyed - 1;
[format["Seized %1 item(s) and put them in the evidence locker.",_destroyed],false,"slow"] call ANZUS_fnc_notificationSystem;