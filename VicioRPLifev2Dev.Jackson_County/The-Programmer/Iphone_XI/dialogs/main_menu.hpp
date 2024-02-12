/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Home_Page {
   idd = 04200000;
   name = "TP_IphoneXI_Home_Page";
   movingenable = 1;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04200001;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class IphoneBackground : Life_RscPicture
       {
           text = "";
           idc = 04200002;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04200003;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class pagesPointsFirst : Life_RscPicture
       {
           text = "";
           idc = 04200008;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class pagesPointsSecond : Life_RscPicture
       {
           text = "";
           idc = 04200009;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class ButtonsPlace : Life_RscControlsGroupNoScrollbars
       {
           idc = 04200004;
           x = 0.6546875 * safezoneW + safezoneX;
           y = 0.335 * safezoneH + safezoneY;
           h = 0.542733529990167 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class ButtonsNavBar : Life_RscControlsGroupNoScrollbars
       {
           idc = 04200007;
           x = 0.663541666666667 * safezoneW + safezoneX;
           y = 0.871964110127827 * safezoneH + safezoneY;
           h = 0.0759218289085549 * safezoneH;
           w = 0.1515625 * safezoneW;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04200011;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class pageChange : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04200010;
           onbuttonclick = "";
           x = 0.7202135 * safezoneW + safezoneX;
           y = 0.849557522123894 * safezoneH + safezoneY;
           w = 0.0417656666666671 * safezoneW;
           h = 0.0226155358898722 * safezoneH;
       };
       class closeMenu : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "closeDialog 0;";
           tooltip = "$STR_Global_Close";
           x = 0.704489499999999 * safezoneW + safezoneX;
           y = 0.943902610619469 * safezoneH + safezoneY;
           w = 0.0699896666666673 * safezoneW;
           h = 0.0147325909537858 * safezoneH;
       };
   };
};