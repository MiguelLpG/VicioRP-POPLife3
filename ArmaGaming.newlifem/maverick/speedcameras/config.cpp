/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

//Customize your settings, to fit your server setup!
class Maverick_SpeedCameras {

    //Define the possible locations for your speed cameras.
    //position -> Get the position via: diag_log(getPosATL player) -> replace the [] with {}
    //direction -> Get the position via: diag_log((getDir player) - 90)
    //speedlimit -> Choose any value you like. In a zone where people should drive 50, make set it to 55 or 60, to catch those speeders!
	SpeedCameras[] = {
	  //{{<position>}, <direction>, <speedlimit>},
        {{8598.24,6772.24,0}, 239, 60}, //Metro
        {{8432.12,7009.01,0}, 90, 140},  //Metro highway
        {{8097.64,6377.86,0}, 256, 140},  //Metro highway
        {{8918.73,8154.19,0}, 167, 90},  //Between metro and DoC
        {{7032.61,8002.98,0}, 128, 140},  //Big road in mid map
        {{6160.6,4432.34,0}, 63, 90},  //Between metro & morrison
        {{6426.23,4613.4,0}, 247, 90},  //Between metro & morrison
        {{8657.48,5236.94,0}, 89, 90},  //Between metro & money laund
        {{4121.4,5852.63,0}, 30, 140},  //Near diamond trader
        {{8793.5,3497.02,0}, 225, 90},  //Near mining area
        {{7026.28,2501.84,0}, 40, 90},  //Near heroin area
        {{3891.49,8259.21,0}, 76, 140},  //Near heroin area
        {{5287.54,2958.03,0}, 260, 60},  //Outside bank
        {{5303.56,3013.47,0}, 39, 70},  //In morrison
        {{4629.34,1541.14,0}, 346, 90},  //Christobal bridge
        {{3080.97,3941.12,0}, 8, 140},  //middle of no where
        {{5041.53,7480.92,0}, 44, 140},  //near new heaven
        {{8468.88,8941.7,0}, 155, 90},  //doc bridge
        {{8801,7167.25,0}, 244, 60},  //metro pd
        {{1750.02,7769.48,0}, 306, 90},  //near diablos
        {{4094.01,6506.24,0}, 18, 90}  //diamond trader
	};
	
	//Define the radius in meter in front of the speed camera where it should be active. 25 Works well with default arma roads.
	Radius = 25;
	
	SideWhitelist[] = {
		//Side name to lower case!
		"west",//Prevent Police officers from triggering the speed camera
		"guer" //Prevent medics from triggering the speed camera
	};
	
    //Shall the user get its driver licenses revoked?
	RemoveLicenses[] = {
		//{ <License name to display in the hint 'msgRemoveLicense'>, <license_variable_name>, <how fast over the limit does he need to drive to get the license removed e.g 10>}
		{ "driver license" , "license_civ_driver", 60 },     //Remove the driver license if he was diriving faster than allowed by at least 1km/h
		{ "trucker license" , "license_civ_trucking", 40 }, //Remove the trucker license if he was diriving faster than allowed by at least 25km/h
	};

    //Shall the player be added to the wanted list with a speeding entry?
    AddPlayerToWanted      = 0;   				   // 0 = No | 1 = yes
	WantedCase			   = "4"; 				   //The number/numbers+charaters that describe the crime you want the player to be added for
	WantedFunction		   = "life_fnc_wantedAdd"; //Adjust if you use any other wanted add function name
	
    //Let the player pay a fine from his bank account
    SpeedingFee            = 50;			 // 0 = No fine payed | Any value over 0 $ will be then subtracted from the bank account
    EnableFactor           = 1;			 	 // 0 = No | 1 = yes -> SpeedingFee * Amount of speed the player was going to fast = 500$ * 24kmh = 12000$
	BankVariable		   = "life_atmbank"; //Adjust your bank account variable
	
	class localization {
	
		//Define the messages, which will be shown to the player, when he was driving too fast
		msgSpeedCamera		   = "Speedcamera";
		msgInfo                = "You have been driving %1 km/h over the limit!";
		msgRemoveLicense 	   = "Your %1 has been revoked!";
		msgWantedAdd  		   = "A wanted record about you has been created!";
		msgSpeedingFee         = "You have been fined with %1$ for speeding!";
	};
};