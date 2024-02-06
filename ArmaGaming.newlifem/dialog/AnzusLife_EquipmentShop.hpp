class AnzusLife_EquipmentShop {
    idd = 8000340;
    name = "AnzusLife_EquipmentShop";
    movingEnable = 1;
    enableSimulation = 0;
    enableDisplay = 1;

    class ControlsBackground {
        class BACKGROUND: ANZUS_ctrlStatic {
        	idc                = -1;
        	x                  = "0.32468 * safezoneW + safezoneX";
        	y                  = "0.313578 * safezoneH + safezoneY";
        	w                  = "0.351671 * safezoneW";
        	h                  = "0.396 * safezoneH";
        	colorBackground[]  = {0.2,0.2,0.2,1};
        };
        class HEADER: ANZUS_ctrlStatic {
        	idc                = 8000351;
        	text               = "";
        	x                  = "0.32468 * safezoneW + safezoneX";
        	y                  = "0.291 * safezoneH + safezoneY";
        	w                  = "0.351671 * safezoneW";
        	h                  = 0.022 * safezoneH;
          colorBackground[] = {0,0.306,1,1};
        };
        class TITLE_EQUIPMENT: ANZUS_ctrlStatic {
        	idc                = -1;
        	text               = "Available Equipment"; // ToDo: Localize;
        	x                  = "0.326743 * safezoneW + safezoneX";
        	y                  = "0.3174 * safezoneH + safezoneY";
        	w                  = "0.122713 * safezoneW";
        	h                  = 0.022 * safezoneH;
        	colorBackground[]  = {0.05,0.05,0.05,1};
        };
        class BACKGROUND_BUTTON: ANZUS_ctrlStatic {
        	idc                = -1;
        	x                  = "0.326763 * safezoneW + safezoneX";
        	y                  = "0.341 * safezoneH + safezoneY";
        	w                  = "0.0123751 * safezoneW";
        	h                  = 0.022 * safezoneH;
        	colorBackground[]  = {0,0,0,0.5};
        };
        class TITLE_WEAPONINFORMATION: ANZUS_ctrlStatic {
        	idc                = -1;
        	text               = "Equipment Information"; // ToDo: Localize;
        	x                  = "0.451742 * safezoneW + safezoneX";
        	y                  = "0.317852 * safezoneH + safezoneY";
        	w                  = "0.221689 * safezoneW";
        	h                  = 0.022 * safezoneH;
        	colorBackground[]  = {0.05,0.05,0.05,1};
        };
        class TITLE_NAME: ANZUS_ctrlStatic {
        	idc                = -1;
        	text               = "Name"; // ToDo: Localize;
        	x                  = "0.451763 * safezoneW + safezoneX";
        	y                  = "0.49563 * safezoneH + safezoneY";
        	w                  = "0.0598127 * safezoneW";
        	h                  = 0.022 * safezoneH;
        	colorBackground[]  = {0,0,0,0.5};
            style              = ST_RIGHT;
        };
        class TITLE_PRICE: TITLE_NAME {
        	text               = "Price"; // ToDo: Localize;
        	y                  = "0.541222 * safezoneH + safezoneY";
        };
        class TITLE_DESCRIPTION: TITLE_NAME {
        	text               = "Description"; // ToDo: Localize;
        	y                  = "0.518778 * safezoneH + safezoneY";
        };
    };
    class Controls {
        class BUTTON_CLOSE: ANZUS_ctrlButtonCancel {
            idc                = 8000348;
            x                  = "0.663969 * safezoneW + safezoneX";
            y                  = "0.291 * safezoneH + safezoneY";
            w                  = "0.0123747 * safezoneW";
        };
        class BUTTON_PURCHASE: ANZUS_ctrlDefaultButton {
            idc                = 8000349;
            text               = "PURCHASE"; // ToDo: Localize;
            x                  = "0.594811 * safezoneW + safezoneX";
            y                  = "0.687 * safezoneH + safezoneY";
            w                  = "0.0794139 * safezoneW";
            colorBackground[]  = {0,0,0,1};
        };
        class TREE_EQUIPMENT: ANZUS_ctrlTree {
            idc                = 8000343;
            idcSearch          = 8000341;
            x                  = "0.326763 * safezoneW + safezoneX";
            y                  = "0.364148 * safezoneH + safezoneY";
            w                  = "0.122724 * safezoneW";
            h                  = "0.342852 * safezoneH";
            colorBackground[]  = {0,0,0,0.5};
        };
        class INPUT_SEARCH: ANZUS_ctrlEdit {
        	idc                = 8000341;
        	x                  = "0.339656 * safezoneW + safezoneX";
        	y                  = "0.341 * safezoneH + safezoneY";
        	w                  = "0.10982 * safezoneW";
        	h                  = 0.022 * safezoneH;
        	colorBackground[]  = {0,0,0,0.4};
        };
        class BUTTON_SEARCH_REFRESH: ANZUS_ctrlButtonPictureKeepAspect {
        	idc                = 8000342;
            text               = "\a3\3DEN\Data\Cfg3DEN\History\rotateItems_ca.paa";
            tooltip            = "Refresh List";
        	x                  = "0.327752 * safezoneW + safezoneX";
        	y                  = "0.342874 * safezoneH + safezoneY";
        	w                  = "0.0103125 * safezoneW";
        	h                  = "0.0182963 * safezoneH";
            colorBackground[]  = {0,0,0,1};
        };
        class WEAPON_PREVIEW: ANZUS_ctrlStructuredText {
        	idc                = 8000344;
        	x                  = "0.451763 * safezoneW + safezoneX";
        	y                  = "0.341 * safezoneH + safezoneY";
        	w                  = "0.221734 * safezoneW";
        	h                  = "0.151222 * safezoneH";
        	colorBackground[]  = {0,0,0,0.5};
        };
        class NAME_TEXT: ANZUS_ctrlStatic {
        	idc                = 8000345;
        	text               = "";
        	x                  = "0.512 * safezoneW + safezoneX";
        	y                  = "0.49563 * safezoneH + safezoneY";
        	w                  = "0.161912 * safezoneW";
        	h                  = 0.022 * safezoneH;
        	colorBackground[]  = {0,0,0,0.4};
        };
        class TEXT_PRICE: NAME_TEXT {
            idc                = 8000346;
            text               = "";
            y                  = "0.541245 * safezoneH + safezoneY";
        };
        class TEXT_DESCRIPTION: NAME_TEXT {
            idc                = 8000347;
            text               = "";
            y                  = "0.518778 * safezoneH + safezoneY";
        };
        class EQUIPMENT_DESCRIPTION: ANZUS_ctrlStatic {
        	idc                = 8000350;
        	x                  = "0.451562 * safezoneW + safezoneX";
        	y                  = "0.564815 * safezoneH + safezoneY";
        	w                  = "0.22224 * safezoneW";
        	h                  = "0.1208 * safezoneH";
        	colorBackground[]  = {0,0,0,0.5};
        };
    };
};
