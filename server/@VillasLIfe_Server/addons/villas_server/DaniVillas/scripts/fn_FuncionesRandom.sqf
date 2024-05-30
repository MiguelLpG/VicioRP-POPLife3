// By FuRixX Lamborghini \\

waitUntil {!isNil "life_adminlevel"};
waitUntil {!isNull findDisplay 46};

// Marcador Individual
[] spawn {

	_nombre = format ["FuRixX_MiPosicion_%1", round(random 10000)];
	_marcador = createMarkerLocal [_nombre, position player];
	_marcador setMarkerAlphaLocal 1;
	_marcador setMarkerTextLocal "";
	_marcador setMarkerTypeLocal "Select";
	_marcador setmarkerColorLocal "ColorRed";
	

	while {true} do {
		_marcador setMarkerPosLocal (getPosASL player);
		sleep 0.1;
	};

};

// Noches más brillantes -> https://steamcommunity.com/sharedfiles/filedetails/?id=853333870
[] spawn {
    _adjustLight = {
        CHBN_adjustBrightness = CHBN_adjustBrightness max 0 min 1;
        _brightness = if (CHBN_adjustBrightness > 0) then {200 * abs (1 - (2 ^ CHBN_adjustBrightness))} else {0};
        CHBN_light setLightAttenuation [10e10,(30000 / (_brightness max 10e-10)),4.31918e-005,4.31918e-005];
        CHBN_light setLightAmbient CHBN_adjustColor;
    };
    
    waitUntil {time > 0};
    if (missionNamespace getVariable ["CHBN_running",false]) exitWith {systemChat "ERROR: El sistema de brillo ya estaba ejecutandose."};
    CHBN_running = true;
    
    CHBN_adjustBrightness = missionNamespace getVariable ["CHBN_adjustBrightness",1];
    CHBN_adjustColor = missionNamespace getVariable ["CHBN_adjustColor",[0.5,0.7,1]];

    if (!isNil "CHBN_light") then {deleteVehicle CHBN_light};
    CHBN_light = "#lightpoint" createVehicleLocal [0,0,0];
    CHBN_light setLightBrightness 1;
    CHBN_light setLightDayLight false;
    call _adjustLight;

    for "_i" from 0 to 1 step 0 do {
        _adjustBrightness = CHBN_adjustBrightness;
        _adjustColor = CHBN_adjustColor;
        waitUntil {!(_adjustBrightness isEqualTo CHBN_adjustBrightness) || !(_adjustColor isEqualTo CHBN_adjustColor)};
        call _adjustLight;
    };
};

"FuRixX_Admin_SolicitarVarCliente_CL" addPublicVariableEventHandler {

    _info = _this select 1;
	_entrada = _info select 0;
	_ids = _info select 1;

	if (_entrada == "Dar") then {

		FuRixX_Admin_SolicitarVarCliente_SV = [ "Dar", _ids, [vicio_din,vicio_atmdin] ];
        publicVariableServer "FuRixX_Admin_SolicitarVarCliente_SV";

	} else {

		FuRixX_Admin_VariablesRecibidas = _info select 1;
	};


};

"FuRixX_EjecutarEnCliente" addPublicVariableEventHandler {

    _Codigo = _this select 1;
    [] spawn _Codigo;

};

// Logs Muerte
player addEventHandler ["Killed", {

	params ["_unit", "_killer", "_instigator", "_useEffects"];

    _letra = selectRandom ["A", "B", "C", "D", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q" , "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    _numero = round (random 999);
    _id = format ["%1-%2", _letra, _numero];

    FuRixX_EnviarLogMuertes = format ["`%5` El usuario __%1__ `(%2)` ha muerto, con el inventario: ```%3``` y con `%4€` en mano", name _unit, getPlayerUID _unit, getUnitLoadout _unit, vicio_din, _id];
    publicVariableServer "FuRixX_EnviarLogMuertes";

    systemChat (format ['La id de tu muerte es "%1"', _id]);

    _muertes = _unit getVariable ["FuRixX_Muertes_Logs", []];

    _muertes pushBack [_id, round(time), getUnitLoadout _unit, vicio_din];
    _unit setVariable ["FuRixX_Muertes_Logs", _muertes, true];

}];

[] spawn {
    
    FuRixX_CountDown = {

        _dupeando = player getVariable ["FuRixX_EstaDupeando", false];

        if (_dupeando) exitWith {};
        player setVariable ["FuRixX_EstaDupeando", true];
        FuRixX_EnviarLogAdmin = format ['**FuRixX_Admin:** :warning: __%1__ `(%2)` ha intentado dupear', name player, getPlayerUID player];
        publicVariableServer "FuRixX_EnviarLogAdmin";
        systemChat "FuRixX AntiDupe System -> Dupeo de Inventario DETECTADO";
        sleep 20;
        player setVariable ["FuRixX_EstaDupeando", false];
        
    };

    while {true} do
    {
        waitUntil{!isNull (findDisplay 49)};

        while {!isNull (findDisplay 49)} do {

            _inventario = (!(isNull (findDisplay 602)));
            if (_inventario) then {closeDialog 0; [] spawn FuRixX_CountDown;};

        };

        sleep 0.1;
    };
};

// No Suicidarse 
[] spawn {

    while {true} do {
        waitUntil{!isNull findDisplay 49};
        _boton = (findDisplay 49) displayCtrl 1010;
        _boton ctrlSetText "TIENES MÁS VIDA POR DELANTE";
        while {!isNull findDisplay 49} do {
            _boton ctrlEnable false;
        };
    };

};

//Marcador distancia
[] spawn {

    sleep 10;

    if (hasInterface) then { waitUntil {!isNull (findDisplay 12)};
    _mapDisplay = findDisplay 12;
    _mapControl = _mapDisplay displayCtrl 51;

    _mapControl ctrlAddEventHandler ["MouseMoving", {
        TRN_var_mainMapMouseOverCustomMark = "customMark" in (ctrlMapMouseOver (_this select 0));
    }];

    ["TRN", "onMapSingleClick", {
        if (_shift) then {
            TRN_var_customMarkLocation = _pos;
        };
    }] call BIS_fnc_addStackedEventHandler;

    _mapDisplay displayAddEventHandler ["KeyDown", {
        if (!isNil "TRN_var_mainMapMouseOverCustomMark" && {TRN_var_mainMapMouseOverCustomMark} && {(_this select 1) == 211}) then {
            TRN_var_customMarkLocation = nil;
        };
    }];

    addMissionEventHandler ["Draw3D", {
        if (!isNil "TRN_var_customMarkLocation") then {

            _distancia = player distance TRN_var_customMarkLocation;
            _unidad = "m";

            if (_distancia > 1000) then {
                _distancia = _distancia / 1000;
                _distancia = [_distancia,1] call BIS_fnc_cutDecimals;
                _unidad = "Km";
            } else {
                _distancia = round _distancia
            };

            drawIcon3D ["\A3\ui_f\data\igui\cfg\cursors\freelook_ca.paa", [1,1,0,1], [TRN_var_customMarkLocation select 0, TRN_var_customMarkLocation select 1, (TRN_var_customMarkLocation select 2) + 0.4], 1.5, 1.5, 0, format ["%1 %2", _distancia, _unidad], 1, 0.03, "RobotoCondensedBold", "", true];
        
        };
    }];
    };
};

// By FuRixX Lamborghini \\