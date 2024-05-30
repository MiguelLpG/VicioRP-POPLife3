with uiNamespace do {
	DiscordEmbedBuilder_SessionKey = compileFinal str("DiscordEmbedBuilder" callExtension "init");
	DiscordEmbedBuilder_LoadSuccess = str DiscordEmbedBuilder_SessionKey != "{}";
	if DiscordEmbedBuilder_LoadSuccess then {
		diag_log parseText "[Villas LogsSystem] Sistema inicializado con éxito. (Modificación de DiscordEmbedBuilder)";

        // Mensaje en discord de encendido
        private _webhookurl = getText(configFile >> "CfgDiscordEmbedWebhooks" >> "ServerON");
        private _imagen = getText(configFile >> "Imagen" >> "ServerON");
        "DiscordEmbedBuilder" callExtension [
            call DiscordEmbedBuilder_SessionKey,
            [
                _webhookurl,
                ":arrow_right: **¡SERVER ON!** :green_circle:",
                "VicioRP Server Status",
                _imagen,
                false,
                []
            ]
        ];
	} else {
		diag_log parseText "[Villas LogsSystem] La carga del sistema ha fallado.";
	};
};