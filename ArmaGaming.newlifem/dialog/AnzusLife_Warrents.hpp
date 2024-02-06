class AnzusLife_Warrents {
    idd = 8005001;
    name = "AnzusLife_Warrents";
    movingEnable = 1;
    enableSimulation = 0;
    enableDisplay = 1;

    class ControlsBackground {
        class Header: ANZUS_ctrlStaticHeader {
            text = "Warrants Database";
            x    = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y    = (0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50));
            w    = 160 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Background: ANZUS_ctrlStaticBackground {
            x = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y = (0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50));
            w = 160 * (pixelW * pixelGrid * 0.50);
            h = (100 * (pixelH * pixelGrid * 0.50)) - (5 * (pixelH * pixelGrid * 0.50)) - ((5 + 2) * (pixelH * pixelGrid * 0.50));
        };
        class FilterBackground: ANZUS_ctrlStatic {
            x                 = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50));
            w                 = (160 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h                 = 5 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 1};
        };
        class ListBackground: ANZUS_ctrlStaticContent {
            x                 = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (1.5 * (pixelH * pixelGrid * 0.50));
            w                 = (160 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h                 = (100 * 0.73) * (pixelH * pixelGrid * 0.50);
        };
    };
    class Controls {
        class Search: ANZUS_ctrlEdit {
            idc = 22;
            x   = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
            w   = (100 / 2.5) * (pixelW * pixelGrid * 0.50);
            h   = 5 * (pixelH * pixelGrid * 0.50);
        };
        class ButtonSearch: ANZUS_ctrlButtonSearch {
            idc = 32;
            x   = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + ((100 / 2.5) * (pixelW * pixelGrid * 0.50)) + (0.85 * (pixelW * pixelGrid * 0.50));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
        };
        class Filter: ANZUS_ctrlListNBox {
            idc             = 40;
            x               = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y               = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50));
            w               = (160 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h               = 5 * (pixelH * pixelGrid * 0.50);
            disableOverflow = 1;
            columns[]       = {0, 0.15, 0.38, 0.6};
            class Items {
                class WarrantID {
                    text  = "Warrant ID";
                    value = 0;
                };
                class Name: WarrantID {
                    text = "Suspects Name";
                };
                class Crime: WarrantID {
                    text = "Crime";
                };
                class Date: WarrantID {
                    text = "Issuing Date and Time";
                };
            };
        };
        class List: Filter {
            idc             = 60;
            x               = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y               = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (1.5 * (pixelH * pixelGrid * 0.50));
            w               = (160 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h               = (100 * 0.73) * (pixelH * pixelGrid * 0.50);
            class Items {};
        };
        class GroupFooter: ANZUS_ctrlControlsGroupNoScrollbars {
            idc = 43;
            x   = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y   = (0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (100 * (pixelH * pixelGrid * 0.50)) - ((5 + 2) * (pixelH * pixelGrid * 0.50));
            h   = (5 + 2) * (pixelH * pixelGrid * 0.50);
            w   = 160 * (pixelW * pixelGrid * 0.50);
            class Controls {
                class Background: ANZUS_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    h = (5 + 2) * (pixelH * pixelGrid * 0.50);
                    w = 160 * (pixelW * pixelGrid * 0.50);
                };
                class ButtonNewWarrant: ANZUS_ctrlDefaultButton {
                    idc  = 25;
                    text = "NEW WARRANT";
                    x    = (pixelW * pixelGrid * 0.50);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (160 / 4) * (pixelW * pixelGrid * 0.50);
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class ButtonDestroyWarrant: ANZUS_ctrlDefaultButton {
                    idc  = 26;
                    text = "DELETE WARRANT";
                    x    = ((pixelW * pixelGrid * 0.50) * 2) + ((160 / 4) * (pixelW * pixelGrid * 0.50));
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (160 / 4) * (pixelW * pixelGrid * 0.50);
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
            };
        };
        class GroupNewWarrantBackground: ANZUS_ctrlControlsGroupNoScrollbars {
            idc = 54;
            x   = safezoneX;
            y   = safezoneY;
            w   = safezoneW;
            h   = safezoneH;
            class Controls {
                class Background: ANZUS_ctrlStaticBackgroundDisableTiles {
                    x = 0;
                    y = 0;
                    w = safezoneW;
                    h = safezoneH;
                };
            };
        };
        class GroupNewWarrant: ANZUS_ctrlControlsGroupNoScrollbars {
            idc = 66;
            x   = (((getResolution select 2) * 0.5 * pixelW) - (120 * 0.5) * (pixelW * pixelGrid * 0.50));
            y   = (0.415 - (80 * 0.5 - 5) * (pixelH * pixelGrid * 0.50));
            w   = 120 * (pixelW * pixelGrid * 0.50);
            h   = 80 * (pixelH * pixelGrid * 0.50);
            class Controls {
                class Header: ANZUS_ctrlStaticHeader {
                    text = "New Warrant";
                    x    = 0;
                    y    = 0;
                    w    = 120 * (pixelW * pixelGrid * 0.50);
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class Background: ANZUS_ctrlStaticBackground {
                    x = 0;
                    y = 5 * (pixelH * pixelGrid * 0.50);
                    w = 120 * (pixelW * pixelGrid * 0.50);
                    h = (80 * (pixelH * pixelGrid * 0.50)) - (5 * (pixelH * pixelGrid * 0.50)) - ((5 + 2) * (pixelH * pixelGrid * 0.50));
                };
                class FooterBackground: ANZUS_ctrlStaticFooter {
                    x = 0;
                    y = (80 * (pixelH * pixelGrid * 0.50)) - ((5 + 2) * (pixelH * pixelGrid * 0.50));
                    w = 120 * (pixelW * pixelGrid * 0.50);
                    h = (5 + 2) * (pixelH * pixelGrid * 0.50);
                };
                class ButtonAddWarrant: ANZUS_ctrlDefaultButton {
                    idc  = 21;
                    text = "ISSUE WARRANT";
                    x    = (pixelW * pixelGrid * 0.50);
                    y    = (80 * (pixelH * pixelGrid * 0.50)) - ((5 + 2) * (pixelH * pixelGrid * 0.50)) + (pixelH * pixelGrid * 0.50);
                    w    = (120 * (pixelW * pixelGrid * 0.50)) / 3;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class ButtonCancel: ANZUS_ctrlDefaultButton {
                    idc  = 20;
                    text = "CANCEL";
                    x    = ((pixelW * pixelGrid * 0.50) * 2) + ((120 * (pixelW * pixelGrid * 0.50)) / 3);
                    y    = (80 * (pixelH * pixelGrid * 0.50)) - ((5 + 2) * (pixelH * pixelGrid * 0.50)) + (pixelH * pixelGrid * 0.50);
                    w    = (120 * (pixelW * pixelGrid * 0.50)) / 3;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class Search: ANZUS_ctrlEdit {
                    idc = 3;
                    x   = (1.5 * (pixelW * pixelGrid * 0.50));
                    y   = (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50));
                    w   = ((120 * (pixelW * pixelGrid * 0.50)) * 0.46) - (pixelW * pixelGrid * 0.50) - (5 * (pixelW * pixelGrid * 0.50));
                    h   = 5 * (pixelH * pixelGrid * 0.50);
                };
                class SearchButton: ANZUS_ctrlButtonSearch {
                    idc = 4;
                    x   = (1.5 * (pixelW * pixelGrid * 0.50)) + ((120 * (pixelW * pixelGrid * 0.50)) * 0.46) - (pixelW * pixelGrid * 0.50) - (5 * (pixelW * pixelGrid * 0.50)) + (pixelW * pixelGrid * 0.50);
                    y   = (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50));
                    w   = 5 * (pixelW * pixelGrid * 0.50);
                    h   = 5 * (pixelH * pixelGrid * 0.50);
                };
                class ListPlayers: ANZUS_ctrlListBox {
                    idc = 1005;
                    x   = (1.5 * (pixelW * pixelGrid * 0.50));
                    y   = ((1.5 * (pixelH * pixelGrid * 0.50)) * 2) + ((5 * (pixelH * pixelGrid * 0.50)) * 2);
                    w   = (120 * (pixelW * pixelGrid * 0.50)) * 0.46;
                    h   = (80 * (pixelH * pixelGrid * 0.50)) * 0.72;
                };
                class CrimesList: ANZUS_ctrlCombo {
                    idc = 1004;
                    x   = 120 * (pixelW * pixelGrid * 0.50) - ((120 * (pixelW * pixelGrid * 0.50)) * 0.48) - (1.5 * (pixelW * pixelGrid * 0.50));
                    y   = (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50));
                    w   = (120 * (pixelW * pixelGrid * 0.50)) * 0.48;
                    h   = 5 * (pixelH * pixelGrid * 0.50);
                };
                class Title: ANZUS_ctrlStatic {
                    idc  = 67;
                    text = "Title";
                    x    = 120 * (pixelW * pixelGrid * 0.50) - ((120 * (pixelW * pixelGrid * 0.50)) * 0.48) - (1.5 * (pixelW * pixelGrid * 0.50));
                    y    = (5 * (pixelH * pixelGrid * 0.50)) + ((1.5 * (pixelH * pixelGrid * 0.50)) * 2) + ((5 * (pixelH * pixelGrid * 0.50)) * 1);
                    w    = (120 * (pixelW * pixelGrid * 0.50)) * 0.48;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class Penalty: ANZUS_ctrlStatic {
                    idc  = 68;
                    text = "Penalty";
                    x    = 120 * (pixelW * pixelGrid * 0.50) - ((120 * (pixelW * pixelGrid * 0.50)) * 0.48) - (1.5 * (pixelW * pixelGrid * 0.50));
                    y    = (5 * (pixelH * pixelGrid * 0.50)) + ((1.5 * (pixelH * pixelGrid * 0.50)) * 3) + ((5 * (pixelH * pixelGrid * 0.50)) * 2);
                    w    = (120 * (pixelW * pixelGrid * 0.50)) * 0.48;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class TicketValue: ANZUS_ctrlStatic {
                    idc  = 69;
                    text = "Ticket";
                    x    = 120 * (pixelW * pixelGrid * 0.50) - ((120 * (pixelW * pixelGrid * 0.50)) * 0.48) - (1.5 * (pixelW * pixelGrid * 0.50));
                    y    = (5 * (pixelH * pixelGrid * 0.50)) + ((1.5 * (pixelH * pixelGrid * 0.50)) * 4) + ((5 * (pixelH * pixelGrid * 0.50)) * 3);
                    w    = (120 * (pixelW * pixelGrid * 0.50)) * 0.48;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class PrisonTime: ANZUS_ctrlStatic {
                    idc  = 70;
                    text = "Prison Time";
                    x    = 120 * (pixelW * pixelGrid * 0.50) - ((120 * (pixelW * pixelGrid * 0.50)) * 0.48) - (1.5 * (pixelW * pixelGrid * 0.50));
                    y    = (5 * (pixelH * pixelGrid * 0.50)) + ((1.5 * (pixelH * pixelGrid * 0.50)) * 5) + ((5 * (pixelH * pixelGrid * 0.50)) * 4);
                    w    = (120 * (pixelW * pixelGrid * 0.50)) * 0.48;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
            };
        };
        class ButtonClose: ANZUS_ctrlButtonClose {
            x = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (5 * (pixelW * pixelGrid * 0.50));
            y = (0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50));
            w = 5 * (pixelW * pixelGrid * 0.50);
            h = 5 * (pixelH * pixelGrid * 0.50);
        };
    };
};