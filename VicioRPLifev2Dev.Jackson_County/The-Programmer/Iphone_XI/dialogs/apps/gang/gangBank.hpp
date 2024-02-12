/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_GangBank {
   idd = 04202600;
   name = "TP_IphoneXI_GangBank";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04202601;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04202602;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04202605;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class gangBank : Life_RscStructuredText
       {
           idc = 04202603;
           text = "";
           x = 0.658854166666667 * safezoneW + safezoneX;
           y = 0.505 * safezoneH + safezoneY;
           w = 0.126666666666667 * safezoneW;
           h = 0.04 * safezoneH;
       };
       class amount : Life_RscEditIphoneXI
       {
           idc = 04202604;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0.7,0.04,0.04,1};
           x = 0.658854166666667 * safezoneW + safezoneX;
           y = 0.675 * safezoneH + safezoneY;
           w = 0.139583333333333 * safezoneW;
           h = 0.03 * safezoneH;
       };
       class sendMoney : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_apps_gangDeposit;";
           x = 0.716989499999999 * safezoneW + safezoneX;
           y = 0.717950538839724 * safezoneH + safezoneY;
           w = 0.042906333333334 * safezoneW;
           h = 0.0352451347099315 * safezoneH;
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