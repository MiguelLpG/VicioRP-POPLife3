/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Keys {
   idd = 04200300;
   name = "TP_IphoneXI_Keys";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04200301;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04200302;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04200305;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class vehiclesList : Life_RscListBoxIphoneXI
       {
           idc = 04200303;
           x = 0.658220833333333 * safezoneW + safezoneX;
           y = 0.405113077679449 * safezoneH + safezoneY;
           w = 0.162091666666667 * safezoneW;
           h = 0.378564405113078 * safezoneH;
       };
       class playersList : Life_RscComboIphoneXI
       {
           idc = 04200304;
           x = 0.658220833333333 * safezoneW + safezoneX;
           y = 0.812132588987217 * safezoneH + safezoneY;
           w = 0.162091666666667 * safezoneW;
           h = 0.0219906 * safezoneH;
       };
       class dropKey : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_keyDrop;";
           x = 0.749281166666666 * safezoneW + safezoneX;
           y = 0.850693901671583 * safezoneH + safezoneY;
           w = 0.0263845000000007 * safezoneW;
           h = 0.0381949872173055 * safezoneH;
       };
       class giveKey : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_keyGive;";
           x = 0.7015625 * safezoneW + safezoneX;
           y = 0.851677185840708 * safezoneH + safezoneY;
           w = 0.04375 * safezoneW;
           h = 0.0381949872173055 * safezoneH;
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