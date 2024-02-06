class AnzusLife_Bleedout {
    idd = 8000001;
    name = "AnzusLife_Bleedout";
    movingEnable = 0;
    duration = 10e10;
    onLoad = "['onLoad',_this] call AnzusLife_BleedoutMain";
    onUnload = "['onUnload',_this] call AnzusLife_BleedoutMain";

    class controlsBackground {
        class PROGRESS_BACKGROUND: ANZUS_ctrlStatic {
        	idc                = -1;
        	x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8498 * safezoneH + safezoneY";
        	w                  = "0.371242 * safezoneW";
        	h                  = "0.0308 * safezoneH";
        	colorBackground[]  = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
        };
    };

    class controls {
        class PROGRESS: ANZUS_ctrlProgress {
        	idc                = 1;
            x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8498 * safezoneH + safezoneY";
        	w                  = "0.371242 * safezoneW";
        	h                  = "0.0308 * safezoneH";
        	colorBar[]         = {0.59, 0, 0, 1};
        };
        class PROGRESS_TEXT: ANZUS_ctrlStatic {
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
        class NEAREST_MEDIC: ANZUS_ctrlStatic {
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
        class ESCAPE_NOTICE: ANZUS_ctrlStatic {
        	idc                = 3;
        	text               = "PRESS [ESCAPE] TO RESPAWN";
        	x                  = "0.314374 * safezoneW + safezoneX";
        	y                  = "0.8806 * safezoneH + safezoneY";
        	w                  = "0.371184 * safezoneW";
        	h                  = "0.033 * safezoneH";
            style              = 0x02;
            font               = "RobotoCondensedLight";
            sizeEx             = "0.018 * safezoneH";
        };
    };
};