class AnzusLife_SpawnMenu {
    idd = 8999720;
    name = "AnzusLife_SpawnMenu";
    movingEnable = 1;
    enableSimulation = 0;
    enableDisplay = 1;

    class ControlsBackground {
        class LOCATIONS_HEADER: ANZUS_ctrlStaticHeader {
        	text               = "Available Spawns";
        	x                  = "safezoneX";
        	y                  = "0.269 * safezoneH + safezoneY";
        	w                  = "0.118589 * safezoneW";
        };
		class SELSPAWN_HEADER: ANZUS_ctrlStaticHeader {
        	text               = "Map";
        	x                  = "0.845845 * safezoneW + safezoneX";
        	y                  = "0.269 * safezoneH + safezoneY";
        	w                  = "0.154674 * safezoneW";
        };
		class SELSPAWN_BACKGROUND: ANZUS_ctrlStaticBackground {
        	x                  = "0.845945 * safezoneW + safezoneX";
        	y                  = "0.287963 * safezoneH + safezoneY";
        	w                  = "0.154164 * safezoneW";
        	h                  = "0.442192 * safezoneH";
        };
        class LOCATIONS_BACKGROUND: ANZUS_ctrlStaticBackground {
        	x                  = "safezoneX";
        	y                  = "0.287519 * safezoneH + safezoneY";
        	w                  = "0.118589 * safezoneW";
        	h                  = "0.416718 * safezoneH";
        };
        class LOCATIONS_FOOTER: ANZUS_ctrlStaticFooter {
        	x                  = "safezoneX";
        	y                  = "0.704948 * safezoneH + safezoneY";
        	w                  = "0.118589 * safezoneW";
        };
		 class SELSPAWN_NAME: ANZUS_ctrlStatic {
        	text               = "Name:"; // ToDo: Localize;
            style              = ST_RIGHT;
        	x                  = "0.848021 * safezoneW + safezoneX";
        	y                  = "0.600274 * safezoneH + safezoneY";
        	w                  = "0.0433128 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class SELSPAWN_DESCRIPTION: SELSPAWN_NAME {
            text               = "Description:"; // ToDo: Localize;
            y                  = "0.619793 * safezoneH + safezoneY";
        };
    };
    class controls {
        class LOCATIONS_TREE: ANZUS_ctrlTree {
        	idc                = 1;
        	idcSearch          = 5;
        	x                  = "0.00217705 * safezoneW + safezoneX";
        	y                  = "0.313548 * safezoneH + safezoneY";
        	w                  = "0.114465 * safezoneW";
        	h                  = "0.387074 * safezoneH";
        	colorBackground[]  = {0, 0, 0, 0.5};
        };
        class LOCATIONS_SEARCHINPUT: ANZUS_ctrlEdit {
        	idc                = 5;
        	x                  = "0.00217705 * safezoneW + safezoneX";
        	y                  = "0.291348 * safezoneH + safezoneY";
        	w                  = "0.0804372 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class LOCATIONS_SEARCH_BUTTON: ANZUS_ctrlButtonSearch {
        	idc                = 6;
        	x                  = "0.0833747 * safezoneW + safezoneX";
        	y                  = "0.291348 * safezoneH + safezoneY";
        };
        class LOCATIONS_EXPANDALL_BUTTON: ANZUS_ctrlButtonExpandAll {
        	idc                = 7;
        	x                  = "0.0968917 * safezoneW + safezoneX";
        	y                  = "0.291667 * safezoneH + safezoneY";
        };
        class LOCATIONS_COLLAPSEALL_BUTTON: ANZUS_ctrlButtonCollapseAll {
        	idc                = 8;
        	x                  = "0.10625 * safezoneW + safezoneX";
        	y                  = "0.291667 * safezoneH + safezoneY";
        };
		class SELSPAWN_MAP: ANZUS_ctrlMapMain {
            idc                = 2;
            x                  = "0.848054 * safezoneW + safezoneX";
            y                  = "0.291926 * safezoneH + safezoneY";
            w                  = "0.150029 * safezoneW";
            h                  = "0.305326 * safezoneH";
            colorBackground[]  = {0, 0, 0, 0.5};
        };
        class SELSPAWN_NAME: ANZUS_ctrlStaticContent {
        	idc                = 9;
        	text               = ""; // ToDo: Localize;
            style              = ST_LEFT;
        	x                  = "0.891667 * safezoneW + safezoneX";
        	y                  = "0.600348 * safezoneH + safezoneY";
        	w                  = "0.106217 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class SELSPAWN_DESCRIPTION_DESCRIPTION: SELSPAWN_NAME {
        	idc                = 3;
            style              = ST_MULTI;
        	y                  = "0.619793 * safezoneH + safezoneY";
        	h                  = "0.106518 * safezoneH";
        };
        class BUTTON_LOBBY: ANZUS_ctrlDefaultButton {
            idc                = 10;
        	text               = "LOBBY"; // ToDo: Localize;
        	x                  = "0.00654686 * safezoneW + safezoneX";
        	y                  = "0.70812 * safezoneH + safezoneY";
        	w                  = "0.0480419 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class BUTTON_SPAWN: BUTTON_LOBBY {
            idc                = 4;
        	text               = "SPAWN"; // ToDo: Localize;
        	x                  = "0.0609969 * safezoneW + safezoneX";
        };
    };
};
