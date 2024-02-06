class AnzusLife_Progress {
    name = "AnzusLife_Progress";
    idd = 8999220;
    fadein=0;
    duration = 99999999999;
    fadeout=0;
    movingEnable = 0;
    onLoad="uiNamespace setVariable ['AnzusLife_Progress',_this select 0]";
    objects[]={};

    class ControlsBackground {};

    class controls {
        class ProgressGroup: ANZUS_ctrlControlsGroupNoScrollbars {
            idc = 1;
            x   = (((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5) * (pixelW * pixelGrid * 0.50));
            y   = ((safezoneY + safezoneH) - (17 * (pixelH * pixelGrid * 0.50)) - (7 * (pixelH * pixelGrid * 0.50)) - (2 * (pixelH * pixelGrid * 0.50)));
            w   = 140 * (pixelW * pixelGrid * 0.50);
            h   = 7 * (pixelH * pixelGrid * 0.50);
            class controls {
                class TextBackground: ANZUS_ctrlStatic {
                    idc               = -1;
                    x                 = 0;
                    y                 = 0;
                    w                 = 140 * (pixelW * pixelGrid * 0.50);
                    h                 = (7 * (pixelH * pixelGrid * 0.50)) - (2 * (pixelH * pixelGrid * 0.50));
                    colorBackground[] = {0.15, 0.15, 0.15, 1};
                };
                class Text: ANZUS_ctrlStructuredText {
                    idc               = 2;
                    x                 = 0;
                    y                 = 0.5 * (pixelH * pixelGrid * 0.50);
                    w                 = 140 * (pixelW * pixelGrid * 0.50);
                    h                 = (7 * (pixelH * pixelGrid * 0.50)) - (2 * (pixelH * pixelGrid * 0.50));
                    class Attributes {
                        size = 1 * (pixelH * pixelGrid * 0.50);
                    };
                };
                class ProgressBackground: ANZUS_ctrlStatic {
                    idc               = 4;
                    x                 = 0;
                    y                 = (7 * (pixelH * pixelGrid * 0.50)) - (2 * (pixelH * pixelGrid * 0.50));
                    w                 = 140 * (pixelW * pixelGrid * 0.50);
                    h                 = 2 * (pixelH * pixelGrid * 0.50);
                    colorBackground[] = {0.2, 0.2, 0.2, 0.9};
                };
                class ProgressBackgroundStriped: ANZUS_ctrlStaticBackgroundDisableTiles {
                    idc               = -1;
                    x                 = 0;
                    y                 = (7 * (pixelH * pixelGrid * 0.50)) - (2 * (pixelH * pixelGrid * 0.50));
                    w                 = 140 * (pixelW * pixelGrid * 0.50);
                    h                 = 2 * (pixelH * pixelGrid * 0.50);
                };
                class Progress: ANZUS_ctrlProgress {
                    idc               = 3;
                    x                 = 0;
                    y                 = (7 * (pixelH * pixelGrid * 0.50)) - (2 * (pixelH * pixelGrid * 0.50));
                    w                 = 140 * (pixelW * pixelGrid * 0.50);
                    h                 = 2 * (pixelH * pixelGrid * 0.50);
                    colorBar[]        = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","1"};
                    colorFrame[]      = {0, 0, 0, 0};
                    onLoad            = "(_this select 0) progressSetPosition 0.7";
                };
            };
        };
    };
};

class life_timer {
    name = "life_timer";
    idd = 38300;
    fadeIn = 1;
    duration = 99999999999;
    fadeout = 1;
    movingEnable = 0;
    onLoad = "uiNamespace setVariable ['life_timer',_this select 0]";
    objects[] = {};

    class controlsBackground {
        class TimerIcon: life_RscPicture {
            idc = -1;
            text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.04;
            h = 0.045;
        };

        class TimerText: Life_RscText {
            colorBackground[] = {0,0,0,0};
            idc = 38301;
            text = "";
            x = 0.0204688 * safezoneW + safezoneX;
            y = 0.2778 * safezoneH + safezoneY;
            w = 0.09125 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};