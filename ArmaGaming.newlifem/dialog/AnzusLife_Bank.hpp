class AnzusLife_Bank {
    idd = 8999520;
    name= "AnzusLife_Bank";
    movingEnable = 0;
    enableSimulation = 1;

    class ControlsBackground {
        class Header: ANZUS_ctrlStaticHeader {
            text = "Cuenta Bancaria Personal";
            x    = (((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50));
            y    = (0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50));
            w    = 130 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Background: ANZUS_ctrlStaticBackground {
            x = (((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50));
            y = (0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50));
            w = 130 * (pixelW * pixelGrid * 0.50);
            h = (40 * (pixelH * pixelGrid * 0.50)) - (5 * (pixelH * pixelGrid * 0.50)) - ((5 + 2) * (pixelH * pixelGrid * 0.50));
        };
        class TitleBank: ANZUS_ctrlStatic {
            text = "Banco";
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y    = ((0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
            w    = 10 * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
            font = "RobotoCondensedBold";
        };
        class TitleCash: TitleBank {
            text = "Efectivo";
            y    = ((0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + (pixelH * pixelGrid * 0.50);
        };
    };

    class Controls {
        class Bank: ANZUS_ctrlStatic {
            idc  = 120;
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + (10 * (pixelW * pixelGrid * 0.50)) + (pixelW * pixelGrid * 0.50);
            y    = ((0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50)));
            w    = (40 * 0.7) * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Cash: ANZUS_ctrlStatic {
            idc  = 121;
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50))) + (10 * (pixelW * pixelGrid * 0.50)) + (pixelW * pixelGrid * 0.50);
            y    = ((0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (5 * (pixelH * pixelGrid * 0.50)) + (pixelH * pixelGrid * 0.50);
            w    = (40 * 0.7) * (pixelW * pixelGrid * 0.50);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class ListPlayers: ANZUS_ctrlCombo {
            idc  = 122;
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y    = ((0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (((5 * (pixelH * pixelGrid * 0.50)) + (pixelH * pixelGrid * 0.50)) * 2);
            w    = (130 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h    = 5 * (pixelH * pixelGrid * 0.50);
        };
        class Input: ANZUS_ctrlEdit {
            idc  = 123;
            x    = ((((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50)) + (1.5 * (pixelW * pixelGrid * 0.50)));
            y    = ((0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50)) + (5 * (pixelH * pixelGrid * 0.50)) + (1.5 * (pixelH * pixelGrid * 0.50))) + (((5 * (pixelH * pixelGrid * 0.50)) + (pixelH * pixelGrid * 0.50)) * 2) + (5 * (pixelH * pixelGrid * 0.50)) + (pixelH * pixelGrid * 0.50);
            w    = (130 * (pixelW * pixelGrid * 0.50)) - ((1.5 * (pixelW * pixelGrid * 0.50)) * 2);
            h    = 5 * (pixelH * pixelGrid * 0.50);
            text = "1";
        };
        class FooterGroup: ANZUS_ctrlControlsGroupNoScrollbars {
            idc = 124;
            x   = (((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50));
            y   = (0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50))  + (40 * (pixelH * pixelGrid * 0.50)) - ((5 + 2) * (pixelH * pixelGrid * 0.50));
            w   = 130 * (pixelW * pixelGrid * 0.50);
            h   = (5 + 2) * (pixelH * pixelGrid * 0.50);
            class Controls {
                class Background: ANZUS_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = 130 * (pixelW * pixelGrid * 0.50);
                    h = (5 + 2) * (pixelH * pixelGrid * 0.50);
                };
                class ButtonDeposit: ANZUS_ctrlDefaultButton {
                    idc  = 125;
                    text = "DEPOSITAR";
                    x    = (pixelW * pixelGrid * 0.50);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (130 * (pixelW * pixelGrid * 0.50)) * 0.2;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                    onButtonClick = "[] call ANZUS_fnc_bankDeposit; playSound 'atmButton'; closeDialog 0;";
                };

                class ButtonWithdraw: ANZUS_ctrlDefaultButton {
                    idc  = 126;
                    text = "RETIRAR";
                    x    = (pixelW * pixelGrid * 0.50) + ((((130 * (pixelW * pixelGrid * 0.50)) * 0.2) + (pixelW * pixelGrid * 0.50)) * 1);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (130 * (pixelW * pixelGrid * 0.50)) * 0.2;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                    onButtonClick = "[] call ANZUS_fnc_bankWithdraw; playSound 'atmButton'; closeDialog 0;";
                };
                class ButtonDepositAll: ANZUS_ctrlDefaultButton {
                    idc  = 127;
                    text = "DEPOSITAR +";
                    x    = (pixelW * pixelGrid * 0.50) + ((((130 * (pixelW * pixelGrid * 0.50)) * 0.2) + (pixelW * pixelGrid * 0.50)) * 2);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (130 * (pixelW * pixelGrid * 0.50)) * 0.2;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                    onButtonClick = "[] call ANZUS_fnc_bankDepositAll; playSound 'atmButton'; closeDialog 0;";
                };
                class ButtonTransfer: ANZUS_ctrlDefaultButton {
                    idc  = 128;
                    text = "TRANSFERIR";
                    x    = (pixelW * pixelGrid * 0.50) + ((((130 * (pixelW * pixelGrid * 0.50)) * 0.2) + (pixelW * pixelGrid * 0.50)) * 3);
                    y    = (pixelH * pixelGrid * 0.50);
                    w    = (130 * (pixelW * pixelGrid * 0.50)) * 0.2;
                    h    = 5 * (pixelH * pixelGrid * 0.50);
                    onButtonClick = "[] call ANZUS_fnc_bankTransfer; playSound 'atmButton'; closeDialog 0;";
                };
            };
        };
        class ButtonCancel: ANZUS_ctrlButtonClose {
            x = (((getResolution select 2) * 0.5 * pixelW) - (130 * 0.5) * (pixelW * pixelGrid * 0.50)) + (130 * (pixelW * pixelGrid * 0.50)) - (5 * (pixelW * pixelGrid * 0.50));
            y = (0.415 - (40 * 0.5 - 5) * (pixelH * pixelGrid * 0.50));
            w = 5 * (pixelW * pixelGrid * 0.50);
            h = 5 * (pixelH * pixelGrid * 0.50);
            onButtonClick = "closeDialog 0;";
        };
    };
};
