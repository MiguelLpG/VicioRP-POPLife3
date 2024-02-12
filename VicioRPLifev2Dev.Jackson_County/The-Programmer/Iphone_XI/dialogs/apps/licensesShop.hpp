/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_LicensesShop {
   idd = 04202200;
   name = "TP_IphoneXI_LicensesShop";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04202201;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04202202;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04202205;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class listbox : Life_RscListBoxIphoneXI
       {
           idc = 04202203;
           x = 0.658854166666667 * safezoneW + safezoneX;
           y = 0.404228121927237 * safezoneH + safezoneY;
           w = 0.1609375 * safezoneW;
           h = 0.336184857423796 * safezoneH;
       };
       class buybutton : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04202204;
           x = 0.715947833333333 * safezoneW + safezoneX;
           y = 0.749498525073746 * safezoneH + safezoneY;
           w = 0.0473958333333333 * safezoneW;
           h = 0.032212389380531 * safezoneH;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_buyLicense;";
       };
       class licenses : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "closeDialog 0; [] spawn the_programmer_iphone_xi_fnc_apps_license;";
           x = 0.715947833333333 * safezoneW + safezoneX;
           y = 0.874156297935103 * safezoneH + safezoneY;
           w = 0.0449896666666673 * safezoneW;
           h = 0.0353815585054082 * safezoneH;
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