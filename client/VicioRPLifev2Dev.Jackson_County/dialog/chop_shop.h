class Chop_Shop
{
	idd = 39400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1; y = 0.2;
			w = 0.32; h = (1 / 25);
		};
		
		class MainBackGround : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1; y = 0.2 + (11 / 250);
			w = 0.32; h = 0.6 - (22 / 250);
		};
		
		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_ChopShop_Title";
			x = 0.1; y = 0.2;
			w = 0.32; h = (1 / 25);
		};
		
		class priceInfo : Life_RscStructuredText
		{
			idc = 39401;
			text = "";
			sizeEx = 0.035;
			x = 0.11; y = 0.68;
			w = 0.2; h = 0.2;
		};
	};
	
	class controls
	{
		class vehicleList : Life_RscListBox
		{
			idc = 39402;
			onLBSelChanged = "_this call life_fnc_chopShopSelection";
			sizeEx = 0.04;
			x = 0.11; y = 0.25;
			w = 0.3; h = 0.38;
		};
		
		class BtnSell : Life_RscButtonMenu
		{
			idc = -1;
			text = "Vender";
			onButtonclick = "[] call life_fnc_chopShopSell;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BtnClose : Life_RscButtonMenu
		{
			idc = -1;
			text = "Cerrar";
			onButtonClick = "closeDialog 0";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
        class medel: RscText
        {
            idc = -1;
            text = "Villas"; //--- ToDo: Localize;
            x = 0.964445 * safezoneW + safezoneX;
            y = -0.0166667 * safezoneH + safezoneY;
            w = 0.0412603 * safezoneW;
            h = 0.055 * safezoneH;
           colorBackground[] = {0,0,0,0};
        };
	};
};