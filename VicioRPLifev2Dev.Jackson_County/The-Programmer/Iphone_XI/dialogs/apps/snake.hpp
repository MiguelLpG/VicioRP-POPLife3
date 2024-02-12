/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Snake {
   idd = 04203300;
   name = "TP_IphoneXI_Snake";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04203301;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04203302;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class PlayTable : Life_RscControlsGroupNoScrollbars
       {
           idc = 04203303;
           x = 0.664583333333333 * safezoneW + safezoneX;
           y = 0.543338249754178 * safezoneH + safezoneY;
           h = 0.31310226155359 * safezoneH;
           w = 0.1484375 * safezoneW;
       };
       class StartBackground : Life_RscPicture
       {
           text = "";
           idc = 04203307;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04203308;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class maxScore : Life_RscTextIphoneXI
       {
           idc = 04203304;
           text = "";
           x = 0.685851666666667 * safezoneW + safezoneX;
           y = 0.504 * safezoneH + safezoneY;
           w = 0.03 * safezoneW;
           h = 0.02 * safezoneH;
       };
       class currentScore : Life_RscTextIphoneXI
       {
           idc = 04203305;
           text = "";
           x = 0.785330833333334 * safezoneW + safezoneX;
           y = 0.504 * safezoneH + safezoneY;
           w = 0.03 * safezoneW;
           h = 0.02 * safezoneH;
       };
       class playButton : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04203306;
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_apps_startSnake;";
           x = 0.699479166666667 * safezoneW + safezoneX;
           y = 0.879005855457227 * safezoneH + safezoneY;
           w = 0.0786458333333333 * safezoneW;
           h = 0.0324985693215344 * safezoneH;
       };
       class closeMenu : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "closeDialog 0; [] spawn the_programmer_iphone_xi_fnc_phone_init;";
           tooltip = "$STR_Global_Close";
           x = 0.704489499999999 * safezoneW + safezoneX;
           y = 0.943902610619469 * safezoneH + safezoneY;
           w = 0.0699896666666673 * safezoneW;
           h = 0.0147325909537858 * safezoneH;
       };
   };
};