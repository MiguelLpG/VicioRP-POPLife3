/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_MarketDetails {
   idd = 04203600;
   name = "TP_IphoneXI_MarketDetails";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04203601;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04203602;
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
       class itemIcon : Life_RscPicture
       {
           text = "";
           idc = 04203603;
           x = 0.672604166666667 * safezoneW + safezoneX;
           y = 0.496598127015756 * safezoneH + safezoneY;
           w = 0.02 * safezoneW;
           h = 0.031425471804303 * safezoneH;
       };
       class itemName : Life_RscTextIphoneXI
       {
           idc = 04203604;
           text = "";
           x = 0.691 * safezoneW + safezoneX;
           y = 0.514257620452311 * safezoneH + safezoneY;
           h = 0.0173829891838741 * safezoneH;
           w = 0.0854166666666667 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class actualPrice : Life_RscTextIphoneXI
       {
           idc = 04203605;
           text = "";
           x = 0.7371875 * safezoneW + safezoneX;
           y = 0.551 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.06 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class priceTendance : Life_RscPicture
       {
           text = "";
           idc = 04203606;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class minimumPrice : Life_RscTextIphoneXI
       {
           idc = 04203607;
           text = "";
           x = 0.7371875 * safezoneW + safezoneX;
           y = 0.587 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.06 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class maximumPrice : Life_RscTextIphoneXI
       {
           idc = 04203608;
           text = "";
           x = 0.7371875 * safezoneW + safezoneX;
           y = 0.622 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.06 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class itemWeight : Life_RscTextIphoneXI
       {
           idc = 04203609;
           text = "";
           x = 0.7371875 * safezoneW + safezoneX;
           y = 0.658 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.06 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class numberItem : Life_RscTextIphoneXI
       {
           idc = 04203610;
           text = "";
           x = 0.7371875 * safezoneW + safezoneX;
           y = 0.694 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.06 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class currentProfit : Life_RscTextIphoneXI
       {
           idc = 04203611;
           text = "";
           x = 0.7371875 * safezoneW + safezoneX;
           y = 0.7297 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.06 * safezoneW;
           colortext[] = {0,0,0,1};
       };
       class maximumProfit : Life_RscTextIphoneXI
       {
           idc = 04203612;
           text = "";
           x = 0.7371875 * safezoneW + safezoneX;
           y = 0.765 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.06 * safezoneW;
           colortext[] = {0,0,0,1};
       };
   };
};