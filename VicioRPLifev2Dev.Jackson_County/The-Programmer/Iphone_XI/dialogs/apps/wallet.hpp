/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Wallet {
   idd = 04201100;
   name = "TP_IphoneXI_Wallet";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04201101;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04201102;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04201107;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class money : Life_RscStructuredText
       {
           idc = 04201104;
           x = 0.654966833333333 * safezoneW + safezoneX;
           y = 0.413 * safezoneH + safezoneY;
           w = 0.129408166666667 * safezoneW;
           h = 0.048405778761062 * safezoneH;
       };
       class nearPlayers : Life_RscComboIphoneXI
       {
           idc = 04201105;
           x = 0.658612666666666 * safezoneW + safezoneX;
           y = 0.62557438446411 * safezoneH + safezoneY;
           w = 0.114304 * safezoneW;
           h = 0.0273263038348081 * safezoneH;
       };
       class moneyEdit : Life_RscEditIphoneXI
       {
           idc = 04201106;
           text = "1";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           x = 0.654966833333333 * safezoneW + safezoneX;
           y = 0.58 * safezoneH + safezoneY;
           w = 0.142949833333334 * safezoneW;
           h = 0.0332260088495571 * safezoneH;
       };
       class sendMoney : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           tooltip = "$STR_Global_Give";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_sendMoney;";
           x = 0.782238166666667 * safezoneW + safezoneX;
           y = 0.619674679449361 * safezoneH + safezoneY;
           w = 0.0411993333333334 * safezoneW;
           h = 0.0371591455260569 * safezoneH;
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