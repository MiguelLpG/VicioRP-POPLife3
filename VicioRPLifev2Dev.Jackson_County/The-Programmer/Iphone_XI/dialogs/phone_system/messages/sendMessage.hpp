/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_SendMessage {
   idd = 04202800;
   name = "TP_IphoneXI_SendMessage";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04202801;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04202802;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class adminAllPicture : Life_RscPicture
       {
           idc = 04202807;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04202808;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class toAdminButton : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "['admin'] call the_programmer_iphone_xi_fnc_phone_sendMessage;";
           x = 0.80625 * safezoneW + safezoneX;
           y = 0.3317904339567 * safezoneH + safezoneY;
           w = 0.0213541666666669 * safezoneW;
           h = 0.0379244136342539 * safezoneH;
       };
       class playersList : Life_RscComboIphoneXI
       {
           idc = 04202803;
           x = 0.705531166666666 * safezoneW + safezoneX;
           y = 0.389106166175024 * safezoneH + safezoneY;
           w = 0.117906333333334 * safezoneW;
           h = 0.0268230373647989 * safezoneH;
       };
       class numberEdit : Life_RscEditIphoneXI
       {
           idc = 04202804;
           text = "";
           colortext[] = {0,0,0,1};
           x = 0.711458333333333 * safezoneW + safezoneX;
           y = 0.392056018682399 * safezoneH + safezoneY;
           w = 0.105729166666667 * safezoneW;
           h = 0.0219906 * safezoneH;
       };
       class textEdit : Life_RscEdit
       {
           idc = 04202805;
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
           onkeyup = "[04202800] call the_programmer_iphone_xi_fnc_phone_onKeyUpMessage;";
       };
       class adminAllButton : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04202806;
           onbuttonclick = "";
           x = 0.6515625 * safezoneW + safezoneX;
           y = 0.899929869223206 * safezoneH + safezoneY;
           w = 0.043125 * safezoneW;
           h = 0.0243572497541787 * safezoneH;
       };
       class sendMessage : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_sendMessage;";
           x = 0.785309833333333 * safezoneW + safezoneX;
           y = 0.899929869223206 * safezoneH + safezoneY;
           w = 0.0412526666666667 * safezoneW;
           h = 0.0243572497541787 * safezoneH;
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