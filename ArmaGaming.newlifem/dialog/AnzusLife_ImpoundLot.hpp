class AnzusLife_ImpoundMenu {
   idd = 1562;
   name = "AnzusLife_ImpoundMenu";

   class controlsBackground
   {
       class AL_Background : Life_RscText
       {
           colorbackground[] = {0,0,0,0.7};
           x = 0.3046875 * safezoneW + safezoneX;
           y = 0.311701081612586 * safezoneH + safezoneY;
           w = 0.398958333333333 * safezoneW;
           h = 0.408062930186824 * safezoneH;
           idc = 1000;
       };
       class AL_TopBackground : Life_RscText
       {
           colorbackground[] = {0,0,0,0.8};
           x = 0.3046875 * safezoneW + safezoneX;
           y = 0.273352999016716 * safezoneH + safezoneY;
           w = 0.399479166666667 * safezoneW;
           h = 0.0396017699115048 * safezoneH;
           idc = 1001;
       };
       class AL_ImpoundBackground : Life_RscText
       {
           colorbackground[] = {0,0,0,0.5};
           x = 0.490625 * safezoneW + safezoneX;
           y = 0.324149459193707 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0406489675516225 * safezoneH;
           idc = 1004;
       };
       class AL_VehDescriptionTextBack : Life_RscText
       {
           colorbackground[] = {0,0,0,0.6};
           x = 0.490625 * safezoneW + safezoneX;
           y = 0.385176991150443 * safezoneH + safezoneY;
           w = 0.205729166666667 * safezoneW;
           h = 0.03468534906588 * safezoneH;
           idc = 1007;
       };
       class AL_VehDecriptionBackground : Life_RscText
       {
           colorbackground[] = {0,0,0,0.3};
           x = 0.490625 * safezoneW + safezoneX;
           y = 0.419591937069813 * safezoneH + safezoneY;
           w = 0.205729166666667 * safezoneW;
           h = 0.281489675516224 * safezoneH;
           idc = 1009;
       };
   };
   class controls
   {
       class AL_TopBarText : Life_RscText
       {
           x = 0.307291666666667 * safezoneW + safezoneX;
           y = 0.28023598820059 * safezoneH + safezoneY;
           h = 0.0337020648967554 * safezoneH;
           w = 0.396354166666667 * safezoneW;
           text = "Impound Lot - Impound Vehicle";
           idc = 1002;
       };
       class AL_VehicleList : Life_RscListBox
       {
           idc = 1500;
           w = 0.169270833333333 * safezoneW;
           h = 0.37693215339233 * safezoneH;
           x = 0.3109375 * safezoneW + safezoneX;
           y = 0.324149459193707 * safezoneH + safezoneY;
           sizeex = 0.035;
           onlbselchanged = "";
       };
       class AL_ImpoundPrice : Life_RscText
       {
           x = 0.493229166666667 * safezoneW + safezoneX;
           y = 0.330248279252704 * safezoneH + safezoneY;
           h = 0.0266838741396264 * safezoneH;
           w = 0.130208333333333 * safezoneW;
           font = PuristaSemiBold;
           text = "Impound Price:";
           idc = 1005;
       };
       class AL_ImpoundVehicle : Life_RscButtonMenu
       {
           text = "Impound";
           x = 0.635416666666667 * safezoneW + safezoneX;
           y = 0.324149459193707 * safezoneH + safezoneY;
           w = 0.0604166666666667 * safezoneW;
           h = 0.0406489675516225 * safezoneH;
           idc = 1512;
       };
       class AL_VehDescriptionText : Life_RscText
       {
           x = 0.493229166666667 * safezoneW + safezoneX;
           y = 0.389380530973451 * safezoneH + safezoneY;
           h = 0.0235988200589971 * safezoneH;
           w = 0.200520833333333 * safezoneW;
           font = PuristaSemiBold;
           text = "Vehicle Description";
           idc = 1008;
       };
       class AL_VehDescription : Life_RscStructuredText
       {
           x = 0.495833333333333 * safezoneW + safezoneX;
           y = 0.427927728613569 * safezoneH + safezoneY;
           h = 0.26135447394297 * safezoneH;
           w = 0.19375 * safezoneW;
           idc = 1010;
       };
   };
};