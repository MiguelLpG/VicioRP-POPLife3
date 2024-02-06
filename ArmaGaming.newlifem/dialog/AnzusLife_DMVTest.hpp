class carCrash {
    idd = 67549;
    name= "carCrash";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\carCrash.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
		};
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.494844 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.099 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Seven""] call ANZUS_fnc_questionResults";
            x = 0.494844 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.11 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option3: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.494844 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.11 * safezoneH;
            tooltip = "Confirm your choice";	
        };

        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};

class trolling {
    idd = 67547;
    name= "trolling";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\trolling.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
		};
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.526251 * safezoneW + safezoneX;
            y = 0.402741 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.165 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Five""] call ANZUS_fnc_questionResults";
            x = 0.524479 * safezoneW + safezoneX;
            y = 0.594445 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.165 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};

class turning {
    idd = 67550;
    name= "turning";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\turning.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
		};
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.551562 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.11 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.551562 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.11 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option3: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Eight""] call ANZUS_fnc_questionResults";
            x = 0.551562 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.099 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};

class speedLimitHW {
    idd = 67545;
    name= "speedLimitHW";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\speedLimitHW.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
		};
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option3: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Three""] call ANZUS_fnc_questionResults";
            x = 0.572708 * safezoneW + safezoneX;
            y = 0.582556 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option4: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.668704 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };

        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};

class checkpoint {
    idd = 67552;
    name= "checkpoint";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\checkpoint.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
		};
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.132 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.143 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option3: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0; [""Pass""] call ANZUS_fnc_questionResults";
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.132 * safezoneH;
            tooltip = "Confirm your choice";	
        };

        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};

class Life_yesnoMenu {
    idd = 67543;
    name= "Life_yesno";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\DMVYesNo.paa";
            x = 0.262812 * safezoneW + safezoneX;
            y = 0.115 * safezoneH + safezoneY;
            w = 0.474375 * safezoneW;
            h = 0.792 * safezoneH;
		};
    };

    class controls {
        class accept: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""One""] call ANZUS_fnc_questionResults";
            tooltip = "Start Test";
            x = 0.369749 * safezoneW + safezoneX;
            y = 0.551833 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            tooltip = "Close Test";
            onButtonClick = "closeDialog 0;";
            x = 0.546875 * safezoneW + safezoneX;
            y = 0.551852 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };
};

class federal {
    idd = 67551;
    name= "federal";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\federal.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
		};
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.132 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Nine""] call ANZUS_fnc_questionResults";
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.143 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option3: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.132 * safezoneH;
            tooltip = "Confirm your choice";	
        };

        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};

class pullOverIllegal {
    idd = 67548;
    name= "pullOverIllegal";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\pullOverIllegal.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
		};
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.515469 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.516666 * safezoneW + safezoneX;
            y = 0.504629 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option3: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.515469 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option4: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Six""] call ANZUS_fnc_questionResults";
            x = 0.516146 * safezoneW + safezoneX;
            y = 0.690741 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };

        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};

class speedingCar {
    idd = 67546;
    name= "speedingCar";
    movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
		{
			idc = -1;
			text = "\ArmaGamingCore\images\textures\DMV\speedingCar.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
		};
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.526251 * safezoneW + safezoneX;
            y = 0.402741 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.165 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Four""] call ANZUS_fnc_questionResults";
            x = 0.524479 * safezoneW + safezoneX;
            y = 0.594445 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.165 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};

class speedLimitCity {
    idd = 67544;
    name= "speedLimitCity";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscPicture
        {
            idc = -1;
            text = "\ArmaGamingCore\images\textures\DMV\speedLimitCity.paa";
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.531094 * safezoneW;
            h = 0.968 * safezoneH;
        };
    };

    class controls {
        class option1: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option2: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option3: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Two""] call ANZUS_fnc_questionResults";
            x = 0.572708 * safezoneW + safezoneX;
            y = 0.582556 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };
        class option4: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "[""Fail""] call ANZUS_fnc_questionResults";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.668704 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.077 * safezoneH;
            tooltip = "Confirm your choice";	
        };

        class decline: Life_RscButtonInvisible
        {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            x = 0.7475 * safezoneW + safezoneX;
            y = 0.137 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "Cancel this test";	
        };
    };
};