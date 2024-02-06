class CfgMaster {
    class Branch {
        //Server Version
        serverVersion = "Dev";

        //Dev Server Name
        devServerName = "Classic Project Dev";

        //main - Live, dev - Development Build
        currentBranch = "main";
    };

    class Security {
        //Player UID's that can bypass addon check
        bypassAddonCheck[] = {};

        //List of CfgPatches that you want to confirm are running
        patchesToVerify[] = {"FHQ_Weapons","POPLife_MetropolisV2_CQC","AL_UI"};

        //Turn on to stop people from saving gear on combat logs (*IN TESTING*)
        combatLogFix = false;
    };

    class Jail {
        class Settings {
            // Minimum and maximum time for jail in minutes.
            minTime = 5;
            maxTime = 120;

            //If true, it will seize stuff in there inventory, otherwise it will keep gear if cop forgets to patdown
            jail_autoSeizeInv = true; 

            //Virtual Items that you want to be seized
            jail_seize_vItems[] = { "zipties", "blindfold", "codeCracker", "spikeStrip","lockpick","goldenbarz3","blastingcharge","boltcutter","heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","turtle_raw" };

            //Force inmates to walk while in jail if true
            jail_forceWalk = true;

            // Loadout player gets when sent to jail
            class Loadout {
                uniform  = "AG_Prisoner_Low_Uni";
                backpack = "AG_FactionInvPack";
                headgear = "Prison_cap_S";
                goggles  = "";
                vest = "";
            };
        };

        class Locations {
            class CarcelAlcatraz {
                name        = "Carcel Nacional";
                description = "La carcel nacional de Lakeside Valley es conocida por su gran seguridad.";
                icon        = "";

                class JailCellLocations {
                    //Using modelToWorld for jail positions
                    useModelToWorld = false;

                    //Spawnpoints for jail prisoners
                    jailPositions[] = {
                        {6651.52,4645.06,0.00143814},
                        {6651.52,4645.06,0.00143814},
                        {6651.52,4645.06,0.00143814}, 
                        {6651.52,4645.06,0.00143814}, 
                        {6651.52,4645.06,0.00143814}, 
                        {6651.52,4645.06,0.00143814}, 
                        {6651.52,4645.06,0.00143814}
                    };
                };

                class ReleaseArea {
                    //Direction to release them in (getDir player)
                    direction = 100;

                    //Position to release them at (getPosATL player)
                    positionATL[] = {8590.82,6611.16,0.00143909};
                };
            };
        };
    };

    class MajorCrimes {
        //Time in minutes that players cannot deposit money after selling stolen gold.
        noatm_timer = 10;
        blacklistedWeapons[] = {"TR8_Mining_Drill","Mr_Camera_News","Mr_Micro_News","Binocular","taser"};

        class Bank {
            items[] = {"markedmoney"};
            amount = 4;
            time = 700;
            displayName = "Bank";
            requiredItem = "codeCracker";
        };

        class Fed {
            items[] = {"markedmoney"};
            amount = 6;
            time = 800;
            displayName = "Federal Reserve";
            requiredItem = "blastingcharge";
        };

        class Casino {
            items[] = {"markedmoney"};
            amount = 3;
            time = 600;
            displayName = "Casino";
            requiredItem = "codeCracker";
        };
    };

    class Medical {
        // Duration of bleedout before bleeding out and dying, in seconds.
        bleedoutDuration = 450;
        
        //Revive fee that players have to pay and medics, only EMS are rewarded with this amount.
        revivalFee = 750; 
        
        //Fee to heal at a hospital NPC  
        hospitalFee = 150; 
    };

    class Saving {
        //Save virtual items
        save_virtualItems = true; 

        //Save illeagal items
        save_illeagalItems = false;

        //Save food, and water?
        save_playerStats = true; 

        //Save civilian location
        save_civilianPosition = true;

        //Save vehicle virtual items
        save_vehicle_virtualItems = false;

        //Save illeagal items in vehicle
        save_vehicle_illeagalItems = false;

        //Save arma inventory items in vehicle
        save_vehicle_inventory = false;

        //Save the vehicles fuel and damage
        save_vehicle_fuel = true;
        save_vehicle_damage = true;
    };

    class GameSettings {
        //Set to false to disable the ARMA 3 fatigue system.
        enable_fatigue = true; 

        //false - Group leaders can access the commander view. true [default] - Group leaders cannot access the commander view.
        disableCommanderView = true; 

        //Enable the donor level set in database (var = life_donorlevel; levels = 0,1,2,3,4,5). ATTENTION! Before enabling, read: https://www.bistudio.com/community/game-content-usage-rules & https://www.bistudio.com/monetization
        donor_level = true;

        //Enable bonus to paychecks if player has server name in steam name
        paycheck_bonus = true;
        paycheck_serverName = "dsc.gg/classic-project";

        class Player {
            //Amount of cash each side starts with
            bank_cop = 40000;
            bank_civ = 40000;
            bank_med = 40000; 

            //Tax that player pays when transferring money from ATM. Tax = Amount * multiplier
            bank_transferTax = .05; 

            //Maximum number of houses a player can own.
            house_limit = 3; 
            
            //The maximum weight allowed without having a backpack
            nobag_maxWeight = 34; 
        };

        class GovFactions {
            //Max Cop Whitelist Level
            cop_maxLevel = 7;

            //Cop Rank Display Names
            cop_rankArray[] = {"No Level","Cadet","Officer","Senior Officer","Corporal","Sergeant","Lieutenant/Captain","Command"};

            //Cop required level to whitelist
            cop_whitelistLevel = 6;

            //Amount of cop departments Default: 7
            cop_departmentsCount = 8;

            //Cop Department Names Default: (None - 0, Doc - 1, Patrol - 2, Highway Patrol - 3, IA - 4, CRT - 5, SWAT - 6, BOI - 7, Command - 8)
            cop_departmentsArray[] = {"No Department","Department of Corrections","Patrol","Highway Patrol","Internal Affairs","Corrections Response Team","Special Weapons and Tactics","Bureau of Investigation","State Command"};

            //Max Medic Whitelist Level
            med_maxLevel = 9;

            //Med Rank Display Names  (None - 0, EMT - 1, Advanced EMT - 2, Probationary Paramedic - 3, Paramedic - 4, Advanced Paramedic - 5, Field Commander - 6, Lieutenant - 7, Captain - 8, Medical Advisor - 9)
            med_rankArray[] = {"No Level","EMT","Advanced EMT","Probationary Paramedic","Paramedic","Advanced Paramedic","Field Commander","Lieutenant","Captain","Medical Advisor"};

            //Medic required level to whitelist
            med_whitelistLevel = 7;

            //Amount of medic departments Default: 1
            med_departmentsCount = 2;

            //Medic Department Names Default: (None - 0, EMS Department - 1)
            med_departmentsArray[] = {"No Department","EMS Department", "Fire Department"};
        };

        class Gangs {
            //Gang creation price
            gang_price = 75000;

            //The base cost for purchasing additional slots in a gang
            gang_upgradeBase = 4000; 

            //Multiplier times off base upgrade price
            gang_upgradeMultiplier = 2.5; 
        };

        class EscapeMenu {
            //Time required to pass before you can click the abort button in the escape menu.
            escapeMenu_timer = 10; 

            //Display the players UID & serverName specified below in the escape menu.
            escapeMenu_displayExtras = true; 

            //Text displayed in the escape menu. Make it short.. around 20 characters.
            escapeMenu_displayText = "Gracias por jugar!"; 
        };
    };

    class Events {
        class SupplyCrate {
            //Enable the supply crate event
            enable_supplyCrate = true;
            
            //Time for drops
            supply_minTime = 30;
            supply_maxTime = 60;

            //Maximum amount of weapons the crate wil spawn
            supply_maxWeapons = 2;

            //Weapon, Attachments, Rarity (using selectRandomWeighted)
            supply_weapons[] = {{"hlc_rifle_bcmjack", {""}},0.1,{"FHQ_arifle_ACR_blk", {""}},0.1,{"FHQ_arifle_Galil_black", {""}},0.1,{"arifle_AKM_F", {""}},0.1,{"FHQ_smg_p90_black", {""}},0.1};   
            supply_items[] = {};
        };

        class Maverick {
            //Enable double xp for talent tree
            enable_doubleXP = false;
        };

        class WeaponTransport {
            // Enable weapon transport mission. 
            enable_weaponTransport = true;

            //Where the transport truck will spawn. 
            spawn_points[] = {"event_transport_spawn1","event_transport_spawn2","event_transport_spawn3"};

            // Transport truck class name.
            truck_class[] = {"O_Truck_03_ammo_f"};

            //The vehicle will be required the be repaired.
            truck_startBroken = true;

            //The amount of rewards it will give you.
            reward_amount = 4;

            //Rewards put the array here. (Can be an VItem, Class Name or Cash)
            cop_reward[] = {{"money",100000}};
            cartel_reward[] = {{"money",50000}, {"arifle_SPAR_01_blk_F",2}, {"hlc_rifle_mk18mod0",2}, {"hlc_smg_mp510",1}, {"hlc_rifle_bcmjack",1}, {"marijuana",20}, {"heroin_processed",20}, {"cocaine_processed",20}};
            mafia_reward[] = {{"money",50000}, {"arifle_SPAR_01_blk_F",2}, {"hlc_rifle_mk18mod0",2}, {"hlc_smg_mp510",1}, {"hlc_rifle_bcmjack",1}, {"codeCracker",1}, {"markedmoney",1}};


            // If you deliver in this time you will get a bonus. (Time in seconds) 
            special_rewardtime = 420;
            special_rewardamount = 6;

        };
    };

    class Shops {
        class Fuel {
            //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
            fuel_cost = 2; 

            //Cost to refuel an empty fuel canister at the fuel station pumps. (Be wary of your buy/sell prices on fuel cans to prevent exploits...)
            fuelCan_refuel = 400; 
        };

        class Vehicle {
            //Vehicles that can only be rented and not purchased
            vehicleShop_rentalOnly[] = {};

            //Vehicle Pruchase Prices (Vehicle Pruchase Price * multiplier)
            vehicle_purchase_multiplier_CIVILIAN = 1.1;
            vehicle_purchase_multiplier_COP = .5;
            vehicle_purchase_multiplier_MEDIC = .75;

            //Vehicle Rental Prices (Vehicle Rental Price * multiplier)
            vehicle_rental_multiplier_CIVILIAN = .80;
            vehicle_rental_multiplier_COP = .5;
            vehicle_rental_multiplier_MEDIC = .55;

            //Vehicle Sell Prices (Vehicle Sell Price * multiplier)
            vehicle_sell_multiplier_CIVILIAN = .5;
            vehicle_sell_multiplier_COP = .5;
            vehicle_sell_multiplier_MEDIC = .5;

            //Chop Shop price for vehicles. TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
            vehicle_chopShop_multiplier = .45;
            
            //Pull from garage cost  (Buy Price * multiplier)
            vehicle_storage_fee_multiplier = .02; 
            
            //Impound Multiplier *Never set higher then cop multipliers above* (Config_vehicle Price * multiplier) 
            vehicle_cop_impound_multiplier = .01; 

            // This will only cover is the vehicle blows up.
            vehicle_insurnace_price_l1 = 0.25;

            // This will include the previous level but also chopping of the vehicle.
            vehicle_insurnace_price_l2 = 0.5;
        };
    };

    CarShopSpawns[] = {"impoundPoint1","civmotorbike","civcar1","civcar2","civcar3","civcar4","civcar5","civcar6","civcar7","civcar8","civcar9","civcar10","civcar11","civcar12","civcar13","civcar14","civcar15","civcar16","civcar17","civcar18","civcar19","civcar20","civcar21","civcarlux1","civcarlux2","civcarlux3","civcarlux4","civtruck1","civtruck2","car_g_1","car_g_2","car_g_3","car_g_4","car_g_5","car_g_6","car_g_7","car_g_8","car_g_9","car_g_10","car_g_11","car_g_12","car_g_13","car_g_14","car_g_15","car_g_16","car_g_17","car_g_18","car_g_19","car_g_20","cop_car_3","cop_car_4","cop_car_5","cop_car_6","cop_car_7","cop_car_9","cop_car_11","cop_car_12","cop_car_13","med_car_1","med_car_2","med_car_3","med_car_4","rebel_car1","rebel_car2"};
    AirShopSpawns[] = {"civair1","civair2","civair3","civair4","copair1","copair2","copair3","copair4","medair1","medair2","airg1","airg2"};
    BoatShopSpawns[] = { "civ_ship_1", "civ_ship_2", "civ_ship_3", "civ_ship_4", "civ_ship_5","cop_ship_1", "cop_ship_6" };

    /* Hunting & Fishing System Configurations */
    animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" }; //Classnames of fish you can catch

    /* Mining */
    MiningAreas[] = {
        "ruby_1",
        "ruby_1",
        "ruby_1",
        "ruby_1",
        "ruby_1",
        "ruby_1",
        "ruby_1",
        "ruby_1",
        "ruby_1",
        "ruby_1",
        "ruby_1"
    };
};

#include "Config_Weapons.hpp"
#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_Vehicles.hpp"
#include "Config_vItems.hpp"
#include "Config_Gather.hpp"
#include "Config_SpawnPoints.hpp"
#include "Config_Process.hpp"
#include "Config_Housing.hpp"
#include "Config_HouseLoot.hpp"
#include "Config_Interactions.hpp"
#include "Config_Phone.hpp"
#include "Config_Jail.hpp"
#include "Config_Gangs.hpp"