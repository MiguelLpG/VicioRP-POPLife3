#include "..\..\script_macros.hpp"
/*
    File: fn_clothingMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and initializes the clothing store menu.
    Started clean, finished messy.
*/

params [["_shop","",[""]]];

if (_shop isEqualTo "") exitWith {};
if !(isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle",true,"slow"] call ANZUS_fnc_notificationSystem};

/* License check & config validation */
if !(isClass(missionConfigFile >> "Clothing" >> _shop)) exitWith {}; //Bad config entry.

private _shopTitle = M_CONFIG(getText,"Clothing",_shop,"title");
private _shopSide = M_CONFIG(getText,"Clothing",_shop,"side");
private _conditions = M_CONFIG(getText,"Clothing",_shop,"conditions");

private _exit = false;

private "_flag";

if !(_shopSide isEqualTo "") then {
    _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true};
};
if (_exit) exitWith {};

_exit = [_conditions] call ANZUS_fnc_levelCheck;
if !(_exit) exitWith {[localize "STR_Shop_Veh_NoLicense",true,"slow"] call ANZUS_fnc_notificationSystem;};

_players = (allPlayers select {_x != player && player distance _x < 30});
{
    if ((unitBackpack player) isEqualTo (unitBackpack _x)) then {
        removeBackpack player;
    };
} foreach _players;

//Save old inventory
life_oldClothes = uniform player;
life_olduniformItems = uniformItems player;
life_oldBackpack = backpack player;
life_oldVest = vest player;
life_oldVestItems = vestItems player;
life_oldBackpackItems = backpackItems player;
life_oldGlasses = goggles player;
life_oldHat = headgear player;
life_oldMagazines = magazinesAmmo player;

/* Open up the menu */
createDialog "AnzusLife_ClothingShop";
ctrlSetText [1,localize _shopTitle];
(findDisplay 3100) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {closeDialog 0;}"];

