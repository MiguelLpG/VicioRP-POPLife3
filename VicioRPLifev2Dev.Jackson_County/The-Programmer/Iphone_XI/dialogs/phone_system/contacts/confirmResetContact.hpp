/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_ContactsConfirmReset {
   idd = 04203100;
   name = "TP_IphoneXI_ContactsConfirmReset";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04203101;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04203102;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
   };
   class controls
   {
       class cancelReset : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "closeDialog 0;";
           x = 0.671354166666667 * safezoneW + safezoneX;
           y = 0.664090778431751 * safezoneH + safezoneY;
           w = 0.0682291666666667 * safezoneW;
           h = 0.0369908341542865 * safezoneH;
       };
       class confirmReset : Life_RscButtonInvisibleIphoneXI
       {
           text = "";
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_phone_resetContact; closeDialog 0; [] call the_programmer_iphone_xi_fnc_phone_contactMenu;";
           x = 0.740104166666666 * safezoneW + safezoneX;
           y = 0.664090778431751 * safezoneH + safezoneY;
           w = 0.0661458333333336 * safezoneW;
           h = 0.0369908341542865 * safezoneH;
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