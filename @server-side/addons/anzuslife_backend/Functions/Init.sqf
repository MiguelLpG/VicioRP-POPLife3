["AnzusLife_InitServer", {
	// _govFetched = ("Arma.WebFetch" callExtension ["sync", ["https://fini.vip/gov.txt"]]);
	// if ((_govFetched select 1) isEqualTo 100) then {
	// 	_arr = (_govFetched select 0) splitString ";";
		
	// 	if (count _arr < 7) then {
	// 		AnzusLife_GovData = [0, [0.30,200000],[0.25,100000],[0.15,50000],0,50,50];
	// 		diag_log "Gov data is invalid";
	// 	} else {
	// 		_budget = parseNumber (_arr select 0);
	// 		_tax1 = parseSimpleArray (_arr select 1);
	// 		_tax2 = parseSimpleArray (_arr select 2);
	// 		_tax3 = parseSimpleArray (_arr select 3);
	// 		_payCheck = parseNumber (_arr select 4);
	// 		_copSub = parseNumber (_arr select 5);
	// 		_emsSub = parseNumber (_arr select 6);

	// 		AnzusLife_GovData = [_budget, _tax1, _tax2, _tax3, _payCheck, _copSub, _emsSub];
	// 		diag_log "Gov data set successfully";

	// 		AnzusLife_PayCheckAdd = compileFinal str _payCheck;
	// 		publicVariable "AnzusLife_PayCheckAdd";

	// 		AnzusLife_GovSubsidization = compileFinal str [_copSub,_emsSub];
	// 		publicVariable "AnzusLife_GovSubsidization";
	// 	};
	// } else {
	// 	AnzusLife_GovData = [0, [0.30,200000],[0.25,100000],[0.15,50000],0,50,50];
	// 	diag_log "Failed to fetch gov data";
	// };

	addMissionEventHandler ["HandleDisconnect", {
		params ["_unit", "_id", "_uid", "_name"];

		_query = switch (side _unit) do {
			case west: {format ["SELECT pid, cop_gear FROM players WHERE pid='%1'",_uid];};
			case civilian: {format ["SELECT pid, civ_gear FROM players WHERE pid='%1'",_uid];};
			case independent: {format ["SELECT pid, med_gear FROM players WHERE pid='%1'",_uid];};
		};
		_queryResult = [_query,2] call ANZUS_fnc_asyncCall;
		_inv = [(_queryResult select 1)] call ANZUS_fnc_mresToArray;
		if (_inv isEqualType "") then {_inv = call compile format ["%1", _inv];};

		_inv set [0, getUnitLoadout _unit];

		_packet = [_uid,side _unit,_inv,3];
		_packet call ANZUS_fnc_updatePartialServer;
		false;
	}];

	//profileNamespace setVariable ["AnzusLife_Budget", (AnzusLife_GovData select 0)];
}] call AnzusLife_ServerCompile; 

