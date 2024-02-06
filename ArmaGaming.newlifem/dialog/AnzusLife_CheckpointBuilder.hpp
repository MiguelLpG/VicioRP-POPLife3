class AnzusLife_CheckpointBuilder {
    idd = 5125;
    name= "AnzusLife_CheckpointBuilder";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
	    class AL_TitleBackground: Life_RscText
		{
			idc = 1000;
			x = 0.355607 * safezoneW + safezoneX;
			y = 0.291089 * safezoneH + safezoneY;
			w = 0.32605 * safezoneW;
			h = 0.230902 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class AL_TitleText: Life_RscText
		{
			idc = 1001;
			text = "Checkpoint Builder"; //--- ToDo: Localize;
			x = 0.355607 * safezoneW + safezoneX;
			y = 0.268219 * safezoneH + safezoneY;
			w = 0.325527 * safezoneW;
			h = 0.0233017 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class AL_Close: Life_RscButtonMenu
		{
			idc = 2409;
			onButtonClick = "closeDialog 0;";
			text = "Close";
			x = 0.355814 * safezoneW + safezoneX;
			y = 0.521991 * safezoneH + safezoneY;
			w = 0.164878 * safezoneW;
			h = 0.0219906 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class AL_BuyObject: Life_RscButtonMenu
		{
			idc = 2410;
			text = "Buy Object";
			x = 0.520385 * safezoneW + safezoneX;
			y = 0.521991 * safezoneH + safezoneY;
			w = 0.161172 * safezoneW;
			h = 0.0219906 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class AL_ItemList: Life_RscListbox
		{
			idc = 1500;
			x = 0.364405 * safezoneW + safezoneX;
			y = 0.299885 * safezoneH + safezoneY;
			w = 0.308994 * safezoneW;
			h = 0.212462 * safezoneH;
		};
	};
};	