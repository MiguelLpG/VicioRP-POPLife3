// By FuRixX Lamborghini \\

FuRixX_Admin_Contra = "FuRixXRadical";

"FuRixX_EstablecerLluvia" addPublicVariableEventHandler {

    _Desidad = _this select 1;
    0 setRain _Desidad;
	forceWeatherChange;

};

"FuRixX_Admin_ActualizarAliveVehiculos" addPublicVariableEventHandler {

	_id = _this select 1;

	diag_log _id;

	_query = format["FuRixXAdminResetearVehiculo:%1",_id];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	_query1 = format["FuRixXAdminGuardarVehiculo:%1",_id];
	_queryResult1 = [_query1,2,true] call DB_fnc_asyncCall;

};


"FuRixX_Admin_ObtenerCasasSV" addPublicVariableEventHandler {

	_id = _this select 1;

	_FuRixX_Admin_ObtenerCasasCL = [];
	_count = (["CountHouses",2] call DB_fnc_asyncCall) select 0;

	for [{_x=0},{_x<=_count},{_x=_x+10}] do {
		waitUntil{!DB_Async_Active};
		_query = format["GetHousesPlayers:%1",_x];
		_queryResult = [_query,2,true] call DB_fnc_asyncCall;
		if(count _queryResult == 0) exitWith {};

		_FuRixX_Admin_ObtenerCasasCL pushBack _queryresult;
	};

	FuRixX_Admin_ObtenerCasasCL = [];

	{
		_slot = _x;
		{
			FuRixX_Admin_ObtenerCasasCL pushBack _x;
		} forEach _slot;

	} forEach _FuRixX_Admin_ObtenerCasasCL;

	_id publicVariableClient "FuRixX_Admin_ObtenerCasasCL";

};

FuRixX_Admin_ObjetosBorradosSV = [];

"FuRixX_Admin_ObjetosBorrados" addPublicVariableEventHandler {

    _Parametros = _this select 1;
	_entrada = _Parametros select 0;
	_info = _Parametros select 1;

	switch (_entrada) do {

		case "Almacenar": {
			FuRixX_Admin_ObjetosBorradosSV pushBack _info;
		};

		case "Reconstruido": {
			FuRixX_Admin_ObjetosBorradosSV deleteAt (FuRixX_Admin_ObjetosBorradosSV find _info);
		};

		default {
			FuRixX_Admin_ObjetosBorradosCL = FuRixX_Admin_ObjetosBorradosSV;
			_info publicVariableClient "FuRixX_Admin_ObjetosBorradosCL";
		};


	};


};

"FuRixX_Admin_SolicitarVarCliente_SV" addPublicVariableEventHandler {

	_info = _this select 1;
	_entrada = _info select 0;
	_ids = _info select 1;

	if (_entrada == "Dar") then {

		_variables = _info select 2;
		FuRixX_Admin_SolicitarVarCliente_CL = ["Recibir", _variables];
		_ids publicVariableClient "FuRixX_Admin_SolicitarVarCliente_CL";

	} else {

		_ide = owner (_info select 2);
		FuRixX_Admin_SolicitarVarCliente_CL = ["Dar", _ids];	
		_ide publicVariableClient "FuRixX_Admin_SolicitarVarCliente_CL";
	};

};

"FuRixX_AdminObtenerCochesServidor" addPublicVariableEventHandler {

	_datos = _this select 1;

	_jugador = _datos select 0;
	_id = _datos select 1;

	_query = format["FuRixXAdminVerVehiculos:%1:%2", getPlayerUID _jugador, side _jugador];

	FuRixX_AdminObtenerCochesCliente = [_query,2,true] call DB_fnc_asyncCall; 
	_id publicVariableClient "FuRixX_AdminObtenerCochesCliente";

};

"FuRixX_Admin_Kickear" addPublicVariableEventHandler {

	_info = _this select 1;

	_admin = _info select 0;
	_uida = getPlayerUID _admin;
	_namea = name _admin;

	_usuario = _info select 1;
	_uid = getPlayerUID _usuario;
	_name = name _usuario;

	diag_log format ["%1 - %2", _uid, _name];

	_comando = format ["#kick %1", _uid];
	_check = FuRixX_Admin_Contra serverCommand _comando;

	_mensaje = "";

	if (check) then {
		_mensaje = format ["**FuRixX_Admin:** :right_facing_fist: el administrador %1 `(%2)` ha kickeado a %3 (%4)", _namea, _uida, _name, _uid];
	} else {
		_mensaje = format ["**FuRixX_Admin:** :right_facing_fist: el administrador %1 `(%2)` ha intentado kickear a %3 (%4), pero no lo ha conseguido porque la contraseña no es correcta", _namea, _uida, _name, _uid];
	};
	
	[_mensaje] spawn FuRixX_EnviarLog_ServerSide;


};


"FuRixX_EjecutarEnClienteSV" addPublicVariableEventHandler {

    _Info = _this select 1;
    _Persona = _Info select 0;
    _Codigo = _Info select 1;
    
    {
        if (getPlayerUID _x == _Persona) exitWith {
            _clientID = owner _x;
            FuRixX_EjecutarEnCliente = _Codigo;
            _clientID publicVariableClient "FuRixX_EjecutarEnCliente";
        };
    } forEach allPlayers;

};

"FuRixX_AdminZeus" addPublicVariableEventHandler {

	_Paramentros = _this select 1;
	_UID = _Paramentros select 0;
	_NombreEnString = _Paramentros select 1;

	_Codigo = format [' 
		FuRixX_ZeusGrupo_%1 = createCenter sideLogic;  
		FuRixX_ZeusGrupo_%1 = createGroup sideLogic;  
		
		FuRixX_Zeus_%1%3 = FuRixX_ZeusGrupo_%1 createUnit ["ModuleCurator_F",[0,0,0],[],0,"NONE"];  
		FuRixX_Zeus_%1%3 setVehicleVarname "FuRixX_Zeus_%1%3";  
		
		FuRixX_Zeus_%1%3 setVariable ["Owner", ""];  
		FuRixX_Zeus_%1%3 setVariable ["Name", ""];  
		FuRixX_Zeus_%1%3 setVariable ["Addons", 2];  
		FuRixX_Zeus_%1%3 setVariable ["Forced", 0];  
			
		FuRixX_Zeus_%1%3 synchronizeObjectsAdd [%2];  
		%2 assignCurator FuRixX_Zeus_%1%3;  
		
		', _UID, _NombreEnString, round(random 99999)
	]; 
	 
	[] spawn (compile _Codigo);
	
};

// By FuRixX Lamborghini \\