class AnzusLife_ItemShop {
    idd = 889922;
    name= "AnzusLife_ItemShop";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Title: ANZUS_ctrlStaticHeader {
            idc  = 92;
            text = "Items Shop";
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
    };
    class controls {
        class Search: ANZUS_ctrlEdit {
            idc = 80;
            x   = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
            w   = (160 / 2.5) * (pixelW * pixelGrid * 0.50);
            h   = 5 * (pixelH * pixelGrid * 0.50);
        };
        class ButtonSearch: ANZUS_ctrlButtonSearch {
            idc = 81;
            x   = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + ((160 / 2.5) * (pixelW * pixelGrid * 0.50)) + (0.85 * (pixelW * pixelGrid * 0.50));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
        };

        class ItemsFilterBackground: ANZUS_ctrlStatic {
            idc             = 232321 + 105;
            x               = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y               = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 1) + (2 * (pixelH * pixelGrid * 0.50));
            w               = (160 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h               = 5 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 1};
        };
        class ItemsFilter: ANZUS_ctrlListNBox {
            idc             = 82;
            x               = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y               = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 1) + (2 * (pixelH * pixelGrid * 0.50));
            w               = (160 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h               = 5 * (pixelH * pixelGrid * 0.50);
            disableOverflow = 1;
            columns[]       = {0, 0.2, 0.3, 0.41, 0.51, 0.61, 0.71};
            class Items {
                class Item {
                    text    = "Item";
                    value   = 0;
                };
                class Buy: Item { text = "Buy"; };
                class Sell: Item { text = "Sell"; };
                class MyQty: Item { text = "My Qty"; };
                class Weight: Item { text = "Weight"; };
                class Illegal: Item { text = "Illegal"; };
                class Edible: Item { text = "Edible"; };
            };
        };
        class ItemsListBackground: ANZUS_ctrlStaticContent {
            idc = 232321 + 108;
            x   = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (2 * (pixelH * pixelGrid * 0.50));
            w   = (160 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h   = (100 / 1.4) * (pixelH * pixelGrid * 0.50);
        };
        class ItemsList: ItemsFilter {
            idc = 83;
            x   = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y   = ((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 2) + (2 * (pixelH * pixelGrid * 0.50));
            w   = (160 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h   = (100 / 1.4) * (pixelH * pixelGrid * 0.50);
            class Items {};
        };

        class AmountTitle: ANZUS_ctrlStatic {
            idc  = 232321 + 6;
            text = "Amount:";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y    = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w    = ((160 / 2.18) * (pixelW * pixelGrid * 0.50)) * 0.19;
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class AmountInput: ANZUS_ctrlEdit {
            idc  = 84;
            text = "1";
            x    = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + (((160 / 2.18) * (pixelW * pixelGrid * 0.50)) * 0.19));
            y    = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w    = (((160 / 2.18) * (pixelW * pixelGrid * 0.50)) * 0.66) - ((1.5 * (pixelW * pixelGrid * 0.50)) / 2);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Plus: ANZUS_ctrlDefaultButton {
            idc  = 85;
            text = "+";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + ((160 / 2.18) * (pixelW * pixelGrid * 0.50)) - ((5 * (pixelW * pixelGrid * 0.50)) * 2) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 0.5);
            y    = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w    = 5 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Minus: ANZUS_ctrlDefaultButton {
            idc  = 86;
            text = "-";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + ((160 / 2.18) * (pixelW * pixelGrid * 0.50)) - (5 * (pixelW * pixelGrid * 0.50));
            y    = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w    = 5 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };

        class MyInventoryProgressBarBackground: ANZUS_ctrlStatic {
            idc               = 232321 + 100;
            x                 = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y                 = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w                 = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h                 = 5 * (pixelH * pixelGrid * 0.50);
            colorBackground[] = {0, 0, 0, 0.2};
        };
        class MyInventoryProgressBar: ANZUS_ctrlProgress {
            idc               = 87;
            x                 = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y                 = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w                 = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h                 = 5 * (pixelH * pixelGrid * 0.50);
            colorBar[]        = {0.3, 0.3, 0.3, 1};
            colorFrame[]      = {0, 0, 0, 0};
        };
        class MyInventoryProgressBarText: ANZUS_ctrlStatic {
            idc               = 88;
            text              = "10/10";
            x                 = (((((getResolution select 2) * 0.5 * pixelW) - (160 * 0.5) * (pixelW * pixelGrid * 0.50)) + (160 * (pixelW * pixelGrid * 0.50)) - (1.5 * (pixelW * pixelGrid * 0.50))) - ((160 / 2.18) * (pixelW * pixelGrid * 0.50)));
            y                 = (((0.415 - (100 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + ((5 * (pixelH * pixelGrid * 0.50)) * 3) + (2 * (pixelH * pixelGrid * 0.50))) + ((100 / 1.35) * (pixelH * pixelGrid * 0.50)) - ((2 * (pixelH * pixelGrid * 0.50)) * 1.6);
            w                 = ((160 / 2.18) * (pixelW * pixelGrid * 0.50));
            h                 = 5 * (pixelH * pixelGrid * 0.50);
            style             = 0x02;
        };

        class Footer: ANZUS_ctrlControlsGroupNoScrollbars {
            idc = 89;
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
                class ButtonBuy: ANZUS_ctrlDefaultButton {
                    idc  = 90;
                    text = "BUY";
                    x    = (pixelW * pixelGrid * 0.50);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (160 / 6.8) * (pixelW * pixelGrid * 0.50);
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class ButtonSell: ANZUS_ctrlDefaultButton {
                    idc  = 91;
                    text = "SELL";
                    x    = ((pixelW * pixelGrid * 0.50) * 2) + ((160 / 6.8) * (pixelW * pixelGrid * 0.50));
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (160 / 6.8) * (pixelW * pixelGrid * 0.50);
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                };
                class ButtonSellAll: ANZUS_ctrlDefaultButton {
                    idc  = 93;
                    text = "SELL ALL";
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