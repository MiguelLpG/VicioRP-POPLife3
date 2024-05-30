// By FuRixX Lamborghini \\

FuRixX_Whitelist_Contra = "FuRixXPTOAmoTest";

_check = FuRixX_Whitelist_Contra serverCommand "#kick 0";

if (!_check) then {
	["**FuRixX Whitelist:** :x: la contraseña **no es correcta**, establezca la correcta en la configuración"] spawn FuRixX_EnviarLog_ServerSide;
} else {
	["**FuRixX Whitelist:** :white_check_mark: Sistema iniciado correctamente"] spawn FuRixX_EnviarLog_ServerSide;
};


"FuRixX_Whitelist_GuardarUID" addPublicVariableEventHandler {

	_uid = _this select 1;
	"FuRixXWhitelist" callExtension _uid;

};


onPlayerConnected {

	_archivo = "FuRixXWhitelist" callExtension "Leer";
	_uids = _archivo splitString " 
	,";
	_autorizado = false;

	{
		if (_uid == _x) exitWith {
			_autorizado = true;
		};

	} forEach _uids;

	if (!_autorizado) then {
		_comando = format ["#kick %1", _uid];
		FuRixX_Whitelist_Contra serverCommand _comando;
		_mensaje = format ["**FuRixX Whitelist:** :airplane_departure: el usuario %1 `(%2)` ha intentado entrar al servidor sin la whitelist", _name, _uid];
		[_mensaje] spawn FuRixX_EnviarLog_ServerSide;
	};


};


// By FuRixX Lamborghini \\