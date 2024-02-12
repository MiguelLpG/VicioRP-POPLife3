/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_GangMenu {
   idd = 04202400;
   name = "TP_IphoneXI_GangMenu";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04202401;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04202402;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04202404;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class gangName : Life_RscStructuredText
       {
           idc = 04202403;
           text = "";
           w = 0.166979166666667 * safezoneW;
           h = 0.0340216322517214 * safezoneH;
           x = 0.658541666666667 * safezoneW + safezoneX;
           y = 0.570698131760078 * safezoneH + safezoneY;
       };
       class gangMembers : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04202405;
           onbuttonclick = "[true] call the_programmer_iphone_xi_fnc_apps_openGangMembersMenu;";
           x = 0.687301999999999 * safezoneW + safezoneX;
           y = 0.641254373647984 * safezoneH + safezoneY;
           w = 0.0390625 * safezoneW;
           h = 0.0647436597836773 * safezoneH;
       };
       class gangBank : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04202406;
           onbuttonclick = "[true] call the_programmer_iphone_xi_fnc_apps_openGangBankMenu;";
           x = 0.7515625 * safezoneW + safezoneX;
           y = 0.641254373647984 * safezoneH + safezoneY;
           w = 0.0390625 * safezoneW;
           h = 0.0647436597836773 * safezoneH;
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