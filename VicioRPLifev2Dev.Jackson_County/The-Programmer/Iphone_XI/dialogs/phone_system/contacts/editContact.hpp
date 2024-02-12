/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_EditContact {
   idd = 04203800;
   name = "TP_IphoneXI_EditContact";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04203801;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04203802;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
   };
   class controls
   {
       class nameEdit : Life_RscEditIphoneXI
       {
           idc = 04203803;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           x = 0.679687499999999 * safezoneW + safezoneX;
           y = 0.602143875776883 * safezoneH + safezoneY;
           w = 0.118750000000001 * safezoneW;
           h = 0.023237702668634 * safezoneH;
       };
       class numeroEdit : Life_RscEditIphoneXI
       {
           idc = 04203804;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           colorDisabled[] = {0,0,0,1};
           x = 0.679687499999999 * safezoneW + safezoneX;
           y = 0.658178226534906 * safezoneH + safezoneY;
           w = 0.118750000000001 * safezoneW;
           h = 0.023237702668634 * safezoneH;
       };
       class cancel : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "closeDialog 0;";
           x = 0.671676999999999 * safezoneW + safezoneX;
           y = 0.694198623402163 * safezoneH + safezoneY;
           w = 0.0671875 * safezoneW;
           h = 0.0373647984267453 * safezoneH;
       };
       class editContact : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_editContact;";
           x = 0.738541666666667 * safezoneW + safezoneX;
           y = 0.694198623402163 * safezoneH + safezoneY;
           w = 0.0671875 * safezoneW;
           h = 0.0373647984267453 * safezoneH;
       };
   };
};