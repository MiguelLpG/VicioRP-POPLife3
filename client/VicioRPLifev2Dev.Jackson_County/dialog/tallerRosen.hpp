////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rosen, v1.063, #Pokaso)
////////////////////////////////////////////////////////

class tallerRosen {
	idd = 8856;
	movingEnabled = false;
	class controls {
		class lista: RscCombo
		{
			idc = 8857;
			x = 0.324688 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class boton: RscButton
		{
			idc = 8858;
			text = "Pintar"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorActive[] = {-1,-1,-1,-1};
		};
		class RscPicture_1200: RscPicture
		{
			idc = 8859;
			text = "rosen\pintura.jpg";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class fondo: IGUIBack
		{
			idc = 8860;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.297 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////