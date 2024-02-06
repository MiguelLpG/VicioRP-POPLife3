class AnzusLife_Deathscreen
{
    idd = -1;
    duration = 1e+1000;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "AnzusLife_Deathscreen";
    onLoad = "uiNamespace setVariable ['AnzusLife_Deathscreen',_this select 0]";

	class controlsBackground {
		class AnzusLife_Background: Life_RscText
			{
				idc = -1;
				x = 0.29375 * safezoneW + safezoneX;
				y = 0.00500001 * safezoneH + safezoneY;
				w = 0.4125 * safezoneW;
				h = 0.13837 * safezoneH;
				colorBackground[] = {0,0,0,0.7};
				colorActive[] = {0,0,0,0.7};
			};
		class AnzusLife_KilledText: Life_RscText
		{
			idc = -1;
			text = "You have been killed, here's how:";	
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			class Attributes
			{
				align = "center";
			};
		};
	};
	class controls {
		class AnzusLife_KilledBy: Life_RscText
		{
			idc = 7310;
			text = "Killed by:";	
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes
			{
				align = "center";
			};
		};
		class AnzusLife_Weapon: LIfe_RscText
		{
			idc = 7311;
			text = "Weapon:";	
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes
			{
				align = "center";
			};
		};
		class AnzusLife_Distance: Life_RscText
		{
			idc = 7312;
			text = "Distance: ";	
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes
			{
				align = "center";
			};
		};

		class AnzusLife_BleedoutTimer: ANZUS_ctrlProgress {
        	idc                = 1;
            x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8498 * safezoneH + safezoneY";
        	w                  = "0.371242 * safezoneW";
        	h                  = "0.0308 * safezoneH";
        	colorBar[]         = {0.59, 0, 0, 1};
        };
        
        class AnzusLife_BleedoutTimerText: ANZUS_ctrlStatic {
        	idc                = 4;
        	text               = "";
        	x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8498 * safezoneH + safezoneY";
        	w                  = "0.371242 * safezoneW";
        	h                  = "0.0286 * safezoneH";
            style              = 0x02;
            font               = "RobotoCondensedLight";
            sizeEx             = "0.02 * safezoneH";
        };

        class AnzusLife_NearestMedic: ANZUS_ctrlStatic {
        	idc                = 2;
        	text               = "";
        	x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8168 * safezoneH + safezoneY";
        	w                  = "0.371184 * safezoneW";
        	h                  = "0.033 * safezoneH";
            style              = 0x02;
            font               = "RobotoCondensed";
            sizeEx             = "0.02 * safezoneH";
        };
	};
};