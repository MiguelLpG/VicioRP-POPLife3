/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_ContactsList {
   idd = 04200900;
   name = "TP_IphoneXI_ContactsList";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04200901;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04200902;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04200905;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class addContact : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_addContactMenu;";
           x = 0.648958333333333 * safezoneW + safezoneX;
           y = 0.334690581774917 * safezoneH + safezoneY;
           w = 0.0208333333333333 * safezoneW;
           h = 0.036007549985162 * safezoneH;
       };
       class removeContact : Life_RscButtonInvisibleIphoneXI
       {
           text = "";
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_removeContact;";
           x = 0.806770833333333 * safezoneW + safezoneX;
           y = 0.334690581774917 * safezoneH + safezoneY;
           w = 0.0208333333333333 * safezoneW;
           h = 0.036007549985162 * safezoneH;
       };
       class myNumber : Life_RscTextIphoneXI
       {
           idc = 04200903;
           x = 0.705208333333333 * safezoneW + safezoneX;
           y = 0.374 * safezoneH + safezoneY;
           h = 0.0214498525073746 * safezoneH;
           w = 0.123958333333334 * safezoneW;
       };
       class contatcsGroup : Life_RscControlsGroupNoScrollbars
       {
           idc = 04200904;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.401548672566372 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.488323500491642 * safezoneH;
           class controls {};
       };
       class callButton : Life_RscButtonInvisibleIphoneXI
       {
           text = "";
           idc = -1;
           onbuttonclick = "['call'] call the_programmer_iphone_xi_fnc_phone_contactListAction;";
           x = 0.721354166666667 * safezoneW + safezoneX;
           y = 0.899478859390363 * safezoneH + safezoneY;
           w = 0.0343749999999998 * safezoneW;
           h = 0.02 * safezoneH;
       };
       class resetcontact : Life_RscButtonInvisibleIphoneXI
       {
           text = "";
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_confirmResetContactMenu;";
           x = 0.653645833333333 * safezoneW + safezoneX;
           y = 0.899478859390363 * safezoneH + safezoneY;
           w = 0.0390625000000002 * safezoneW;
           h = 0.0316322517207474 * safezoneH;
       };
       class sendMessageButton : Life_RscButtonInvisibleIphoneXI
       {
           text = "";
           idc = -1;
           onbuttonclick = "['message'] call the_programmer_iphone_xi_fnc_phone_contactListAction;";
           x = 0.779166666666667 * safezoneW + safezoneX;
           y = 0.899478859390363 * safezoneH + safezoneY;
           w = 0.0463541666666667 * safezoneW;
           h = 0.0316322517207474 * safezoneH;
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