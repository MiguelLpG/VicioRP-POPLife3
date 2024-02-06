class AL_Hud
{
	idd = -1; 
	duration = 1e+1000; 
	fadeIn = 0; 
	fadeOut = 0;
    name = "AL_Hud";
	onLoad = "uiNamespace setVariable ['AL_Hud',_this select 0]";
	
	// CONTROLS
	controls[]=
	{
		NCK_BACKGROUND,
		NCK_TEXT_MONEY,
		NCK_TEXT_FECHA,
		NCK_BG_PROGRESS_HEALTH,
		NCK_BG_PROGRESS_FATIGUE,
		NCK_BG_PROGRESS_COMIDA,
		NCK_BG_PROGRESS_SED,
		NCK_PROGRESS_HEALTH,
		NCK_PROGRESS_FATIGUE,
		NCK_PROGRESS_COMIDA,
		NCK_PROGRESS_SED,
		NCK_PICTURE_HEALTH,
		NCK_PICTURE_FATIGUE,
		NCK_PICTURE_COMIDA,
		NCK_PICTURE_SED,
		AnzusLife_ThreatLevelText,
		rscBackground1,
		rscBackground2,
		rscBackground3,
		rscBackground4,
		rscBackground5,
		rscBackground6,
		rscBackground7,
		rscBackground8,
		rscBackground9,
		rscKey1,
		rscKey2,
		rscKey3,
		rscKey4,
		rscKey5,
		rscKey6,
		rscKey7,
		rscKey8,
		rscKey9,
		rscIcon1,
		rscIcon2,
		rscIcon3,
		rscIcon4,
		rscIcon5,
		rscIcon6,
		rscIcon7,
		rscIcon8,
		rscIcon9
	};
	// FONDO
	class NCK_BACKGROUND: IGUIBack
	{
		idc = -1;
		x = 0.005 * safezoneW + safezoneX;
		y = 0.885 * safezoneH + safezoneY;
		w = 0.134062 * safezoneW;
		h = 0.11 * safezoneH;
		colorBackground[] = {0.11,0.11,0.13,1};
	};
	class NCK_TEXT_MONEY: life_RscText
	{
		idc = 600212;
		x = 0.005 * safezoneW + safezoneX;
		y = 0.8465 * safezoneH + safezoneY;
		w = 0.134166 * safezoneW;
		h = 0.0266297 * safezoneH;
		colorBackground[] = {0.11,0.11,0.13,1};
	};
	class NCK_TEXT_FECHA: life_RscText
	{
		idc = 600213;
		x = 0.141537 * safezoneW + safezoneX;
		y = 0.973 * safezoneH + safezoneY;
		w = 0.0721875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	// BACKGROUNDS
	class NCK_BG_PROGRESS_FATIGUE: IGUIBack
	{
		idc = -1;
		x = 0.0307812 * safezoneW + safezoneX;
		y = 0.929 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.0055 * safezoneH;
		colorBackground[] = {0.24,0.24,0.24,1};
	};
	class NCK_BG_PROGRESS_COMIDA: IGUIBack
	{
		idc = -1;
		x = 0.0307812 * safezoneW + safezoneX;
		y = 0.951 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.0055 * safezoneH;
		colorBackground[] = {0.24,0.24,0.24,1};
	};
	class NCK_BG_PROGRESS_SED: IGUIBack
	{
		idc = -1;
		x = 0.0307812 * safezoneW + safezoneX;
		y = 0.973 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.0055 * safezoneH;
		colorBackground[] = {0.24,0.24,0.24,1};
	};
	class NCK_BG_PROGRESS_HEALTH: IGUIBack
	{
		idc = -1;
		x = 0.0307812 * safezoneW + safezoneX;
		y = 0.907 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.0055 * safezoneH;
		colorBackground[] = {0.24,0.24,0.24,1};
	};
	// PROGRESOS
	class NCK_PROGRESS_COMIDA: Nick_RscProgress
	{
		idc = 700410;
		texture = "#(argb,8,8,3)color(0.87,0.87,0.87,1)";
		x = 0.0307812 * safezoneW + safezoneX;
		y = 0.929 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.0055 * safezoneH;
	};
	class NCK_PROGRESS_SED: Nick_RscProgress
	{
		idc = 700411;
		texture = "#(argb,8,8,3)color(0.87,0.87,0.87,1)";
		x = 0.0307812 * safezoneW + safezoneX;
		y = 0.951 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.0055 * safezoneH;
	};
	class NCK_PROGRESS_HEALTH: Nick_RscProgress
	{
		idc = 700412;
		texture = "#(argb,8,8,3)color(0.87,0.87,0.87,1)";
		x = 0.0307812 * safezoneW + safezoneX;
		y = 0.973 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.0055 * safezoneH;
	};
	class NCK_PROGRESS_FATIGUE: Nick_RscProgress
	{
		idc = 700413;
		texture = "#(argb,8,8,3)color(0.87,0.87,0.87,1)";
		x = 0.0307812 * safezoneW + safezoneX;
		y = 0.907 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.0055 * safezoneH;
	};
	// IMAGENES
	class NCK_PICTURE_FATIGUE: RscPicture
	{
		idc = -1;
		text = "armagamingcore\images\icons\nick\peso.paa";
		x = 0.0194375 * safezoneW + safezoneX;
		y = 0.89798 * safezoneH + safezoneY;
		w = 0.00921874 * safezoneW;
		h = 0.0173704 * safezoneH;
	};
	class NCK_PICTURE_COMIDA: RscPicture
	{
		idc = -1;
		text = "armagamingcore\images\icons\nick\apple.paa";
		x = 0.0191281 * safezoneW + safezoneX;
		y = 0.9213 * safezoneH + safezoneY;
		w = 0.00973951 * safezoneW;
		h = 0.0164446 * safezoneH;
	};
	class NCK_PICTURE_SED: RscPicture
	{
		idc = -1;
		text = "armagamingcore\images\icons\nick\water.paa";
		x = 0.0194375 * safezoneW + safezoneX;
		y = 0.94418 * safezoneH + safezoneY;
		w = 0.00828119 * safezoneW;
		h = 0.0156296 * safezoneH;
	};
	class NCK_PICTURE_HEALTH: RscPicture
	{
		idc = -1;
		text = "armagamingcore\images\icons\nick\vida.paa";
		x = 0.0177875 * safezoneW + safezoneX;
		y = 0.96596 * safezoneH + safezoneY;
		w = 0.0108333 * safezoneW;
		h = 0.0192222 * safezoneH;
	};
	class AnzusLife_ThreatLevelText: life_RscText
    {
        idc = 1251;
        text = "THREAT LEVEL";
        x = 0.936218 * safezoneW + safezoneX;
        y = 0.9752 * safezoneH + safezoneY;
        w = 0.061875 * safezoneW;
        h = 0.022 * safezoneH;
        colorText[] = {0.063,0.776,0,1};
        font = "PuristaSemiBold";
        SizeEx = 0.035;
    };
	//QUICK ACCESS BAR
	 class rscBackground1: Nick_IGUIBack {
		idc = 9550;
		x = 0.374188 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscBackground2: Nick_IGUIBack {
		idc = 9551;
		x = 0.401 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscBackground3: Nick_IGUIBack {
		idc = 9552;
		x = 0.428845 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscBackground4: Nick_IGUIBack {
		idc = 9553;
		x = 0.455657 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscBackground5: Nick_IGUIBack {
		idc = 9554;
		x = 0.4835 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscBackground6: Nick_IGUIBack {
		idc = 9555;
		x = 0.510311 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscBackground7: Nick_IGUIBack {
		idc = 9556;
		x = 0.538156 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscBackground8: Nick_IGUIBack {
		idc = 9557;
		x = 0.564968 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscBackground9: Nick_IGUIBack {
		idc = 9558;
		x = 0.592812 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.122,0.125,0.169,1};
		shadow = 2;
	 };
	 class rscIcon1: Nick_RscPicture {
		idc = 9559;
		text = "";
		x = 0.374188 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0247499 * safezoneW;
		h = 0.044 * safezoneH;
	 };
	 class rscIcon2: Nick_RscPicture {
		idc = 9560;
		text = "";
		x = 0.401 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
	 };
	 class rscIcon3: Nick_RscPicture {
		idc = 9561;
		text = "";
		x = 0.428845 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0247499 * safezoneW;
		h = 0.044 * safezoneH;
	 };
	 class rscIcon4: Nick_RscPicture {
		idc = 9562;
		text = "";
		x = 0.455657 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
	 };
	 class rscIcon5: Nick_RscPicture {
		idc = 9563;
		text = "";
		x = 0.4835 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0247499 * safezoneW;
		h = 0.044 * safezoneH;
	 };
	 class rscIcon6: Nick_RscPicture {
		idc = 9564;
		text = "";
		x = 0.510311 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
	 };
	 class rscIcon7: Nick_RscPicture {
		idc = 9565;
		text = "";
		x = 0.538156 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0247499 * safezoneW;
		h = 0.044 * safezoneH;
	 };
	 class rscIcon8: Nick_RscPicture {
		idc = 9566;
		text = "";
		x = 0.564968 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.044 * safezoneH;
	 };
	 class rscIcon9: Nick_RscPicture {
		idc = 9567;
		text = "";
		x = 0.592812 * safezoneW + safezoneX;
		y = 0.9488 * safezoneH + safezoneY;
		w = 0.0247499 * safezoneW;
		h = 0.044 * safezoneH;
	 };	 
	 class rscKey1: Nick_RscText {
		idc = 9659;
		text = "1"; 
		x = 0.372126 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
	 class rscKey2: Nick_RscText {
		idc = 9660;
		text = "2"; 
		x = 0.399033 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
	 class rscKey3: Nick_RscText {
		idc = 9661;
		text = "3"; 
		x = 0.426106 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
	 class rscKey4: Nick_RscText {
		idc = 9662;
		text = "4"; 
		x = 0.45371 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
	 class rscKey5: Nick_RscText {
		idc = 9663;
		text = "5"; 
		x = 0.481303 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
	 class rscKey6: Nick_RscText {
		idc = 9664;
		text = "6"; 
		x = 0.508907 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
	 class rscKey7: Nick_RscText {
		idc = 9665;
		text = "7"; 
		x = 0.536533 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
	 class rscKey8: Nick_RscText {
		idc = 9666;
		text = "8"; 
		x = 0.563616 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
	 class rscKey9: Nick_RscText {
		idc = 9667;
		text = "9"; 
		x = 0.591199 * safezoneW + safezoneX;
		y = 0.9774 * safezoneH + safezoneY;
		w = 0.00928125 * safezoneW;
		h = 0.0154 * safezoneH;
		sizeEx = 0.030;
	 };
};
