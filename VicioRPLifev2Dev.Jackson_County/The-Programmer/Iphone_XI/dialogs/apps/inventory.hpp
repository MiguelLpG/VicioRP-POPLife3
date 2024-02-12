/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Inventory {
   idd = 04201500;
   name = "TP_IphoneXI_Inventory";
   movingenable = 1;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04201501;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04201502;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04201507;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class weight : Life_RscTextIphoneXI
       {
           idc = 04201503;
           text = "";
           colortext[] = {0.445,0.39,0.32,1};
           sizeex = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
           x = 0.685 * safezoneW + safezoneX;
           y = 0.41 * safezoneH + safezoneY;
           w = 0.0266483333333333 * safezoneW;
           h = 0.02 * safezoneH;
       };
       class itemsList : Life_RscListBoxIphoneXI
       {
           idc = 2005;
           colorbackground[] = {1,1,1,0};
           x = 0.659275833333334 * safezoneW + safezoneX;
           y = 0.43952802359882 * safezoneH + safezoneY;
           w = 0.160515833333333 * safezoneW;
           h = 0.298918387413962 * safezoneH;
       };
       class useItem : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] call life_fnc_useItem;";
           x = 0.701364499999999 * safezoneW + safezoneX;
           y = 0.74845154965585 * safezoneH + safezoneY;
           w = 0.0447916666666669 * safezoneW;
           h = 0.03 * safezoneH;
       };
       class remoteItem : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_removeItem;";
           x = 0.753125 * safezoneW + safezoneX;
           y = 0.74845154965585 * safezoneH + safezoneY;
           w = 0.0203125 * safezoneW;
           h = 0.03 * safezoneH;
       };
       class nearPlayers : Life_RscComboIphoneXI
       {
           idc = 04201505;
           x = 0.659275833333334 * safezoneW + safezoneX;
           y = 0.81 * safezoneH + safezoneY;
           w = 0.160515833333333 * safezoneW;
           h = 0.0258579547689281 * safezoneH;
       };
       class quantity : Life_RscEditIphoneXI
       {
           idc = 04201506;
           text = "1";
           colortext[] = {0,0,0,1};
           colorbackground[] = {1,1,1,0};
           x = 0.654080833333333 * safezoneW + safezoneX;
           y = 0.857 * safezoneH + safezoneY;
           w = 0.123523333333333 * safezoneW;
           h = 0.0347075122910525 * safezoneH;
       };
       class giveItem : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_giveItem;";
           x = 0.783623833333333 * safezoneW + safezoneX;
           y = 0.852214808259587 * safezoneH + safezoneY;
           w = 0.0413761666666669 * safezoneW;
           h = 0.0347075122910525 * safezoneH;
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