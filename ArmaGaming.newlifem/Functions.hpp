class Life_Client_Core {
    tag = "ANZUS";

    class Actions {
        file = "core\actions";
        class arrestAction {};
        class buyLicense {};
        class catchFish {};
        class dropFishingNet {};
        class escortAction {};
        class gather {};
        class healHospital {};
        class impoundAction {};
        class mine {};
        class packupSpikes {};
        class pickupItem {};
        class pickupMoney {};
        class postBail {};
        class processAction {};
        class pulloutAction {};
        class putInCar {};
        class removeContainer {};
        class repairTruck {};
        class restrainAction {};
        class robAction {};
        class searchAction {};
        class searchVehAction {};
        class seizePlayerAction {};
        class stopEscorting {};
        class storeVehicle {};
        class surrender {};
        class ticketAction {};
        class unrestrain {};
        class gpsTracker {};
        class robShops {};
        class refillMags {};
        class unflip {};
        class breakDownHouse {};
        class houseCrateInit {};
        class lockpickChest {};
        class launderMoney {};
		class quickBar {};
    };

    class Civilian {
        file = "core\civilian";
        class civLoadout {};
        class jail {};
        class jailMe {};
        class paroleMe {};
        class knockedOut {};
        class knockoutAction {};
        class ragdoll {};
        class removeLicenses {};
        class robPerson {};
        class robReceive {};
        class tazed {};
        class tazedHit {};
        class gagAction {};
		class gagged {};
		class removeGagAction {};
		class tieingAction {};
		class tieingActionb {};
		class tieingb {};
		class untie {};
		class untieb {};
    };

    class Cop {
        file = "core\cop";
        class arrestDialog_Arrest {};
        class arrestDialog_Parole {};
        class backupCall {};
        class bountyReceive {};
        class callBackup {};
        class containerInvSearch {};
        class crashTackled {};
        class copLights {};
        class copLoadout {};
        class copSearch {};
        class copSiren {};
        class licenseCheck {};
        class licensesRead {};
        class questionDealer {};
        class radar {};
        class removeWeaponAction {};
        class restrain {};
        class searchClient {};
        class setFreq {};
        class seizeWeapon {};
        class seizeClient {};
        class removeClothing {};
        class spikeStripEffect {};
        class tackleAction {};
        class ticketGive {};
        class ticketPrompt {};
        class vehInvSearch {};
        class openThreatMenu {};
        class changeThreat {};
        class openArrestMenu {};
        class flashbang {};
    };

    class Dialog_Controls {
        file = "dialog\function";
        class bankDeposit {};
        class bankDepositAll {};
        class bankTransfer {};
        class bankWithdraw {};
        class displayHandler {};
        class garageLBChange {};
        class guiPrompt {};
        class impoundMenu {};
        class progressBar {};
        class safeFix {};
        class sellGarage {};
        class setMapPosition {};
        class spawnCamera {};
        class spawnConfirm {};
        class spawnMenu {};
        class unimpound {};
        class wireTransfer {};
    };
    class DMV {
        file = "core\dmv";
        class licenseTestStart {};
        class questionResults {};
    };

    class Quests {
        file = "core\quests";
        class relic1 {};
        class relic2 {};
        class relic3 {};
        class relic4 {};
        class relicReward {};
        class relicRewardFed {};
        class destroySatellite {};
        class satelliteReward {};
        class gatherResearch {};
    };

    class Gangs {
        file = "core\gangs";
        class gangDisbanded {};
        class gangInvite {};
        class gangInvitePlayer {};
        class gangKick {};
        class gangLeave {};
        class gangNewLeader {};
        class gangUpgrade {};
        class initGang {};
        class gangOpen {};
        class gangGetRank {};
    };

    class Housing {
        file = "core\housing";
        class buyHouse {};
        class copBreakDoor {};
        class copHouseOwner {};
        class garageRefund {};
        class getBuildingPositions {};
        class initHouses {};
        class lightHouse {};
        class lightHouseAction {};
        class lockHouse {};
        class lockupHouse {};
        class placeContainer {};
        class PlayerInBuilding {};
        class raidHouse {};
        class sellHouse {};
        class ownedHousesResponse {};
        class ownedHouses {};
    };

    class Items {
        file = "core\items";
        class bandage {};
        class cocaine {};
        class cprKit {};
        class heroin {};
        class morphine {};
        class jerrycanRefuel {};
        class jerryRefuel {};
        class lockpick {};
        class placestorage {};
        class spikeStrip {};
        class storageBox {};
        class weed {};
        class engineDisable {};
    };

    class Medical_System {
        file = "core\medical";
        class antiCombatRevive {};
        class blackOutIn {};
        class deathScreen {};
        class killfeed {};
        class medicLoadout {};
        class medicRequest {};
        class medicMarkers {};
        class medicSiren {};
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class requestMedic {};
        class respawned {};
        class revived {};
        class revivePlayer {};
        class cprRevived {};
    };

    class Shops {
        file = "core\shops";
        class 3dPreviewDisplay {};
        class 3dPreviewExit {};
        class 3dPreviewInit {};
        class 3dButton {};
        class atmMenu {};
        class buyClothes {};
        class chopShopMenu {};
        class chopShopSelection {};
        class chopShopSell {};
        class clothingFilter {};
        class clothingMenu {};
        class fuelLBchange {};
        class fuelStatOpen {};
        class levelCheck {};
        class vehicleShopBuy {};
        class vehicleShopLBChange {};
        class vehicleShopMenu {};
        class virt_buy {};
        class virt_menu {};
        class virt_sell {};
        class virt_update {};
        class weaponShopFill {};
        class weaponShopMenu {};
        class weaponShopCompatible {};
        class weaponShopIndex {};
    };

    class Vehicle {
        file = "core\vehicle";
        class addVehicle2Chain {};
        class colorVehicle {};
        class FuelRefuelcar {};
        class lockVehicle {};
        class openInventory {};
        class vehiclecolor3DRefresh {};
        class vehicleOwners {};
        class vehicleWeight {};
        class vehInventory {};
        class vehStoreItem {};
        class vehTakeItem {};
        class insureVehicle {};
    };

    class Phone
    {
      file = "core\phone";
      class s_onSliderChange {};
      class changeMenu {};
      class loadBackgroundSelection {};
      class loadMainButtons {};
      class openPSIPhone {};
      class sendWarning {};
      class StartSetup {};
      class ClearPlaceholder {};
      class LoadGangMenu {};
      class GangComboChanged {};
      class LoadInventory {};
      class UseItem {};
      class GiveItem {};
      class GangCreateGang {};
      class GangCreated {};
      class GiveItemReturn {};
      class ReceiveItem {};
      class RemoveItem {};
      class LoadLicenses {};
      class LoadKeyChain {};
      class GiveKey {};
      class GetKey {};
      class LoadMoneyMenu {};
      class GiveMoney {};
      class ReceiveMoney {};
      class loadSettings {};
      class SettingsUpdateViewDistance {};
      class SettingsChangeBackground {};
      class BackgroundSlider {};
      class UpdateToggle {};
      class LoadContacts {};
      class ContactChange {};
      class LoadContact {};
      class EditContact {};
      class SetupGetNumbers {};
      class SetupSetNumber {};
      class SetupSetName {};
      class SetupQueryNumberReturn {};
      class LoadMessages {};
      class LoadMessageList {};
      class CheckSender {};
      class SendMessage {};
      class ReceiveMessage {};
      class OpenEmergencyMessage {};
      class LoadNewMenu {};
      class deleteOldMenu {};
      class updateViewDistance {};
      class bannedWords {};
      class DeleteContact {};
      class SendEMessage {};
      class ReceiveEMessage {};
      class isNumber {};
      class contactCheck {};
    };

    class warrants {
        file = "core\warrants";
        class addWarrants {};
        class issueWarrant {};
        class openWarrants {};
        class receiveWarrants {};
        class updateWarrants {};
    };
};

class LoSantosYT {
    tag = "lsyt"

    class generalRob {
        file = "LoSantosYT\Robos";
        class puerta {};
    };

    class Robar {
        file = "LoSantosYT\Robos\robos";
        class majorCrimes;
        class RobData;
        class Oro;
    };
    
    class Huella {
        file = "LoSantosYT\Robos\Huella\Scripts";
        class contador {};
        class finalizar{};
        class huella {};
        class rotarImg {};
    };
    
    class Taladro{
        file = "LoSantosYT\Robos\Taladro";
        class taladro {};  
    };
};