/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class TP_IphoneXI_SettingsFull {
   idd = 04201800;
   name = "TP_IphoneXI_SettingsFull";
   movingenable = 1;
   enablesimulation = 1;
   class controlsBackground
   {
       class IphoneColor : Life_RscPicture
       {
           idc = 04201801;
           text = "";
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class MenuBackground : Life_RscPicture
       {
           text = "";
           idc = 4201802;
           x = 0.634062 * safezoneW + safezoneX;
           y = 0.28 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
       class CurrentHour : Life_RscStructuredText
       {
           idc = 04201811;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.308 * safezoneH + safezoneY;
           h = 0.015 * safezoneH;
           w = 0.035 * safezoneW;
       };
   };
   class controls
   {
       class color : Life_RscButtonInvisibleIphoneXI
       {
           idc = 04201813;
           onbuttonclick = "['colors'] call the_programmer_iphone_xi_fnc_settings_settingsDetailsMenu;";
           tooltip = "Color";
           x = 0.6546875 * safezoneW + safezoneX;
           y = 0.339733016224189 * safezoneH + safezoneY;
           w = 0.0131198333333337 * safezoneW;
           h = 0.0270319788593904 * safezoneH;
       };
       class reboots : Life_RscButtonInvisibleIphoneXI
       {
           idc = -1;
           onbuttonclick = "[] spawn the_programmer_iphone_xi_fnc_settings_rebootMenu;";
           tooltip = "Reboots";
           x = 0.809375 * safezoneW + safezoneX;
           y = 0.339733016224189 * safezoneH + safezoneY;
           w = 0.0193698333333337 * safezoneW;
           h = 0.0270319788593904 * safezoneH;
       };
       class callsSound : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.6484375 * safezoneW + safezoneX;
           y = 0.397304487708948 * safezoneH + safezoneY;
           w = 0.181770833333333 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           idc = -1;
           onbuttonclick = "['calls'] call the_programmer_iphone_xi_fnc_settings_settingsDetailsMenu;";
       };
       class messagesSound : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.6484375 * safezoneW + safezoneX;
           y = 0.426803012782694 * safezoneH + safezoneY;
           w = 0.181770833333333 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           idc = -1;
           onbuttonclick = "['messages'] call the_programmer_iphone_xi_fnc_settings_settingsDetailsMenu;";
       };
       class muteSounds : Life_Checkbox
       {
           idc = 04201803;
           x = 0.719791666666667 * safezoneW + safezoneX;
           y = 0.46 * safezoneH + safezoneY;
           w = 0.018 * safezoneW;
           h = 0.025 * safezoneH;
           sizeex = 0.04;
           colorfocused[] = {0,0,0,1};
           colorhover[] = {0,0,0,1};
           colorpressed[] = {0,0,0,1};
           tooltipcolorbox[] = {0,0,0,1};
           color[] = {0,0,0,1};
           colordisabled[] = {0,0,0,1};
           oncheckedchanged = "['mute',_this] call the_programmer_iphone_xi_fnc_settings_settingsLbChanged;";
       };
       class airplaneMode : Life_Checkbox
       {
           idc = 04201812;
           tooltip = "";
           oncheckedchanged = "['planemode',(_this select 1),04201800] call the_programmer_iphone_xi_fnc_settings_settingsCheckedChange;";
           x = 0.740625 * safezoneW + safezoneX;
           y = 0.46 * safezoneH + safezoneY;
           w = 0.018 * safezoneW;
           h = 0.025 * safezoneH;
           colorfocused[] = {0,0,0,1};
           colorhover[] = {0,0,0,1};
           colorpressed[] = {0,0,0,1};
           tooltipcolorbox[] = {0,0,0,1};
           color[] = {0,0,0,1};
           colordisabled[] = {0,0,0,1};
           sizeex = 0.04;
       };
       class footVDistance : Life_RscEditIphoneXI
       {
           idc = 04201804;
           text = "";
           onkeyup = "[(_this select 0),'ground','full'] call the_programmer_iphone_xi_fnc_settings_settingsKeyUP;";
           x = 0.78 * safezoneW + safezoneX;
           y = 0.512300884955752 * safezoneH + safezoneY;
           w = 0.07 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           colortext[] = {0,0,0,1};
       };
       class carVDistance : Life_RscEditIphoneXI
       {
           idc = 04201805;
           text = "";
           onkeyup = "[(_this select 0),'vehicle','full'] call the_programmer_iphone_xi_fnc_settings_settingsKeyUP;";
           x = 0.78 * safezoneW + safezoneX;
           y = 0.543077679449361 * safezoneH + safezoneY;
           w = 0.07 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           colortext[] = {0,0,0,1};
       };
       class airVDistance : Life_RscEditIphoneXI
       {
           idc = 04201806;
           text = "";
           onkeyup = "[(_this select 0),'air','full'] call the_programmer_iphone_xi_fnc_settings_settingsKeyUP;";
           x = 0.78 * safezoneW + safezoneX;
           y = 0.572536873156341 * safezoneH + safezoneY;
           w = 0.07 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           colortext[] = {0,0,0,1};
       };
       class grassNo : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.6484375 * safezoneW + safezoneX;
           y = 0.628584070796461 * safezoneH + safezoneY;
           w = 0.181770833333333 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           idc = -1;
           onbuttonclick = "setTerrainGrid 50; hint (['STR_CHANGE_GRASS_NO','The_Programmer_IphoneXI','IphoneXI_Localization'] call theprogrammer_core_fnc_localize);";
       };
       class grassLow : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.6484375 * safezoneW + safezoneX;
           y = 0.658858076696165 * safezoneH + safezoneY;
           w = 0.181770833333333 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           idc = -1;
           onbuttonclick = "setTerrainGrid 30; hint (['STR_CHANGE_GRASS_LOW','The_Programmer_IphoneXI','IphoneXI_Localization'] call theprogrammer_core_fnc_localize);";
       };
       class grassNormal : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.6484375 * safezoneW + safezoneX;
           y = 0.688356601769912 * safezoneH + safezoneY;
           w = 0.181770833333333 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           idc = -1;
           onbuttonclick = "setTerrainGrid 12.5; hint (['STR_CHANGE_GRASS_NORMAL','The_Programmer_IphoneXI','IphoneXI_Localization'] call theprogrammer_core_fnc_localize);";
       };
       class grassHight : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.6484375 * safezoneW + safezoneX;
           y = 0.717855126843658 * safezoneH + safezoneY;
           w = 0.181770833333333 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           idc = -1;
           onbuttonclick = "setTerrainGrid 3.125; hint (['STR_CHANGE_GRASS_HIGHT','The_Programmer_IphoneXI','IphoneXI_Localization'] call theprogrammer_core_fnc_localize);";
       };
       class sideChat : Life_Checkbox
       {
           idc = 04201807;
           tooltip = "$STR_GUI_SideSwitch";
           oncheckedchanged = "['sidechat',(_this select 1)] call the_programmer_iphone_xi_fnc_settings_settingsCheckedChange;";
           x = 0.81 * safezoneW + safezoneX;
           y = 0.775 * safezoneH + safezoneY;
           w = 0.018 * safezoneW;
           h = 0.025 * safezoneH;
           colorfocused[] = {0,0,0,1};
           colorhover[] = {0,0,0,1};
           colorpressed[] = {0,0,0,1};
           tooltipcolorbox[] = {0,0,0,1};
           color[] = {0,0,0,1};
           colordisabled[] = {0,0,0,1};
           sizeex = 0.04;
       };
       class revealPlayers : Life_Checkbox
       {
           idc = 04201808;
           tooltip = "$STR_GUI_PlayerReveal";
           oncheckedchanged = "['objects',(_this select 1)] call the_programmer_iphone_xi_fnc_settings_settingsCheckedChange;";
           x = 0.81 * safezoneW + safezoneX;
           y = 0.805 * safezoneH + safezoneY;
           w = 0.018 * safezoneW;
           h = 0.025 * safezoneH;
           colorfocused[] = {0,0,0,1};
           colorhover[] = {0,0,0,1};
           colorpressed[] = {0,0,0,1};
           tooltipcolorbox[] = {0,0,0,1};
           color[] = {0,0,0,1};
           colordisabled[] = {0,0,0,1};
           sizeex = 0.04;
       };
       class broadcast : Life_Checkbox
       {
           idc = 04201809;
           tooltip = "$STR_GUI_BroadcastSwitch";
           oncheckedchanged = "['broadcast',(_this select 1)] call the_programmer_iphone_xi_fnc_settings_settingsCheckedChange;";
           x = 0.81 * safezoneW + safezoneX;
           y = 0.835 * safezoneH + safezoneY;
           w = 0.018 * safezoneW;
           h = 0.025 * safezoneH;
           colorfocused[] = {0,0,0,1};
           colorhover[] = {0,0,0,1};
           colorpressed[] = {0,0,0,1};
           tooltipcolorbox[] = {0,0,0,1};
           color[] = {0,0,0,1};
           colordisabled[] = {0,0,0,1};
           sizeex = 0.04;
       };
       class playersTags : Life_Checkbox
       {
           tooltip = "$STR_GUI_PlayTags";
           idc = 04201810;
           oncheckedchanged = "['tags',(_this select 1)] call the_programmer_iphone_xi_fnc_settings_settingsCheckedChange;";
           x = 0.81 * safezoneW + safezoneX;
           y = 0.865 * safezoneH + safezoneY;
           w = 0.018 * safezoneW;
           h = 0.025 * safezoneH;
           colorfocused[] = {0,0,0,1};
           colorhover[] = {0,0,0,1};
           colorpressed[] = {0,0,0,1};
           tooltipcolorbox[] = {0,0,0,1};
           color[] = {0,0,0,1};
           colordisabled[] = {0,0,0,1};
       };
       class wallPapers : Life_RscButtonInvisibleIphoneXI
       {
           x = 0.6484375 * safezoneW + safezoneX;
           y = 0.894110127826942 * safezoneH + safezoneY;
           w = 0.181770833333333 * safezoneW;
           h = 0.0284575575221236 * safezoneH;
           idc = -1;
           onbuttonclick = "['wallpapers'] call the_programmer_iphone_xi_fnc_settings_settingsDetailsMenu;";
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