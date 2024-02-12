/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Masterpay {
   idd = 04201200;
   name = "TP_IphoneXI_Masterpay";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04201201;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04201202;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04201207;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class name : Life_RscStructuredText
       {
           idc = 04201203;
           x = 0.667466833333333 * safezoneW + safezoneX;
           y = 0.491417230088495 * safezoneH + safezoneY;
           w = 0.145554 * safezoneW;
           h = 0.03 * safezoneH;
       };
       class bank : Life_RscStructuredText
       {
           idc = 04201204;
           x = 0.667466833333333 * safezoneW + safezoneX;
           y = 0.551397564405113 * safezoneH + safezoneY;
           w = 0.129408166666667 * safezoneW;
           h = 0.03 * safezoneH;
       };
       class NearPlayers : Life_RscComboIphoneXI
       {
           idc = 04201205;
           x = 0.667466833333333 * safezoneW + safezoneX;
           y = 0.728819222222222 * safezoneH + safezoneY;
           w = 0.142429 * safezoneW;
           h = 0.0253597354965584 * safezoneH;
       };
       class moneyEdit : Life_RscEditIphoneXI
       {
           idc = 04201206;
           text = "1";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           x = 0.662704666666667 * safezoneW + safezoneX;
           y = 0.777 * safezoneH + safezoneY;
           w = 0.081566166666666 * safezoneW;
           h = 0.0332260088495571 * safezoneH;
       };
       class sendMoney : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           tooltip = "$STR_ATM_Transfer";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_transfer;";
           x = 0.776509 * safezoneW + safezoneX;
           y = 0.772083725663717 * safezoneH + safezoneY;
           w = 0.0362278 * safezoneW;
           h = 0.0332260088495571 * safezoneH;
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