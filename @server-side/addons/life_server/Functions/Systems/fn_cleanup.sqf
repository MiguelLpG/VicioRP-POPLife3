#include "\life_server\script_macros.hpp"

private _deleted = false;
for "_i" from 0 to 1 step 0 do {
    uiSleep (30 * 60);
    {
        _list = _x nearEntities ['Man', 12];
        _list = _list select {isPlayer _x};
        if (count _list isEqualTo 0) then {
        	deleteVehicle _x;
        };
    } forEach (allSimpleObjects ["Land_Suitcase_F","Land_Money_F","Land_Sleeping_bag_blue_folded_F"]);

    uiSleep (1 * 60);
    {
        deleteVehicle _x;
    } forEach (allMissionObjects "GroundWeaponHolder");
	
	uiSleep (1 * 60);
    {   
        if (typeOf _x isEqualTo "Land_WoodenCrate_01_F" && _x getVariable ["AnzusLife_HouseRobberyOpened",false] isEqualTo false) then {
            _list = _x nearEntities ['Man', 12];
            _list = _list select {isPlayer _x};
            if (count _list isEqualTo 0) then {
                deleteVehicle _x;
            };
        };
    } forEach (allMissionObjects "Thing");
};
