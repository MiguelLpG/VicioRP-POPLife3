class newPlayerProfile
{
    idd = 19928;
    name= "DaniVillasPlayerProfile";
    movingEnable = false;
    enableSimulation = true;
	onLoad = "[""main""] spawn ica_fnc_DaniVillasPlayerProfile;";
	onUnLoad = "";

	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Dani Villas, v1.063, #Qocile)
		////////////////////////////////////////////////////////

		class backgroundImg: RscPicture
		{
			idc = 1200;
			text = "icons\NewPlayerProfile.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.726 * safezoneH;
		};
		class eventsButton: RscButtonSilent
		{
			idc = 1600;
			text = "eventos"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class logrosButton: RscButtonSilent
		{
			idc = 1601;
			text = "logros"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class orgsButton: RscButtonSilent
		{
			idc = 1602;
			text = "organiz"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.2338 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class profileButton: RscButtonSilent
		{
			idc = 1603;
			text = "perfil"; //--- ToDo: Localize;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.2316 * safezoneH + safezoneY;
			w = 0.0391876 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class ayudaButton: RscButtonSilent
		{
			idc = 1604;
			text = "ayuda"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		class donateButton: RscButtonSilent
		{
			idc = 1605;
			text = "donar"; //--- ToDo: Localize;
			x = 0.585594 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0381563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class novedadesButton: RscButtonSilent
		{
			idc = 1606;
			text = "noved"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.2338 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class statsButton: RscButtonSilent
		{
			idc = 1607;
			text = "estadisticas"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class reportesButton: RscButtonSilent
		{
			idc = 1608;
			text = "reportes"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.3262 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class playerName: RscStructuredText
		{
			idc = 1100;
			text = "Villas newPlayProfile: ERROR FETCHING PLAYER NAME."; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.0462 * safezoneH;
		};
		class mainStatsText: RscStructuredText
		{
			idc = 1101;
			text = "Villas newPlayProfile: ERROR FETCHING PLAYER MAIN STATS."; //--- ToDo: Localize;
			x = 0.408218 * safezoneW + safezoneX;
			y = 0.3614 * safezoneH + safezoneY;
			w = 0.154689 * safezoneW;
			h = 0.2046 * safezoneH;
		};
		class closeButton: RscButtonSilent
		{
			idc = 1609;
			onButtonClick = "closeDialog 0";
			x = 0.694906 * safezoneW + safezoneX;
			y = 0.2272 * safezoneH + safezoneY;
			w = 0.0113438 * safezoneW;
			h = 0.0198 * safezoneH;
		};
		class vehButton: RscButtonSilent
		{
			idc = 1610;
			text = "vehiculos"; //--- ToDo: Localize;
			x = 0.583532 * safezoneW + safezoneX;
			y = 0.3504 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class propiedadesButton: RscButtonSilent
		{
			idc = 1611;
			text = "propiedades"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.3922 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class habilidadesButton: RscButtonSilent
		{
			idc = 1612;
			text = "habilidades"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.4362 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class opcionesButton: RscButtonSilent
		{
			idc = 1613;
			text = "opciones"; //--- ToDo: Localize;
			x = 0.583532 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class permisosButton: RscButtonSilent
		{
			idc = 1614;
			text = "permisos"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class rewardsButton: RscButtonSilent
		{
			idc = 1615;
			text = "recompensas"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.5638 * safezoneH + safezoneY;
			w = 0.113436 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class notificationsText: RscStructuredText
		{
			idc = 1102;
			text = "Villas newPlayProfile: ERROR FETCHING PLAYER NOTIFICATIONS."; //--- ToDo: Localize;
			x = 0.404093 * safezoneW + safezoneX;
			y = 0.6518 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.121 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};