class tallermetropolis
{
	idd = 19700;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['taller', _this select 0]; abierto = true; ";
	onUnLoad = "uiNamespace setVariable ['taller', nil]; abierto = nil;";
	class TallerRscText
	{
		deletable = 0;
		fade = 0;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,1};
		access = 0;
		type = 0;
		idc = -1;
		text = "";
		fixedWidth = 0;
		colorShadow[] = {0,0,0,0.5};
		tooltipColorText[] = {1,1,1,1};
		tooltipColorBox[] = {1,1,1,1};
		tooltipColorShade[] = {0,0,0,0.65};
		x = 0;
		y = 0;
		h = 0.037;
		w = 0.3;
		style = 0;
		shadow = 1;
		font = "puristaMedium";
		SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		linespacing = 1;
	};
	class TallerRscButton
	{
		deletable = 0;
		fade = 0;
		colorText[] = {1,1,1,1};
		colorDisabled[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
		soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
		soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
		soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
		soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		period = 1.2;
		periodFocus = 1.2;
		periodOver = 1.2;
		access = 0;
		borderSize = 0;
		font = "PuristaMedium";
		h = 0.039216;
		offsetPressedX = 0.002;
		offsetPressedY = 0.002;
		offsetX = 0.003;
		offsetY = 0.003;
		shadow = 2;
		sizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		style = 2;
		text = "";
		type = 1;
		w = 0.095589;
		x = 0;
		y = 0;
	};
	class TallerRscPicture
	{
		deletable = 0;
		fade = 0;
		colorBackground[] = { 0, 0, 0, 1};
		colorText[] = { 1, 1, 1, 1};
		access = 0;
		type = 0;
		idc = -1;
		style = 48;
		font = "TahomaB";
		sizeEx = 0;
		lineSpacing = 0;
		text = "";
		fixedWidth = 0;
		tooltipColorText[] = { 1, 1, 1, 1};
		tooltipColorBox[] = { 1, 1, 1, 1};
		tooltipColorShade[] = { 0, 0, 0, 0.65};
		shadow = 0;
		x = 0;
		y = 0;
		w = 0.2;
		h = 0.15;
	};
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Wofeju)
		////////////////////////////////////////////////////////

		class TallerRscPicture_1200: TallerRscPicture
		{
			idc = 1200;
			text = "\AxE\tallermetropolis.paa";
			x = 0.0926565 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.799219 * safezoneW;
			h = 1.001 * safezoneH;
		};
		class TallerRscButton_2400: TallerRscButton
		{
			idc = 2400;
			text = "REDUCCION DE DAÑO"; //--- ToDo: Localize;
			x = 0.134427 * safezoneW + safezoneX;
			y = 0.476148 * safezoneH + safezoneY;
			w = 0.11651 * safezoneW;
			h = 0.0540741 * safezoneH;
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			onButtonClick = "[""menu"",""red""] spawn ica_fnc_meca";
		};
		class TallerRscButton_2401: TallerRscButton
		{
			idc = 2401;
			text = "RUEDAS BLINDADAS"; //--- ToDo: Localize;
			x = 0.134427 * safezoneW + safezoneX;
			y = 0.533926 * safezoneH + safezoneY;
			w = 0.116562 * safezoneW;
			h = 0.0678519 * safezoneH;
			onButtonClick = "[""menu"",""rue""] spawn ica_fnc_meca";
		};
		class TallerRscButton_2402: TallerRscButton
		{
			idc = 2402;
			text = "BLINDAJE ADICIONAL"; //--- ToDo: Localize;
			x = 0.134375 * safezoneW + safezoneX;
			y = 0.607408 * safezoneH + safezoneY;
			w = 0.116511 * safezoneW;
			h = 0.0678519 * safezoneH;
			onButtonClick = "[""menu"",""bli""] spawn ica_fnc_meca";
		};
		class TallerRscButton_2403: TallerRscButton
		{
			idc = 2403;
			text = "CONSUMO REDUCIDO"; //--- ToDo: Localize;
			x = 0.134323 * safezoneW + safezoneX;
			y = 0.680519 * safezoneH + safezoneY;
			w = 0.116511 * safezoneW;
			h = 0.0678519 * safezoneH;
			onButtonClick = "[""menu"",""con""] spawn ica_fnc_meca";
		};
		class TallerRscButton_2404: TallerRscButton
		{
			idc = 2404;
			text = "NITRO MEJORADO"; //--- ToDo: Localize;
			x = 0.134427 * safezoneW + safezoneX;
			y = 0.753926 * safezoneH + safezoneY;
			w = 0.116511 * safezoneW;
			h = 0.0678519 * safezoneH;
			onButtonClick = "[""menu"",""nit""] spawn ica_fnc_meca";
		};
		class TallerRscButton_2405: TallerRscButton
		{
			idc = 2405;
			text = "LOCALIZADOR PERSONAL"; //--- ToDo: Localize;
			x = 0.134375 * safezoneW + safezoneX;
			y = 0.826296 * safezoneH + safezoneY;
			w = 0.116511 * safezoneW;
			h = 0.0604444 * safezoneH;
			onButtonClick = "[""menu"",""loc""] spawn ica_fnc_meca";
		};
		class TallerRscButton_2406: TallerRscButton
		{
			idc = 2406;
			sizeEx = 0.052;
			text = "APLICAR MODIFICACIONES"; //--- ToDo: Localize;
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.099 * safezoneH;
			onButtonClick = "[""menu"",""aplicar""] spawn ica_fnc_meca";
		};
		class TallerRscButton_2407: TallerRscText
		{
			idc = 2407;
			text = "MODIFICACION SELECCIONADA"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class TallerRscButton_2408: TallerRscButton
		{
			idc = 2408;
			text = "PINTAR VEHICULO"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.099 * safezoneH;
			onButtonClick = "[""menu"",""pin""] spawn ica_fnc_meca";
		};
		class TallerRscButton_2409: TallerRscButton
		{
			idc = 2409;
			text = "CAMBIAR MATRICULA"; //--- ToDo: Localize;
			x = 0.44474 * safezoneW + safezoneX;
			y = 0.707963 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "[""menu"",""cam""] spawn ica_fnc_meca";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};