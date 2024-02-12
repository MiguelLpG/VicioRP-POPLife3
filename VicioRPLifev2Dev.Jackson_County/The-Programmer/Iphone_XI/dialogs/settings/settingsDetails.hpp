/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_SettingsDetails {
   idd = 04202100;
   name = "TP_IphoneXI_SettingsDetails";
   movingenable = 1;
   enablesimulation = 1;
   onload = "";
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04202101;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04202102;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class wallpapersGroup : Life_RscControlsGroupNoScrollbarsIphoneXI
       {
           idc = 04202104;
           x = 0.6555 * safezoneW + safezoneX;
           y = 0.394862340216322 * safezoneH + safezoneY;
           h = 0.5 * safezoneH;
           w = 0.175 * safezoneW;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04202105;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class soundsList : Life_RscListBoxIphoneXI
       {
           idc = 04202103;
           w = 0.175 * safezoneW;
           h = 0.525 * safezoneH;
           x = 0.6515625 * safezoneW + safezoneX;
           y = 0.382163225172075 * safezoneH + safezoneY;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           sizeex = 0.045;
           colorselect[] = {0,0,0,1};
           colorselect2[] = {0,0,0,1};
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