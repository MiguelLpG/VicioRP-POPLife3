/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_CallsHistory {
   idd = 04203200;
   name = "TP_IphoneXI_CallsHistory";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04203201;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04203202;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04203204;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class deleteButton : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_deleteCall;";
           x = 0.807135166666667 * safezoneW + safezoneX;
           y = 0.336725663716814 * safezoneH + safezoneY;
           w = 0.0189065000000001 * safezoneW;
           h = 0.0300393313667652 * safezoneH;
       };
       class callsGroup : Life_RscControlsGroupNoScrollbars
       {
           idc = 04203203;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.375 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.508077482792527 * safezoneH;
           class controls {};
       };
       class sendCall : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_sendCall;";
           x = 0.650364333333333 * safezoneW + safezoneX;
           y = 0.895231071779744 * safezoneH + safezoneY;
           w = 0.0407815000000001 * safezoneW;
           h = 0.0192232055063917 * safezoneH;
       };
       class sendMessage : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_sendMessageToSelectedCall;";
           x = 0.776041666666667 * safezoneW + safezoneX;
           y = 0.895231071779744 * safezoneH + safezoneY;
           w = 0.0494791666666664 * safezoneW;
           h = 0.0349557522123898 * safezoneH;
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