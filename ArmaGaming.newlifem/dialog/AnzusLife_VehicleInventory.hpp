class AnzusLife_VehicleInventory {
    idd = 8005003;
    name= "AnzusLife_VehicleInventory";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Header: ANZUS_ctrlStaticHeader {
            idc = 32;
            text = "Vehicle Inventory";
            x    = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y    = (0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50));
            w    = 160 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Background: ANZUS_ctrlStaticBackground {
            x = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y = (0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50));
            w = 160 * (pixelW * pixelGrid * 0.50);
            h = (100 * (pixelH * pixelGrid * 0.50)) - (5 * (pixelH * pixelGrid * 0.50));
        };
        class MyInventoryProgressBarBackground: ANZUS_ctrlStatic {
            x                 = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + ((2 * (pixelH * pixelGrid * 0.50)) / 2);
            w                 = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h                 = 5 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 0.2};
        };
        class VehicleInventoryProgressBarBackground: MyInventoryProgressBarBackground {
            x = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
        };
        class MyInventoryFilterBackground: ANZUS_ctrlStatic {
            x                 = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y                 = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (2 * (pixelH * pixelGrid * 0.50));
            w                 = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h                 = 5 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 1};
        };
        class VehicleInventoryFilterBackground: MyInventoryFilterBackground {
            x = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
        };
        class MyInventoryListBackground: MyInventoryFilterBackground {
            h                 = (100 / 1.35) * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class VehicleInventoryListBackground: MyInventoryListBackground {
            x                 = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
        };
    };
    class controls {
        class MyInventoryTitle: ANZUS_ctrlStatic {
            idc  = 232321 + 1;
            text = "My Inventory";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y    = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
            w    = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class MyInventoryProgressBar: ANZUS_ctrlProgress {
            idc          = 35;
            x            = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y            = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + ((2 * (pixelH * pixelGrid * 0.50)) / 2);
            w            = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h            = 5 * (pixelH * pixelGrid * 0.50);
            colorBar[]   = {0.3, 0.3, 0.3, 1};
            colorFrame[] = {0, 0, 0, 0};
        };
        class MyInventoryProgressBarText: ANZUS_ctrlStatic {
            idc   = 47;
            text  = "10/224";
            x     = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y     = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + ((2 * (pixelH * pixelGrid * 0.50)) / 2);
            w     = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h     = 5 * (pixelH * pixelGrid * 0.50);
            style = 0x02;
        };
        class MyInventoryFilter: ANZUS_ctrlListNBox {
            idc             = 36;
            x               = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y               = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (2 * (pixelH * pixelGrid * 0.50));
            w               = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h               = 5 * (pixelH * pixelGrid * 0.50);
            disableOverflow = 1;
            columns[]       = {0, 0.09, 0.43, 0.73};
            class Items {
                class Icon {
                    text    = "";
                    value   = 0;
                };
                class Item: Icon {
                    text    = "Item";
                    value   = 0;
                };
                class TotalWeight: Icon {
                    text    = "Total Weight";
                    value   = 0;
                };
                class Quantity: Icon {
                    text    = "Qty";
                    value   = 0;
                };
            };
        };
        class MyInventoryList: MyInventoryFilter {
            idc = 37;
            x   = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50));
            w   = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h   = (100 / 1.35) * (pixelH * pixelGrid * 0.50);
            class Items {};
        };

        class AmountTitle: ANZUS_ctrlStatic {
            idc  = 232321 + 2;
            text = "Amount:";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y    = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w    = ((160 / 2.18) * (pixelW * pixelGrid * 0.50)) * 0.19;
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class AmountInput: ANZUS_ctrlEdit {
            idc  = 39;
            text = "1";
            x    = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + (((160 / 2.18) * (pixelW * pixelGrid * 0.50)) * 0.19));
            y    = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w    = (((160 / 2.18) * (pixelW * pixelGrid * 0.50)) * 0.66) - ((1.5 * (pixelW * pixelGrid * 0.50)) / 2);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Plus: ANZUS_ctrlDefaultButton {
            idc  = 40;
            text = "+";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + ((160 / 2.18) * (pixelW * pixelGrid * 0.50)) - ((5 * (pixelW * pixelGrid * 0.50)) * 2) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 0.5);
            y    = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w    = 5 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Minus: ANZUS_ctrlDefaultButton {
            idc  = 41;
            text = "-";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + ((160 / 2.18) * (pixelW * pixelGrid * 0.50)) - (5 * (pixelW * pixelGrid * 0.50));
            y    = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w    = 5 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };

        class VehicleInventoryTitle: MyInventoryTitle {
            idc  = 48;
            text = "Vehicle Inventory";
            x    = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
        };
        class VehicleInventoryProgressBar: MyInventoryProgressBar {
            idc = 42;
            x   = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
        };
        class VehicleInventoryProgressBarText: MyInventoryProgressBarText {
            idc = 43;
            x   = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
        };
        class VehicleInventoryFilter: MyInventoryFilter {
            idc = 44;
            x   = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (2 * (pixelH * pixelGrid * 0.50));
            w   = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h   = 5 * (pixelH * pixelGrid * 0.50);
        };
        class VehicleInventoryList: MyInventoryList {
            idc = 45;
            x   = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50));
            w   = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h   = (100 / 1.7) * (pixelH * pixelGrid * 0.50);
        };

        class Footer: ANZUS_ctrlControlsGroupNoScrollbars {
            idc = 46;
            x   = (((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50));
            y   = (0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + ((100 * (pixelH * pixelGrid * 0.50)) - (5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50));
            w   = 160 * (pixelW * pixelGrid * 0.50);
            h   = (5 + 2) * (pixelH * pixelGrid * 0.50);
            class controls {
                class Background: ANZUS_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonTake: ANZUS_ctrlDefaultButton {
                    idc  = 49;
                    text = "TAKE";
                    x    = (pixelW * pixelGrid * 0.50);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (160 / 6.8) * (pixelW * pixelGrid * 0.50);
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                    onButtonClick = "[] call ANZUS_fnc_vehTakeItem;";
                };
                class ButtonStore: ANZUS_ctrlDefaultButton {
                    idc  = 50;
                    text = "STORE";
                    x    = ((pixelW * pixelGrid * 0.50) * 2) + (160 / 6.8) * (pixelW * pixelGrid * 0.50);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (160 / 6.8) * (pixelW * pixelGrid * 0.50);
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                    onButtonClick = "[] call ANZUS_fnc_vehStoreItem;";
                };
                class ButtonSwap: ANZUS_ctrlDefaultButton {
                    idc  = 51;
                    text = "SWAP";
                    x    = ((pixelW * pixelGrid * 0.50) * 3) + (((160 / 6.8) * (pixelW * pixelGrid * 0.50)) * 2);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (160 / 6.8) * (pixelW * pixelGrid * 0.50);
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