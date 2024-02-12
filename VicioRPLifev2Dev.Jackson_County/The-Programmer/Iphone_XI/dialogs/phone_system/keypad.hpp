/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_Keypad {
   idd = 04200700;
   name = "TP_IphoneXI_Keypad";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04200701;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04200702;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04200705;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class appelrestant : Life_RscStructuredText
       {
           idc = 04200703;
           colorbackground[] = {1,1,1,0};
           x = 0.664583333333333 * safezoneW + safezoneX;
           y = 0.34629842674533 * safezoneH + safezoneY;
           h = 0.03 * safezoneH;
           w = 0.15 * safezoneW;
       };
       class ecran : Life_RscEditIphoneXI
       {
           x = 0.652604166666666 * safezoneW + safezoneX;
           y = 0.389562930186825 * safezoneH + safezoneY;
           h = 0.05 * safezoneH;
           w = 0.173 * safezoneW;
           idc = 04200704;
           text = "";
           colortext[] = {0,0,0,1};
           sizeex = 0.06;
           onkeyup = "(ctrlParent (_this select 0)) setVariable [""compose_number"",(ctrlText 04200704)];";
       };
       class btn_1 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.66875 * safezoneW + safezoneX;
           y = 0.467075221238937 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""1""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_2 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.7209375 * safezoneW + safezoneX;
           y = 0.467075221238937 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""2""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_3 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.773541666666667 * safezoneW + safezoneX;
           y = 0.467075221238937 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""3""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_4 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.66875 * safezoneW + safezoneX;
           y = 0.560487217305801 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""4""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_5 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.7209375 * safezoneW + safezoneX;
           y = 0.560487217305801 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""5""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_6 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.773541666666667 * safezoneW + safezoneX;
           y = 0.560487217305801 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""6""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_7 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.66875 * safezoneW + safezoneX;
           y = 0.651932645034414 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""7""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_8 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.7209375 * safezoneW + safezoneX;
           y = 0.651932645034414 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""8""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_9 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.773541666666667 * safezoneW + safezoneX;
           y = 0.651932645034414 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""9""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_star : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.66875 * safezoneW + safezoneX;
           y = 0.752227630285152 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""*""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_0 : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.7209375 * safezoneW + safezoneX;
           y = 0.752227630285152 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""0""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class btn_diez : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.773541666666667 * safezoneW + safezoneX;
           y = 0.752227630285152 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[""#""] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
       };
       class contact : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.66875 * safezoneW + safezoneX;
           y = 0.845639626352015 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[true] spawn the_programmer_iphone_xi_fnc_phone_contactMenu;";
       };
       class call : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.7209375 * safezoneW + safezoneX;
           y = 0.845639626352015 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[((ctrlParent (_this select 0)) getVariable [""compose_number"",""""])] spawn max_phone_fnc_sendCall;";
       };
       class supprimer : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.773541666666667 * safezoneW + safezoneX;
           y = 0.845639626352015 * safezoneH + safezoneY;
           w = 0.038 * safezoneW;
           h = 0.06 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_phone_composeNumber;";
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