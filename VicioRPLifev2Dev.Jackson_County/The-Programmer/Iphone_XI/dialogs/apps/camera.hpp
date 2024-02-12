/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Camera {
   idd = 04200400;
   name = "TP_IphoneXI_Camera";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04200401;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04200402;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
   };
   class controls
   {
       class liveCamera : Life_RscPicture
       {
           idc = 04200403;
           x = 0.652083333333333 * safezoneW + safezoneX;
           y = 0.352015732546706 * safezoneH + safezoneY;
           h = 0.467059980334317 * safezoneH;
           w = 0.177083333333333 * safezoneW;
           text = "";
       };
       class takePhoto : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.720416666666666 * safezoneW + safezoneX;
           y = 0.833824975417896 * safezoneH + safezoneY;
           w = 0.0384375000000002 * safezoneW;
           h = 0.0609636184857423 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_apps_takeSelfie;";
       };
       class closeMenu : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "(findDisplay 04200400) closeDisplay 0; [1] spawn the_programmer_iphone_xi_fnc_phone_init;";
           tooltip = "$STR_Global_Close";
           x = 0.704489499999999 * safezoneW + safezoneX;
           y = 0.943902610619469 * safezoneH + safezoneY;
           w = 0.0699896666666673 * safezoneW;
           h = 0.0147325909537858 * safezoneH;
       };
   };
};
