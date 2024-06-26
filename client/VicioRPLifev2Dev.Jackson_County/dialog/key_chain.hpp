class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Keys_Title";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class KeyChainList : Life_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = 0.035;
			x = 0.323958 * safezoneW + safezoneX;
			y = 0.368519 * safezoneH + safezoneY;
			w = 0.0777083 * safezoneW;
			h = 0.280926 * safezoneH;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Cerrar";
			onButtonClick = "closeDialog 0;";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class NearPlayers : Life_RscCombo {
		
		idc = 2702;
		
			x = 0.410937 * safezoneW + safezoneX;
			y = 0.366667 * safezoneH + safezoneY;
			w = 0.0719791 * safezoneW;
			h = 0.0253704 * safezoneH;
		
		};
		
//		class DropKey : life_RscButtonMenu {
//			idc = -1;
//			text = "$STR_Keys_DropKey";
//			onButtonClick = "[] call life_fnc_keyDrop";
//			x = 0.411458 * safezoneW + safezoneX;
//			y = 0.431482 * safezoneH + safezoneY;
//			w = 0.0730208 * safezoneW;
//			h = 0.0272222 * safezoneH;
//		};
		
		class GiveKey : life_RscButtonMenu {
			idc = 2703;
			text = "$STR_Keys_GiveKey";
//			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			colorBackground[] = {0, 0.62, 0.62, 0.6};
			onButtonClick = "[] call life_fnc_keyGive";
			x = 0.410416 * safezoneW + safezoneX;
			y = 0.393519 * safezoneH + safezoneY;
			w = 0.0730208 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
	};
};