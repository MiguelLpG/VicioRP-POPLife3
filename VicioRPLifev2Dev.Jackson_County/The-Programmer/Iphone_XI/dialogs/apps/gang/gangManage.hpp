/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_GangManage {
   idd = 04202700;
   name = "TP_IphoneXI_GangManage";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04202701;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 04202702;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04202705;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class gangMembersList : Life_RscListBoxIphoneXI
       {
           idc = 04202703;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0.7,0.04,0.04,1};
           x = 0.657916666666667 * safezoneW + safezoneX;
           y = 0.425191740412979 * safezoneH + safezoneY;
           w = 0.162395833333333 * safezoneW;
           h = 0.314237954768928 * safezoneH;
       };
       class othersPlayers : Life_RscComboIphoneXI
       {
           idc = 04202704;
           x = 0.662083333333333 * safezoneW + safezoneX;
           y = 0.760448377581121 * safezoneH + safezoneY;
           w = 0.0952083333333333 * safezoneW;
           h = 0.0232291052114056 * safezoneH;
           colorBackground[] = {0.12,0.12,0.12,1};
           colorText[] = {1,1,1,1};
       };
       class invitePlayer : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_apps_gangInvitePlayer;";
           x = 0.773125 * safezoneW + safezoneX;
           y = 0.755531956735497 * safezoneH + safezoneY;
           w = 0.0492708333333336 * safezoneW;
           h = 0.0340452310717798 * safezoneH;
       };
       class kickMember : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] call the_programmer_iphone_xi_fnc_apps_gangKick;";
           x = 0.6553125 * safezoneW + safezoneX;
           y = 0.813545722713864 * safezoneH + safezoneY;
           w = 0.0492708333333336 * safezoneW;
           h = 0.0340452310717798 * safezoneH;
       };
       class defineNewLeader : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_apps_gangNewLeader;";
           x = 0.773125 * safezoneW + safezoneX;
           y = 0.813545722713864 * safezoneH + safezoneY;
           w = 0.0492708333333336 * safezoneW;
           h = 0.0340452310717798 * safezoneH;
       };
       class upgradeGang : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] spawn life_fnc_gangUpgrade;";
           x = 0.6553125 * safezoneW + safezoneX;
           y = 0.857423795476893 * safezoneH + safezoneY;
           w = 0.063958333333333 * safezoneW;
           h = 0.0381317600786624 * safezoneH;
       };
       class disbandGang : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           text = "";
           onbuttonclick = "closeDialog 0; [] spawn life_fnc_gangDisband;";
           x = 0.759583333333333 * safezoneW + safezoneX;
           y = 0.857423795476893 * safezoneH + safezoneY;
           w = 0.063958333333333 * safezoneW;
           h = 0.0381317600786624 * safezoneH;
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