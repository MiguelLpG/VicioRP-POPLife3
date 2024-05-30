class aanuncio {
	idd = -1;
	fadein = 2; 
	duration = 9999;
	fadeout = 4;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['aanuncio', _this select 0]";
	onUnLoad = "uiNamespace setVariable ['aanuncio', nil]";
	
	class controls {
		////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Dono y no tiro server, v1.063, #Sajabe)
////////////////////////////////////////////////////////

class fondo: IGUIBack
{
	idc = -1;
	x = 0.7975 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.187082 * safezoneW;
	h = 0.130895 * safezoneH;
	colorBackground[] = {0,0,0,0.65};
};
class imagen: RscStructuredText
{
	idc = 11007;
	x = 0.803078 * safezoneW + safezoneX;
	y = 0.284958 * safezoneH + safezoneY;
	w = 0.0728324 * safezoneW;
	h = 0.121546 * safezoneH;
	//font = "EtelkaNarrowMediumPro";
};
class texto: RscStructuredText
{
	idc = 11034;
	x = 0.879285 * safezoneW + safezoneX;
	y = 0.286827 * safezoneH + safezoneY;
	w = 0.099489 * safezoneW;
	h = 0.118748 * safezoneH;
	font = "EtelkaNarrowMediumPro";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};



