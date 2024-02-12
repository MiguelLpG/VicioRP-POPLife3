/*
    Author: Maxence
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
#define false 0
#define true 1

class The_Programmer_IphoneXI {
    default_lang = "es"; // fr / en / de / es

    textures_base_path = "\IphoneXI_Assets"; // If you move the textures to another location or in a mod keep the folder structure and file names the same in the current textures folder
    enable_cellphone_animations = true; // You have to put the "The_Programmer_Cellphone" mod into your modpack !

    gang_bank_system_lastest_version = false; // Default (& RECOMMENDED) TRUE. An update of the gang scripts was made on 15 May 2019 changing the hole gang bank system. If you have a problem with gang deposit, try with FALSE or contact us. Commit link : https://github.com/AsYetUntitled/Framework/commit/b7c1cbc7586319e823d2e7851d4c072e875eca44

    default_color = "colors\grey_black.paa";
    default_wallpaper = "wallpapers\grey_light.paa";

    RebootsHours[] = {"Próximamente"};
    BuyableLicenses[] = {"home"};

    Colors[] = {
        {"Blanc","colors\white.paa"},
        {"Bleu foncé","colors\blue_dark.paa"},
        {"Bleu clair","colors\blue_light.paa"},
        {"Vert foncé","colors\green_dark.paa"},
        {"Vert clair","colors\green_light.paa"},
        {"Gris-noir","colors\grey_black.paa"},
        {"Noir","colors\black.paa"},
        {"Orange","colors\orange.paa"},
        {"Rouge","colors\red.paa"},
        {"Jaune","colors\yellow.paa"},
        {"Violet","colors\purple.paa"},
        {"Rose","colors\pink.paa"},
        {"Turquoise","colors\aqua.paa"}
    };

    Wallpapers[] = {
        {"Bleu foncé","wallpapers\blue_dark.paa"},
        {"Bleu clair","wallpapers\blue_light.paa"},
        {"Vert foncé","wallpapers\green_dark.paa"},
        {"Vert clair","wallpapers\green_light.paa"},
        {"Gris Foncé","wallpapers\grey_dark.paa"},
        {"Gris clair","wallpapers\grey_light.paa"},
        {"Noir","wallpapers\black.paa"},
        {"Orange foncé","wallpapers\orange_dark.paa"},
        {"Orange clair","wallpapers\orange_light.paa"}
    };

    MessagesSounds[] = {
        {"Mario Mushroom","IphoneXI_mario_mushroom"},
        {"Classic Whistle","IphoneXI_classic_whistle"},
        {"Iphone","IphoneXI_Notif_iphone"},
        {"Samsung","IphoneXI_Samsung"}
    };

    CallsRingtones[] = {
        {"ArmyWakeup","IphoneXI_ArmyWakeup"},
        {"Bahbahbah","IphoneXI_bahbahbah"},
        {"Dont Worry Be Happy","IphoneXI_DontWorryBeHappy"},
        {"Hurr Durr","IphoneXI_HurrDurr"},
        {"Iphone","IphoneXI_IsThatMyiPhone"},
        {"Rocket Ship","IphoneXI_RocketShip"},
        {"Smoke Weed","IphoneXI_SmokeWeed"}
    };

    placeables_can_remove_only_own = true; // Except button "all" that's only for own objects in any cases
    placeables[] = {};

    class Iphone_NavBar { // Maximum 4 buttons !
        class licenses {
            action = "[] spawn the_programmer_iphone_xi_fnc_apps_license;";
            displayName = "STR_APP_LICENSES";
            condition = "";
            iconFile = "icons\licenses.paa";
        };
        class wallet {
            action = "[true] call the_programmer_iphone_xi_fnc_apps_wallet;";
            displayName = "STR_APP_WALLET";
            condition = "";
            iconFile = "icons\wallet.paa";
        };
        class messages {
            action = "[true] call the_programmer_iphone_xi_fnc_phone_messagesMenu;";
            displayName = "STR_APP_MESSAGES";
            condition = "";
            iconFile = "icons\messages.paa";
        };
    };

    class Iphone_Apps { // Maximum 24 buttons per page and 2 pages -> 48 buttons maximum
        class calendar {
            action = "[player] remoteExec [""advent_calendar_tpfn_queryDatabase"",2];";
            displayName = "STR_APP_CALENDAR";
            condition = "(['The_Programmer_Advent_Calendar'] call theprogrammer_core_fnc_isProductInstalled) && ((systemTime select 1) == 12) && ((systemTime select 2) <= 24)";
            iconFile = "icons\calendar.paa";
        };
        class keys {
            action = "[true] spawn the_programmer_iphone_xi_fnc_apps_keyMenu;";
            displayName = "STR_APP_KEYS";
            condition = "";
            iconFile = "icons\keys.paa";
        };
        class settings {
            action = "[] call the_programmer_iphone_xi_fnc_settings_openSettingsMenu;";
            displayName = "STR_APP_SETTINGS";
            condition = "";
            iconFile = "icons\settings.paa";
        };
        class gang {
            action = "[] call the_programmer_iphone_xi_fnc_apps_openGangMenu;";
            displayName = "STR_APP_GANG";
            condition = "";
            iconFile = "icons\gang.paa";
        };
        class syncData {
            action = "[] call SOCK_fnc_syncData;";
            displayName = "STR_APP_SYNCDATA";
            condition = "";
            iconFile = "icons\syncData.paa";
        };
        class bank {
            action = "[true] call the_programmer_iphone_xi_fnc_apps_masterpay;";
            displayName = "STR_APP_BANK";
            condition = "";
            iconFile = "icons\bank.paa";
        };
        class weather {
            action = "[] spawn the_programmer_iphone_xi_fnc_apps_weather;";
            displayName = "STR_APP_WEATHER";
            condition = "";
            iconFile = "icons\weather.paa";
        };
        class camera {
            action = "closeDialog 0; [] spawn the_programmer_iphone_xi_fnc_apps_camera;";
            displayName = "STR_APP_CAMERA";
            condition = "((getNumber (missionConfigFile >> ""The_Programmer_IphoneXI"" >> ""enable_cellphone_animations"")) isEqualTo 1)";
            iconFile = "icons\camera.paa";
        };
        class notes {
            action = "[] spawn the_programmer_iphone_xi_fnc_apps_pasteme;";
            displayName = "STR_APP_NOTES";
            condition = "";
            iconFile = "icons\pasteme.paa";
        };
        class company {
            action = "[] spawn max_entreprise_fnc_openMenu;";
            displayName = "STR_APP_COMPANY";
            condition = "((['Max_Settings_Entreprise'] call theprogrammer_core_fnc_isProductInstalled) && !(isNull (player getVariable [""current_entreprise"",objNull])))";
            iconFile = "icons\company.paa";
        };
        class government {
            action = "[] spawn max_gouvernement_fnc_selectGovernementMenu;";
            displayName = "STR_APP_GOVERNMENT";
            condition = "(['Max_Settings_Gouvernement'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\government.paa";
        };
        class GPS {
            action = "[] call gps_menu_fnc_loadGPSMenu;";
            displayName = "STR_APP_GPS";
            condition = "(['CfgGPS'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\gps.paa";
        };
        class keypad {
            action = "[] call the_programmer_iphone_xi_fnc_phone_keypad;";
            displayName = "STR_APP_KEYPAD";
            condition = "(['Max_Settings_Phone_Advanced'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\keypad.paa";
        };
        class contacts {
            action = "[true] spawn the_programmer_iphone_xi_fnc_phone_contactMenu;";
            displayName = "STR_APP_CONTACTS";
            condition = "(['Max_Settings_Phone'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\contact.paa";
        };
        class callsHistory {
            action = "[true] call the_programmer_iphone_xi_fnc_phone_openCallsHistoryMenu;";
            displayName = "STR_APP_CALLS_HISTORY";
            condition = "(['Max_Settings_Phone_Advanced'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\callsHistory.paa";
        };
        class bills {
            action = "createDialog ""facture_list"";";
            displayName = "STR_APP_BILLS";
            condition = "(['Max_Settings_Facture'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\bills.paa";
        };
        class documents {
            action = "createDialog ""Advanced_Documents_Documents_List"";";
            displayName = "STR_APP_DOCUMENTS";
            condition = "(['The_Programmer_Advanced_Documents'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\documents.paa";
        };
        class market {
            action = "[true] call the_programmer_iphone_xi_fnc_apps_marketMenu;";
            displayName = "STR_APP_DYNAMIC_MARKET";
            condition = "(['CfgDynamicMarketPrice'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\market.paa";
        };
        class placeables {
            action = "[true] call the_programmer_iphone_xi_fnc_apps_placeableMenu;";
            displayName = "STR_APP_PLACEABLE";
            condition = "([] call the_programmer_iphone_xi_fnc_apps_placeableCheckConditions)";
            iconFile = "icons\work.paa";
        };
        class farmingHelper {
            action = "createDialog ""The_Programmer_FarmingHelper_Menu"";";
            displayName = "STR_APP_FARMING_HELPER";
            condition = "(['The_Programmer_FarmingHelper'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\farming.paa";
        };
        class snake {
            action = "[true] call the_programmer_iphone_xi_fnc_apps_openSnake;";
            displayName = "STR_APP_SNAKE";
            condition = "";
            iconFile = "icons\snakeGame.paa";
        };
        class adminMenu {
            action = "closeDialog 0; [] spawn life_fnc_adminmenu;";
            displayName = "STR_APP_ADMIN_MENU";
            condition = "((call life_adminlevel) >= 1)";
            iconFile = "icons\adminMenu.paa";
        };
        class dispatch {
            action = "[] spawn max_callsmanage_fnc_openCallsManagementMenu;";
            displayName = "STR_APP_DISPATCH_SYSTEM";
            condition = "((['Max_Settings_Dispatch'] call theprogrammer_core_fnc_isProductInstalled) && !(playerSide isEqualTo civilian))";
            iconFile = "icons\dispatch.paa";
        };
        class TfarPanel {
            action = "closeDialog 0; createDialog ""The_Programmer_TFAR_Menu"";";
            displayName = "Radio";
            condition = "((['The_Programmer_TFAR_panel'] call theprogrammer_core_fnc_isProductInstalled) && !(playerSide isEqualTo civilian))";
            iconFile = "icons\radio.paa";
        };
        class Speedometer {
            action = "[] spawn speedometer_fnc_initConfig;";
            displayName = "STR_APP_SPEEDOMETER";
            condition = "(['The_Programmer_Speedometer_Config'] call theprogrammer_core_fnc_isProductInstalled)";
            iconFile = "icons\speedometer.paa";
        };
        class wantedList {
            action = "if (['Max_Settings_Interpol'] call theprogrammer_core_fnc_isProductInstalled) then {closeDialog 0; [0] remoteExec [""max_interpol_fnc_getInterpol"",2];} else {[] call life_fnc_wantedMenu;};";
            displayName = "PDA";
            condition = "(playerSide isEqualTo west)";
            iconFile = "icons\interpol.paa";
        };
        class licensePlate {
            action = "[] call the_programmer_iphone_xi_fnc_apps_searchPlateMenu;";
            displayName = "STR_APP_LICENSES_PLATE";
            condition = "((['Max_Settings_Immatriculation'] call theprogrammer_core_fnc_isProductInstalled) && (playerSide isEqualTo west))";
            iconFile = "icons\licensePlate.paa";
        };
        class whiteListMenu {
            action = "createDialog ""whitelist_menu"";";
            displayName = "STR_APP_WHITELIST_MENU";
            condition = "((['Max_Settings_WhitelistMenu'] call theprogrammer_core_fnc_isProductInstalled) && ((call life_adminlevel) >= 1))";
            iconFile = "icons\whitelistMenu.paa";
        };
    };
};
