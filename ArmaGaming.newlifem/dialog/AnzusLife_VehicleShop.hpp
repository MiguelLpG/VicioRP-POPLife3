class AnzusLife_VehicleShop {
    idd = 8000240;
    name= "AnzusLife_VehicleShop";
    movingEnable = 0;
    enableSimulation = 1;
    onUnLoad = "[] call ANZUS_fnc_endShop;";

    class ControlsBackground {
        class BACKGROUND: ANZUS_ctrlStatic {
            idc                = -1;
            x                  = "0.29375 * safezoneW + safezoneX";
            y                  = "0.314148 * safezoneH + safezoneY";
            w                  = "0.4125 * safezoneW";
            h                  = "0.396 * safezoneH";
            colorBackground[]  = {0.2,0.2,0.2,0.6};
        };
        class HEADER: ANZUS_ctrlStatic {
            idc                = 8000241;
            text               = "Vehicle Purchases"; // ToDo: Localize;
            x                  = "0.29375 * safezoneW + safezoneX";
            y                  = "0.291 * safezoneH + safezoneY";
            w                  = "0.4125 * safezoneW";
            h                  = "0.022 * safezoneH";
            colorBackground[] = {0,0.306,1,1};
        };
        class TREE_TITLE: ANZUS_ctrlStatic {
            idc                = -1;
            text               = "Available Vehicles"; // ToDo: Localize;
            x                  = "0.295802 * safezoneW + safezoneX";
            y                  = "0.3174 * safezoneH + safezoneY";
            w                  = "0.140245 * safezoneW";
            h                  = "0.022 * safezoneH";
            colorBackground[]  = {0.05,0.05,0.05,1};
        };
        class VEHICLE_SELECTED_TITLE: ANZUS_ctrlStatic {
            idc                = 8000242;
            text               = ""; // ToDo: Localize;
            x                  = "0.438635 * safezoneW + safezoneX";
            y                  = "0.3174 * safezoneH + safezoneY";
            w                  = "0.265031 * safezoneW";
            h                  = "0.022 * safezoneH";
            colorBackground[]  = {0.05,0.05,0.05,1};
        };
        class TITLE_NAME: ANZUS_ctrlStatic {
            idc                = -1;
            text               = "Name:"; // ToDo: Localize;
            x                  = "0.438542 * safezoneW + safezoneX";
            y                  = "0.500037 * safezoneH + safezoneY";
            w                  = "0.0773833 * safezoneW";
            h                  = "0.022 * safezoneH";
            colorBackground[]  = {0,0,0,0.5};
            style              = 0x01;
        };
        class TITLE_PRICE: TITLE_NAME {
            text               = "Price:"; // ToDo: Localize;
            y                  = "0.522726 * safezoneH + safezoneY";
        };
        class TITLE_MAXSPEED: TITLE_NAME {
            text               = "Max Speed:"; // ToDo: Localize;
            y                  = "0.546341 * safezoneH + safezoneY";
        };
        class TITLE_HORSEPOWER: TITLE_NAME {
            text               = "Horse Power:"; // ToDo: Localize;
            y                  = "0.569023 * safezoneH + safezoneY";
        };
        class TITLE_PASSENGERSEATS: TITLE_NAME {
            text               = "Passenger Seats:"; // ToDo: Localize;
            y                  = "0.5924 * safezoneH + safezoneY";
        };
        class TITLE_TRUNKSPACE: TITLE_NAME {
            text               = "Trunk Space:"; // ToDo: Localize;
            y                  = "0.616126 * safezoneH + safezoneY";
        };
        class TITLE_FUEL: TITLE_NAME {
            text               = "Fuel Space:"; // ToDo: Localize;
            y                  = "0.638696 * safezoneH + safezoneY";
        };
        class TITLE_ARMOR: TITLE_NAME {
            text               = "Armor:"; // ToDo: Localize;
            y                  = "0.662422 * safezoneH + safezoneY";
        };
        class TITLE_VEHICLESPECIFICATIONS: TITLE_NAME {
            text               = "Vehicle Specifications"; // ToDo: Localize;
            y                  = "0.476533 * safezoneH + safezoneY";
            w                  = "0.265031 * safezoneW";
            colorBackground[]  = {0.05,0.05,0.05,1};
            style              = 0x00;
        };
    };
    class controls {
        class TREE_VEHICLES: ANZUS_ctrlTree {
            idc                = 8000243;
            y                  = "0.341 * safezoneH + safezoneY";
            x                  = "0.295803 * safezoneW + safezoneX";
            w                  = "0.140245 * safezoneW";
            h                  = "0.3652 * safezoneH";
            colorBackground[]  = {0,0,0,0.5};
        };
        class SELECTED_VEHICLE_ICONPREVIEW: ANZUS_ctrlStructuredText {
            idc                = 8000244;
            x                  = "0.438542 * safezoneW + safezoneX";
            y                  = "0.340422 * safezoneH + safezoneY";
            w                  = "0.265031 * safezoneW";
            h                  = "0.125 * safezoneH";
            colorBackground[]  = {0,0,0,0.5};
        };
        class TEXT_NAME: ANZUS_ctrlStatic {
            idc                = 8000245;
            text               = "";
            x                  = "0.516667 * safezoneW + safezoneX";
            y                  = "0.500385 * safezoneH + safezoneY";
            w                  = "0.187196 * safezoneW";
            h                  = "0.022 * safezoneH";
            colorBackground[]  = {0,0,0,0.4};
        };
        class TEXT_PRICE: TEXT_NAME {
            idc                = 8000246;
            text               = "£100.000.00"; // ToDo: Localize;
            y                  = "0.522725 * safezoneH + safezoneY";
        };
        class TEXT_MAXSPEED: TEXT_NAME {
            idc                = 8000247;
            text               = "320 km/h"; // ToDo: Localize;
            y                  = "0.546333 * safezoneH + safezoneY";
        };
        class TEXT_HORSEPOWER: TEXT_NAME {
            idc                = 8000248;
            text               = "220hp"; // ToDo: Localize;
            y                  = "0.569482 * safezoneH + safezoneY";
        };
        class TEXT_PASSENGERSEATS: TEXT_NAME {
            idc                = 8000249;
            text               = "3"; // ToDo: Localize;
            y                  = "0.592519 * safezoneH + safezoneY";
        };
        class TEXT_TRUNKSPACE: TEXT_NAME {
            idc                = 8000250;
            text               = "30"; // ToDo: Localize;
            y                  = "0.616016 * safezoneH + safezoneY";
        };
        class TEXT_FUEL: TEXT_NAME {
            idc                = 8000251;
            text               = "50l"; // ToDo: Localize;
            y                  = "0.639163 * safezoneH + safezoneY";
        };
        class TEXT_ARMOR: TEXT_NAME {
            idc                = 8000252;
            text               = "220"; // ToDo: Localize;
            y                  = "0.662311 * safezoneH + safezoneY";
        };
        class BUTTON_RENT_VEHICLE: ANZUS_ctrlDefaultButton {
            idc                = 8000253;
            text               = "RENT VEHICLE"; // ToDo: Localize;
            x                  = "0.438645 * safezoneW + safezoneX";
            y                  = "0.685726 * safezoneH + safezoneY";
            w                  = "0.110341 * safezoneW";
            h                  = "0.0198 * safezoneH";
            colorBackground[]  = {0,0,0,1};
        };
        class BUTTON_PURCHASE_VEHICLE: BUTTON_RENT_VEHICLE {
            idc                = 8000254;
            text               = "PURCHASE VEHICLE";
            x                  = "0.593295 * safezoneW + safezoneX";
        };
        class INSURANCE_CHECKBOX: ANZUS_RscCheckbox {
            idc                = 8000256;
            x                  = "0.581954 * safezoneW + safezoneX";
            y                  = "0.686111 * safezoneH + safezoneY";
            w                  = "0.0103125 * safezoneW";
            h                  = "0.0198 * safezoneH";
            colorBackground[]  = {0,0,0,1};
            tooltip            = "Mark checkbox to add insurance to your vehicle"; // ToDo: Localize;
        };
    };
};