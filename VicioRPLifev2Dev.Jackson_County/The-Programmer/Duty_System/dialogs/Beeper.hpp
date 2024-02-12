/*
    Author: Jean-Baptiste
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
class The_Programmer_Beeper_Menu {
   idd = 8001;
   name = "The_Programmer_Beeper_Menu";
   movingenable = false;
   enablesimulation = true;
   class controlsBackground {
          class Fond : Life_RscPicture {
           idc = 1000;
           text = "";
           x = 0.5515625 * safezoneW + safezoneX;
           y = 0.492354965585054 * safezoneH + safezoneY;
           w = 0.4 * safezoneW;
           h = 0.65 * safezoneH;
       };
   };
   class controls {
       class Envoyer : Life_RscButtonMenu {
           x = 0.622518 * safezoneW + safezoneX;
           y = 0.851581773844641 * safezoneH + safezoneY;
           w = 0.05 * safezoneW;
           h = 0.035 * safezoneH;
           idc = 8002;
           animtexturenormal = "";
           animtexturedisabled = "";
           animtextureover = "";
           animtexturefocused = "";
           animtexturepressed = "";
           animtexturedefault = "";
       };
       class Message : Life_RscEdit {
           x = 0.640104166666667 * safezoneW + safezoneX;
           y = 0.729262536873156 * safezoneH + safezoneY;
           h = 0.06 * safezoneH;
           w = 0.22 * safezoneW;
           colorbackground[] = {1,1,1,0};
           idc = 1005;
           text = "";
           colorText[] =  {0,0,0,1};
           style = "16 + 512";
           lineSpacing = 1;
           sizeEx = 0.05;
       };
   };
};
