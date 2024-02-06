#include "..\..\script_macros.hpp"

private _npc = nearestObjects [player, ["Land_InfoStand_V1_F"], 5];
private _tags = [];

{
    _cansee = (([objNull, "VIEW"] checkVisibility [eyePos player, eyePos _x]) > 0) && (!isObjectHidden _x) && (life_settings_tagson);
    private _shop = "No Name";
    if (_cansee) then
    {   
        if (isNil {vehicleVarName _x}) exitWith {};
        switch (!(isNil {vehicleVarName _x})) do { 
            case (vehicleVarName _x find "Supermarket" > -1): {_shop = "Supermarket"}; 
        };
        _shop;

        private _displayshit = format["%1",_shop];
        _tags pushback [_x,_displayshit];
    };
} foreach _npc;

ANZUS_TagsArray = _tags;