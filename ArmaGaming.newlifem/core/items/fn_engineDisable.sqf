#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];

if(isNull _vehicle) exitWith {};
if(isPlayer _vehicle) exitWith {};
if(!(_vehicle isKindOf "LandVehicle" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 5) exitWith {["You have to be within 5m of the vehicle.",true,"slow"] call ANZUS_fnc_notificationSystem;};
if(!([false,"enginedisable",1,"misc"] call ANZUS_fnc_handleInv)) exitWith {["You need a Engine Disabler.",true,"slow"] call ANZUS_fnc_notificationSystem;};

closeDialog 0;
life_action_inUse = true;
_displayName = getText (configFile >> "CfgVehicles" >> typeof _vehicle >> "displayName");

//Setup the progress bar
_title = format["Adding engine disabler to %1",_displayName];
_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\impound.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progressBar = _controlsGroup controlsGroupCtrl 3;
_titleText = _controlsGroup controlsGroupCtrl 2;
_titleText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, str("1" + "%"), (100 * (pixelH * pixelGrid * 0.50))];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
        player disableAI "anim"; 
    };

	sleep 0.27;
	_cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _titleText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
    if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {life_interrupted = true;};
    if (player distance _vehicle > 10) exitWith {life_interrupted = true;};
    if (!alive player) exitWith {life_interrupted = true;};
    if(player != vehicle player) exitWith {life_interrupted = true;};
    if (life_interrupted) exitWith {};
};

[0] call ANZUS_fnc_updatePartial;
life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if(life_interrupted) exitWith {
	life_interrupted = false;
	titleText[localize "STR_NOTF_ActionCancel","PLAIN"];
	[true,"enginedisable",1] call life_fnc_handleInv;
};

["You have placed the egine disabler on the vehicle.",false,"slow"] call ANZUS_fnc_notificationSystem;
player addAction [format["<t color='#4DB0E2'>Disable Engine (%1)",_displayName], {_veh = (_this select 3); if(!isNull _veh && alive _veh) then {[_veh] remoteExec ["ANZUS_fnc_setEngineHit",_veh]; }; (_this select 0) removeAction (_this select 2);}, _vehicle,0,true,true];