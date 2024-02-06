class AnzusLife_JailHud {
    idd          = 102012;
    duration     = 10e10;
    name         = "AnzusLife_JailHud";
    movingEnable = 0;
    onLoad = "uiNamespace setVariable ['AnzusLife_JailHud',_this select 0]";

    class controlsBackground {
        class Background: ANZUS_ctrlStatic {
            x = ((safezoneX + (safezoneW * 0.5)) - ((100 * 0.5) * (pixelW * pixelGrid * 0.50)));
            y = (((safezoneY + safezoneH) - (1.5 * (pixelH * pixelGrid * 0.50))) - (265 * (pixelH * pixelGrid * 0.50)));
            w = 100 * (pixelW * pixelGrid * 0.50);
            h = 19.5 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0.1, 0.1, 0.1, 0.5};
        };
    };
    class controls {
        class Title: ANZUS_ctrlStatic {
            idc         = 20;
            text        = "";
            x           = ((safezoneX + (safezoneW * 0.5)) - ((100 * 0.5) * (pixelW * pixelGrid * 0.50)));
            y           = (((safezoneY + safezoneH) - (1.5 * (pixelH * pixelGrid * 0.50))) - (270 * (pixelH * pixelGrid * 0.50)));
            w           = 100 * (pixelW * pixelGrid * 0.50);
            h           = 20 * (pixelH * pixelGrid * 0.50);
            font        = "RobotoCondensedBold";
            style       = 0x02;
            colorText[] = {0.8,0.01,0,1};
        };
        class Reason: ANZUS_ctrlStatic {
            idc     = 21;
            text    = "";
            x       = ((safezoneX + (safezoneW * 0.5)) - ((100 * 0.5) * (pixelW * pixelGrid * 0.50)));
            y       = (((safezoneY + safezoneH) - (1.5 * (pixelH * pixelGrid * 0.50))) - (270 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 1.8) + ((1.5 * (pixelH * pixelGrid * 0.50)) * 1);
            w       = 100 * (pixelW * pixelGrid * 0.50);
            h       = 10 * (pixelH * pixelGrid * 0.50);
            style   = 0x02;
        };
        class TimeLeft: ANZUS_ctrlStatic {
            idc     = 22;
            text    = "";
            x       = ((safezoneX + (safezoneW * 0.5)) - ((100 * 0.5) * (pixelW * pixelGrid * 0.50)));
            y       = (((safezoneY + safezoneH) - (1.5 * (pixelH * pixelGrid * 0.50))) - (270 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2.6) + ((1.5 * (pixelH * pixelGrid * 0.50)) * 2);
            w       = 100 * (pixelW * pixelGrid * 0.50);
            h       = 10 * (pixelH * pixelGrid * 0.50);
            style   = 0x02;
        };
    };
};