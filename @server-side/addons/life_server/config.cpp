class DefaultEventhandlers;
class CfgPatches {
    class life_server {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "life_server.pbo";
        author = "Tonic";
    };
};

class CfgFunctions {
    class initFunctions
        {
            tag = "TON";
            class Client
            {
                file = "\life_server\Client";
                class initFunctions{};
            };
        };

    class Life_System {
        tag = "ANZUS";
        class warrants {
            file = "\life_server\Functions\warrants";
            class addWarrantsServ {};
            class delWarrantsServ {};
        };

        class MySQL
        {
            file = "\life_server\Functions\MySQL";
            class numberSafe {};
            class mresArray {};
            class queryRequest{};
            class asyncCall{};
            class insertRequest{};
            class updateRequestServer {};
            class mresToArray {};
            class insertVehicle {};
            class bool {};
            class mresString {};
            class updatePartialServer {};
        };
        
        class Jail_Sys {
            file = "\life_server\Functions\Jail";
            class jailSys {};
			class jailTimer {};
			class jailPlayer {};
            class jailSaveTime {};
        };

        class Client_Code {
            file = "\life_server\Functions\Client";
        };

        class Phone {
          file = "\life_server\Functions\Phone";
          class Server_MessageRelay {};
          class SetupQueryNumber {};
        };

        class Custom {
          file = "\life_server\Functions\Custom";
          class weaponMission {};
        };
    };

    class TON_System {
        tag = "TON";
        class Systems {
            file = "\life_server\Functions\Systems";
            class cleanup {};
            class getID {};
            class entityRespawned {};
            class vehicleCreate {};
            class spawnVehicle {};
            class getVehicles {};
            class vehicleStore {};
            class vehicleDelete {};
            class spikeStrip {};
            class transferOwnership {};
            class chopShopSell {};
            class clientDisconnect {};
            class cleanupRequest {};
            class keyManagement {};
            class vehicleUpdate {};
            class recupkeyforHC {};
            class terrainSort {};
            class serverVehicleStore {};
            class insureVehicle {};
        };

        class Housing {
            file = "\life_server\Functions\Housing";
            class addHouse {};
            class addContainer {};
            class deleteDBContainer {};
            class fetchPlayerHouses {};
            class initHouses {};
            class sellHouse {};
            class sellHouseContainer {};
            class updateHouseContainers {};
            class updateHouseTrunk {};
            class houseCleanup {};
            class houseGarage {};
        };

        class Smartphone
        {
            file = "\life_server\Functions\Smartphone";
            class handleMessages {};
            class msgRequest {};
        };

        class Gangs {
            file = "\life_server\Functions\Gangs";
            class insertGang {};
            class queryPlayerGang {};
            class removeGang {};
            class updateGang {};
        };

        class Actions {
            file = "\life_server\Functions\Actions";
            class pickupAction {};
        };
    };
};