//Cop / Civ Pre Check
if (_shop in ["dive","reb","kart"] && {!(playerSide isEqualTo civilian)}) exitWith {[localize "STR_Shop_NotaCiv",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
if (_shop == "bruce" && playerSide isEqualTo independent) exitWith {["You are a medic you can not access this shop.",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
if (_shop == "cop" && {!(playerSide isEqualTo west)}) exitWith {[localize "STR_Shop_NotaCop",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
if (_shop == "dive" && {!(missionNamespace getVariable LICENSE_VARNAME("dive","civ"))}) exitWith {[localize "STR_Shop_NotaDive",true,"slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
private ["_pos","_oldPos","_oldDir","_oldBev","_testLogic","_nearVeh","_light"];

_pos = getPosATL player;
life_clothing_store = _shop;

/* Store license check */
if (isClass(missionConfigFile >> "Licenses" >> life_clothing_store)) then {
    _flag = M_CONFIG(getText,"Licenses",life_clothing_store,"side");
    _displayName = M_CONFIG(getText,"Licenses",life_clothing_store,"displayName");
    if !(LICENSE_VALUE(life_clothing_store,_flag)) exitWith {
        [format[localize "STR_Shop_YouNeed",localize _displayName],true,"slow"] call ANZUS_fnc_notificationSystem;
        closeDialog 0;
    };
};

//initialize camera view
showCinemaBorder false;
life_shop_cam = "CAMERA" camCreate (player modelToWorld [0, 100, 10]);
life_shop_cam camSetTarget player;
life_shop_cam camSetRelPos [1, 2, 2];
life_shop_cam cameraEffect ["INTERNAL", "BACK"];
life_shop_cam camCommit 0;
life_cMenu_lock = false;

_display = findDisplay 3100;
if (isNull _display) exitWith {};

private _list = _display displayCtrl 4;
private _filter = _display displayCtrl 7;
lbClear _filter;
lbClear _list;

_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";
_filter lbSetCurSel 0;

_ctrlTree = _display displayCtrl 4;
_ctrlTree ctrlAddEventHandler ["TreeSelChanged", { 
    _control = _this select 0;
    _selection = _this select 1;
    _price = (findDisplay 3100) displayCtrl 5;
    _total = (findDisplay 3100) displayCtrl 6;

    if (_selection isEqualTo []) exitWith {[localize "STR_Shop_NoSelection",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if (isNull _control) exitWith {[localize "STR_Shop_NoDisplay",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if (life_cMenu_lock) exitWith {};
    life_cMenu_lock = true;

    life_clothing_purchase set [life_clothing_filter,(_control tvValue _selection)];
    _data = _control tvData _selection;

    if (_data isEqualTo "NONE") then {
        _item = switch (life_clothing_filter) do {
            case 0: {uniform player};
            case 1: {headGear player};
            case 2: {goggles player};
            case 3: {vest player};
            case 4: {backpack player};
        };

        [_item,false] call ANZUS_fnc_handleItem;
    } else {
        [_data,true,nil,nil,nil,nil,nil,true] call ANZUS_fnc_handleItem;
    };

    life_cMenu_lock = false;
    _price ctrlSetStructuredText parseText format ["<t color='#8cff9b'>$%1</t>",[(_control tvValue _selection)] call ANZUS_fnc_numberText];

    _totalPrice = 0;
    {
        if (_x != -1) then {
            _totalPrice = _totalPrice + _x;
        };
    } forEach life_clothing_purchase;

    _total ctrlSetStructuredText parseText format ["<t color='#8cff9b'>$%1</t>",[_totalPrice] call ANZUS_fnc_numberText];
}];

waitUntil {isNull (findDisplay 3100)};

life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;
life_clothing_filter = 0;
if (isNil "life_clothesPurchased") exitWith {
    life_clothing_purchase = [-1,-1,-1,-1,-1];
    if !(life_oldClothes isEqualTo "") then {player addUniform life_oldClothes;} else {removeUniform player};
    if !(life_oldHat isEqualTo "") then {player addHeadgear life_oldHat} else {removeHeadgear player;};
    if !(life_oldGlasses isEqualTo "") then {player addGoggles life_oldGlasses;} else {removeGoggles player};
    if !(backpack player isEqualTo "") then {
        if (life_oldBackpack isEqualTo "") then {
            removeBackpack player;
        } else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            clearAllItemsFromBackpack player;
            if (count life_oldBackpackItems > 0) then {
                {
                    [_x,true,true] call ANZUS_fnc_handleItem;
                    true
                } count life_oldBackpackItems;
            };
        };
    };

    if (count life_oldUniformItems > 0) then {
        {
            [_x,true,false,false,true] call ANZUS_fnc_handleItem;
            true
        } count life_oldUniformItems;
    };

    if (vest player != "") then {
        if (life_oldVest isEqualTo "") then {
            removeVest player;
        } else {
            player addVest life_oldVest;
            if (count life_oldVestItems > 0) then {
                {
                    [_x,true,false,false,true] call ANZUS_fnc_handleItem;
                    true
                } count life_oldVestItems;
            };
        };
    };

    if (!(magazines player isEqualTo [])) then{
        {
            player removeMagazine _x;
        } forEach magazines player;

        {
            player addMagazine [_x select 0,_x select 1];
        } forEach life_oldMagazines;
    };
};
life_clothesPurchased = nil;

//Check uniform purchase.
if ((life_clothing_purchase select 0) isEqualTo -1) then {
    if (life_oldClothes != uniform player) then {player addUniform life_oldClothes;};
};
//Check hat
if ((life_clothing_purchase select 1) isEqualTo -1) then {
    if (life_oldHat != headgear player) then {
        if (life_oldHat isEqualTo "") then {
            removeHeadGear player;
        } else {
            player addHeadGear life_oldHat;
        };
    };
};
//Check glasses
if ((life_clothing_purchase select 2) isEqualTo -1) then {
    if (life_oldGlasses != goggles player) then {
        if (life_oldGlasses isEqualTo "") then  {
            removeGoggles player;
        } else {
            player addGoggles life_oldGlasses;
        };
    };
};
//Check Vest
if ((life_clothing_purchase select 3) isEqualTo -1) then {
    if (life_oldVest != vest player) then {
        if (life_oldVest isEqualTo "") then {removeVest player;} else {
            player addVest life_oldVest;
            {
                [_x,true,false,false,true] call ANZUS_fnc_handleItem;
                true
            } count life_oldVestItems;
        };
    };
};

//Check Backpack
if ((life_clothing_purchase select 4) isEqualTo -1) then {
    if (life_oldBackpack != backpack player) then {
        if (life_oldBackpack isEqualTo "") then {removeBackpack player;} else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            {
                [_x,true,true] call ANZUS_fnc_handleItem;
                true
            } count life_oldBackpackItems;
        };
    };
};

if (!(magazines player isEqualTo [])) then{
    {
        player removeMagazine _x;
    } forEach magazines player;

    {
        player addMagazine [_x select 0,_x select 1];
    } forEach life_oldMagazines;
};

life_clothing_purchase = [-1,-1,-1,-1,-1];
[] call ANZUS_fnc_saveGear;
