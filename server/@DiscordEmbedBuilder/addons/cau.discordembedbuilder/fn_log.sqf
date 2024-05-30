"Villas_EnviarLogAdmin" addPublicVariableEventHandler {
	_mensaje = _this select 1;

	_webhookurl = getText(configFile >> "CfgDiscordEmbedWebhooks" >> "Admin");
	_imagen = getText(configFile >> "Imagen" >> "Image");
	_key = call (uiNamespace getVariable ["DiscordEmbedBuilder_SessionKey",{""}]);
	
	"DiscordEmbedBuilder" callExtension [
		_key,
		[
			_webhookurl,
			_mensaje,
			"Logs Administración",
			_imagen,
			false,
			[]
		]
	];
};

"Villas_EnviarLogMuerte" addPublicVariableEventHandler {
	_mensaje = _this select 1;

	_webhookurl = getText(configFile >> "CfgDiscordEmbedWebhooks" >> "Death");
	_imagen = getText(configFile >> "Imagen" >> "Image");
	_key = call (uiNamespace getVariable ["DiscordEmbedBuilder_SessionKey",{""}]);
	
	"DiscordEmbedBuilder" callExtension [
		_key,
		[
			_webhookurl,
			_mensaje,
			"Logs Muertes",
			_imagen,
			false,
			[]
		]
	];
};

"Villas_EnviarLogDinero" addPublicVariableEventHandler {
	_mensaje = _this select 1;

	_webhookurl = getText(configFile >> "CfgDiscordEmbedWebhooks" >> "Money");
	_imagen = getText(configFile >> "Imagen" >> "Image");
	_key = call (uiNamespace getVariable ["DiscordEmbedBuilder_SessionKey",{""}]);
	
	"DiscordEmbedBuilder" callExtension [
		_key,
		[
			_webhookurl,
			_mensaje,
			"Logs Dinero",
			_imagen,
			false,
			[]
		]
	];
};

"Villas_EnviarLogAutoClick" addPublicVariableEventHandler {
	_mensaje = _this select 1;

	_webhookurl = getText(configFile >> "CfgDiscordEmbedWebhooks" >> "Autoclick");
	_imagen = getText(configFile >> "Imagen" >> "Image");
	_key = call (uiNamespace getVariable ["DiscordEmbedBuilder_SessionKey",{""}]);
	
	"DiscordEmbedBuilder" callExtension [
		_key,
		[
			_webhookurl,
			_mensaje,
			"Logs Autoclick",
			_imagen,
			false,
			[]
		]
	];
};

"Villas_EnviarLogDupe" addPublicVariableEventHandler {
	_mensaje = _this select 1;

	_webhookurl = getText(configFile >> "CfgDiscordEmbedWebhooks" >> "Dupe");
	_imagen = getText(configFile >> "Imagen" >> "Image");
	_key = call (uiNamespace getVariable ["DiscordEmbedBuilder_SessionKey",{""}]);
	
	"DiscordEmbedBuilder" callExtension [
		_key,
		[
			_webhookurl,
			_mensaje,
			"Dupeo",
			_imagen,
			false,
			[]
		]
	];
};

"Villas_EnviarLogAlert" addPublicVariableEventHandler {
	_mensaje = _this select 1;

	_webhookurl = getText(configFile >> "CfgDiscordEmbedWebhooks" >> "Alerts");
	_imagen = getText(configFile >> "Imagen" >> "Image");
	_key = call (uiNamespace getVariable ["DiscordEmbedBuilder_SessionKey",{""}]);
	
	"DiscordEmbedBuilder" callExtension [
		_key,
		[
			_webhookurl,
			_mensaje,
			"Alerta",
			_imagen,
			false,
			[]
		]
	];
};