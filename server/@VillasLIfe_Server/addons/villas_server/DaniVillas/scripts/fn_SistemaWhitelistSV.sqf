// By FuRixX Lamborghini \\

"FuRixX_Whitelist" addPublicVariableEventHandler {

	_parametros = _this select 1;

	_uid = _parametros select 0;
	_variable = _parametros select 1;
	_rango = _parametros select 2;

	_query = format["FuRixXSetWhitelistInGame%1:%2:%3", _variable, _rango, _uid];
	[_query,1] call DB_fnc_asyncCall;

};

"FuRixX_WhitelistObtenerUsuariosServidor" addPublicVariableEventHandler {

	_id = _this select 1;
	FuRixX_WhitelistObtenerUsuariosCliente = ["FuRixXSetWhitelistUsuarios",2,true] call DB_fnc_asyncCall;
	_id publicVariableClient "FuRixX_WhitelistObtenerUsuariosCliente";
	_id;

};

// By FuRixX Lamborghini \\