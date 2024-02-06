["ANZUS_fnc_plantCharge",{
	_cops = (west countSide playableUnits);
	if (_cops < 8) exitWith {["You can not rob the DoC until there are 8 cops on duty!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if ((missionNamespace getVariable [format['life_inv_blastingcharge_%1', uiNamespace getVariable ['Life_Rnd', 0]], 0]) < 1) exitWith {["You do not have a blasting charge on you.",true,"slow"] call ANZUS_fnc_notificationSystem;};
	
	_var = missionNamespace getVariable ["AnzusLife_MajorCrime",time];
	if ((time - _var) < 1800) exitWith {["There has been a recent major crime in the past 30 minutes, you must wait that 30 mins!",true,"slow"] call ANZUS_fnc_notificationSystem;};

    [player,cursorObject] remoteExec ["AnzusLife_HandleCharge",2];
}] call AnzusLife_ClientCompile;

["AnzusLife_HandleCharge",{
	params [["_player",objNull,[objNull]],["_door",objNull,[objNull]]];

	if (_door getVariable ["JailPlanted",false]) exitWith {["There is already a charge planted, please try again after the charge is gone!",true,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem", _player];};

	_charge = "TR8_C4" createVehicle [0,0,0]; 
	_modelSpace = _door selectionPosition "door"; 
	_modelSpace set [0, (_modelSpace select 0) + (-0.5)]; 
	_modelSpace set [1, (_modelSpace select 1) + 0.2]; 
	_modelSpace set [2, (_modelSpace select 2) + (-0.4)]; 
	_pos = _door modelToWorld (_modelSpace); 
	_charge setPos _pos; 
	_charge setVectorDirAndUp [[sin (getDir _door - 90), cos (getDir _door - 90), 0], [0, cos (getDir _door), 0]];

	_door setVariable ["JailPlanted",true,true];
	["The charge has been/will be planted and will blow in 1 minutes, get behind cover!",false,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem", _player];
	["A charge has been placed on the main jail door, respond immediately!",false,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem",west];

	private _timer = 60;
	while {_timer > 0} do {	
		sleep 1;
		_minutes = floor (_timer / 60);
		_seconds = _timer % 60;
		_tens = floor (_seconds / 10);
		_units = _seconds % 10;
		_charge setObjectTextureGlobal [0, format ["\TR8_Pack\TR8_Items\TR8_C4\textures\%1.paa", _minutes]];
		_charge setObjectTextureGlobal [1, format ["\TR8_Pack\TR8_Items\TR8_C4\textures\%1.paa", _tens]];
		_charge setObjectTextureGlobal [2, format ["\TR8_Pack\TR8_Items\TR8_C4\textures\%1.paa", _units]];

		_timer = _timer - 1;
	};

	_pos = getPos _charge;
	_bomb = "Bo_GBU12_LGB_MI10" createVehicle _pos;
	_bomb hideObjectGlobal true;
	_bomb setPosASL (getPosASL _charge);
	_bomb setDamage 1;
	deleteVehicle _charge;

	_door setVariable ["JailPlanted",false,true];
	_door animate ["maindoor1",1.5]; 
	_door animate ["maindoor2",-1.5];
	_door animate ["door",1]; 

	playSound3D ["ArmaGamingCore\sounds\bankAlarm.ogg", _door, false, getPosASL _door, 6, 1, 150];
}] call AnzusLife_ServerCompile;

["AnzusLife_GetDoor",{
	params[["_jail",objNull,[objNull]]];
	_range = 1.55;

	if (cameraView == "External") then
	{
		_range = _range + ((positioncameratoworld [0,0,0]) distance (player modeltoworld(player selectionposition "head")));
	};

	_posa = positionCameraToWorld [0,0,0];
	_posb = positionCameraToWorld [0,0,_range];

	_int = ([_jail, "GEOM"] intersect [_posa, _posb]) select 0 select 0;

	if (isNil "_int") then
	{
		_int = ([_jail, "FIRE"] intersect [_posa, _posb]) select 0 select 0;
	};

	if (isNil "_int") exitWith {""};


	_int
}] call AnzusLife_ClientCompile;

["AnzusLife_OpenDoor",{
	closeDialog 0;
	_jail = cursorObject;
	_check = [_jail] call AnzusLife_GetDoor;

	if (_jail animationPhase _check < -0.5) exitWith {["The cell is already open!",true,"slow"] call ANZUS_fnc_notificationSystem;};
	if ((animationState player) == "ainvpknlmstpsnonwnondnon_medic_1") exitwith {["You are already opening this cell door!",true,"slow"] call ANZUS_fnc_notificationSystem;}; 

	if !(_check isEqualTo "") then {
		life_action_inUse = true;
		closeDialog 0;

		//Setup the progress bar
		_title = "Lockpicking Cell";
		_icon = "\ArmaGamingCore\images\displays\displayInteractionMenu\lockpick.paa";

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
            if ((animationState player) != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

            sleep 0.30;
            _cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_lockpickMultiplier", 1]));
            _progress progressSetPosition _cP;
            _precentage = str round(_cP * 100) + "%";
    		_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    
            if (_cP >= 1) exitWith {};
			if (player getVariable ["inHostage",false]) exitWith {};
            if (!alive player) exitWith {};
            if !(isNull objectParent player) exitWith {};
            if (life_interrupted) exitWith {};
        };

        life_action_inUse = false;
        "progressBar" cutText ["","PLAIN"];
        player playActionNow "stop";
        if (life_interrupted) exitWith {life_interrupted = false; ["Lockpicking canceled!",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
        if !(isNull objectParent player) exitWith {["You cannot be in a vehicle!",true,"slow"] call ANZUS_fnc_notificationSystem;};
        if (player getVariable ["inHostage",false]) exitWith {["You have been taken hostage, action canceled.",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};

        player playMoveNow "Stand";

        _opened = [_jail,_check] call AnzusLife_Lib_OpenDoor;

        if !(_opened) exitWith {["Door failed to open!",true,"slow"] call ANZUS_fnc_notificationSystem;};
        _chance = round(random(100));
        if (_chance < 50) then {
            ["A cell door has been broken into at DOC, all units please respond.",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem", west];
            ["You have completed lockpicking the cell but the lockpick broke and the cops were alerted!",true,"slow"] call ANZUS_fnc_notificationSystem;
            [false,"lockpick",1,"jail"] call ANZUS_fnc_handleInv;
        } else {
        	["You have completed lockpicking the cell and have managed to open it!",true,"slow"] call ANZUS_fnc_notificationSystem;
    	};
	} else {
		["You are not near any cells!",true,"slow"] call ANZUS_fnc_notificationSystem;
	};
}] call AnzusLife_ClientCompile;


["AnzusLife_SearchGarbage",{
	closeDialog 0;
	if (animationState player isEqualTo "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon" || animationState player isEqualTo "amovpknlmstpsnonwnondnon") exitwith {["You are already searching the garbage!",true,"slow"] call ANZUS_fnc_notificationSystem;}; 

	life_action_inUse = true;
	closeDialog 0;
	//Setup the progress bar
	_title = "Searching the Garbage";
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

	for "_i" from 0 to 1 step 0 do {
	    if (animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon") then {
	        [player,"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
	        player switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	        player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	    };

	    sleep 0.45;
	    _cP = _cP + 0.01;
	    _progress progressSetPosition _cP;
	    _precentage = str round(_cP * 100) + "%";
	    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
	    
	    if (_cP >= 1) exitWith {};
		if (player getVariable ["inHostage",false]) exitWith {};
	    if (!alive player) exitWith {};
	    if !(isNull objectParent player) exitWith {};
	    if (life_interrupted) exitWith {};
	};

	life_action_inUse = false;
	"progressBar" cutText ["","PLAIN"];
	player playActionNow "stop";
	if (life_interrupted) exitWith {life_interrupted = false; ["Searching canceled!",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
	if !(isNull objectParent player) exitWith {["You cannot be in a vehicle!",true,"slow"] call ANZUS_fnc_notificationSystem;};

	player playMoveNow "Stand";

	_chance = round(random(2000));
	if (_chance isEqualTo 0) then {
		["You have completed searching the garbage, and found a discarded keycard!",true,"slow"] call ANZUS_fnc_notificationSystem;
		[true,"keyCard",1,"jail"] call ANZUS_fnc_handleInv;		
	} else {
		if (_chance < 30) then {
		    ["You have completed searching the garbage, you have found some rare equipment and a radio!",true,"slow"] call ANZUS_fnc_notificationSystem;
		    [true,"shank",1,"jail"] call ANZUS_fnc_handleInv;
		    [true,"zipties",1,"jail"] call ANZUS_fnc_handleInv;
		    if !(call TFAR_fnc_haveSWRadio) then {	
		    	player additem "RoleplayRadio";		
			};
		} else {
			if (_chance < 500) then {
			    ["You have completed searching the garbage, and found a few lockpicks!",true,"slow"] call ANZUS_fnc_notificationSystem;
			    [true,"lockpick",2,"jail"] call ANZUS_fnc_handleInv;
			} else {
				if (_chance <= 1000) then {
					["You have completed searching the garbage, and found a lockpick!",true,"slow"] call ANZUS_fnc_notificationSystem;
				    [true,"lockpick",1,"jail"] call ANZUS_fnc_handleInv;
				} else {
					if (_chance > 1000) then {
						["You have found nothing but trash, its still worth somthing!",true,"slow"] call ANZUS_fnc_notificationSystem;
						[true,"trash",1,"jail"] call ANZUS_fnc_handleInv;
					};
				};
			};
		};

	};
}] call AnzusLife_ClientCompile;

["AnzusLife_RobEvidence",{
	_locker = param [0];
	_cops = (west countSide playableUnits);
	if (_cops < 8) exitWith {["You can not rob the evidence locker until there are 8 cops on duty!",true,"slow"] call ANZUS_fnc_notificationSystem;};
		
	["THE EVIDENCE LOCKER IS BEING ROBBED, RESPOND IMMEDIATELY!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",west];
	["THE EVIDENCE LOCKER IS BEING ROBBED, STAY AWAY OR YOU WILL BE ARRESTED!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",civilian];
	["Doc"] remoteExec ['ANZUS_fnc_AANBank',-2];

	//Setup the progress bar
	_title = "Robbing Evidence Locker, stay within 15m";
	_icon = "\ArmaGamingCore\images\displays\displayCommunicationTargets\police.paa";

	disableSerialization;
	"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
	_ui = uiNamespace getVariable "AnzusLife_Progress";
	_controlsGroup = _ui displayCtrl 1;
	_progress = _controlsGroup controlsGroupCtrl 3;
	_pgText = _controlsGroup controlsGroupCtrl 2;
	_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];

	while {true} do
	{
		uiSleep 7;
		_cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_robbingMultiplier", 1]));
		_progress progressSetPosition _cP;
	    _precentage = str round(_cP * 100) + "%";
	    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
	    
		if (_cP >= 1) exitWith {};
		if (player getVariable ["inHostage",false]) exitWith {};
		if (!alive player) exitWith {};
		if (player distance _locker > 25) exitWith {};
		if ((player getVariable["restrained",false])) exitWith {};
		if (life_istazed) exitWith {};
	};
	
	"progressBar" cutText ["","PLAIN"];
	missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];
	if!(alive player) exitWith {};
	if(player distance _locker > 15) exitWith { ["You are too far away, robbery failed!",false,"slow"] call ANZUS_fnc_notificationSystem;};
	if(player getVariable "restrained") exitWith {["You have been arrested!",false,"slow"] call ANZUS_fnc_notificationSystem;};
	if(life_istazed) exitWith {["You have been downed!",false,"slow"] call ANZUS_fnc_notificationSystem;};

	
	["You have opened up the Evidence Locker!",false,"slow"] call ANZUS_fnc_notificationSystem;

	["Police News: The evidence locker has just been robbed, if you have seen the robbers contact police!",true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	["robevidence"] spawn mav_ttm_fnc_addExp;
	_locker setVariable ["Robbed",true,true];
}] call AnzusLife_ClientCompile;