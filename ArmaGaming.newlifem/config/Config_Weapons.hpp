/*
/*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Description): Description of item
*        2: SCALAR (Buy price): Cost of item
*        3: STRING (Conditions): Same as above conditions string
*        4: STRING (Nickname): Nickname that will appear purely in the shop dialog
*/

class WeaponShops {
  class cop {
    name = "Cop Weapon Shop";
    conditions = "call life_coplevel >= 1";
    side = "cop";
    weapons[] = {
      { "HandGrenade_Stone", "Blind your suspects and get the upper hand.", 3500, "call life_copdept in [5,6,8]", "Flashbang"},
      { "SmokeShellBlue", "", 2500, "call life_copdept in [6,8]", ""},
      { "SmokeShellRed", "", 2500, "call life_copdept in [6,8]", ""},
      { "SmokeShellGreen", "", 2500, "call life_copdept in [6,8]", ""},
      { "crow_x26", "", 500, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "crow_x26_blk_yellow", "", 500, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "crow_x26_yellow", "", 500, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "crow_x26_green", "", 500, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_m9", "", 850, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_g19", "", 850, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_gsh18", "", 850, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "AG_kimber_nw", "", 850, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_cz75", "", 850, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_usp", "", 850, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "hlc_Pistol_Mk25", "", 850, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_fn57", "", 850, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_m1911", "", 850, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "hlc_pistol_P226US", "", 850, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_bullb", "", 850, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "tRH_tec9", "", 850, "call life_coplevel >= 2 || call life_copdept in [7,8]", ""},
      { "hgun_Pistol_heavy_01_green_F", "", 850, "call life_coplevel >= 2 || call life_copdept in [6,8]", ""},
      { "RH_sw659", "", 850, "call life_coplevel >= 2 || call life_copdept in [6,8]", ""},
      //{ "H_uspm", "", 850, "call life_coplevel >= 5 || call life_copdept in [6,8]", ""},
      //{ "anzus_police_baton ", "", 500, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "AG_TheComany_Winchester", "", 3000, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_smg_mp5a4", "", 3000, "call life_coplevel >= 1 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "A3F_P_Shield_Demo", "", 2000, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "Winchester1897_02_NoDamage", "", 3000, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_hk53RAS", "", 6000, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_M4", "", 6500, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_M4afg_SM", "", 6500, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_MK18afgBLK_SM", "", 6500, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_m4", "", 6500, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_M4_moe_b", "", 6500, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_M4MOE_OD_SM", "", 6500, "call life_coplevel >= 3 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_HK416CUSTOMCQBafgB", "", 6500, "call life_coplevel >= 3 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_MK18afgBLK", "", 6500, "call life_coplevel >= 3 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_AAC_MPW_12_Black", "", 6500, "call life_coplevel >= 4 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_hk33a2RIS", "", 6500, "call life_coplevel >= 4 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_416D145", "", 6500, "call life_coplevel >= 4 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_MK18afg_SM", "", 6500, "call life_coplevel >= 4 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_Hk416", "", 6500, "call life_coplevel >= 4 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "Winchester1897_01", "", 3000, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_ACRREMAFGCQBblk_N", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_G36TAC", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_416D20", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_M16A4", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_M27IAR", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_M4MOE_Tan", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_ACRblk", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_ACR_Carb_black", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_rifle_SG551LB_RIS", "", 6500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_M4A6", "", 8500, "call life_coplevel >= 5 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "Winchester1897_01", "", 3000, "call life_coplevel >= 2 || call life_copdept in [7]", ""},
      { "hlc_smg_mp5k_PDW", "", 3000, "call life_coplevel >= 2 || call life_copdept in [7,8]", ""},
      { "hlc_smg_mp5sd6", "", 3000, "call life_coplevel >= 2 || call life_copdept in [7,8]", ""},
      { "RH_Hk416c", "", 6500, "call life_coplevel >= 2 || call life_copdept in [7,8]", ""},
      { "hlc_rifle_hk53RAS", "", 6500, "call life_coplevel >= 2 || call life_copdept in [7,8]", ""},
      { "hlc_rifle_416N", "", 6500, "call life_coplevel >= 2 || call life_copdept in [7,8]", ""},
      { "hlc_wp_XM177E2", "", 6500, "call life_coplevel >= 2 || call life_copdept in [6,7,8]", ""},
      //{ "A3F_P_Shield", "", 5000, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "hlc_rifle_hk33ka3", "", 6500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "hlc_rifle_416D145C", "", 6500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "SMA_ACRMOE_Blk", "", 6500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "SMA_MK18MOEBLKTAN_SM", "", 6500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      //{ "MA_HK416afg", "", 6500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "RH_Mk12mod1", "", 6500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "hlc_rifle_bcmjack", "", 6500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "hlc_rifle_SG551LB_TAC", "", 6500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "hlc_rifle_samr2", "", 8500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "RH_M4A6", "", 8500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      //{ "lc_rifle_g3a3ris", "", 8500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "RH_m16a6", "", 8500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "hlc_rifle_M21_Rail", "", 8500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "RH_Mk11", "", 8500, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "hlc_rifle_FN3011Modern", "", 12000, "call life_coplevel >= 1 || call life_copdept in [5,6,8]", ""},
      { "SMA_M4afgSTOCK", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "SMA_AAC_MPW_16_Black", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "SMA_ACRREMMOEblk", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_RU556", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_bcmblackjack", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_G36TAC", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_416D20", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "SMA_L85RIS", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "SMA_Mk16_black", "", 6500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_ACR68_Carb_black", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_PSG1A1_RIS", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_Bushmaster300", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "RH_hb_b", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_ACR68_Carb_black", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "RH_m110", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "RH_SR25EC", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_M14dmr_Rail", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_stgw57_RIS", "", 8500, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "hlc_rifle_awMagnum_OD_ghillie", "", 12000, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "AG_rifle_awcovert_BL", "", 12000, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      //{ "LAGO_KU98K", "", 15000, "call life_coplevel >= 1 || call life_copdept in [6,8]", ""},
      { "srifle_LRR_F", "", 20000, "call life_coplevel >= 5 || call life_copdept in [6,8]", ""},
      { "sma_minimi_mk3_762tlb", "", 20000, "call life_coplevel >= 5 || call life_copdept in [6,8]", ""},
      { "arifle_SDAR_F", "", 7000, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      //{ "ANZUS_Harpon", "", 2500, "call life_coplevel >= 2 || call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "launch_RPG32_green_F", "", 35000, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      //{ "XZ_CamRecorder_2", "", 3000, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      { "anzus_shovel", "", 69, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      { "hlc_lmg_mg42kws_b", "", 20000, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      { "hlc_lmg_m60", "", 25000, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      { "HLC_wp_M134Painless", "", 80000, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      { "hlc_rifle_BAB", "", 6500, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      { "hlc_rifle_416D165_wdl", "", 6500, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      { "AG_SMA_AAC_MPW_12_OD_Gold", "", 10000, "call life_coplevel >= 7 || call life_copdept in [8]", ""},
      { "ANZUS_Arbalete", "", 6500, "call life_coplevel >= 7 || call life_copdept in [8]", ""}
    };
    
    magazines[] = {
      { "X26_Cartridge_Blank", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "X26_Cartridge_Blank_Yellow", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "X26_Cartridge", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "X26_Cartridge_Yellow", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_15Rnd_9x19_M9", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_17Rnd_9x19_g17", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_18Rnd_9x19_gsh", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_7Rnd_45cal_m1911", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_16Rnd_9x19_CZ", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_12Rnd_45cal_usp", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_15Rnd_9x19_B_P226", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_20Rnd_57x28_FN", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_7Rnd_45cal_m1911", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_6Rnd_454_Mag", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_32Rnd_9x19_tec", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "11Rnd_45ACP_Mag", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_14Rnd_9x19_sw", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_16Rnd_40cal_usp", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "30Rnd_9x21_Mag ", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "6Rnd_00_Buckshot_Magazine", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "6Rnd_Slug_Magazine", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "6Rnd_00_Buckshot_beanbag_Magazine", "", 10, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_30rnd_556x45_b_HK33", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_30rnd_556x45_EPR", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_30Rnd_556x45_M855A1", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_30Rnd_556x45_M855A1", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_30Rnd_762x35_BLK_EPR", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_30rnd_556x45_b_HK33", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_30Rnd_556x45_EPR_sg550", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_30Rnd_68x43_FMJ", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_30rnd_556x45_EPR", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_30Rnd_9x19_B_MP5", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_30Rnd_556x45_Mk262", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_20rnd_762x51_b_G3", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_20Rnd_762x51_B_M14", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RH_20Rnd_762x51_M80A1", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_10Rnd_762x51_B_fal", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_30Rnd_762x35_BLK_EPR", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_30Rnd_68x43_SPC_FMJ", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "29rnd_300BLK_STANAG", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_30rnd_556x45_EPR_G36", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "lc_30rnd_68x43_FMJ", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_24Rnd_75x55_B_stgw", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "hlc_5rnd_300WM_FMJ_AWM", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "KU98K_MAG", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "7Rnd_408_Mag", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_150Rnd_762_M80A1", "", 2000, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "Fleche_Harpon", "", 15, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "XZ_CamRecorder_Mag", "", 1, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "SMA_30Rnd_762x35_BLK_EPR", "", 50, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "5Rnd_Fleche", "", 5, "call life_copdept in [1,2,3,4,5,6,7,8]", ""},
      { "RPG32_F", "", 4000, "call life_copdept in [8]", ""},
      { "hlc_50Rnd_792x57_B_MG42", "", 2000, "call life_copdept in [8]", ""},
      { "hlc_100Rnd_762x51_M_M60E4", "", 2500, "call life_copdept in [8]", ""},
      { "hlc_500rnd_762x51_Belt", "", 3000, "call life_copdept in [8]", ""},
	    { "UGL_FlareCIR_F", "", 100, "call life_copdept in [6,7,8]", ""},
	    { "UGL_FlareYellow_F", "", 100, "call life_copdept in [6,7,8]", ""},
	    { "UGL_FlareRed_F", "", 100, "call life_copdept in [6,7,8]", ""},
	    { "UGL_FlareWhite_F", "", 100, "call life_copdept in [6,7,8]", ""},
	    { "UGL_FlareGreen_F", "", 100, "call life_copdept in [6,7,8]", ""},
	    { "1Rnd_SmokeGreen_Grenade_shell", "", 100, "call life_copdept in [8]", ""},
	    { "1Rnd_SmokeBlue_Grenade_shell", "", 100, "call life_copdept in [8]", ""},
	    { "1Rnd_SmokeRed_Grenade_shell", "", 100, "call life_copdept in [8]", ""}
    };

    items[] = {
      {"Binocular", "Use these to see stuff at furthur distances", 250, "call life_coplevel >= 1", ""},
      {"Rangefinder", "Use these to see stuff at furthur distances", 250, "call life_coplevel >= 5 && call life_copdept in [6,7,8]", ""},
      {"ItemGPS", "Use this to not get lost", 500, "call life_coplevel >= 1", ""},
      {"ItemMap", "Use this to find the local shops", 10, "call life_coplevel >= 1", ""},
      {"ItemCompass", "Use this to find directions", 10, "call life_coplevel >= 1", ""},
      {"RoleplayRadio", "Use this to communicate from distance", 15, "call life_coplevel >= 1", ""}
    };

    attachments[] = {
	  { "RH_cmore", "", 200, "true", ""},
	  { "RH_eotech553", "", 200, "true", ""},
	  { "KA_FNP45_shield2", "", 200, "true", ""},
	  { "KA_red", "", 200, "true", ""},
	  { "RH_barska_rds", "", 200, "true", ""},
	  { "SMA_BARSKA", "", 200, "true", ""},
	  { "RH_ta31rmr", "", 200, "true", ""},
	  { "SMA_ELCAN_SPECTER_RDS", "", 200, "true", ""},
	  { "acc_flashlight", "", 200, "true", ""},
      { "optic_Hamr", "", 50, "true", ""},
      { "optic_MRCO", "", 50, "true", ""},
      { "optic_Arco_blk_F", "", 50, "true", ""},
      { "optic_ERCO_blk_F", "", 50, "true", ""},
      { "optic_MRD", "", 50, "true", ""},
      { "HLC_optic228_ATT", "", 20, "true", ""},
      { "HLC_optic228_VTAC", "", 20, "true", ""},
      { "HLC_Optic_Romeo1_RX", "", 50, "true", ""},
      { "HLC_optic228_stavenhagen", "", 50, "true", ""},
      { "hlc_optic_ZF95_3011", "", 50, "true", ""},
      { "acc_flashlight", "", 50, "true", ""},
	  { "RH_ta31rmr_2D", "", 100, "call life_coplevel >= 3 && call life_copdept in [6,7,8]", ""},
	  { "RH_ta648", "", 100, "call life_coplevel >= 3 && call life_copdept in [6,7,8]", ""},
	  { "SMA_SFPEQ_M4TOP_BLK", "", 100, "call life_coplevel >= 3 && call life_copdept in [6,7,8]", ""},
	  { "KA_FNP45_shield2", "", 100, "call life_coplevel >= 3 && call life_copdept in [6,7,8]", ""},
	  { "KA_red", "", 100, "call life_coplevel >= 3 && call life_copdept in [6,7,8]", ""},
      { "hlc_optic_LeupoldM3A_3011", "", 100, "call life_coplevel >= 5 && call life_copdept in [7,8]", ""},
      { "optic_LRPS", "", 100, "call life_coplevel >= 5 && call life_copdept in [6,7,8]", ""}
    };
  };

  class gun {
    name = "Metropolis Firearms";
    conditions = "license_civ_gun || call life_copdept in [6,7,8]";
    side = "civ";
    weapons[] = {
		{ "FHQ_hgun_ColtM45_Black", "", 11000, "true", ""},
        { "hlc_Pistol_M11", "", 11600, "true", ""},
        { "hlc_pistol_Mk25", "", 11400, "true", ""},
        { "hlc_pistol_P226WestGerman", "", 13400, "true", ""},
        { "hlc_Pistol_P228", "", 13400, "true", ""},
        { "hlc_Pistol_M11A1", "", 13600, "true", ""},
        { "hlc_Pistol_M11A1D", "", 13600, "true", ""},
        { "hlc_pistol_Mk25D", "", 13500, "true", ""},
        { "hlc_pistol_Mk25TR", "", 13500, "true", ""},
		    { "hlc_pistol_P226R_357Combat", "", 13500, "true", ""},
		    { "hlc_pistol_P226R_40Combat", "", 13500, "true", ""},
  	    { "hgun_Pistol_heavy_01_F", "", 13500, "true", ""},
  	    { "hgun_Rook40_F", "", 13500, "true", ""},
        { "hlc_rifle_FN3011", "", 80000, "true", ""},
        { "hlc_rifle_FN3011_WDL", "", 80000, "true", ""},
        { "hlc_rifle_M1903A1", "", 30000, "true", ""},
		{ "RH_m9", "", 13400, "true", ""},
		{ "RH_m9c", "", 13400, "true", ""},
		{ "KA_Px4", "", 13400, "true", ""},
		{ "KA_Px4_Black", "", 13400, "true", ""},
		{ "RH_python", "", 25000, "true", ""},
		{ "RH_Deagleg", "", 50000, "true", ""},
		{ "RH_Deaglem", "", 50000, "true", ""},
		{ "RH_Deagles", "", 50000, "true", ""},
		{ "RH_fn57", "", 13400, "true", ""},
		{ "RH_fn57_t", "", 13400, "true", ""},
		{ "RH_g17", "", 13400, "true", ""},
		{ "RH_g19", "", 13400, "true", ""},
		{ "KA_Glock_17_Single", "", 13400, "true", ""},
		{ "KA_Glock_18_Single", "", 13400, "true", ""},
		{ "RH_gsh18", "", 13400, "true", ""},
		{ "RH_kimber", "", 13400, "true", ""},
		{ "RH_m1911", "", 13400, "true", ""},
		{ "RH_mak", "", 13400, "true", ""},
		{ "RH_mp412", "", 13400, "true", ""},
		{ "arifle_KA_SKS_F", "", 50000, "true", ""},
		{ "KA_crossbow_black", "", 25000, "true", ""}
    };
      
    magazines[] = {
		{ "hlc_12Rnd_357SIG_B_P226", "", 40, "true", ""},
		{ "hlc_12Rnd_40SW_B_P226", "", 40, "true", ""},
		{ "FHQ_7Rnd_45ACP_Mag", "", 30, "true", ""},
        { "hlc_13Rnd_9x19_B_P228", "", 30, "true", ""},
        { "hlc_15Rnd_9x19_B_P226", "", 40, "true", ""},
        { "8Rnd_45GAP_Magazine", "", 50, "true", ""},
        { "6Rnd_357M_Magazine", "", 100, "true", ""},
        { "hlc_30rnd_556x45_EPR", "", 30, "true", ""},
  	    { "11Rnd_45ACP_Mag", "", 30, "true", ""},
  	    { "16Rnd_9x21_Mag", "", 30, "true", ""},
		{ "hlc_5rnd_3006_1903", "", 50, "true", ""},
		{ "RH_15Rnd_9x19_M9", "", 40, "true", ""},
		{ "KA_Px4_17Rnd_9x19_FMJ_Mag", "", 40, "true", ""},
		{ "RH_6Rnd_357_Mag", "", 40, "true", ""},
		{ "RH_7Rnd_50_AE", "", 40, "true", ""},
		{ "RH_20Rnd_57x28_FN", "", 40, "true", ""},
		{ "RH_17Rnd_9x19_g17", "", 40, "true", ""},
		{ "KA_17Rnd_9x19_Mag", "", 40, "true", ""},
		{ "RH_18Rnd_9x19_gsh", "", 40, "true", ""},
		{ "RH_7Rnd_45cal_m1911", "", 40, "true", ""},
		{ "RH_8Rnd_9x18_Mak", "", 40, "true", ""},
		{ "RH_6Rnd_357_Mag", "", 40, "true", ""},
		{ "10Rnd_M43_762x39_Ball", "", 100, "true", ""},
		{ "KA_arrow_mag", "", 40, "true", ""},
		{ "hlc_10Rnd_762x51_B_fal", "", 100, "true", ""}
    };

    attachments[] = {
        { "optic_Yorris", "", 50, "true", ""},
		{ "optic_Aco_smg", "", 50, "true", ""},
        { "optic_MRD", "", 50, "true", ""},
        { "HLC_optic228_ATT", "", 20, "true", ""},
        { "HLC_optic228_VTAC", "", 20, "true", ""},
        { "HLC_Optic_Romeo1_RX", "", 50, "true", ""},
        { "HLC_optic228_stavenhagen", "", 50, "true", ""},
		{ "hlc_optic_ANGSCHUTZ", "", 20, "true", ""},
		{ "hlc_optic_ZF95_3011", "", 400, "true", ""},
		{ "hlc_optic_FNSTANAG2D", "", 200, "true", ""}
    };
    items[] = {
  		{ "RoleplayRadio", "Use this to communicate from distance", 150, "true", ""},
  		{ "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""},
  		{ "ItemGPS", "Use this to not get lost", 500, "true", ""},
  		{ "ItemMap", "Use this to find the local shops", 10, "true", ""},
  		{ "ItemCompass", "Use this to find directions", 10, "true", ""}
   	};
  };

  class hunting {
    name = "Kamdan Hunting Store";
    conditions = "";
    side = "civ";
    weapons[] = {
      {
                "ANZUS_Harpon",
                "",
                10000,
                "true",
                ""},
      {
                "ANZUS_Arbalete",
                "",
                10000,
                "true",
                ""},
      {
                "hlc_rifle_M1903A1",
                "",
                24000,
                "true",
                ""},
      {
                "hlc_rifle_FN3011",
                "",
                35000,
                "true",
                ""},
      {
                "hlc_rifle_FN3011Modern",
                "",
                45000,
                "true",
                ""},
      {
                "hlc_rifle_FN3011Modern_camo",
                "",
                45000,
                "true",
                ""},
      {
                "hlc_rifle_FN3011Tactical",
                "",
                75000,
                "true",
                ""},
      {
                "AG_20rnd_762x51_Universal",
                "",
                100,
                "true",
                ""}
    };
    magazines[] = {
      {
                "5Rnd_Fleche",
                "",
                25,
                "true",
                ""},
      {
                "Fleche_Harpon",
                "",
                25,
                "true",
                ""},
      {
                "hlc_13Rnd_9x19_B_P228",
                "",
                25,
                "true",
                ""},
      {
                "hlc_15Rnd_9x19_B_P226",
                "",
                25,
                "true",
                ""},
      {
                "16Rnd_9x21_Mag",
                "",
                25,
                "true",
                ""},
      {
                "nonlethal_swing ",
                "",
                100,
                "true",
                ""},
      {
                "hlc_5rnd_3006_1903",
                "",
                25,
                "true",
                ""}
    };
    attachments[] = {
      {
                "optic_Yorris",
                "",
                500,
                "true",
                ""},
      {
                "acc_flashlight",
                "",
                200,
                "true",
                ""},
      {
                "HLC_optic_DocterR",
                "",
                500,
                "true",
                ""},
      {
                "optic_aco",
                "",
                500,
                "true",
                ""},
      {
                "optic_Arco_blk_F",
                "",
                2000,
                "true",
                ""},
      {
                "optic_ERCO_blk_F",
                "",
                2000,
                "true",
                ""},
      {
                "optic_hamr",
                "",
                2000,
                "true",
                ""},
      {
                "hlc_optic_HensoldtZO_lo_Docter",
                "",
                2000,
                "true",
                ""},
      {
                "acc_flashlight",
                "",
                500,
                "true",
                ""},
      {
                "SMA_ELCAN_SPECTER",
                "",
                2500,
                "TRUE",
                ""},
      {
                "SMA_ELCAN_SPECTER_RDS",
                "",
                1500,
                "TRUE",
                ""},
      {
                "SMA_MICRO_T2",
                "",
                1500,
                "TRUE",
                ""},
      {
                "SMA_MICRO_T2_3XDOWN",
                "",
                1500,
                "TRUE",
                ""},
      {
                "SMA_MICRO_T2_LM",
                "",
                1500,
                "TRUE",
                ""},
      {
                "SMA_eotech",
                "",
                1500,
                "TRUE",
                ""},
      {
                "SMA_eotechG33_3XDOWN",
                "",
                2500,
                "TRUE",
                ""},
      {
                "RH_eothhs1",
                "",
                5000,
                "true",
                ""},
      {
                "SMA_ELCAN_SPECTER_4z",
                "",
                3000,
                "TRUE",
                ""},
      {
                "SMA_ELCAN_SPECTER_RDS_4z",
                "",
                3000,
                "TRUE",
                ""},
      {
                "RH_ta31rmr_2D",
                "",
                7000,
                "TRUE",
                ""},
      {
                "bipod_03_F_blk",
                "",
                2500,
                "true",
                ""}
    };
    items[] = {
      {
                "RoleplayRadio",
                "Use this to communicate from distance",
                150,
                "true",
                ""},
      {
                "Binocular",
                "Use these to see stuff at farther distances",
                250,
                "true",
                ""},
      {
                "ItemGPS",
                "Use this to not get lost",
                500,
                "true",
                ""},
      {
                "ItemMap",
                "Use this to find the local shops",
                10,
                "true",
                ""},
      {
                "ItemCompass",
                "Use this to find directions",
                10,
                "true",
                ""}
    };
    };

  class jail {
    name = "Jail Firearms";
    conditions = "life_is_arrested";
    side = "civ";
    weapons[] = {
		{ "KA_knife", "", 3000, "true", ""},
		{ "hgun_Pistol_heavy_01_F", "", 6000, "true", ""},
		{ "hgun_Rook40_F", "", 7000, "true", ""}
    };
      
    magazines[] = {
		{ "KA_knife_blade", "", 500, "true", ""},
		{ "11Rnd_45ACP_Mag", "", 500, "true", ""},
		{ "16Rnd_9x21_Mag", "", 750, "true", ""}
    };

    attachments[] = {
		{ "optic_Yorris", "", 50, "true", ""},
		{ "optic_MRD", "", 50, "true", ""},
		{ "HLC_optic228_ATT", "", 20, "true", ""},
		{ "HLC_optic228_VTAC", "", 20, "true", ""},
		{ "HLC_Optic_Romeo1_RX", "", 50, "true", ""},
		{ "HLC_optic228_stavenhagen", "", 50, "true", ""}
    };
    items[] = {
		{ "RoleplayRadio", "Use this to talk to others out of jail", 250, "true", ""},
		{ "Binocular", "Use these to see cops at furthur distances", 250, "true", ""},
		{ "ItemGPS", "Let others find you if you are in a gang", 750, "true", ""},
		{ "ItemMap", "Use this to find your way out", 100, "true", ""}
    };
  };

  class rebel {
    name = "Black Market Trader";
    conditions = "(missionNamespace getVariable ['mav_ttm_var_rebel', 0]) isEqualTo 1";
    weapons[] = {
      { "ItemMap", "Please remember to only use stuff that is in your sops",  10, "", "Please remember to only use stuff that is in your sops"  },
      { "AG_g19", "",  1000, "", ""  },
      { "AG_g19_Seska", "", 800, "",""  },
      { "AG_g19_Demon", "", 800, "", ""  },
      { "AG_g19_Cyber", "", 800, "", ""  },
      { "AG_g19_Fade", "", 800, "", ""  },
      { "AG_uspm_Cyrex", "", 800, "true", ""  },
      { "AG_uspm_Black", "",  1000, "true", ""  },
      { "AG_uspm_Gold", "",  1000, "true", ""  },
      { "AG_uspm_VIP", "",  1000, "true", ""  },
      { "AG_uspm", "",  1000, "true", ""  },
      { "AG_CaseyKimber", "", 800, "", ""  },
      { "AG_WeThePeople", "", 800, "", ""  },
      { "AG_kimber_nw", "", 800, "true", ""  },
      { "AG_kimber_nw_tan", "", 800, "true", ""  },
      { "RH_fnp45t", "", 800, "true", ""  },
      { "AG_fnp45_Printstream", "", 800, "true", ""  },
      { "AG_fnp45_Neon", "",  1000, "true", ""  },
      { "AG_fnp45_Anarchy", "",  1000, "true", ""  },
      { "AG_HK416_vfg_NeonRider", "", 7500, "true", ""  },
      { "AG_HK416_vfg_Emperor", "", 7500, "true", ""  },
      { "SMA_HK416CUSTOMafgODP", "", 6500, "true", ""  },
      { "SMA_HK416CUSTOMvfgODP", "", 6500, "true", ""  },
      { "SMA_HK416CUSTOMafg", "", 6500, "true", ""  },
      { "SMA_HK416CUSTOMvfg", "", 6500, "true", ""  },
      { "SMA_MK18afgOD", "", 6500, "true", ""  },
      { "SMA_MK18MOEOD", "", 6500, "true", ""  },
      { "SMA_MK18afgTAN", "", 6500, "true", ""  },
      { "SMA_MK18MOETAN", "", 6500, "true", ""  },
      { "AG_HK416_vfg_DesolateSpace", "", 7500, "true", ""  },
      { "SMA_HK416MOEOD", "", 6500, "true", ""  },
      { "AG_rifle_bcmjack", "", 6500, "true", ""  },
      { "AG_rifle_bcmjack_black", "", 6500, "true", ""  },
      { "AG_rifle_bcmjack_Tan", "", 6500, "true", ""  },
      { "AG_HK416CUSTOMvfg_BlueOrange", "", 7500, "true", ""  },
      { "AG_HK416CUSTOMvfg_PurpleOrange", "", 7500, "true", ""  },
      { "hlc_rifle_G36KV", "", 6500, "life_factionlevel >= 5", ""  },
      { "hlc_rifle_G36V", "", 6500, "life_factionlevel >= 5", ""  },
      { "AG_HK416CUSTOMvfg_BlackIce", "", 7500, "", ""  },
      { "AG_MK18MOEBLK_BloodSport", "", 7500, "", ""  },
      { "AG_MK18MOEBLK_BloodSport", "", 7500, "", ""  },
      { "SMA_MK18MOEBLK_Emperor", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_Cyborg", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_Apocalypse", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_Cyber", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_King", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_Medieval", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_Royal", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_Hive", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_Enforcer", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_ToothFairy", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_BioWar", "", 7500, "true", ""  },
      { "AG_MK18MOEBLK_Anubis", "", 7500, "true", ""  },
      { "RH_M16A6_EndGangLife_Silver", "", 5000, ""  },
      { "RH_M16A6_EndGangLife_Black", "", 5000, ""  },
      { "AG_rifle_awmagnum_Asiimov", "",  10000, "", ""  },
      { "AG_rifle_awmagnum_HyperBeast", "",  10000, "", ""  },
      { "AG_rifle_awmagnum_Bloodsport", "",  10000, "", ""  },
      { "AG_rifle_awmagnum_FrostBite", "",  10000, "", ""  },
      { "AG_rifle_awmagnum_DragonLore", "",  10000, "", ""  },
      { "AG_rifle_awmagnum_BL", "",  10000, "", ""  },
      { "AG_rifle_awmagnum_OD", "",  10000, "", ""  },
      { "AG_rifle_awmagnum_FDE", "",  10000, "", ""  },
      { "AG_SMA_supp2b_556_Cosmetic", "",  1000, "", ""  },
      { "AG_SMA_supp1b_556_Cosmetic", "",  1000, "", ""  },
      { "AG_SMA_supp1tan_556_Cosmetic", "",  1000, "", ""  },
      { "AG_SMA_supp1BB_556_Cosmetic", "",  1000, "", ""  },
      { "AG_SMA_supp1TT_556_Cosmetic", "",  1000, "(", ""  },
      { "AG_SMA_supp1BOD_556_Cosmetic", "",  1000, "", ""  },
      { "AG_SMA_supp2smaB_556_Cosmetic", "",  1000, "", ""  },
      { "hlc_30rnd_556x45_EPR", "",  100, "true", ""  },
      { "AG_30rnd_9x19mm_Universal", "",  100, "true", ""  },
      { "AG_30rnd_10x25mm_Universal", "",  100, "true", ""  },
      { "AG_30rnd_45acp_Universal", "",  100, "true", ""  },
      { "Ag_30rnd_68_Universal", "",  100, "true", ""  },
      { "AG_30rnd_300blk_Universal", "",  100, "", ""  },
      { "AG_30rnd_556x45_Universal", "",  100, "true", ""  },
      { "AG_20rnd_762x51_Universal", "",  100, "true", ""  },
      { "AG_30rnd_762x39_Universal", "",  100, "true", ""  },
      { "AG_30rnd_545x39_Universal", "",  100, "true", "" }
    };
    magazines[] = {
      { "hlc_30rnd_556x45_EPR", "",  100, "true", ""  },
      { "AG_30rnd_556x45_Universal", "",  100, "true", ""  },
      { "AG_20rnd_762x51_Universal", "",  100, "true", ""  },
      { "AG_30rnd_762x39_Universal", "",  100, "true", ""  },
      { "AG_30rnd_545x39_Universal", "",  100, "true", ""  },
      { "AG_30rnd_9x19mm_Universal", "",  100, "true", ""  },
      { "RH_7Rnd_45cal_m1911", "", 40, "", ""  },
      { "AG_30rnd_10x25mm_Universal", "",  100, "true", ""  },
      { "AG_30rnd_45acp_Universal", "",  100, "true", ""  },
      { "Ag_30rnd_68_Universal", "",  100, "true", ""  },
      { "RH_16Rnd_40cal_usp", "",  1, "true", ""  },
      { "AG_5rnd_300WM_mk248", "",  100, "true", ""  },
      { "AG_5rnd_300WM_mk248_Asiimov", "",  100, "true", ""  },
      { "hlc_5rnd_300WM_mk248_AWM", "",  100, "true", ""  },
      { "AG_7Rnd_45cal_m1911", "",  10, "", ""  },
      { "RH_12Rnd_45cal_usp", "",  1, "true", ""  },
      { "RH_15Rnd_45cal_fnp", "",  1, "true", ""  },
      { "30Rnd_556x45_Stanag", "",  10, "true", ""  },
      { "SMA_30Rnd_556x45_M855A1", "",  10, "TRUE", ""  },
      { "hlc_30rnd_556x45_EPR_G36", "",  10, "true", ""  },
      { "Ag_30rnd_68_Universal", "", 75, "true", ""  },
      { "AG_30rnd_556x45_Blank", "",  1, "true", ""  },
      { "AG_30rnd_556x45_Training", "",  1, "true", ""}
    };
    items[] = {
      { "ItemGPS", "Use this to not get lost", 500, "true", ""  },
      { "ItemMap", "Use this to find the local shops",  10, "true", ""  },
      { "ItemCompass", "Use this to find directions",  10, "true", ""  },
      { "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""  },
      { "RoleplayRadio", "Use this to communicate from distance",  15, "true", ""  },
      { "RH_HBLM", "",  100, "true", ""  },
      { "SMA_SFFL_BLK", "",  100, "true", ""  },
      { "AG_muzzle_Blank", "A adapter that removes the damage from your gun",  100, "true", ""}
    };
    attachments[] = {
      { "RH_eothhs1", "", 500, "true", ""  },
      { "RH_eotech553mag", "", 500, "true", ""  },
      { "acc_flashlight", "", 200, "true", ""  },
      { "RH_docter", "", 200, "true", ""  },
      { "RH_X300", "", 200, "true", ""  },
      { "optic_MRD", "", 200, "true", ""  },
      { "optic_Arco", "", 200, "true", ""  },
      { "optic_Arco_blk_F", "", 200, "true", ""  },
      { "optic_Arco_lush_F", "", 200, "true", ""  },
      { "optic_Aco", "", 200, "true", ""  },
      { "optic_ERCO_blk_F", "", 200, "true", ""  },
      { "bipod_03_F_blk", "", 250, "true", ""  },
      { "SMA_Gripod_01", "", 250, "true", ""  },
      { "SMA_SFPEQ_MK18TOP_BLK", "", 200, "true", ""  },
      { "SMA_SFPEQ_MK18TOP_TAN", "", 200, "true", ""  },
      { "SMA_SFPEQ_M4TOP_TAN", "", 200, "true", ""  },
      { "SMA_SFPEQ_M4TOP_BLK", "", 200, "true", ""  },
      { "SMA_SFPEQ_HKTOP_TAN", "", 200, "true", ""  },
      { "SMA_SFPEQ_HKTOP_BLK", "", 200, "true", ""  },
      { "SMA_FLASHHIDER1", "", 200, "", ""  },
      { "SMA_FLASHHIDER2", "", 200, "", ""  },
      { "optic_ERCO_blk_F", "", 200, "true", ""  },
      { "optic_MRCO", "", 200, "true", ""  },
      { "AG_muzzle_Blank", "A adapter that removes the damage from your gun",  100, "true", ""}
    };
  };

  class genstore {
    name = "Metropolis General Store";
    conditions = "";
    side = "civ";
    weapons[] = {
      { "TR8_Mining_Drill", "Used to mine more ore", 1000, "true", ""},
      { "Mr_Camera_News", "Used to record the news.", 1000, "true", ""},
      { "Mr_Micro_News", "Used to record audio.", 1000, "true", ""}
    };

    magazines[] = {
      { "10_TR8_Drill_Fuel", "Fuel for the drill", 100, "true", ""}
    };

    items[] = {
      { "RoleplayRadio", "Use this to communicate from distance", 150, "true", ""},
      { "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""},
      { "ItemGPS", "Use this to not get lost", 500, "true", ""},
      { "ItemMap", "Use this to find the local shops", 10, "true", ""},
      { "ItemCompass", "Use this to find directions", 10, "true", ""}    
    };
  };

  class f_station_store {
    name = "Metropolis Fuel Station Store";
    conditions = "";
    side = "civ";
    items[] = {
      { "RoleplayRadio", "Use this to communicate from distance", 150, "true", ""},
      { "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""},
      { "ItemGPS", "Use this to not get lost", 500, "true", ""},
      { "ItemMap", "Use this to find the local shops", 10, "true", ""},
      { "ItemCompass", "Use this to find directions", 10, "true", ""}
    };
  };

  class med_basic {
    name = "Medic Shop";
    conditions = "call life_medicLevel >= 1";
    side = "med";
    items[] = {
	  { "KA_TL_122_flashlight", "Use this to communicate from distance", 50, "call(life_medicLevel) >= 1", ""},
      { "RoleplayRadio", "Use this to communicate from distance", 50, "call(life_medicLevel) >= 1", ""},
      { "Medikit", "Use this to heal to full health", 50, "call(life_medicLevel) >= 1", ""},
      { "FirstAidKit", "Use this to heal players", 50, "call(life_medicLevel) >= 1", ""},
      { "Binocular", "Use this to communicate from distance", 50, "call(life_medicLevel) >= 1", ""},
      { "ItemGPS", "Use this to not get lost", 50, "call(life_medicLevel) >= 1", ""},
      { "ItemMap", "Use this to find the local shops", 10, "call(life_medicLevel) >= 1", ""},
      { "ItemCompass", "Use this to find directions", 10, "call(life_medicLevel) >= 1", ""}
    };
  };
};