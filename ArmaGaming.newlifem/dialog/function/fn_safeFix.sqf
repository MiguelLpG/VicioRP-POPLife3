#include "..\..\script_macros.hpp"
	
private "_vault";
_vault = _this select 0;
if (!(_vault getVariable ["bankOpen",false])) exitWith {[localize "STR_Cop_VaultLocked",true,"slow"] call ANZUS_fnc_notificationSystem;};

life_action_inUse = true;
	
//Setup the progress bar
_title = "Repairing Vault";
_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\organizationAccount.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if !((animationState player) == "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    uisleep 0.26;
    _cP = _cP + .012;
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
    
    if (_cP >= 1 || !alive player) exitWith {};
    if (life_interrupted) exitWith {};
};

	
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
_vault setVariable ["bankOpen",false,true];

switch (vehicleVarName _vault) do { 
    case "FedVault" : {[true,"relicFed",1,"misc"] call ANZUS_fnc_handleInv;}; 
    default {}; 
};

["FixSafe"] call mav_ttm_fnc_addExp;
[localize "STR_Cop_VaultRepaired",true,"slow"] call ANZUS_fnc_notificationSystem;