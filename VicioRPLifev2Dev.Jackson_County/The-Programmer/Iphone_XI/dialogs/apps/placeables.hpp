/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Placeables {
   idd = 04203700;
   name = "TP_IphoneXI_Placeables";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04203701;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04203702;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04203703;
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
           idc = 04203704;
           x = 0.658220833333333 * safezoneW + safezoneX;
           y = 0.405113077679449 * safezoneH + safezoneY;
           w = 0.162091666666667 * safezoneW;
           h = 0.332350049164209 * safezoneH;
       };
       class placeItem : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_apps_placeablePlace;";
           x = 0.704489499999999 * safezoneW + safezoneX;
           y = 0.744499211406096 * safezoneH + safezoneY;
           w = 0.0699896666666673 * safezoneW;
           h = 0.0381949872173055 * safezoneH;
       };
       class removeCursor : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "['1m'] spawn the_programmer_iphone_xi_fnc_apps_placeableRemove;";
           x = 0.653125 * safezoneW + safezoneX;
           y = 0.83594463913471 * safezoneH + safezoneY;
           w = 0.0520833333333333 * safezoneW;
           h = 0.0381949872173055 * safezoneH;
       };
       class removeNear : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "['5m'] spawn the_programmer_iphone_xi_fnc_apps_placeableRemove;";
           x = 0.7125 * safezoneW + safezoneX;
           y = 0.83594463913471 * safezoneH + safezoneY;
           w = 0.0520833333333333 * safezoneW;
           h = 0.0381949872173055 * safezoneH;
       };
       class removeAll : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "['all'] spawn the_programmer_iphone_xi_fnc_apps_placeableRemove;";
           x = 0.771875 * safezoneW + safezoneX;
           y = 0.83594463913471 * safezoneH + safezoneY;
           w = 0.0520833333333333 * safezoneW;
           h = 0.0381949872173055 * safezoneH;
       };
       class autoReopen : Life_Checkbox
       {
           idc = 04203705;
           tooltip = "";
           oncheckedchanged = "[(_this select 1)] call the_programmer_iphone_xi_fnc_apps_placeableCheckedChange;";
           x = 0.647 * safezoneW + safezoneX;
           y = 0.885742379547689 * safezoneH + safezoneY;
           w = 0.018 * safezoneW;
           h = 0.025 * safezoneH;
           colorfocused[] = {0,0,0,1};
           colorhover[] = {0,0,0,1};
           colorpressed[] = {0,0,0,1};
           tooltipcolorbox[] = {0,0,0,1};
           color[] = {0,0,0,1};
           colordisabled[] = {0,0,0,1};
           sizeex = 0.04;
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