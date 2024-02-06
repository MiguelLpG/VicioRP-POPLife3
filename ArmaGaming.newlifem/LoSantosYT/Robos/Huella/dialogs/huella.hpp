class Huella {
	idd=1234;
	class controlsBackground
   	{
       class Fond : RscPicture
       {
        	text = "\ArmaGamingCore\LoSantosYT\huella\fondohuella.paa";
        	idc = -1;
        	x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
       };
   	};
	class controls{

		class Contador: RscText 
		{
			idc = 1000;
			text = ""; //--- ToDo: Localize;
			size = 4;
			x = 0.358687 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.258594 * safezoneW;
			h = 0.134 * safezoneH;		
			sizeEx = 0.10;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\ArmaGamingCore\LoSantosYT\huella\a.paa";
			x = 0.524531 * safezoneW + safezoneX;
			y = 0.261 * safezoneH + safezoneY;
			w = 0.0264063 * safezoneW;
			h = 0.048 * safezoneH;
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "\ArmaGamingCore\LoSantosYT\huella\b.paa";
			x = 0.56125 * safezoneW + safezoneX;
			y = 0.261 * safezoneH + safezoneY;
			w = 0.0264063 * safezoneW;
			h = 0.048 * safezoneH;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1202;
			text = "\ArmaGamingCore\LoSantosYT\huella\c.paa";
			x = 0.598969 * safezoneW + safezoneX;
			y = 0.261 * safezoneH + safezoneY;
			w = 0.0264063 * safezoneW;
			h = 0.048 * safezoneH;
		};
		class RscPicture_1203: RscPicture
		{
			idc = 1203;
			text = "\ArmaGamingCore\LoSantosYT\huella\d.paa";
			x = 0.639531 * safezoneW + safezoneX;
			y = 0.261 * safezoneH + safezoneY;
			w = 0.0264063 * safezoneW;
			h = 0.048 * safezoneH;
		};
		// Botones huella
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.381 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
			action = [1611] spawn lsyt_fnc_rotarImg;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.437 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
			action = [1612] spawn lsyt_fnc_rotarImg;
			
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.493 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
			action = [1613] spawn lsyt_fnc_rotarImg;
		};
		class RscButton_1604: RscButton
		{
			idc = 1604;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.549 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
			action = [1614] spawn lsyt_fnc_rotarImg;
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.605 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
			action = [1615] spawn lsyt_fnc_rotarImg;
		};
		class RscButton_1606: RscButton
		{
			idc = 1606;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
			action = [1616] spawn lsyt_fnc_rotarImg;
		};
		

		// Img
		class RscPicture_1611: RscPicture
		{
			idc = 1611;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.381 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1612: RscPicture
		{
			idc = 1612;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.437 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1613: RscPicture
		{
			idc = 1613;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.493 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1614: RscPicture
		{
			idc = 1614;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.549 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1615: RscPicture
		{
			idc = 1615;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.605 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1616: RscPicture
		{
			idc = 1616;
			text = ""; //--- ToDo: Localize;
			x = 0.304375 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////

	};
};