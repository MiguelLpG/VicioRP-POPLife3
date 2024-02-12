/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_MarketMenu {
   idd = 04203500;
   name = "TP_IphoneXI_MarketMenu";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04203501;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04203502;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04203503;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class itemsList : Life_RscListBoxIphoneXI
       {
           idc = 04203504;
           text = "";
           x = 0.656875 * safezoneW + safezoneX;
           y = 0.384877089478859 * safezoneH + safezoneY;
           w = 0.1634375 * safezoneW;
           h = 0.435181907571288 * safezoneH;
           colortext[] = {1,1,1,1};
           colorselect[] = {1,1,1,1};
           colorselect2[] = {1,1,1,1};
       };
       class nextCalculFull : Life_RscStructuredText
       {
           idc = 04203505;
           text = "";
           x = 0.656875 * safezoneW + safezoneX;
           y = 0.858751229105211 * safezoneH + safezoneY;
           h = 0.0321042281219272 * safezoneH;
           w = 0.0695833333333333 * safezoneW;
       };
       class nextCalculLite : Life_RscStructuredText
       {
           idc = 04203507;
           text = "";
           x = 0.704489499999999 * safezoneW + safezoneX;
           y = 0.858751229105211 * safezoneH + safezoneY;
           h = 0.0321042281219272 * safezoneH;
           w = 0.0695833333333333 * safezoneW;
       };
       class nextEventFull : Life_RscStructuredText
       {
           idc = 04203506;
           text = "";
           x = 0.750729166666667 * safezoneW + safezoneX;
           y = 0.858751229105211 * safezoneH + safezoneY;
           h = 0.0321042281219272 * safezoneH;
           w = 0.0695833333333333 * safezoneW;
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