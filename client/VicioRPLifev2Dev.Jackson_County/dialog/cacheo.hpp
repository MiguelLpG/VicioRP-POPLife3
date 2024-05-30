class cacheo
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['cacheo', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['cacheo', nil]; ";
	
	class controls {
		class l1: RscListbox
		{
			idc = 7090;

	x = 0.285463 * safezoneW + safezoneX;
	y = 0.345964 * safezoneH + safezoneY;
	w = 0.14025 * safezoneW;
	h = 0.352 * safezoneH;
	colorBackground[] = {0,0,0,0.8};
		};
		class l2: RscListbox
		{
			idc = 7091;

	x = 0.429839 * safezoneW + safezoneX;
	y = 0.345964 * safezoneH + safezoneY;
	w = 0.14025 * safezoneW;
	h = 0.352 * safezoneH;
	colorBackground[] = {0,0,0,0.8};
		};
		class l3: RscListbox
		{
			idc = 7092;

	text = "l3"; //--- ToDo: Localize;
	x = 0.574215 * safezoneW + safezoneX;
	y = 0.345964 * safezoneH + safezoneY;
	w = 0.14025 * safezoneW;
	h = 0.352 * safezoneH;
	colorBackground[] = {0,0,0,0.8};
		};
		
		class RscText_1000: RscText
		{
			idc = 1003;
	text = "Ropa"; //--- ToDo: Localize;
	x = 0.285463 * safezoneW + safezoneX;
	y = 0.317376 * safezoneH + safezoneY;
	w = 0.14024 * safezoneW;
	h = 0.0307999 * safezoneH;
	colorBackground[] = {0,0,0,1};
		};
		class RscText_1001: RscText
		{
			idc = 1004;
	text = "Chaleco"; //--- ToDo: Localize;
	x = 0.429839 * safezoneW + safezoneX;
	y = 0.317376 * safezoneH + safezoneY;
	w = 0.14024 * safezoneW;
	h = 0.0307999 * safezoneH;
	colorBackground[] = {0,0,0,1};
		};
		class RscText_1002: RscText
		{
			idc = 1005;
	text = "Mochila"; //--- ToDo: Localize;
	x = 0.574215 * safezoneW + safezoneX;
	y = 0.317376 * safezoneH + safezoneY;
	w = 0.14024 * safezoneW;
	h = 0.0307999 * safezoneH;
	colorBackground[] = {0,0,0,1};
		};
		class btn: RscButton
		{
			idc = 2400;
	action = "[] spawn ica_fnc_confiscar";

	text = "Confiscar"; //--- ToDo: Localize;
	x = 0.388401 * safezoneW + safezoneX;
	y = 0.718782 * safezoneH + safezoneY;
	w = 0.048478 * safezoneW;
	h = 0.0282119 * safezoneH;
	colorBackground[] = {0,0,0,1};
		};

		class radio: RscButton
			{
				idc = 1600;
	action = "[] spawn Climent_fnc_cnfryg";

	text = "Confiscar GPS"; //--- ToDo: Localize;
	x = 0.447115 * safezoneW + safezoneX;
	y = 0.71629 * safezoneH + safezoneY;
	w = 0.105725 * safezoneW;
	h = 0.0281207 * safezoneH;
	colorBackground[] = {0,0,0,1};
	tooltip = "Arrancarle el GPS"; //--- ToDo: Localize;
			};
	};
};