/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_IncomingCall {
   idd = 04201600;
   name = "TP_IphoneXI_IncomingCall";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04201601;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04201602;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04201604;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class fromNumber : Life_RscStructuredText
       {
           idc = 04201603;
           x = 0.6640625 * safezoneW + safezoneX;
           y = 0.378746804326451 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.15 * safezoneW;
           text = "";
       };
       class takeCall : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.681354166666666 * safezoneW + safezoneX;
           y = 0.598835299901672 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.0638982300884955 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_phone_acceptCall;";
       };
       class refuseCall : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.757083333333333 * safezoneW + safezoneX;
           y = 0.598835299901672 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.0638982300884955 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_phone_refuseReceivedCall;";
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