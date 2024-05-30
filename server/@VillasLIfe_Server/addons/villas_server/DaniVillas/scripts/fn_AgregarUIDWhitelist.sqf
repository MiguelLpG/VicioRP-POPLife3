// By FuRixX Lamborghini \\

_entrada = _this select 0;

if (isNil "_entrada") exitWith {
	createDialog "FuRixX_UID_Whitelist";
	_dialogo = findDisplay 1257;
	_boton = _dialogo displayCtrl 1003;
	_boton buttonSetAction "['Aplicar'] spawn FuRixX_fnc_AgregarUIDWhitelist";
};

if (_entrada == "Aplicar") exitWith {

	_dialogo = findDisplay 1257;
	_edit = _dialogo displayCtrl 1002;
	_uid = ctrlText _edit;

	FuRixX_Whitelist_GuardarUID = _uid;
	publicVariableServer "FuRixX_Whitelist_GuardarUID";

	hint format ['Has agregado la uid "%1" a la whitelist', _uid];

	FuRixX_EnviarLog = format [':bookmark_tabs: El administrador %1 `(%2)` ha agregado a la uid `%3` a la whitelist', name player, getPlayerUID player, _uid];
	publicVariableServer "FuRixX_EnviarLog";
};



// By FuRixX Lamborghini \\