["AnzusLife_InitVars",{
	// AnzusLife_ClientVersion = getNumber (configFile >> "CfgPatches" >> "ArmaGamingCore" >> "requiredVersion");
	AnzusLife_Paycheck = 0;
	AnzusLife_PaycheckTimer = 10;
	AnzusLife_WeedIsActive = false;
	AnzusLife_HeroinIsActive = false;
	AnzusLife_CocaineIsActive = false;
	AnzusLife_Phone_Messages = [];
	AnzusLife_KillfeedList = [];
	AnzusLife_KillfeedControl = 0;
	ajkgfAFAsfASfasbjsbfasbf1 = true;
	
	if (isNil "AnzusLife_PayCheckAdd") then {
		AnzusLife_PayCheckAdd = {0};
	};
	switch (playerSide) do { 
		case west: {AnzusLife_PaycheckAmount = (3100 + (call AnzusLife_PayCheckAdd));}; 
		case civilian: {AnzusLife_PaycheckAmount = (320 + (call AnzusLife_PayCheckAdd));}; 
		case independent: {AnzusLife_PaycheckAmount = (1350 + (call AnzusLife_PayCheckAdd));}; 
	};

	AnzusLife_CB_Items = [
		["Land_BarGate_F","Bar Gate",500],
		["RoadCone_F","Road Cone",50],
		["RoadBarrier_small_F","Road Barrier Small",150],
		["Land_PlasticBarrier_03_F","Plastic Barrier",150],
		["TapeSign_F", "Red-White Tape", 150],
		["ArrowDesk_L_F","Arrow Desk (left)",80],
		["ArrowDesk_R_F","Arrow Desk (right)",80],
		["ArrowMarker_R_F","Arrow Marker (right)",80],
		["ArrowMarker_L_F","Arrow Marker (left)",80],
		["Land_PortableLight_single_f","Portable Lights Single",120],
		["Land_PortableLight_double_f","Portable Lights Double",120]
	];

	AnzusLife_Jobs = [
		["Tow Truck Driver","Become a tow truck driver and get request of pickups to tow to the tow yard or to a local mechanic shop, etc.",700]
	];

	AnzusLife_MafiaTasks = [
	  ["Armed Detainment","Take a player hostage","",1],
	  ["Defunding the Cartel","Rob the federal reserve successfully and strip the cartel of their money flow","",1],
	  ["Breaking and Entering","Successfully break into 20 houses around metropolis","AnzusLife_HousesRobbed",20],
	  ["Wired","Gather and process 400 heroin","AnzusLife_HeroinProcessed",400],
	  ["Boosting the Blue","Successfully chopshop 10 vehicles","AnzusLife_ChoppedVehicles",10],
	  ["Breaking Free","Get put in jail, and manage to escape successfully","",1]
	];

	AnzusLife_CartelTasks = [
	  ["Ganja Gathering","Gather and process 400 marijuana","AnzusLife_MarijuanaProcessed",400],
	  ["Kings of Cocaine","Gather and process 500 cocaine","AnzusLife_CocaineProcessed",500],
	  ["Defunding the Mafia","Rob the bank of metropolis and strip the mafia of their funding","",1],
	  ["High Voltage","Successfully take a police officer hostage and obtain a tazer, then use it on them","",1],
	  ["Armed Robbery","Successfully rob 20 gas stations around metropolis","AnzusLife_GasRobberys",20],
	  ["Breaking Free","Get put in jail, and manage to escape successfully","",1]
	];

	if(isnil {profilenamespace getvariable "AnzusLife_NametagColor"}) then {profilenamespace setvariable ["AnzusLife_NametagColor",[1,1,1,1]]};

	AnzusLife_LocationTypes = []; 
	"AnzusLife_LocationTypes pushBack configName _x" configClasses (configFile >> "CfgLocationTypes"); 	

	AnzusLife_InitVars = nil;
},false] call AnzusLife_ClientCompile;

["AnzusLife_SpawnCamera", {
    private _camTarget = [8056,5229,0];
    private _camStart = [8230,5107];
    private _camTargets = [
        [8056,5229,0]
		/*
        [3384.99, 12891.5],
        [3312.42, 13342.05],
        [3657.17, 13532.45],
        [4048.55, 13240.32],
        [3981.92, 12807.55]
		*/
    ];

    private _duration = 2;
    private _altitude = 180;
    private _commitTime = (_duration * 60) / count _camTargets;

    AnzusLife_SpawnCameraObj = "camera" camCreate (_camStart + [_altitude]);
    showCinemaBorder true;
    AnzusLife_SpawnCameraObj cameraEffect ["INTERNAL", "BACK"];
    AnzusLife_SpawnCameraObj camSetTarget _camTarget;
    AnzusLife_SpawnCameraObj camCommit 0;

    {
        private _new = _x + [_altitude];
        _new params [
            ["_posX", 0, [0]],
            ["_posY", 0, [0]],
            ["_posZ", 0, [0]]
        ];

        AnzusLife_SpawnCameraObj camSetPos [_posX, _posY, _posZ];
        AnzusLife_SpawnCameraObj camCommit _commitTime;

        waitUntil {camCommitted AnzusLife_SpawnCameraObj;};
    } forEach _camTargets;
},false] call AnzusLife_ClientCompile;

