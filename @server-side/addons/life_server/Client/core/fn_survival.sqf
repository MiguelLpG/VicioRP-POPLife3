#include "..\script_macros.hpp"
/*
    File: fn_survival.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    All survival? things merged into one thread.
*/
private ["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];
_fnc_food =  {
    if (life_hunger < 2) then {
        [localize "STR_NOTF_EatMSG_Death","true","slow"] call ANZUS_fnc_notificationSystem;
        player setHit ["head",1];
    } else {
        if (AnzusLife_WeedIsActive) then {
          life_hunger = life_hunger - 20;
        } else {
          life_hunger = life_hunger - 10;
        };
        [] call ANZUS_fnc_hudUpdate;
        if (life_hunger < 2) then {player setHit ["head",1]; [localize "STR_NOTF_EatMSG_Death","true","slow"] call ANZUS_fnc_notificationSystem;};
        switch (life_hunger) do {
            case 30: {[localize "STR_NOTF_EatMSG_1","true","slow"] call ANZUS_fnc_notificationSystem;};
            case 20: {[localize "STR_NOTF_EatMSG_2","true","slow"] call ANZUS_fnc_notificationSystem;};
            case 10: {[localize "STR_NOTF_EatMSG_3","true","slow"] call ANZUS_fnc_notificationSystem;};
        };
    };
};

_fnc_water = {
    if (life_thirst < 2) then {
        [localize "STR_NOTF_DrinkMSG_Death","true","slow"] call ANZUS_fnc_notificationSystem;
        player setHit ["head",1];
    } else {
        if (AnzusLife_CocaineIsActive) then {
          life_thirst = life_thirst - 20;
        } else {
          life_thirst = life_thirst - 10;
        };
        [] call ANZUS_fnc_hudUpdate;
        if (life_thirst < 2) then {player setHit ["head",1]; [localize "STR_NOTF_DrinkMSG_Death","true","slow"] call ANZUS_fnc_notificationSystem;};
        switch (life_thirst) do  {
            case 30: {[localize "STR_NOTF_DrinkMSG_1","false","slow"] call ANZUS_fnc_notificationSystem;};
            case 20: {[localize "STR_NOTF_DrinkMSG_2","false","slow"] call ANZUS_fnc_notificationSystem; if (MAIN_SETTINGS_TYPE(getNumber,"GameSettings","enable_fatigue") isEqualTo 1) then {player setFatigue 1;};};
            case 10: {[localize "STR_NOTF_DrinkMSG_3","false","slow"] call ANZUS_fnc_notificationSystem;};
        };
    };
};

_fnc_passout = {
  if (vehicle player isEqualTo player) then {
    [] call ANZUS_fnc_ragdoll;
  };

  ["You are starting to become low on hydration and hunger, and are starting to black out!","false","slow"] call ANZUS_fnc_notificationSystem;
  [4] spawn ANZUS_fnc_blackOutIn;
};


//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_weedtime = time;
_passouttime = time;
_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (_lastPos select 0) + (_lastPos select 1);
_lastState = vehicle player;
_gameSettings = MAIN_SETTINGS("GameSettings","Player");

for "_i" from 0 to 1 step 0 do {
    /* Thirst / Hunger adjustment that is time based */
    if ((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
    if ((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};
    if ((time - _passouttime) > 120) then {if (life_hunger < 15 || life_thirst < 15) then {[] call _fnc_passout; _passouttime = time;};};

    /* Drugs Are Bad mkkkkk */
    if (AnzusLife_HeroinIsActive) then {
      player forceWalk true;
    };

    /* Adjustment of carrying capacity based on backpack changes */
    if (backpack player isEqualTo "") then {
        life_maxWeight = getNumber(_gameSettings >> "nobag_maxWeight");
        _bp = backpack player;
    } else {
        if (!(backpack player isEqualTo "") && {!(backpack player isEqualTo _bp)}) then {
            _bp = backpack player;
            life_maxWeight = (getNumber(_gameSettings >> "nobag_maxWeight")) + round(FETCH_CONFIG2(getNumber,"CfgVehicles",_bp,"maximumload") / 4);
        };
    };

    /* Check if the player's state changed? */
    if (!(vehicle player isEqualTo _lastState) || {!alive player}) then {
        [] call ANZUS_fnc_updateViewDistance;
        _lastState = vehicle player;
    };

    /* Check if the weight has changed and the player is carrying to much */
    if (life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
        player forceWalk true;
        if (MAIN_SETTINGS_TYPE(getNumber,"GameSettings","enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
        if (player getVariable ["life_is_alive",false]) then {
            [localize "STR_NOTF_MaxWeight","false","slow"] call ANZUS_fnc_notificationSystem;
        };
    } else {
        if (isForcedWalk player) then {
            player forceWalk false;
        };
    };

    /* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
    if (!alive player) then {_walkDis = 0;} else {
        _curPos = visiblePosition player;
        _curPos = (_curPos select 0) + (_curPos select 1);
        if (!(_curPos isEqualTo _lastPos) && {(isNull objectParent player)}) then {
            _walkDis = _walkDis + 1;
            if (_walkDis isEqualTo 650) then {
                _walkDis = 0;
                life_thirst = life_thirst - 5;
                life_hunger = life_hunger - 5;
                [] call ANZUS_fnc_hudUpdate;
            };
        };
        _lastPos = visiblePosition player;
        _lastPos = (_lastPos select 0) + (_lastPos select 1);
    };
    uiSleep 1;
};
