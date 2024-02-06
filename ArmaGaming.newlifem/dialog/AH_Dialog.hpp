#define GUI_GRID_X  (0)
#define GUI_GRID_Y  (0)
#define GUI_GRID_W  (0.025)
#define GUI_GRID_H  (0.04)
#define GUI_GRID_WAbs   (1)
#define GUI_GRID_HAbs   (1)


class RscEdit_AH: RscEdit {
    style=16;
    autocomplete="scripting";
};

class RscListBox_AH: RscListbox {
    type = 5;
    style = 0;
    border = false;
    borderSize = 0;

    class ScrollBar
    {
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
    };
    class ListScrollBar: ScrollBar
    {
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
        shadow = 0;
    };
};


class AH_Menu {
    idd = 6971;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Background: IGUIBack
        {
            idc = 2200;

            x = -18.1 * GUI_GRID_W + GUI_GRID_X;
            y = -7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 79 * GUI_GRID_W;
            h = 41 * GUI_GRID_H;
        };
        class thingy1: RscStructuredText
        {
            idc = 2401;

            text = "Bantah V4";
            x = -18.1 * GUI_GRID_W + GUI_GRID_X;
            y = -9 * GUI_GRID_H + GUI_GRID_Y;
            w = 79 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
    };

    class controls {
        class Mainbutton: RscButton
        {
            colorFocused[] = {0.71,0.125,0.251,1};

            text = "Main";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = -7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorActive[] = {0.71,0.125,0.251,1};
        };
        class LeftListbox: RscListBox_AH
        {
            idc = 1500;

            x = -18.1 * GUI_GRID_W + GUI_GRID_X;
            y = -7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 18.5 * GUI_GRID_W;
            h = 38.5 * GUI_GRID_H;
        };
        class MainListbox: RscListBox_AH
        {
            idc = 1501;

            x = 1.4 * GUI_GRID_W + GUI_GRID_X;
            y = -7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 32 * GUI_GRID_H;
        };
        class RightListbox: RscListBox_AH
        {
            idc = 1502;

            x = 40.9 * GUI_GRID_W + GUI_GRID_X;
            y = -7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20 * GUI_GRID_W;
            h = 38.5 * GUI_GRID_H;
        };
        class RightSearch: RscEdit
        {
            idc = 1401;

