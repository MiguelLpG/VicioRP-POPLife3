/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_ResultPlate {
   idd = 04201400;
   name = "TP_IphoneXI_ResultPlate";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04201401;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04201402;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
   };
   class controls
   {
       class closePopup : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "closeDialog 0;";
           tooltip = "$STR_Global_Close";
           x = 0.785317666666666 * safezoneW + safezoneX;
           y = 0.496598127015756 * safezoneH + safezoneY;
           w = 0.0188490000000004 * safezoneW;
           h = 0.031425471804303 * safezoneH;
       };
       class owner : Life_RscTextIphoneXI
       {
           idc = 04201403;
           text = "";
           x = 0.72 * safezoneW + safezoneX;
           y = 0.55 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.09 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class plate : Life_RscTextIphoneXI
       {
           idc = 04201404;
           text = "";
           x = 0.72 * safezoneW + safezoneX;
           y = 0.587 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.09 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class model : Life_RscTextIphoneXI
       {
           idc = 04201405;
           text = "";
           x = 0.72 * safezoneW + safezoneX;
           y = 0.622 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.09 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class color : Life_RscTextIphoneXI
       {
           idc = 04201406;
           text = "";
           x = 0.72 * safezoneW + safezoneX;
           y = 0.658 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.09 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class side : Life_RscTextIphoneXI
       {
           idc = 04201407;
           text = "";
           x = 0.72 * safezoneW + safezoneX;
           y = 0.693 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.09 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class type : Life_RscTextIphoneXI
       {
           idc = 04201408;
           text = "";
           x = 0.72 * safezoneW + safezoneX;
           y = 0.73 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.09 * safezoneW;
           colortext[] = {0,0,0,1};
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