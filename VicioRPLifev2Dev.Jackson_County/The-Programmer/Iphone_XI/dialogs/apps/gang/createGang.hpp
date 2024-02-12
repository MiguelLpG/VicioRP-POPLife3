/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_CreateGang {
   idd = 04202300;
   name = "TP_IphoneXI_CreateGang";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04202301;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04202302;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04202305;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class gangName : Life_RscEditIphoneXI
       {
           idc = 04202303;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {1,1,1,1};
           x = 0.6580625 * safezoneW + safezoneX;
           y = 0.65 * safezoneH + safezoneY;
           w = 0.1606875 * safezoneW;
           h = 0.03 * safezoneH;
       };
       class createGangButton : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_createGang;";
           x = 0.719479166666666 * safezoneW + safezoneX;
           y = 0.692182890855457 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.0354473942969522 * safezoneH;
       };
       class gangPriceInfo : Life_RscStructuredText
       {
           idc = 04202304;
           text = "";
           x = 0.666916666666667 * safezoneW + safezoneX;
           y = 0.74 * safezoneH + safezoneY;
           w = 0.15 * safezoneW;
           h = 0.14 * safezoneH;
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