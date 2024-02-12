/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Locked_Menu {
   idd = 04200100;
   name = "TP_IphoneXI_Locked_Menu";
   movingenable = 1;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04200101;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class IphoneBackground : Life_RscPicture
       {
           text = "";
           idc = 04200102;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04200103;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
   };
   class controls
   {
       class Heure : Life_RscStructuredText
       {
           idc = 04200104;
           text = "";
           x = 0.689583333333333 * safezoneW + safezoneX;
           y = 0.380816125860374 * safezoneH + safezoneY;
           h = 0.05 * safezoneH;
           w = 0.1 * safezoneW;
       };
       class currentDate : Life_RscStructuredText
       {
           idc = 04200105;
           x = 0.6796875 * safezoneW + safezoneX;
           y = 0.43 * safezoneH + safezoneY;
           h = 0.035 * safezoneH;
           w = 0.12 * safezoneW;
       };
       class unlock : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "closeDialog 0; TP_IphoneXI_Locked = false; [1] spawn the_programmer_iphone_xi_fnc_phone_init;";
           x = 0.639385333333332 * safezoneW + safezoneX;
           y = 0.43952802359882 * safezoneH + safezoneY;
           w = 0.2 * safezoneW;
           h = 0.431661750245821 * safezoneH;
       };
       class call : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04200106;
           text = "";
           onbuttonclick = "";
           x = 0.6625 * safezoneW + safezoneX;
           y = 0.885447394296952 * safezoneH + safezoneY;
           w = 0.0255208333333333 * safezoneW;
           h = 0.0417895771878073 * safezoneH;
       };
       class camera : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_apps_camera;";
           x = 0.787760416666667 * safezoneW + safezoneX;
           y = 0.885447394296952 * safezoneH + safezoneY;
           w = 0.0255208333333333 * safezoneW;
           h = 0.0417895771878073 * safezoneH;
       };
   };
};