["AnzusLife_LoadClient", {
	life_session_completed = false;
	disableUserInput false;

	waitUntil {!(isNull player) && (player == player)};
	waitUntil {!(isNull(findDisplay 46))};
	sleep 1.1;
	[] spawn AnzusLife_InitVars;
	[] call compile preprocessFileLineNumbers "core\configuration.sqf";

    0 fadeMusic 0;
    playMusic "cam_intro";
    5 fadeMusic 0.8;

    AnzusLife_MusicStop = addMusicEventHandler ["MusicStop", { playMusic "cam_intro"; }];

    "SPLASHNOISE" cutRsc ["SPLASHNOISE", "PLAIN", 10e10];
	[] spawn AnzusLife_SpawnCamera;

	private _displayCreated = createDialog "AnzusLife_Loading";
	waitUntil {_displayCreated;};
	(findDisplay 999210) displayAddEventHandler["KeyDown", "if((_this select 1) isEqualTo 1) then {true};"];

	_extDB_notLoaded = "";

	0 spawn {
	    for "_i" from 1 to 5 do {
	        ["Setting up client...", (_i / 100)] spawn AnzusLife_SetLoading;
	        uiSleep 0.1;
	    };
	    AnzusLife_Loading_Done = true;
	};

	disableUserInput true;
	enableSentences false;
	//showChat false;
	hint "";
	0 fadeSound 0;
	0 fadeSpeech 0;
	enableRadio false;
	setViewDistance 1000;
	setTerrainGrid 50;
	removeBackpack player;
	removeAllWeapons player;
	removeUniform player;
	removeVest player;
	removeGoggles player;
	removeHeadgear player;
	player disableConversation true;
	player addRating 9999999999999999;
	showHUD [true, true, true, true, true, true, true, true];
	["", 0, 0, 1, 0.1, 0, 1000] spawn BIS_fnc_dynamicText;
	player switchCamera "EXTERNAL";
	player setVariable ["restrained",false,true];
	player setVariable ["Escorting",false,true];
	player setVariable ["playerSurrender",false,true];
	
	waitUntil {!isNil "AnzusLife_Loading_Done"}; 
	AnzusLife_Loading_Done = nil; 

	0 spawn {
	    for "_i" from 6 to 15 do {
	        ["Retrieving Server Data...", (_i / 100)] spawn AnzusLife_SetLoading;
	        uiSleep 0.1;
	    };
	    AnzusLife_Loading_Done = true;
	};

	waitUntil {!isNil "life_server_isReady"};
	waitUntil {!isNil "life_HC_isActive" && {!isNil "life_server_extDB_notLoaded"}};

	waitUntil {!isNil "AnzusLife_Loading_Done"}; 
	AnzusLife_Loading_Done = nil; 

	0 spawn {
	    for "_i" from 16 to 30 do {
	        ["Connecting to database...", (_i / 100)] spawn AnzusLife_SetLoading;
	        uiSleep 0.1;
	    };
	    AnzusLife_Loading_Done = true;
	};

	if (life_server_extDB_notLoaded) exitWith {};
	waitUntil {life_server_isReady};

	[] call ANZUS_fnc_dataQuery;
	waitUntil {life_session_completed};
	
	waitUntil {!isNil "AnzusLife_Loading_Done"}; 
	AnzusLife_Loading_Done = nil; 

	0 spawn {
	    for "_i" from 31 to 40 do {
	        ["Checking for hacks...", (_i / 100)] spawn AnzusLife_SetLoading;
	        uiSleep 0.1;
	    };
	    AnzusLife_Loading_Done = true;
	};

	
	waitUntil {!isNil "AnzusLife_Loading_Done"}; 
	AnzusLife_Loading_Done = nil; 

	0 spawn {
	    for "_i" from 41 to 50 do {
	        ["Checking for crash script...", (_i / 100)] spawn AnzusLife_SetLoading;
	        uiSleep 0.1;
	    };
	    AnzusLife_Loading_Done = true;
	};

	[] call compile preprocessFileLineNumbers "core\clientValidator.sqf";
	[] execFSM "core\fsm\client.fsm";
	[] call AnzusLife_EventHandlers;
	[] spawn ANZUS_fnc_escInterupt;
	waitUntil {(!isNil "TON_fnc_clientGangLeader")};
	
	waitUntil {!isNil "AnzusLife_Loading_Done"};
	AnzusLife_Loading_Done = nil;

	0 spawn {
	    for "_i" from 51 to 75 do {
	        ["Deleting System32...", (_i / 100)] spawn AnzusLife_SetLoading;
	        uiSleep 0.06;
	    };
	    AnzusLife_Loading_Done = true;
	};

	switch (playerSide) do {
	    case west: {
	        [] spawn ANZUS_fnc_initCop;
	    };
	    case civilian: {
	        [] spawn ANZUS_fnc_initCiv;
	    };
	    case independent: {
	        [] spawn ANZUS_fnc_initMedic;
	    };
	};

	// [] spawn ANZUS_fnc_rpr;
	[] spawn AnzusLife_Loops;

	waitUntil {!isNil "AnzusLife_Loading_Done"};
	AnzusLife_Loading_Done = nil;

	0 spawn {
	    for "_i" from 76 to 85 do {
	        ["Stoping server crash...", (_i / 100)] spawn AnzusLife_SetLoading;
	        uiSleep 0.1;
	    };
	    AnzusLife_Loading_Done = true;
	};

	setTerrainGrid 50;
	
	waitUntil {!isNil "AnzusLife_Loading_Done"};
	AnzusLife_Loading_Done = nil;

	0 spawn {
	    for "_i" from 86 to 99 do {
	        ["Almost finished...", (_i / 100)] spawn AnzusLife_SetLoading;
	        uiSleep 0.1;
	    };
	    AnzusLife_Loading_Done = true;
	};

	waitUntil {(missionNamespace getVariable ["life_perksInitialized", true])};

	
	waitUntil {!isNil "AnzusLife_Loading_Done"};
	AnzusLife_Loading_Done = nil;

	["Finished!", 1] spawn AnzusLife_SetLoading;

	closeDialog 0;
	waitUntil {isNull(findDisplay 999210)};
    AnzusLife_SpawnCameraObj cameraEffect ["TERMINATE", "BACK"];
    camDestroy AnzusLife_SpawnCameraObj;
    removeMusicEventHandler ["MusicStop", AnzusLife_MusicStop];

	disableUserInput false;
	0 fadeSound 1;
	["", 0, 0, 1, 0.1, 0, 1000] spawn BIS_fnc_dynamicText;
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call ANZUS_fnc_keyHandler"];
	cutText["", "BLACK IN"];
	//[] call AnzusLife_AC_TakeItemCheck;
 
	LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame",{{_p = _x select 0; _pos = visiblePositionASL _p; _pos set [2, ((_p modelToWorld [0,0,0]) select 2) + 2]; drawIcon3D ["", _x select 2,_pos, 0.2, 0.2, 45, _x select 1, 1, 0.03, "PuristaBold"];} foreach (missionNameSpace getVariable ["AnzusLife_TagsArray",[]]);}] call BIS_fnc_addStackedEventHandler;
	ANZUS_ID_VehicleTags = ["ANZUS_VehicleTags","onEachFrame",{{_p = _x select 0; _pos = visiblePositionASL _p; _pos set [2, ((_p modelToWorld [0,0,0]) select 2) + 1]; drawIcon3D ["", [0.267,0.549,1,1],_pos, 0.2, 0.2, 45, _x select 1, 1, 0.04, "PuristaBold"];} foreach (missionNameSpace getVariable ["ANZUS_TagsArray",[]]);}] call BIS_fnc_addStackedEventHandler; 
	LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","ANZUS_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

	[] spawn {
	    for "_i" from 0 to 1 step 0 do {
	        waitUntil {(!isNull (findDisplay 49)) && {(!isNull (findDisplay 602))}};
	        (findDisplay 49) closeDisplay 2; // Close ESC dialog
	        (findDisplay 602) closeDisplay 2; // Close Inventory dialog
	    };
	};

	ANZUS_fnc_moveIn = compileFinal
	"
	    life_disable_getIn = false;
	    player moveInCargo (_this select 0);
	    life_disable_getOut = true;
	";

	ANZUS_fnc_RequestClientId = player;
	publicVariableServer "ANZUS_fnc_RequestClientId"; //Variable OwnerID for HeadlessClient

	[] spawn ANZUS_fnc_survival;
	[] spawn ANZUS_fnc_mapMarkers;
	AnzusLife_HeliEjectThread = scriptNull;

	{
	    _x params [["_chan",-1,[0]], ["_noText","false",[""]], ["_noVoice","false",[""]]];

	    _noText = [false,true] select ((["false","true"] find toLower _noText) max 0);
	    _noVoice = [false,true] select ((["false","true"] find toLower _noVoice) max 0);

	    _chan enableChannel [!_noText, !_noVoice];

	} forEach getArray (missionConfigFile >> "disableChannels");

	if (!(isNil {call TFAR_fnc_activeSwRadio})) then {
		["OnRadioOwnerSet", TFAR_currentUnit, [TFAR_currentUnit, (call TFAR_fnc_activeSwRadio)]] call TFAR_fnc_fireEventHandlers;
	};

	if (call(life_coplevel) > 0) then {
		player setVariable ["AnzusLife_CopLevel",call(life_coplevel),true];
		player setVariable ["AnzusLife_CopDept",call(life_copdept),true];
	};

	if (call(life_mediclevel) > 0) then {
		player setVariable ["AnzusLife_MedicLevel",call(life_mediclevel),true];
		player setVariable ["AnzusLife_MedicDept",call(life_medicdept),true];
	};

	AnzusLife_LoadClient = nil;
	AnzusLife_SetLoading = nil;
	AnzusLife_SpawnCamera = nil;
},false] call AnzusLife_ClientCompile;

["AnzusLife_SetLoading", {    
	params [
		["_text", "", [""]],
        ["_amount", 0, [0]]
    ];

	private _display = findDisplay 999210;
    private _ctrlLoadingText = _display displayCtrl 14;
    private _ctrlProgressBar = _display displayCtrl 13;

	_ctrlLoadingText ctrlSetText (toUpper _text);
	_ctrlProgressBar progressSetPosition (_amount);
},false] call AnzusLife_ClientCompile;