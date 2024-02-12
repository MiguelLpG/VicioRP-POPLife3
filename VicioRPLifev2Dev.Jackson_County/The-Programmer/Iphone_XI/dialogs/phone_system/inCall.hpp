/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_InCall {
   idd = 04201700;
   name = "TP_IphoneXI_InCall";
   movingenable = 0;
   enablesimulation = 1;
   onload = "[] spawn the_programmer_iphone_xi_fnc_inCallIphone;";
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04201701;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04201702;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04201706;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class fromNumber : Life_RscStructuredText
       {
           idc = 04201703;
           x = 0.664583333333333 * safezoneW + safezoneX;
           y = 0.379730088495576 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.15 * safezoneW;
           text = "";
       };
       class timeCall : Life_RscStructuredText
       {
           idc = 04201704;
           x = 0.704489499999999 * safezoneW + safezoneX;
           y = 0.442959685349065 * safezoneH + safezoneY;
           h = 0.02 * safezoneH;
           w = 0.07 * safezoneW;
           text = "";
       };
       class addToCall : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04201705;
           x = 0.720312500000001 * safezoneW + safezoneX;
           y = 0.595885447394297 * safezoneH + safezoneY;
           h = 0.0648815142576204 * safezoneH;
           w = 0.0375 * safezoneW;
           tooltip = "";
           onbuttonclick = "";
       };
       class stopCall : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.720312500000001 * safezoneW + safezoneX;
           y = 0.804341691248771 * safezoneH + safezoneY;
           w = 0.0375 * safezoneW;
           h = 0.0648815142576204 * safezoneH;
           idc = 04201707;
           text = "";
           onbuttonclick = "";
       };
       class closeMenu : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "closeDialog 0; [2] spawn the_programmer_iphone_xi_fnc_phone_init;";
           tooltip = "$STR_Global_Close";
           x = 0.704489499999999 * safezoneW + safezoneX;
           y = 0.943902610619469 * safezoneH + safezoneY;
           w = 0.0699896666666673 * safezoneW;
           h = 0.0147325909537858 * safezoneH;
       };
   };
};