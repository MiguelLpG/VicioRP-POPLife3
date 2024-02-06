class AnzusLife_GangProgressPicker {
	idd = 21540;
	name="AnzusLife_GangProgressPicker";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class AL_TopBar: Life_RscText
		{
			idc = 1200;
			x = 0.350468 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class AL_TopBackground: Life_RscText
		{
			idc = 1201;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class AL_TopBarText: Life_RscText
		{
			idc = 1000;
			text = "Gang Progress Picker";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class controls {
		class AL_RoleText: Life_RscText
		{
			idc = 1001;
			text = "What role what you like your gang to pursue?";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AL_MafiaButton: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Mafia";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.269167 * safezoneW;
			h = 0.0312593 * safezoneH;
		};
		class AL_CartelButton: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Cartel";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.269167 * safezoneW;
			h = 0.0312593 * safezoneH;
		};
		class AL_CloseButton: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Close";
			onButtonClick = "closeDialog 0";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class AnzusLife_GangProgressTree {
    idd = 21541;
    name= "AnzusLife_GangProgressTree";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Header: ANZUS_ctrlStaticHeader {
            idc = 32;
            text = "Gang Progress Tree";
            x    = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y    = (0.440 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50));
            w    = 160 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Background: ANZUS_ctrlStaticBackground {
            x = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y = (0.440 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50));
            w = 160 * (pixelW * pixelGrid * 0.50);
            h = (100 * (pixelH * pixelGrid * 0.50)) - (5 * (pixelH * pixelGrid * 0.50));
        };
        class TaskProgressBarBackground: ANZUS_ctrlStatic {
            x                 = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + ((2 * (pixelH * pixelGrid * 0.50)) / 2);
            w                 = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h                 = 5 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 0.2};
        };
        class TaskListTopBackground: ANZUS_ctrlStatic {
            x                 = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + (2 * (pixelH * pixelGrid * 0.50 / 2));
            w                 = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h                 = 5 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 1};
        };
        class InstructionsTopBackground: TaskListTopBackground {
            x = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.415 - (90 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (2 * (pixelH * pixelGrid * 0.50));
        };

        class InstructionsBackground: TaskListTopBackground {
            x                 = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.415 - (90 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (2 * (pixelH * pixelGrid * 0.50));
            h                 = (90 / 1.32) * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 0.5};
        };
    };
    class controls {
        class TasksTitle: ANZUS_ctrlStatic {
            idc  = 232321 + 1;
            text = "Tasks";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y    = ((0.456 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
            w    = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class TasksList: ANZUS_ctrlListBox {
            idc = 37;
            x   = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y   = ((0.376 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50));
            w   = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h   = (100 / 1.34) * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0,0,0,0.5};
            colorShadow[] = {0,0,0,0};
            itemSpacing = 0.01;
        };
        class StatusTitle: TasksTitle {
            idc  = 48;
            text = "Status:";
            x    = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y    = ((0.456 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
        };
        class InformationTitle: TasksTitle {
            idc  = 49;
            text = "Information:";
            x    = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y    = ((0.530 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
        };
        class StatusProgressBar: ANZUS_ctrlProgress {
            idc = 42;
            x            = (((((getResolution select 2) * 0.5 * pixelW) - (500 * 0.5) * (pixelW * pixelGrid * 0.50)) + (500 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((500 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y            = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + ((2 * (pixelH * pixelGrid * 0.50)) / 2);
            w            = ((160 / 2.7) * (pixelW * pixelGrid * 0.50));
            h            = 5 * (pixelH * pixelGrid * 0.50);
            colorBar[]   = {0.3, 0.3, 0.3, 1};
            colorFrame[] = {0, 0, 0, 0};
        };
        class StatusProgressBarText: ANZUS_ctrlStatic {
            idc = 43;
            text  = "100%";
            x   = (((((getResolution select 2) * 0.5 * pixelW) - (500 * 0.5) * (pixelW * pixelGrid * 0.50)) + (500 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((500 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y     = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + ((2 * (pixelH * pixelGrid * 0.50)) / 2);
            w     = ((160 / 2.7) * (pixelW * pixelGrid * 0.50));
            h     = 5 * (pixelH * pixelGrid * 0.50);
            style = 0x02;
        };

        class InstructionsText: ANZUS_RscStructuredText {
            idc               = 33;
            x                 = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.455 - (90 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (2 * (pixelH * pixelGrid * 0.50));
            w                 = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h                 = (90 / 1.32) * (pixelH * pixelGrid * 0.50);
            colorText[] = {1, 1, 1, 1};
        };

        class Footer: ANZUS_ctrlControlsGroupNoScrollbars {
            idc = 46;
            x   = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y   = (0.400 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + ((100 * (pixelH * pixelGrid * 0.50)) - (5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50));
            w   = 160 * (pixelW * pixelGrid * 0.50);
            h   = 5 * (pixelH * pixelGrid * 0.50);
            class controls {
                class Background: ANZUS_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
            };
        };
        class ButtonClose: ANZUS_ctrlButtonClose {
            x = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (5 * (pixelW * pixelGrid * 0.50));
            y = (0.440 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50));
            w = 5 * (pixelW * pixelGrid * 0.50);
            h = 5 * (pixelH * pixelGrid * 0.50);
        };
    };
};