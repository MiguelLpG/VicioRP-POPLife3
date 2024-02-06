#include "..\..\script_macros.hpp"
	

private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorObject;  
_vel = velocity _veh;  
_dir = direction player; 
life_interrupted = false;
if(isNull _veh) exitwith {};
if( locked _veh > 1 ) exitWith {["You cannot push locked vehicles",true,"slow"] call ANZUS_fnc_notificationSystem;};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	life_action_inUse = true;
	
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_upp = format["Pushing %1",_displayName];	
	
	//Setup the progress bar
	_title = _upp;
	_icon = "\ArmaGamingCore\images\displays\displayProgress\gather.paa";

	disableSerialization;
	"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
	_ui = uiNamespace getVariable "AnzusLife_Progress";
	_controlsGroup = _ui displayCtrl 1;
	_progress = _controlsGroup controlsGroupCtrl 3;
	_pgText = _controlsGroup controlsGroupCtrl 2;
	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while {true} do
	{
	    if !((animationState player) == "AinvPknlMstpSnonWnonDnon_medic_1") then {
	        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
	        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	    };
		uiSleep 0.27;
		_cP = _cP + 0.06;
		_progress progressSetPosition _cP;
	    _precentage = str round(_cP * 100) + "%";
	    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
	    
		if (_cP >= 1) exitWith {};
	    if (player getVariable ["inHostage",false]) exitWith {};
		if (!alive player) exitWith {};
		if ((player getVariable["restrained",false])) exitWith {};
		if (life_istazed) exitWith {};
		if (life_interrupted) exitWith {};
	};

    life_action_inUse = false;
    "progressBar" cutText ["","PLAIN"];
    player playActionNow "stop";
    if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
    if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
    if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];life_action_inUse = false;};
    if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
    player playMoveNow "Stand";

	_veh allowdamage false;
	_speed = 8.5;
	_veh setVelocity [(_vel select 0) + (sin _dir * _speed),(_vel select 1) + (cos _dir * _speed),(_vel select 2)];
	[format["You have pushed your %1",_displayName],false,"slow"] call ANZUS_fnc_notificationSystem;
	sleep 1;
	_veh allowdamage true;
};