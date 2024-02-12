/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_MessagesConversation {
   idd = 04203000;
   name = "TP_IphoneXI_MessagesConversation";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04203001;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04203002;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class callButton : Life_RscPicture
       {
           text = "";
           idc = 04203007;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04203009;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class conversationTitle : Life_RscStructuredText
       {
           idc = 04203003;
           text = "";
           x = 0.679166666666666 * safezoneW + safezoneX;
           y = 0.335299901671583 * safezoneH + safezoneY;
           h = 0.0324483775811212 * safezoneH;
           w = 0.123958333333334 * safezoneW;
       };
       class addContact : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04203010;
           text = "";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_addOrUpdateContact;";
           x = 0.8034375 * safezoneW + safezoneX;
           y = 0.335299901671583 * safezoneH + safezoneY;
           w = 0.0241666666666667 * safezoneW;
           h = 0.0324483775811212 * safezoneH;
       };
       class messagesGroup : Life_RscControlsGroupNoScrollbars
       {
           idc = 04203008;
           x = 0.650364333333333 * safezoneW + safezoneX;
           y = 0.377861553588987 * safezoneH + safezoneY;
           w = 0.176719 * safezoneW;
           h = 0.462846411012783 * safezoneH;
           class controls {};
       };
       class textEdit : Life_RscEdit
       {
           idc = 04203005;
           text = "";
           x = 0.659 * safezoneW + safezoneX;
           y = 0.85 * safezoneH + safezoneY;
           w = 0.16 * safezoneW;
           h = 0.025 * safezoneH;
           colorbackground[] = {1,1,1,1};
           colortext[] = {0,0,0,1};
           style = "16 + 512";
           linespacing = 1;
           shadow = 0;
           onkeyup = "[04203000] call the_programmer_iphone_xi_fnc_phone_onKeyUpMessage;";
       };
       class callPlayer : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04203006;
           text = "";
           onbuttonclick = "";
           x = 0.650364333333333 * safezoneW + safezoneX;
           y = 0.895231071779744 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.0270894788593905 * safezoneH;
       };
       class sendMessage : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_replyConversation;";
           x = 0.785260166666667 * safezoneW + safezoneX;
           y = 0.895231071779744 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.0270894788593905 * safezoneH;
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