            x = 41 * GUI_GRID_W + GUI_GRID_X;
            y = 31.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 19.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class LeftSearch: RscEdit
        {
            idc = 1400;

            x = -17.8 * GUI_GRID_W + GUI_GRID_X;
            y = 31.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 17.8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class MainEdit: RscEdit
        {
            idc = 1402;
            x = 1.4 * GUI_GRID_W + GUI_GRID_X;
            y = 25 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 5.99999 * GUI_GRID_H;
            colorText[] = {0.71,0.125,0.251,1};
            //colorBackground[] = {0.71,0.125,0.251,1};
            //colorActive[] = {0.71,0.125,0.251,1};
        };
        class Togglebutton: RscButton
        {
            colorFocused[] = {0.71,0.125,0.251,1};

            text = "Toggles";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = -5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class MainBtn: RscButton
        {
            idc = 1817;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Main Menu";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = -5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class PlayersBtn: RscButton
        {
            idc = 1816;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Player List";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = -3.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class AdminLogsBtn: RscButton
        {
            idc = 1815;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Admin Logs";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = -1.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class HackerLogsBtn: RscButton
        {
            idc = 1814;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Hacker Logs";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 1.95 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class WeaponsBtn: RscButton
        {
            idc = 1813;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Weapons";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2.05 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class VehiclesBtn: RscButton
        {
            idc = 1812;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Vehicles";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class VItemsBtn: RscButton
        {
            idc = 1811;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "V-Items";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class BackpacksBtn: RscButton
        {
            idc = 1810;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Backpacks";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class LoadoutsBtn: RscButton
        {
            idc = 1809;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Loadouts";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 1.95 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class DeathLogsBtn: RscButton
        {
            idc = 1808;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Death Logs";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class ViewerBtn: RscButton
        {
            idc = 1807;
            colorFocused[] = {0.71,0.125,0.251,1};
            text = "Variable Viewer";
            x = -27 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.71,0.125,0.251,1};
        };
        class ExecBtn: RscButton
        {
            idc = 1805;
            text = "Execute";
            x = 1.4 * GUI_GRID_W + GUI_GRID_X;
            y = 31.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 12 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class MsgEveryBtn: RscButton
        {
            idc = 1804;
            text = "Message Everyone";
            x = 14.9 * GUI_GRID_W + GUI_GRID_X;
            y = 31.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 12 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class MsgTargetBtn: RscButton
        {
            idc = 1801; 
            text = "Message Target";
            x = 28.4 * GUI_GRID_W + GUI_GRID_X;
            y = 31.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 12 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
    };
};

class AH_LagSwitch
{
	idd = 6970;
	movingEnabled = false;
	enableSimulation = true;

	 class controlsBackground {
	    class RscText_1004: RscText
		{
			idc = -1;
			x = -28 * GUI_GRID_W + GUI_GRID_X;
			y = -10 * GUI_GRID_H + GUI_GRID_Y;
			w = 96 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1005: RscText
		{
			idc = -1;
			x = -28 * GUI_GRID_W + GUI_GRID_X;
			y = 34 * GUI_GRID_H + GUI_GRID_Y;
			w = 96 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1006: RscText
		{
			idc = -1;
			x = -28 * GUI_GRID_W + GUI_GRID_X;
			y = -9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.5 * GUI_GRID_W;
			h = 43 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1007: RscText
		{
			idc = -1;
			x = 66.46 * GUI_GRID_W + GUI_GRID_X;
			y = -9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.5 * GUI_GRID_W;
			h = 43 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1008: RscText
		{
			idc = -1;
			x = -26.32 * GUI_GRID_W + GUI_GRID_X;
			y = -8.88 * GUI_GRID_H + GUI_GRID_Y;
			w = 92.6061 * GUI_GRID_W;
			h = 42.7096 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.2};
		};
	};

	class controls {
		
		class RscText_1000: RscText
		{
			idc = -1;
			text = "LAGSWITCH DETECTION";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = -7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorText[] = {135,3,3,1};
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			idc = -1;
			text = "NETWORK LAG DETECTED";
			x = 8 * GUI_GRID_W + GUI_GRID_X;
			y = 29 * GUI_GRID_H + GUI_GRID_Y;
			w = 24.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorText[] = {135,3,3,1};
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1002: RscText
		{
			idc = -1;
			text = "IF YOU ARE EXPERIENCING THESE INTERRUPTIONS, CHECK YOUR CONNECTION";
			x = -14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 69.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorText[] = {135,3,3,1};
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1003: RscStructuredText
		{
			idc = -1;
			text = "IF YOU BELIEVE THIS IS A SERVER SIDE ISSUE, PLEASE REPORT THIS TO OUR SUPPORT TEAM";
			x = -14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 69.5 * GUI_GRID_W;
			h = 7.5 * GUI_GRID_H;
			colorText[] = {135,3,3,1};
			sizeEx = 1.2 * GUI_GRID_H;
            class Attributes {
                align = "center";
            };
		};
	};
};


class AH_ExecMenu
{
    idd=6969;
    movingEnable = false;
    
    class controlsBackground {
        class Background: RscText
        {
            idc = 1000;

            x = 0.187042 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.598125 * safezoneW;
            h = 0.473 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.7};
        };
        class WatchBackground: RscText
        {
            idc = 1000;

            x = 0.187532 * safezoneW + safezoneX;
            y = 0.6782 * safezoneH + safezoneY;
            w = 0.597604 * safezoneW;
            h = 0.22 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.7};
        };
    };

    class controls {
        class ScriptEdit: RscEdit_AH
        {
            idc = 1399;

            x = 0.195781 * safezoneW + safezoneX;
            y = 0.1986 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.377704 * safezoneH;
        };
        class PlayerList: RscListBox_AH
        {
            idc = 1500;

            x = 0.620178 * safezoneW + safezoneX;
            y = 0.203 * safezoneH + safezoneY;
            w = 0.156198 * safezoneW;
            h = 0.342444 * safezoneH;
        };
        class ExecPlayer: RscButton
        {
            idc = 1600;

            text = "Execute on Player";
            x = 0.617563 * safezoneW + safezoneX;
            y = 0.589156 * safezoneH + safezoneY;
            w = 0.16349 * safezoneW;
            h = 0.0384444 * safezoneH;
        };
        class ExecLocal: RscButton
        {
            idc = 1601;

            text = "Execute (Local)";
            x = 0.223618 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class ExecGloal: RscButton
        {
            idc = 1602;

            text = "Execute (Global)";
            x = 0.342209 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class ExecServer: RscButton
        {
            idc = 1603;

            text = "Execute (Server)";
            x = 0.464928 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class PlayerSearch: RscEdit
        {
            idc = 1400;

            x = 0.618594 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.162969 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class ScriptNext: RscButton
        {
            idc = 1604;

            text = ">";
            x = 0.588135 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.0191146 * safezoneW;
            h = 0.0430741 * safezoneH;
        };
        class WatchTitleBackground: RscText
        {
            idc = 1000;

            x = 0.187011 * safezoneW + safezoneX;
            y = 0.654 * safezoneH + safezoneY;
            w = 0.598125 * safezoneW;
            h = 0.0238519 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.9};
        };
        class WatchTitle: RscText
        {
            idc = 1003;
            text = "Watch Statements";
            x = 0.188562 * safezoneW + safezoneX;
            y = 0.6518 * safezoneH + safezoneY;
            w = 0.0865625 * safezoneW;
            h = 0.0272222 * safezoneH;
        };
        class ExecutorTopBackground: RscText
        {
            idc = 1000;

            x = 0.187021 * safezoneW + safezoneX;
            y = 0.156222 * safezoneH + safezoneY;
            w = 0.598125 * safezoneW;
            h = 0.0238519 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.9};
        };
        class ExecutorText: RscText
        {
            idc = 1005;
            text = "Executor Menu";
            x = 0.187531 * safezoneW + safezoneX;
            y = 0.1546 * safezoneH + safezoneY;
            w = 0.0865625 * safezoneW;
            h = 0.0272222 * safezoneH;
        };
        class Watch1: RscEdit_AH
        {
            idc = 1401;

            x = 0.195781 * safezoneW + safezoneX;
            y = 0.6936 * safezoneH + safezoneY;
            w = 0.546562 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {-1,-1,-1,1};
        };
        class Watch1Result: RscEdit_AH
        {
            idc = 1402;

            x = 0.195781 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.546562 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.4};
        };
        class Watch1Toggle: RscCheckbox
        {
            idc = 2800;
            x = 0.752656 * safezoneW + safezoneX;
            y = 0.6914 * safezoneH + safezoneY;
            w = 0.0141668 * safezoneW;
            h = 0.0262963 * safezoneH;
        };
        class Watch2: RscEdit_AH
        {
            idc = 1403;

            x = 0.195781 * safezoneW + safezoneX;
            y = 0.7596 * safezoneH + safezoneY;
            w = 0.546562 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {-1,-1,-1,1};
        };
        class Watch2Result: RscEdit_AH
        {
            idc = 1404;

            x = 0.195781 * safezoneW + safezoneX;
            y = 0.786 * safezoneH + safezoneY;
            w = 0.546562 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.4};
        };
        class Watch2Toggle: RscCheckbox
        {
            idc = 2801;
            x = 0.752656 * safezoneW + safezoneX;
            y = 0.7552 * safezoneH + safezoneY;
            w = 0.0141668 * safezoneW;
            h = 0.0262963 * safezoneH;
        };
        class Watch3: RscEdit_AH
        {
            idc = 1405;

            x = 0.195781 * safezoneW + safezoneX;
            y = 0.83 * safezoneH + safezoneY;
            w = 0.546562 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {-1,-1,-1,1};
        };
        class Watch3Result: RscEdit_AH
        {
            idc = 1406;

            x = 0.195781 * safezoneW + safezoneX;
            y = 0.8564 * safezoneH + safezoneY;
            w = 0.546562 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.4};
        };
        class Watch3Toggle: RscCheckbox
        {
            idc = 2802;
            x = 0.75472 * safezoneW + safezoneX;
            y = 0.8256 * safezoneH + safezoneY;
            w = 0.0141668 * safezoneW;
            h = 0.0262963 * safezoneH;
        };
        class ScriptPrevious: RscButton
        {
            idc = 1605;
            text = "<";
            x = 0.195781 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.0191146 * safezoneW;
            h = 0.0430741 * safezoneH;
        };
    };
};