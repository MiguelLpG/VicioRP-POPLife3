class AnzusLife_Core_Settings {
  phoneNumberPrefix = "+34";
  phoneNumberLength = 9;	
  phoneNumberStart = 6;
  ServerTag = "Classic Project";	
  allMenus[] = {"AnzusLife_EmergencyMessage","AnzusLife_MessagesEmergency", "AnzusLife_MessagesView", "AnzusLife_MessagesMain", "AnzusLife_ContactView","AnzusLife_ContactEdit","AnzusLife_ContactAdd","AnzusLife_Setup","AnzusLife_ContactsMain","AnzusLife_PhoneWarning","AnzusLife_gangCreate","AnzusLife_gangMain","AnzusLife_KeyChain","AnzusLife_Buttons", "AnzusLife_Settings","AnzusLife_ChangeBackground","AnzusLife_Licenses","AnzusLife_Money","AnzusLife_Inv"};

  BannedWords[] = {
    "Fuck",
    "Shit",
    "Prick",
    "Nigger",
    "Nigga",
    "Jiggaboo",
    "Spic",
   	"Faggot",
   	"Fag",
   	"Bitch",
   	"Paki",
   	"Coon",
   	"Nignog",
   	"Niglet",
   	"Porch Monkey",
   	"PorchMonkey",
   	"Chink",
   	"Gook",
   	"Towelhead",
   	"Spick",
   	"Wetback",
   	"Beaner"
  };
};

class AnzusLife_Backgrounds {
  class test1 {
    image = "\ArmaGamingCore\images\phone\backgrounds\Background_1.paa";
    preview = "\ArmaGamingCore\images\phone\backgrounds\Background_1_preview.paa";
  };
  class test2 {
    image = "\ArmaGamingCore\images\phone\backgrounds\Background_2.paa";
    preview = "\ArmaGamingCore\images\phone\backgrounds\Background_2_preview.paa";
  };
  class test3 {
    image = "\ArmaGamingCore\images\phone\backgrounds\Background_3.paa";
    preview = "\ArmaGamingCore\images\phone\backgrounds\Background_3_preview.paa";
  };
  class test4 {
    image = "\ArmaGamingCore\images\phone\backgrounds\Background_4.paa";
    preview = "\ArmaGamingCore\images\phone\backgrounds\Background_4_preview.paa";
  };
};

class AnzusLife_BottomIcons
{
  class Keys
  {
    displayName = "KEYS";
    onCall = "['AnzusLife_KeyChain'] spawn ANZUS_fnc_changeMenu";
    image = "Keys.paa";
  };
  class Money
  {
    displayName = "MONEY";
    onCall = "['AnzusLife_Money'] spawn ANZUS_fnc_changeMenu";
    image = "money.paa";
  };
  class Sync
  {
    displayName = "SYNC DATA";
    onCall = "[] call ANZUS_fnc_syncData";
    image = "sync.paa";
  };
  class Inventory
  {
    displayName = "INVENTORY";
    onCall = "['AnzusLife_Inv'] spawn ANZUS_fnc_changeMenu";
    image = "Inventory.paa";
  };
};

class AnzusLife_Apps
{
  class Licenses
  {
    displayName = "LICENSES";
    onCall = "['AnzusLife_Licenses'] spawn ANZUS_fnc_changeMenu";
    image = "licenses.paa";
    conditions = "";
  };
  class Settings
  {
    displayName = "SETTINGS";
    onCall = "['AnzusLife_Settings'] spawn ANZUS_fnc_changeMenu";
    image = "settings.paa";
    conditions = "";
  };
  class GangMenu
  {
    displayName = "GANG MENU";
    onCall = "[] spawn ANZUS_fnc_LoadGangMenu";
    image = "gang.paa";
    conditions = "playerSide isEqualTo Civilian";
  };
  class GangProgress
  {
    displayName = "GANG TREE";
    onCall = "[] call AnzusLife_OpenGangPicker;";
    image = "gangT.paa";
    conditions = "playerSide isEqualTo civilian";
  };
  class Contacts
  {
    displayName = "CONTACTS";
    onCall = "['AnzusLife_ContactsMain'] spawn ANZUS_fnc_changeMenu";
    image = "Contacts.paa";
    conditions = "";
  };
  class Messages
  {
    displayName = "MESSAGES";
    onCall = "['AnzusLife_MessagesMain'] spawn ANZUS_fnc_changeMenu";
    image = "Messages.paa";
    conditions = "";
  };
  class EmergencyMessage
  {
    displayName = "DISPATCH";
    onCall = "['AnzusLife_MessagesEmergency'] spawn ANZUS_fnc_changeMenu";
    image = "999_messaging.paa";
    conditions = "!(playerSide isEqualTo Civilian)";
  };
  class EmergencyMessageTo
  {
    displayName = "999";
    onCall = "['AnzusLife_EmergencyMessage'] spawn ANZUS_fnc_changeMenu";
    image = "999_dispatch.paa";
    conditions = "";
  };
  class SkillMenu
  {
    displayName = "SKILLS";
    onCall = "createDialog ""TTM_GUI_RscDisplayTalentOverview"";";
    image = "skills.paa";
    conditions = "";
  };
  class VIP
  {
    displayName = "UID Color";
    onCall = "[] call AnzusLife_VIPNametagMenu;";
    image = "VIP.paa";
    conditions = "";
  };
  class Checkpoint
  {
    displayName = "BARRIER";
    onCall = "[] call AnzusLife_CheckpointBuilder;";
    image = "nav.paa";
    conditions = "playerSide isEqualTo WEST";
  };
  class warrants
  {
    displayName = "WARRANTS";
    onCall = "closeDialog 0; [] call ANZUS_fnc_openWarrants;";
    image = "wanted.paa";
    conditions = "playerSide isEqualTo WEST";
  };
  class majorcrime
  {
    displayName = "MC ALERT";
    onCall = "closeDialog 0; [] spawn AnzusLife_MajorCrimeAlert;";
    image = "gang.paa";
    conditions = "playerSide isEqualTo WEST";
  };
  class Navigation
  {
    displayName = "NAVIGATION";
    onCall = "closeDialog 0; [] spawn ANZUS_fnc_markerMenu;";
    image = "nav.paa";
    conditions = "";
  };
};

class AnzusLife_onLoads
{
  class AnzusLife_Buttons
  {
    onload = "[] spawn ANZUS_fnc_loadMainButtons";
  };
  class AnzusLife_ChangeBackground
  {
    onload = "[] spawn ANZUS_fnc_loadBackgroundSelection";
  };
  class AnzusLife_Money
  {
    onload = "[] call ANZUS_fnc_LoadMoneyMenu";
  };

  class AnzusLife_Inv
  {
    onload = "[] call ANZUS_fnc_LoadInventory";
  };

  class AnzusLife_Licenses
  {
    onload = "[] call ANZUS_fnc_LoadLicenses";
  };

  class AnzusLife_Settings
  {
    onload = "[] call ANZUS_fnc_loadSettings";
  };

  class AnzusLife_KeyChain
  {
    onload = "[] call ANZUS_fnc_LoadKeyChain";
  };

  class AnzusLife_ContactsMain
  {
    onload = "[] call ANZUS_fnc_LoadContacts";
  };

  class AnzusLife_MessagesMain
  {
    onload = "[] spawn ANZUS_fnc_LoadMessageList";
  };

  class AnzusLife_MessagesEmergency
  {
    onLoad = "[] spawn ANZUS_fnc_OpenEmergencyMessage";
  };
};