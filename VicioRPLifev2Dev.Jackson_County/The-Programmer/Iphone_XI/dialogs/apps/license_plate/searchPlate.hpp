/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_SearchPlate {
   idd = 04201300;
   name = "TP_IphoneXI_SearchPlate";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04201301;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04201302;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
   };
   class controls
   {
       class searchValue : Life_RscEditIphoneXI
       {
           idc = 04201303;
           text = "";
           colortext[] = {0,0,0,1};
           colorbackground[] = {1,1,1,0};
           x = 0.6796875 * safezoneW + safezoneX;
           y = 0.637217305801377 * safezoneH + safezoneY;
           w = 0.11875 * safezoneW;
           h = 0.0245329400196655 * safezoneH;
       };
       class cancel : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "closeDialog 0;";
           x = 0.6721875 * safezoneW + safezoneX;
           y = 0.676923177319532 * safezoneH + safezoneY;
           w = 0.067083333333334 * safezoneW;
           h = 0.0369411294651289 * safezoneH;
       };
       class searchButton : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_apps_searchPlate;";
           x = 0.739166666666666 * safezoneW + safezoneX;
           y = 0.676923177319532 * safezoneH + safezoneY;
           w = 0.067083333333334 * safezoneW;
           h = 0.0369411294651289 * safezoneH;
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