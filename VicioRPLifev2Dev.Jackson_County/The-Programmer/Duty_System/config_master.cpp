/*
    Author: Jean-Baptiste
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
#define false 0
#define true 1

class The_programmer_Duty_Config {
    default_lang = "en"; // fr / en

    textures_base_path = "The-Programmer\Duty_System\textures";
    tonic_version = 4; // 5 if you are on version 5.0 or 4 if you are on version 4.X  

    path_init = "core\init.sqf"; // File destination to be executed : [] execVM "path_init";
    path_fsm = "core\fsm\client.fsm"; // File destination to be executed : [] execFSM "path_fsm";
    briefing = false;

    open_beeper_key = 48; // https://community.bistudio.com/wiki/DIK_KeyCodes for the keys number (48 = B)

    save_between_disconnection = true; // Save the status of the player between the disconnection
    save_between_reboot = true; // Save the status of the player between reboot
 
    /* Type : level OR license */
    type_of_check = "license"; // type_of_check = "type";

    class Cop_Side_Configuration {
        coplevel_required = 1; // Minimum CopLevel level to take up duty
        required_license_cop[] = {"license_civ_isCop"}; // All licenses that allows you to take up duty

        coplevel_required_to_acces_beeper = 2; // Minimum CopLevel level to open the beeper
        licence_required_to_acces_beeper = ""; // All licenses that allows you to open the beeper    
    };

    class Medic_Side_Configuration {
        mediclevel_required = 1;
        required_license_medic[] = {"license_civ_isMed"};

        medlevel_required_to_acces_beeper = 2;
        licence_required_to_acces_beeper = "";
    };

    class Adac_Side_Configuration {
        east_side = false; // If you have the east side on your server put true
        name_of_column_for_adac_level = "adaclevel"; // Name of the column in your database for the adac level

        adaclevel_required = 1;
        required_license_adac[] = {""};

        Adaclevel_required_to_acces_beeper = 2;
        licence_required_to_acces_beeper = "";
    };
};
