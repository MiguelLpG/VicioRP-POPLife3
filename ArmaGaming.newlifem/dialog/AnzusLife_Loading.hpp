class AnzusLife_Loading {
    idd = 999210;
    name = "AnzusLife_Loading";
    movingEnable = 1;
    enableSimulation = 0;
    enableDisplay = 1;

    class Controls {
        class ProgressBarBackground: ANZUS_ctrlStatic {
            idc               = 11;
            x                 = safezoneX;
            y                 = safezoneY + safezoneH - (3 * (pixelH * pixelGrid * 0.50));
            w                 = safezoneW;
            h                 = 3 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0.2, 0.2, 0.2, 0.9};
        };
        class ChangelogTitle : ANZUS_ctrlStaticHeader
        {
          idc = 15;
          x = safeZoneX + safeZoneW * 0.26875;
          y = safeZoneY + safeZoneH * 0.15111112;
          w = safeZoneW * 0.4625;
          h = safeZoneH * 0.03444445;
          style = 0+2;
          text = "¡Bienvenido a Classic Project!";
          colorText[] = {1,1,1,1};
          sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.25);
          colorBackground[] = {0,0.306,1,0.7};
        };
        class ProgressBarBackgroundStriped: ANZUS_ctrlStaticBackgroundDisableTiles {
            idc = 12;
            x   = safezoneX;
            y   = safezoneY + safezoneH - (3 * (pixelH * pixelGrid * 0.50));
            w   = safezoneW;
            h   = 3 * (pixelH * pixelGrid * 0.50);
        };
        class ProgressBar: ANZUS_ctrlProgress {
            idc    = 13;
            x      = safezoneX;
            y      = safezoneY + safezoneH - (3 * (pixelH * pixelGrid * 0.50));
            w      = safezoneW;
            h      = 3 * (pixelH * pixelGrid * 0.50);
        };
        class InitStateText: ANZUS_ctrlStatic {
            idc    = 14;
            text   = "CARGANDO INFORMACIÓN...";
            sizeEx = "11 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
            x      = safezoneX + (2 * (pixelW * pixelGrid * 0.50));
            y      = "(safezoneY + safezoneH) - (11 * (1 / (getResolution select 3)) * pixelGrid * 0.5) - (5 * (pixelH * pixelGrid * 0.50))";
            h      = "11 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
            w      = safezoneW;
            shadow = 0.6;
            font   = "RobotoCondensedBold";
        };
        class ChangelogBack : ANZUS_ctrlStaticBackground
        {
          idc = 16;
          x = safeZoneX + safeZoneW * 0.26875;
          y = safeZoneY + safeZoneH * 0.18555556;
          w = safeZoneW * 0.4625;
          h = safeZoneH * 0.58888889;
          sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
          colorBackground[] = {0.2, 0.2, 0.2, 0.7};
        };
        class ChangelogText : ANZUS_ctrlStructuredText
        {
          idc = 17;
          x = safeZoneX + safeZoneW * 0.271875;
          y = safeZoneY + safeZoneH * 0.19;
          w = safeZoneW * 0.456875;
          h = safeZoneH * 0.57777778;
          text = "";
          colorText[] = {0.2,0.9529,0.2353,1};
          sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
          colorBackground[] = {0, 0, 0, 0.2};
        };
        class ChangelogBottom : ANZUS_ctrlStructuredText
        {
          idc = 18;
          x = safeZoneX + safeZoneW * 0.271875;
          y = safeZoneY + safeZoneH * 0.73444445;
          w = safeZoneW * 0.456875;
          h = safeZoneH * 0.03333334;
          colorText[] = {0.2,0.9529,0.2353,1};
    			text = "<t font='RobotoCondensedBold' size='1.75' align='center'>Check out our Discord for our latest infomation.</t>";
    			colorBackground[] = {0.2,0.2,0.2,0};
    			font = "PuristaMedium";
    			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.6);
        };
    };
};
