-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for armalife
CREATE DATABASE IF NOT EXISTS `armalife` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `armalife`;

-- Dumping structure for table armalife.access
CREATE TABLE IF NOT EXISTS `access` (
  `accessID` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `address` varchar(64) DEFAULT NULL,
  `failed` int(11) NOT NULL,
  PRIMARY KEY (`accessID`),
  UNIQUE KEY `accessID` (`accessID`),
  KEY `accessID_1` (`accessID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table armalife.access: ~3 rows (approximately)
INSERT INTO `access` (`accessID`, `date_time`, `address`, `failed`) VALUES
	(3, '2019-04-23 11:24:18', '162.158.158.126', 0),
	(4, '2019-04-23 14:27:51', '141.101.99.36', 0),
	(5, '2019-04-23 15:32:02', '141.101.107.49', 0);

-- Dumping structure for table armalife.armalife_phonemessages
CREATE TABLE IF NOT EXISTS `armalife_phonemessages` (
  `sender` varchar(50) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timesent` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- Dumping data for table armalife.armalife_phonemessages: ~0 rows (approximately)

-- Dumping structure for table armalife.armalife_phonenumbers
CREATE TABLE IF NOT EXISTS `armalife_phonenumbers` (
  `number` varchar(50) DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- Dumping data for table armalife.armalife_phonenumbers: ~2 rows (approximately)
INSERT INTO `armalife_phonenumbers` (`number`, `uid`) VALUES
	('7186010929', '76561198207240099'),
	('7465819678', '76561198137248966');

-- Dumping structure for table armalife.containers
CREATE TABLE IF NOT EXISTS `containers` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `dir` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `owned` tinyint(1) DEFAULT 0,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`,`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- Dumping data for table armalife.containers: ~0 rows (approximately)

-- Dumping structure for procedure armalife.deleteDeadVehicles
DELIMITER //
CREATE PROCEDURE `deleteDeadVehicles`()
BEGIN
  DELETE FROM `vehicles` WHERE `alive` = 0;
END//
DELIMITER ;

-- Dumping structure for procedure armalife.deleteOldContainers
DELIMITER //
CREATE PROCEDURE `deleteOldContainers`()
BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END//
DELIMITER ;

-- Dumping structure for procedure armalife.deleteOldGangs
DELIMITER //
CREATE PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END//
DELIMITER ;

-- Dumping structure for procedure armalife.deleteOldHouses
DELIMITER //
CREATE PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END//
DELIMITER ;

-- Dumping structure for procedure armalife.deleteUnpaidHouses
DELIMITER //
CREATE PROCEDURE `deleteUnpaidHouses`()
BEGIN
  DELETE FROM `houses` WHERE `property_tax` = 0;
END//
DELIMITER ;

-- Dumping structure for table armalife.gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text DEFAULT NULL,
  `maxmembers` int(3) DEFAULT 50,
  `bank` int(100) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `tasks` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name_UNIQUE` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- Dumping data for table armalife.gangs: ~5 rows (approximately)
INSERT INTO `gangs` (`id`, `owner`, `name`, `members`, `maxmembers`, `bank`, `active`, `insert_time`, `tasks`) VALUES
	(135, '76561199389341040', 'Enter Gang Name', '"[[`Chanquete Garcia`,`76561199389341040`,4]]"', 50, 0, 1, '2022-12-17 14:23:48', '[1,[0,0,0,0,0,0]]'),
	(136, '76561198424187813', 'HMT', '"[[`Dani Villas`,`76561198424187813`,4]]"', 50, 0, 1, '2022-12-18 15:34:46', '[0,[0,0,0,0,0,0]]'),
	(137, '76561198166709677', 'PUMA$', '"[[`Vladimir Sokolov`,`76561198166709677`,4]]"', 50, 0, 1, '2022-12-22 04:54:20', '[1,[0,0,0,0,0,0]]'),
	(138, '76561198374137014', '123', '"[[`Abdul Juderio`,`76561198374137014`,4]]"', 50, 0, 1, '2022-12-22 20:49:04', '[0,[0,0,0,0,0,0]]'),
	(139, '76561198059844393', 'ARMAGaming', '"[[`Daniel Yubero`,`76561198059844393`,4]]"', 50, 0, 1, '2022-12-24 00:38:43', '[0,[0,0,0,0,0,0]]');

-- Dumping structure for table armalife.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT 0,
  `garage` tinyint(1) NOT NULL DEFAULT 0,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `property_tax` int(1) NOT NULL DEFAULT 7,
  PRIMARY KEY (`id`,`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- Dumping data for table armalife.houses: ~0 rows (approximately)

-- Dumping structure for table armalife.log
CREATE TABLE IF NOT EXISTS `log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` varchar(64) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`logid`),
  UNIQUE KEY `logid` (`logid`),
  KEY `logid_2` (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table armalife.log: ~0 rows (approximately)

-- Dumping structure for table armalife.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `fromID` varchar(50) NOT NULL,
  `toID` varchar(50) NOT NULL,
  `message` text DEFAULT NULL,
  `fromName` varchar(32) NOT NULL,
  `toName` varchar(32) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- Dumping data for table armalife.messages: ~0 rows (approximately)

-- Dumping structure for table armalife.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing note_id of each user, unique index',
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note_text` varchar(255) NOT NULL,
  `warning` enum('1','2','3','4') NOT NULL,
  `note_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`note_id`),
  UNIQUE KEY `note_id` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table armalife.notes: ~0 rows (approximately)

-- Dumping structure for table armalife.players
CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `pid` varchar(17) NOT NULL,
  `exp_total` int(11) NOT NULL DEFAULT 0,
  `exp_level` int(11) NOT NULL DEFAULT 0,
  `cash` int(100) NOT NULL DEFAULT 20,
  `bankacc` int(100) NOT NULL DEFAULT 0,
  `wealth_tax` int(11) NOT NULL,
  `last_wealth` int(100) NOT NULL DEFAULT 0,
  `taxamount` int(100) NOT NULL DEFAULT 0,
  `adminlevel` enum('0','1','2') NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `copdept` enum('0','1','2','3','4','5','6','7','8') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5','6','7','8','9') NOT NULL DEFAULT '0',
  `medicdept` enum('0','1','2') NOT NULL DEFAULT '0',
  `donorlevel` enum('0','1') NOT NULL DEFAULT '0',
  `civ_licenses` text NOT NULL,
  `cop_licenses` text NOT NULL,
  `med_licenses` text NOT NULL,
  `civ_gear` text NOT NULL,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `civ_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `cop_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `med_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `arrested` tinyint(1) NOT NULL DEFAULT 0,
  `blacklist` tinyint(1) NOT NULL DEFAULT 0,
  `civ_alive` tinyint(1) NOT NULL DEFAULT 0,
  `civ_position` varchar(64) NOT NULL DEFAULT '"[]"',
  `playtime` varchar(32) NOT NULL DEFAULT '"[0,0,0]"',
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `exp_perkPoints` int(11) NOT NULL DEFAULT 0,
  `exp_perks` text DEFAULT NULL,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `parole` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `pid` (`pid`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `blacklist` (`blacklist`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2671 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- Dumping data for table armalife.players: ~15 rows (approximately)
INSERT INTO `players` (`uid`, `name`, `aliases`, `pid`, `exp_total`, `exp_level`, `cash`, `bankacc`, `wealth_tax`, `last_wealth`, `taxamount`, `adminlevel`, `coplevel`, `copdept`, `mediclevel`, `medicdept`, `donorlevel`, `civ_licenses`, `cop_licenses`, `med_licenses`, `civ_gear`, `cop_gear`, `med_gear`, `civ_stats`, `cop_stats`, `med_stats`, `arrested`, `blacklist`, `civ_alive`, `civ_position`, `playtime`, `insert_time`, `last_seen`, `exp_perkPoints`, `exp_perks`, `jail_time`, `parole`) VALUES
	(2655, 'Dani Villas', '"[`Dani Villas`]"', '76561198424187813', 11900, 11, 0, 99894576, 0, 0, 0, '2', '7', '8', '9', '1', '1', '"[[`license_civ_driver`,1],[`license_civ_boat`,1],[`license_civ_trucking`,1],[`license_civ_gun`,1],[`license_civ_dive`,1],[`license_civ_home`,1]]"', '"[]"', '"[]"', '"[[[`AG_rifle_bcmjack_CTRG`,`SMA_supp1TW_556`,`acc_flashlight`,`optic_Arco_blk_F`,[`hlc_30rnd_556x45_EPR`,30],[],``],[],[],[`AG_CTRG_IndepUniAlt`,[[`hlc_30rnd_556x45_EPR`,9,30]]],[`AG_CTRG_H1Plate`,[[`hlc_30rnd_556x45_EPR`,20,30]]],[`AG_CTRG_GSG9_Engineer_Backpack`,[]],`AG_CTRG_HelmetAlt`,`JD_Eyes`,[],[`ItemMap`,`ItemGPS`,``,`ItemCompass`,`ItemWatch`,`AG_Kenny_Mop2`]],[]]"', '"[[[`AG_MK18afg_Roman`,``,``,`RH_ta31rmr`,[`SMA_30Rnd_556x45_M855A1`,30],[],``],[],[`taser`,``,``,``,[`vvv_np_magazine_taser`,1],[],``],[`AG_Sheriff_Sheriff`,[[`SMA_30Rnd_556x45_M855A1`,3,30],[`vvv_np_magazine_taser`,1,1]]],[`AG_Sheriff_CPC_Vest`,[]],[`AG_SERT_Engineer_Backpack`,[]],`AG_sheriffcowboyhat_SMA`,`VSM_MPACT_Gloves_cut_black_standalone`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`ItemGPS`,`RoleplayRadio_17`,`ItemCompass`,``,`AG_BadgeEarpeice_NVG`]],[[`keyCard`,1],[`waterBottle`,2],[`donuts`,1],[`panicbutton`,1],[`cprKit`,2],[`bandage`,1],[`toolkit`,1]]]"', '"[[[],[],[],[`U_Rangemaster`,[[`FirstAidKit`,1]]],[`V_Rangemaster_belt`,[]],[],`H_Cap_headphones`,``,[],[`ItemMap`,``,`RoleplayRadio`,`ItemCompass`,`tf_microdagr`,``]],[[`waterBottle`,2],[`donuts`,2],[`cprKit`,2],[`toolkit`,1]]]"', '"[100,100]"', '"[100,100]"', '"[100,100]"', 0, 0, 1, '"[9702.05,660.05,0.0014286]"', '"[0,0,0]"', '2022-12-03 12:51:18', '2022-12-30 17:43:47', 26, '[[["perk_civilian_master",1],[[["perk_rebel_1",1],[["perk_rebel_2",1]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 0, 0),
	(2657, 'Chanquete Garcia', '"[`Chanquete Garcia`]"', '76561199389341040', 1200, 3, 0, 774800, 0, 0, 0, '0', '2', '2', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[`AG_HK416CUSTOMvfg_Toxic`,`SMA_supp2b_556`,``,`optic_Arco_blk_F`,[`SMA_30Rnd_556x45_M855A1`,30],[],``],[`launch_RPG7_F`,``,``,``,[],[],``],[],[`AG_Baja_Uni_Alt`,[]],[`AG_Baja_Vest_Alt`,[]],[`JD_InvPack`,[[`SMA_30Rnd_556x45_M855A1`,11,30]]],`AG_Baja_BoonieAlt`,``,[],[`ItemMap`,`ItemGPS`,``,`ItemCompass`,``,``]],[[`waterBottle`,2],[`donuts`,2]]]"', '"[[[],[],[`taser`,``,``,``,[],[],``],[],[],[],``,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_7`,`ItemCompass`,``,``]],[[`keyCard`,1],[`waterBottle`,2],[`donuts`,2],[`panicbutton`,1],[`toolkit`,1],[`spikeStrip`,1]]]"', '"[[],[]]"', '"[100,100]"', '"[100,100]"', '"[100,100,0]"', 0, 0, 0, '"[7162.16,8023.37,10.1855]"', '"[0,0,0]"', '2022-12-16 14:49:51', '2022-12-17 20:50:43', 3, '[[["perk_civilian_master",1],[[["perk_rebel_1",1],[["perk_rebel_2",0]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 5, 0),
	(2658, 'Abdul Juderio', '"[`Abdul Juderio`]"', '76561198374137014', 18500, 14, 0, 106739, 0, 0, 0, '0', '7', '8', '9', '1', '1', '"[[`license_civ_driver`,1],[`license_civ_boat`,1],[`license_civ_trucking`,1],[`license_civ_gun`,1],[`license_civ_dive`,1],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[],[],[],[`U_C_Poor_2`,[]],[],[],``,`AG_CTRG_Bandana2Alt`,[],[`ItemMap`,``,``,`ItemCompass`,`tf_microdagr`,``]],[[`cprKit`,1]]]"', '"[[[`AG_CTAR_F_Obsidian`,`SMA_supp2b_556`,`acc_flashlight`,`optic_Arco_blk_F`,[`SMA_30Rnd_556x45_M855A1`,30],[],``],[],[],[`AG_CTRG_Rangemaster`,[[`SMA_30Rnd_556x45_M855A1`,1,20],[`SMA_30Rnd_556x45_M855A1`,1,27]]],[`AG_CTRG_Vest_Alt`,[]],[`AG_FactionInvPack`,[[`SMA_30Rnd_556x45_M855A1`,22,30],[`Vorona_HEAT`,2,1]]],`AG_CTRG_RangemasterCap`,`AG_CTRG_Bandana2Alt`,[],[``,`ItemGPS`,`RoleplayRadio_11`,`Charm_Blue`,``,``]],[[`keyCard`,1],[`cprKit`,1]]]"', '"[[[],[],[],[`AG_KMD_TRU_Uni`,[[`FirstAidKit`,3]]],[`AG_KMD_TRU_Vest`,[[`Medikit`,1],[`hlc_200rnd_556x45_M_SAW`,3,200]]],[`AG_FactionInvPack`,[[[`hlc_m249_SQuantoon`,``,``,``,[`hlc_200rnd_556x45_M_SAW`,182],[],``],1]]],`AG_KMD_Helmet`,``,[],[`ItemMap`,``,`RoleplayRadio_6`,`ItemCompass`,``,``]],[[`waterBottle`,2],[`donuts`,2],[`cprKit`,2],[`stabilizer`,1],[`toolkit`,1]]]"', '"[100,100]"', '"[100,100]"', '"[100,100]"', 0, 0, 0, '"[8347.93,7327.84,0.00160646]"', '"[0,0,0]"', '2022-12-16 14:50:28', '2022-12-28 14:02:19', 36, '[[["perk_civilian_master",1],[[["perk_rebel_1",1],[["perk_rebel_2",1]]]]],["perk_medical_master",1],["perk_cop_master",0]]', 0, 0),
	(2659, 'Furry Lomas', '"[`Furry el Franco`]"', '76561198376013446', 5300, 7, 0, 28749, 0, 0, 0, '0', '7', '8', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[`AG_MK18MOEBLK_Arrow`,`SMA_supp2b_556`,`acc_flashlight`,`optic_Arco_blk_F`,[`SMA_30Rnd_556x45_M855A1`,10],[],``],[],[`taser`,``,``,``,[],[],``],[`AG_Sheriff_CommisionerWhite`,[[`SMA_30Rnd_556x45_M855A1`,1,23],[`SMA_30Rnd_556x45_M855A1`,1,20],[`SMA_30Rnd_556x45_M855A1`,1,9]]],[`AG_Patrol_Belt_Radio_Sheriff`,[]],[`AG_FactionInvPack`,[[`SMA_30Rnd_556x45_M855A1`,13,30]]],`AG_Sheriff_Hat`,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_4`,`ItemCompass`,``,``]],[[`waterBottle`,4],[`donuts`,3]]]"', '"[[[`AG_MK18MOEBLK_Arrow`,`SMA_supp2b_556`,`acc_flashlight`,`optic_Arco_blk_F`,[`SMA_30Rnd_556x45_M855A1`,30],[],``],[],[`taser`,``,``,``,[],[],``],[`AG_Sheriff_CommisionerWhite`,[]],[`AG_Patrol_Belt_Radio_Sheriff`,[]],[`AG_FactionInvPack`,[]],`AG_Sheriff_Hat`,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_10`,`ItemCompass`,``,``]],[[`keyCard`,1]]]"', '"[[],[]]"', '"[100,100]"', '"[100,100]"', '"[100,100,0]"', 0, 0, 0, '"[1992.74,3747.4,0.00134659]"', '"[0,0,0]"', '2022-12-16 19:31:42', '2022-12-28 14:02:26', 17, '[[["perk_civilian_master",0],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 5, 0),
	(2660, 'NoSoYFuRRo', '"[`NoSoYFuRRo`]"', '76561199213086371', 450, 2, 0, 40000, 0, 0, 0, '0', '0', '0', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[`AG_HK416CUSTOMvfg_BlueOrange`,``,``,`RH_ta31rmr`,[`SMA_30Rnd_556x45_M855A1`,0],[],``],[],[],[`AG_HMT_Uni_Gorka`,[]],[`AG_HMT_Vest`,[]],[`AG_FactionInvPack`,[[`SMA_30Rnd_556x45_M855A1`,3,30],[`SMA_30Rnd_556x45_M855A1`,1,23],[`SMA_30Rnd_556x45_M855A1`,1,13],[`SMA_30Rnd_556x45_M855A1`,1,8],[`SMA_30Rnd_556x45_M855A1`,1,22]]],`AG_HMT_BCap`,`AG_HMT_Bandana2`,[],[`ItemMap`,`ItemGPS`,``,`ItemCompass`,``,`AG_PoliceThing`]],[]]"', '"[[],[]]"', '"[[],[]]"', '"[100,100]"', '"[100,100,0]"', '"[100,100,0]"', 0, 0, 0, '"[8775.66,9396.47,43.629]"', '"[0,0,0]"', '2022-12-16 21:19:36', '2022-12-16 22:15:20', 4, '[[["perk_civilian_master",0],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 0, 0),
	(2661, 'Vladimir Sokolov', '"[`Vladimir Sokolov`]"', '76561198166709677', 12900, 12, 0, 107222, 0, 0, 0, '2', '7', '8', '9', '1', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,1],[`license_civ_trucking`,1],[`license_civ_gun`,1],[`license_civ_dive`,1],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[`av_Vant2_ch`,``,``,``,[`30Rnd_9x21_Mag`,26],[],``],[],[],[`U_Marshal`,[[`30Rnd_9x21_Mag`,2,30]]],[],[],``,``,[`Binocular`,``,``,``,[],[],``],[`ItemMap`,`I_E_UavTerminal`,``,`ItemCompass`,``,``]],[[`rubyU`,1],[`goldbar`,7],[`coalOre`,1],[`pdrill`,1],[`relic4`,1]]]"', '"[[[],[],[`RH_bull`,``,``,``,[`RH_6Rnd_454_Mag`,4],[],``],[`AG_DOC_Uni`,[[`FirstAidKit`,1],[`RH_6Rnd_454_Mag`,2,6]]],[`AG_DOC_Plate_FTO`,[]],[`AG_FactionInvPack`,[]],`drrpg_cowboyHatBrown`,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_2`,`ItemCompass`,`tf_microdagr`,``]],[[`keyCard`,1],[`waterBottle`,2],[`donuts`,2],[`toolkit`,1],[`spikeStrip`,1]]]"', '"[[[],[],[],[`AG_Doctor_Hirurg_1`,[]],[],[`AG_FactionInvPack`,[]],`AG_KMD_Beret_Batchf`,``,[],[`ItemMap`,``,`RoleplayRadio_2`,`ItemCompass`,``,``]],[[`waterBottle`,2],[`donuts`,2],[`cprKit`,1],[`toolkit`,1]]]"', '"[70,60]"', '"[100,100]"', '"[100,100]"', 0, 0, 0, '"[9706.02,660.05,0.00134587]"', '"[0,0,0]"', '2022-12-17 22:12:51', '2022-12-30 17:31:58', 30, '[[["perk_civilian_master",1],[[["perk_rebel_1",1],[["perk_rebel_2",1]]]]],["perk_medical_master",1],["perk_cop_master",0]]', 0, 0),
	(2662, 'Zetachiel Guzmán', '"[`Zetachiel Guzmán`]"', '76561198140510093', 1150, 3, 9375000, 584667, 0, 0, 0, '0', '0', '0', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,1],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[],[],[],[],[],[],``,``,[],[`ItemMap`,`ItemGPS`,``,`ItemCompass`,``,``]],[]]"', '"[[],[]]"', '"[[],[]]"', '"[100,100]"', '"[100,100,0]"', '"[100,100,0]"', 0, 0, 0, '"[9710,660.05,0.00146127]"', '"[0,0,0]"', '2022-12-22 02:48:28', '2022-12-22 04:11:07', 6, '[[["perk_civilian_master",0],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 0, 0),
	(2663, 'Daniel Yubero', '"[`Daniel Yubero`]"', '76561198059844393', 11350, 11, 0, 645535, 0, 0, 0, '0', '7', '8', '9', '1', '1', '"[[`license_civ_driver`,1],[`license_civ_boat`,1],[`license_civ_trucking`,1],[`license_civ_gun`,1],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[`AG_RH_M4_ris_m_Platinum`,`SMA_supp2b_556`,`acc_flashlight`,`SMA_eotech552`,[`RH_30Rnd_556x45_M855A1`,24],[],``],[],[`taser`,``,``,``,[],[],``],[`AG_Sheriff_CommisionerWhite`,[[`RH_30Rnd_556x45_M855A1`,1,30]]],[`AG_Patrol_Belt_Radio_Sheriff`,[]],[`AG_FactionInvPack`,[]],`AG_Sheriff_Hat`,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_11`,`ItemCompass`,``,``]],[]]"', '"[[[],[],[],[`U_Rangemaster`,[[`FirstAidKit`,1]]],[`V_Rangemaster_belt`,[]],[],`H_Cap_headphones`,`EF_AC1`,[],[`ItemMap`,``,`RoleplayRadio_14`,`ItemCompass`,`tf_microdagr`,``]],[[`gpstracker`,2],[`keyCard`,1],[`coffee`,2],[`waterBottle`,2],[`donuts`,5],[`panicbutton`,3]]]"', '"[[[],[],[],[`AG_KMD_EMT_Uni`,[]],[],[`B_TacticalPack_blk`,[[`Medikit`,1]]],`H_Cap_marshal`,``,[],[`ItemMap`,``,`RoleplayRadio_6`,`ItemCompass`,``,``]],[[`waterBottle`,2],[`donuts`,2],[`cprKit`,1],[`toolkit`,1]]]"', '"[100,100]"', '"[100,100]"', '"[100,100]"', 0, 0, 0, '"[9710,660.05,0.00142837]"', '"[0,0,0]"', '2022-12-22 20:01:36', '2022-12-26 20:01:11', 27, '[[["perk_civilian_master",1],[[["perk_rebel_1",1],[["perk_rebel_2",1]]]]],["perk_medical_master",1],["perk_cop_master",0]]', 5, 0),
	(2664, 'Maximo Figueroa', '"[`Maximo Figueroa`]"', '76561198433582953', 4000, 6, 0, 0, 0, 0, 0, '0', '7', '7', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[],[],[],[],[],[],``,``,[],[`ItemMap`,`ItemGPS`,``,`ItemCompass`,``,``]],[]]"', '"[[[`AG_RH_M16A4_Gold`,``,``,`optic_ACO_grn`,[`hlc_30rnd_556x45_EPR`,10],[],``],[],[],[`AG_SWAT_Uni_Black`,[]],[`AG_Swat_Plate_Black`,[]],[`JD_InvPack`,[[`hlc_30rnd_556x45_EPR`,5,30]]],`AG_Swat_PatchCap`,`G_Bandanna_aviator`,[],[`ItemMap`,``,`RoleplayRadio_13`,`ItemCompass`,`tf_microdagr`,``]],[[`keyCard`,1],[`waterBottle`,2],[`donuts`,2],[`panicbutton`,1],[`toolkit`,1],[`spikeStrip`,1]]]"', '"[[],[]]"', '"[100,100]"', '"[100,100]"', '"[100,100,0]"', 0, 0, 0, '"[1151.43,7520.57,0.191432]"', '"[0,0,0]"', '2022-12-22 23:13:01', '2022-12-23 13:45:02', 14, '[[["perk_civilian_master",0],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 0, 0),
	(2665, 'Jaime Rodríguez', '"[`Jaime Rodríguez`]"', '76561198314493020', 5250, 7, 991659, 47980000, 0, 0, 0, '0', '7', '8', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[],[],[],[],[],[],``,`JD_Tie`,[],[`ItemMap`,`ItemGPS`,``,`ItemCompass`,``,``]],[]]"', '"[[[`Winchester1897_01`,``,``,``,[`6Rnd_Slug_Magazine`,6],[],``],[],[`RH_m9`,``,``,``,[`RH_15Rnd_9x19_M9`,8],[],``],[`AG_CID_Uni_Green`,[[`6Rnd_Slug_Magazine`,2,6],[`6Rnd_Slug_Magazine`,1,1],[`6Rnd_Slug_Magazine`,2,5],[`RH_15Rnd_9x19_M9`,1,13]]],[`AG_DetectiveVestBelt_CID_White`,[[`RH_15Rnd_9x19_M9`,17,15],[`6Rnd_Slug_Magazine`,1,1],[`6Rnd_Slug_Magazine`,1,2]]],[`AG_FactionInvPack`,[]],`AG_CID_PatchCap`,``,[],[`ItemMap`,``,`RoleplayRadio_3`,`ItemCompass`,`tf_microdagr`,``]],[[`keyCard`,1],[`waterBottle`,2],[`donuts`,1],[`panicbutton`,1],[`toolkit`,1],[`spikeStrip`,1]]]"', '"[[],[]]"', '"[100,100]"', '"[100,100]"', '"[100,100,0]"', 0, 0, 0, '"[5887.69,1093.1,9.05149]"', '"[0,0,0]"', '2022-12-24 01:27:49', '2022-12-30 06:28:05', 17, '[[["perk_civilian_master",0],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 0, 0),
	(2666, 'Max Hubner', '"[`Max Hubner`]"', '76561198367522633', 2250, 5, 0, 8778599, 0, 0, 0, '0', '6', '7', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[],[],[],[],[],[],``,``,[],[`ItemMap`,`ItemGPS`,``,`ItemCompass`,``,``]],[]]"', '"[[[],[],[],[`U_Rangemaster`,[[`FirstAidKit`,1]]],[`V_Rangemaster_belt`,[]],[],`H_Cap_headphones`,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]],[[`gpstracker`,1],[`keyCard`,2],[`waterBottle`,2],[`donuts`,2],[`panicbutton`,2],[`cprKit`,2],[`bandage`,1]]]"', '"[[],[]]"', '"[100,100]"', '"[100,100]"', '"[100,100,0]"', 0, 0, 0, '"[7627.46,2461.26,0.0655308]"', '"[0,0,0]"', '2022-12-24 16:20:35', '2022-12-27 13:54:06', 11, '[[["perk_civilian_master",0],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 0, 0),
	(2667, 'Patxi Balenziaga', '"[`Patxi Balenziaga`]"', '76561198303262159', 1350, 3, 14535, 4689426, 0, 0, 0, '0', '3', '2', '4', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[],[],[],[`U_C_Poor_2`,[]],[],[`AG_Lacoste_WhiteSkin`,[]],``,`G_Sport_Blackred`,[],[`ItemMap`,``,``,`ItemCompass`,`tf_microdagr`,``]],[[`rubyU`,20],[`anzus_pickaxe`,1],[`toolkit`,1]]]"', '"[[[],[],[`RH_m9`,``,``,``,[`RH_15Rnd_9x19_M9`,15],[],``],[`AG_KSP_SnrTrooper_Uni`,[[`RH_15Rnd_9x19_M9`,4,15],[`RH_15Rnd_9x19_M9`,1,7]]],[`AG_StatePolice_Plate_FTO`,[[`RH_15Rnd_9x19_M9`,14,15]]],[`AG_FactionInvPack`,[]],`AG_StatePolice_Hat`,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_1`,`ItemCompass`,``,``]],[[`keyCard`,1],[`waterBottle`,2],[`donuts`,2],[`panicbutton`,7],[`bandage`,3],[`toolkit`,1],[`spikeStrip`,1]]]"', '"[[[],[],[],[`AG_KMD_Paramedic_Uni`,[[`FirstAidKit`,6]]],[],[`AG_FactionInvPack`,[[`Medikit`,6],[`FirstAidKit`,2]]],`AG_KMD_Cap`,``,[],[`ItemMap`,``,`RoleplayRadio_11`,`ItemCompass`,``,``]],[[`waterBottle`,22],[`apple`,10],[`donuts`,2],[`cprKit`,1],[`morphine`,10],[`bandage`,10],[`toolkit`,16]]]"', '"[70,60]"', '"[100,90]"', '"[100,90]"', 0, 0, 0, '"[8161.91,3247.29,0.532171]"', '"[0,0,0]"', '2022-12-26 12:25:08', '2022-12-26 15:32:28', 5, '[[["perk_civilian_master",0],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",1],["perk_cop_master",0]]', 0, 0),
	(2668, 'Daniel Valero ', '"[`Daniel Valero `]"', '76561199148078501', 1600, 4, 431800, 3468943, 0, 0, 0, '0', '0', '0', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,1],[`license_civ_trucking`,1],[`license_civ_gun`,1],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[],[],[`RH_m9c`,``,``,``,[`RH_15Rnd_9x19_M9`,15],[],``],[`U_C_E_LooterJacket_01_F`,[]],[`Vest_Izi_nato_S`,[[`RH_15Rnd_9x19_M9`,6,15],[`RH_15Rnd_9x19_M9`,1,7],[[`RH_m9c`,``,``,``,[`RH_15Rnd_9x19_M9`,15],[],``],1]]],[`AG_GSG9Assualt_Brown`,[]],``,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_6`,`ItemCompass`,``,``]],[[`pepsi`,1],[`bandage`,1],[`anzus_pickaxe`,1],[`toolkit`,2],[`fuelEmpty`,1]]]"', '"[[[],[],[`taser`,``,``,``,[],[],``],[],[],[],``,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_8`,`ItemCompass`,``,``]],[[`keyCard`,1],[`waterBottle`,2],[`donuts`,2],[`panicbutton`,1],[`toolkit`,1],[`spikeStrip`,1]]]"', '"[[[],[],[],[],[],[`B_TacticalPack_blk`,[[`Medikit`,1]]],`H_Cap_marshal`,``,[],[`ItemMap`,``,`RoleplayRadio_9`,`ItemCompass`,``,``]],[[`waterBottle`,2],[`donuts`,2],[`cprKit`,1],[`toolkit`,1]]]"', '"[60,65]"', '"[100,100]"', '"[100,100]"', 0, 0, 0, '"[7920.44,2593.85,0.075573]"', '"[0,0,0]"', '2022-12-26 13:01:01', '2022-12-26 20:26:30', 6, '[[["perk_civilian_master",1],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",1],["perk_cop_master",0]]', 0, 0),
	(2669, 'Daniel Porro', '"[`Daniel Porro`]"', '76561199093529621', 400, 2, 0, 0, 0, 0, 0, '0', '0', '0', '0', '0', '0', '"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[[[],[],[],[`U_C_Poor_2`,[]],[],[],``,`JD_Pipe`,[],[`ItemMap`,``,``,`ItemCompass`,`tf_microdagr`,``]],[]]"', '"[[],[]]"', '"[[],[]]"', '"[100,100]"', '"[100,100,0]"', '"[100,100,0]"', 0, 0, 0, '"[6569.86,2158.36,5.35608]"', '"[0,0,0]"', '2022-12-26 16:57:25', '2022-12-26 17:23:59', 4, '[[["perk_civilian_master",0],[[["perk_rebel_1",0],[["perk_rebel_2",0]]]]],["perk_medical_master",0],["perk_cop_master",0]]', 0, 0),
	(2670, 'Santiago Walker', '"[`Santiago Walker`]"', '76561198408889114', 0, 0, 0, 40000, 0, 0, 0, '0', '0', '0', '0', '0', '0', '"[]"', '"[]"', '"[]"', '"[[],[]]"', '"[[[],[],[`taser`,``,``,``,[],[],``],[],[],[],``,``,[],[`ItemMap`,`ItemGPS`,`RoleplayRadio_2`,`ItemCompass`,``,``]],[[`keyCard`,1],[`waterBottle`,2],[`donuts`,2],[`panicbutton`,1],[`toolkit`,1],[`spikeStrip`,1]]]"', '"[[],[]]"', '"[100,100,0]"', '"[100,100]"', '"[100,100,0]"', 0, 0, 0, '"[]"', '"[0,0,0]"', '2022-12-28 02:00:28', '2022-12-28 02:00:49', 0, NULL, 0, 0);

-- Dumping structure for procedure armalife.resetLifeVehicles
DELIMITER //
CREATE PROCEDURE `resetLifeVehicles`()
BEGIN
  UPDATE `vehicles` SET `active`= 0;
END//
DELIMITER ;

-- Dumping structure for table armalife.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `side` varchar(10) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `alive` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `inventory` text NOT NULL,
  `color` int(11) NOT NULL,
  `plate` text NOT NULL,
  `gear` text NOT NULL,
  `damage` double NOT NULL DEFAULT 0,
  `insured` tinyint(4) NOT NULL DEFAULT 0,
  `blacklist` tinyint(4) NOT NULL DEFAULT 0,
  `fuel` int(11) NOT NULL DEFAULT 1,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `impound` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_side` (`side`) USING BTREE,
  KEY `index_type` (`type`) USING BTREE,
  KEY `fkIdx_players_vehicles` (`pid`) USING BTREE,
  CONSTRAINT `FK_players_vehicles` FOREIGN KEY (`pid`) REFERENCES `players` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table armalife.vehicles: ~112 rows (approximately)
INSERT INTO `vehicles` (`id`, `side`, `classname`, `type`, `pid`, `alive`, `active`, `inventory`, `color`, `plate`, `gear`, `damage`, `insured`, `blacklist`, `fuel`, `insert_time`, `impound`) VALUES
	(37, 'cop', 'AG_BMW_M5CS_KSP_ST_AG', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '776799', '"[]"', 0, 1, 0, 1, '2022-12-03 14:05:37', 0),
	(38, 'cop', 'AG_CHARGER_SRT_KSP_AG', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '964042', '"[]"', 0, 0, 0, 1, '2022-12-03 20:07:42', 0),
	(39, 'cop', 'AG_camaro_21_KSP_AG', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '775947', '"[]"', 0, 1, 0, 1, '2022-12-03 20:09:07', 0),
	(40, 'cop', 'd3s_f85_15_UNM_Alt', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '590347', '"[]"', 0, 1, 0, 1, '2022-12-11 20:15:14', 0),
	(41, 'cop', 'AG_CHARGER_SRT_KSP_ST_AG', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '561339', '"[]"', 0, 1, 0, 1, '2022-12-16 15:16:20', 0),
	(42, 'cop', 'AG_Range_KSP_AG', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '226635', '"[]"', 0, 0, 0, 1, '2022-12-16 19:20:24', 0),
	(43, 'cop', 'AG_TAHOE15_Sheriff_Unmarked_ST_AG_TIER1', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '390243', '"[]"', 0, 1, 0, 1, '2022-12-17 13:59:09', 0),
	(44, 'cop', 'AG_CROWNVIC_KSP_AG', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '269931', '"[]"', 0, 0, 0, 1, '2022-12-17 21:27:25', 0),
	(45, 'cop', 'AG_CROWNVIC_KSP_ST_AG', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '78273', '"[]"', 0, 0, 0, 1, '2022-12-18 14:54:39', 0),
	(46, 'cop', 'villas_rover_ksp', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '436268', '"[]"', 0, 0, 0, 1, '2022-12-19 19:49:40', 0),
	(47, 'cop', 'villas_charger_sheriff', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '547274', '"[]"', 0, 1, 0, 1, '2022-12-19 19:50:53', 0),
	(48, 'cop', 'villas_rover_doc', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '709921', '"[]"', 0, 0, 0, 1, '2022-12-20 20:34:10', 0),
	(49, 'cop', 'villas_charger_ksp', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '322763', '"[]"', 0, 0, 0, 1, '2022-12-21 15:00:26', 0),
	(50, 'cop', 'villas_rover_sheriff', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '368244', '"[]"', 0, 0, 0, 1, '2022-12-21 15:03:35', 0),
	(51, 'civ', 'd3s_e38_98_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '884419', '"[]"', 0, 0, 0, 1, '2022-12-21 21:26:03', 0),
	(52, 'civ', 'd3s_savana_05_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '812082', '"[]"', 0, 0, 0, 1, '2022-12-21 21:28:47', 0),
	(53, 'civ', 'd3s_e38_98_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '665928', '"[]"', 0, 0, 0, 1, '2022-12-21 21:51:09', 0),
	(54, 'cop', 'villas_rover_ksp', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '46889', '"[]"', 0, 0, 0, 1, '2022-12-21 22:35:32', 0),
	(55, 'cop', 'villas_charger_swat', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '320044', '"[]"', 0, 0, 0, 1, '2022-12-21 22:45:37', 0),
	(56, 'cop', 'villas_falcon_KSP', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '328781', '"[]"', 0, 0, 0, 1, '2022-12-22 02:49:56', 0),
	(57, 'cop', 'villas_charger_ksp', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '827472', '"[]"', 0, 0, 0, 1, '2022-12-22 02:51:25', 0),
	(59, 'cop', 'villas_charger_ksp', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '704319', '"[]"', 0, 0, 0, 1, '2022-12-22 02:55:20', 0),
	(60, 'cop', 'villas_raptor_doc', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '752178', '"[]"', 0, 0, 0, 1, '2022-12-22 02:56:35', 0),
	(61, 'civ', 'd3s_falcon_15_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '941423', '"[]"', 0, 0, 0, 1, '2022-12-22 03:04:13', 0),
	(62, 'civ', 'd3s_e38_98_AG', 'Car', '76561198140510093', 1, 0, '"[[],0]"', 0, '579465', '"[]"', 0, 0, 0, 1, '2022-12-22 03:08:04', 0),
	(63, 'civ', 'd3s_ratloader_AG', 'Car', '76561198140510093', 1, 0, '"[[],0]"', 0, '195455', '"[]"', 0, 1, 0, 1, '2022-12-22 03:15:06', 0),
	(64, 'cop', 'villas_rover_swat', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '578397', '"[]"', 0, 0, 0, 1, '2022-12-22 03:32:16', 0),
	(65, 'civ', 'd3s_hsvw427_09_AG', 'Car', '76561198140510093', 1, 0, '"[[],0]"', 0, '880356', '"[]"', 0, 0, 0, 1, '2022-12-22 03:32:17', 0),
	(66, 'cop', 'villas_rover_hwp', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '620522', '"[]"', 0, 0, 0, 1, '2022-12-22 03:33:42', 0),
	(67, 'civ', 'd3s_wrxsti_05_2_AG', 'Car', '76561198140510093', 1, 0, '"[[],0]"', 0, '551044', '"[]"', 0, 0, 0, 1, '2022-12-22 03:34:34', 0),
	(68, 'cop', 'villas_falcon_KSP', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '682067', '"[]"', 0, 0, 0, 1, '2022-12-22 03:34:44', 0),
	(69, 'cop', 'villas_charger_ksp', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '988496', '"[]"', 0, 0, 0, 1, '2022-12-22 03:35:47', 0),
	(70, 'civ', 'd3s_hsvw427_09_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '479982', '"[]"', 0, 0, 0, 1, '2022-12-22 21:12:35', 0),
	(71, 'cop', 'villas_charger_hwp', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '449563', '"[]"', 0, 0, 0, 1, '2022-12-22 22:12:18', 0),
	(72, 'cop', 'villas_raptor_doc', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '152305', '"[]"', 0, 0, 0, 1, '2022-12-22 22:13:24', 0),
	(73, 'civ', 'LF_boat_01', 'Ship', '76561198166709677', 1, 0, '"[[],0]"', 0, '649984', '"[]"', 0, 0, 0, 1, '2022-12-22 22:28:39', 0),
	(74, 'civ', 'AG_CTRG_RHIB', 'Ship', '76561198166709677', 1, 0, '"[[],0]"', 0, '687840', '"[]"', 0, 0, 0, 1, '2022-12-22 22:30:20', 0),
	(75, 'civ', 'A3PL_Yacht', 'Ship', '76561198166709677', 1, 0, '"[[],0]"', 0, '65239', '"[]"', 0, 0, 0, 1, '2022-12-22 22:32:37', 0),
	(76, 'cop', 'villas_holden_doc', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '855561', '"[]"', 0, 0, 0, 1, '2022-12-22 22:39:03', 0),
	(77, 'cop', 'villas_rover_hwp', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '87279', '"[]"', 0, 0, 0, 1, '2022-12-22 23:16:17', 0),
	(78, 'cop', 'villas_falcon_sheriff', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '630555', '"[]"', 0, 0, 0, 1, '2022-12-22 23:18:36', 0),
	(79, 'civ', 'd3s_teslaR_20_AG', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '921652', '"[]"', 0, 0, 0, 1, '2022-12-23 00:18:35', 0),
	(80, 'civ', 'd3s_e38_98_AG', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '242656', '"[]"', 0, 0, 0, 1, '2022-12-23 00:32:31', 0),
	(81, 'civ', 'd3s_chaser_00_AG', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '513283', '"[]"', 0, 0, 0, 1, '2022-12-23 00:49:54', 0),
	(82, 'cop', 'villas_rover_doc', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '750233', '"[]"', 0, 1, 0, 1, '2022-12-23 02:22:30', 0),
	(83, 'cop', 'villas_holden_doc', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '587682', '"[]"', 0, 0, 0, 1, '2022-12-23 02:26:44', 0),
	(84, 'cop', 'villas_rover_ksp', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '834519', '"[]"', 0, 0, 0, 1, '2022-12-23 02:29:43', 0),
	(85, 'cop', 'villas_holden_doc', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '314704', '"[]"', 0, 0, 0, 1, '2022-12-23 02:31:34', 0),
	(86, 'cop', 'villas_raptor_doc', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '752822', '"[]"', 0, 0, 0, 1, '2022-12-23 02:33:11', 0),
	(87, 'cop', 'villas_rover_swat', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '940323', '"[]"', 0, 0, 0, 1, '2022-12-23 02:35:28', 0),
	(88, 'cop', 'villas_rover_doc', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '215241', '"[]"', 0, 0, 0, 1, '2022-12-23 02:41:16', 0),
	(89, 'cop', 'villas_falcon_KSP', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '982888', '"[]"', 0, 0, 0, 1, '2022-12-23 02:47:23', 0),
	(90, 'cop', 'villas_charger_ksp', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '400261', '"[]"', 0, 0, 0, 1, '2022-12-23 02:48:27', 0),
	(91, 'cop', 'villas_charger_ksp', 'Car', '76561198433582953', 1, 0, '"[[],0]"', 0, '816426', '"[]"', 0, 0, 0, 1, '2022-12-23 02:50:25', 0),
	(92, 'civ', 'd3s_amazing_a45_16_AG', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '906492', '"[]"', 0, 0, 0, 1, '2022-12-23 03:10:31', 0),
	(93, 'civ', 'd3s_vandura_83_AG', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '399422', '"[]"', 0, 0, 0, 1, '2022-12-23 03:12:08', 0),
	(94, 'cop', 'AG_Bearcat_SWAT_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '243085', '"[]"', 0, 0, 0, 1, '2022-12-23 14:42:18', 0),
	(95, 'cop', 'villas_rover_swat', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '617056', '"[]"', 0, 0, 0, 1, '2022-12-23 19:40:16', 0),
	(96, 'civ', 'd3s_wrx_17_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '63694', '"[]"', 0, 0, 0, 1, '2022-12-24 00:18:59', 0),
	(97, 'civ', 'd3s_hiluxarctic_14_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '849032', '"[]"', 0, 0, 0, 1, '2022-12-24 00:29:23', 0),
	(98, 'civ', 'd3s_teslaR_20_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '940810', '"[]"', 0, 0, 0, 1, '2022-12-24 00:31:05', 0),
	(99, 'civ', 'd3s_h1_06_AG', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '731706', '"[]"', 0, 0, 0, 1, '2022-12-24 00:31:33', 0),
	(100, 'civ', 'd3s_cullinanMANS_19_G_AG', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '967772', '"[]"', 0, 0, 0, 1, '2022-12-24 00:32:38', 0),
	(101, 'civ', 'd3s_falcon_15_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '958529', '"[]"', 0, 0, 0, 1, '2022-12-24 00:51:50', 0),
	(102, 'civ', 'd3s_impala_67_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '880726', '"[]"', 0, 0, 0, 1, '2022-12-24 01:12:26', 0),
	(103, 'civ', 'd3s_xesv_17_AG', 'Car', '76561198059844393', 1, 0, '"[[],0]"', 0, '736682', '"[]"', 0, 0, 0, 1, '2022-12-24 01:12:54', 0),
	(104, 'civ', 'd3s_Ducati_Monster_1200_S_AG', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '61384', '"[]"', 0, 0, 0, 1, '2022-12-24 02:20:51', 0),
	(105, 'cop', 'villas_rover_ksp', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '191998', '"[]"', 0, 0, 0, 1, '2022-12-24 02:57:40', 0),
	(107, 'cop', 'villas_charger_ksp', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '1082', '"[]"', 0, 0, 0, 1, '2022-12-24 03:10:58', 0),
	(108, 'cop', 'villas_holden_doc', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '550536', '"[]"', 0, 0, 0, 1, '2022-12-24 03:33:12', 0),
	(109, 'cop', 'villas_Crown_Victoria_SWAT', 'Car', '76561198166709677', 1, 0, '"[[],0]"', 0, '642495', '"[]"', 0, 0, 0, 1, '2022-12-24 04:00:19', 0),
	(110, 'cop', 'villas_charger_sheriff', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '53804', '"[]"', 0, 0, 0, 1, '2022-12-24 14:17:09', 0),
	(111, 'cop', 'villas_holden_swat', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '250696', '"[]"', 0, 0, 0, 1, '2022-12-24 14:59:04', 0),
	(112, 'cop', 'AG_Raptor_UNM_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '962060', '"[]"', 0, 0, 0, 1, '2022-12-24 16:07:13', 0),
	(113, 'cop', 'AG_TAHOE15_UNM2_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '813533', '"[]"', 0, 0, 0, 1, '2022-12-24 16:08:42', 0),
	(114, 'cop', 'AG_camaro_21_Unm_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '971843', '"[]"', 0, 0, 0, 1, '2022-12-24 16:09:44', 0),
	(115, 'cop', 'AG_BMW_M5CS_Unm_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '413452', '"[]"', 0, 0, 0, 1, '2022-12-24 16:37:55', 0),
	(116, 'cop', 'd3s_G29_19_UNM_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '815441', '"[]"', 0, 0, 0, 1, '2022-12-24 16:39:22', 0),
	(117, 'cop', 'd3s_can_am_UNM_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '434615', '"[]"', 0, 0, 0, 1, '2022-12-24 16:40:23', 0),
	(118, 'cop', 'd3s_tahoe_UNM', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '833785', '"[]"', 0, 0, 0, 1, '2022-12-24 16:41:31', 0),
	(119, 'cop', 'AG_TAHOE15_UNM2_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '162082', '"[]"', 0, 0, 0, 1, '2022-12-24 16:42:04', 0),
	(120, 'cop', 'AG_TAHOE15_Sheriff_Unmarked_Alt_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '983814', '"[]"', 0, 0, 0, 1, '2022-12-24 16:42:35', 0),
	(121, 'cop', 'd3s_tahoe_15_Unm_Sides', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '985088', '"[]"', 0, 1, 0, 1, '2022-12-24 16:43:39', 0),
	(122, 'cop', 'd3s_landstalker2_gtaV_Unm', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '728492', '"[]"', 0, 0, 0, 1, '2022-12-24 16:45:41', 0),
	(123, 'cop', 'd3s_RS6MANS_20_Unm_new_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '967639', '"[]"', 0, 0, 0, 1, '2022-12-24 16:56:32', 0),
	(124, 'cop', 'villas_charger_sheriff', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '755887', '"[]"', 0, 0, 0, 1, '2022-12-24 17:00:08', 0),
	(125, 'cop', 'AG_Bearcat_SWAT_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '788430', '"[]"', 0, 0, 0, 1, '2022-12-24 17:01:22', 0),
	(126, 'cop', 'AG_Raptor_UNM_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '128901', '"[]"', 0, 0, 0, 1, '2022-12-24 17:02:54', 0),
	(127, 'cop', 'AG_BMW_M5CS_Unm_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '7092', '"[]"', 0, 0, 0, 1, '2022-12-24 17:07:32', 0),
	(128, 'cop', 'd3s_ctsv_16_unm', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '100353', '"[]"', 0, 0, 0, 1, '2022-12-24 17:12:20', 0),
	(129, 'cop', 'AG_CHARGER_Hellcat_Unm_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '770084', '"[]"', 0, 0, 0, 1, '2022-12-24 17:12:57', 0),
	(130, 'cop', 'AG_camaro_21_Unm_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '570924', '"[]"', 0, 0, 0, 1, '2022-12-24 17:13:24', 0),
	(131, 'cop', 'AG_Holden_UNM_AG', 'Car', '76561198367522633', 1, 0, '"[[],0]"', 0, '218903', '"[]"', 0, 0, 0, 1, '2022-12-24 17:14:39', 0),
	(132, 'cop', 'villas_charger_sheriff', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '746383', '"[]"', 0, 1, 0, 1, '2022-12-25 11:12:35', 0),
	(133, 'cop', 'd3s_G29_19_UNM_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '224560', '"[]"', 0, 0, 0, 1, '2022-12-25 14:08:34', 0),
	(134, 'cop', 'villas_rover_sheriff', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '467924', '"[]"', 0, 0, 0, 1, '2022-12-25 14:41:35', 0),
	(135, 'cop', 'villas_charger_ksp', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '605197', '"[]"', 0, 1, 0, 1, '2022-12-25 19:50:03', 0),
	(136, 'civ', 'd3s_e38_98_AG', 'Car', '76561198303262159', 1, 0, '"[[],0]"', 0, '842987', '"[]"', 0, 0, 0, 1, '2022-12-26 12:34:06', 0),
	(137, 'civ', 'd3s_challenger_15_DM_AG', 'Car', '76561198303262159', 1, 0, '"[[],0]"', 0, '187933', '"[]"', 0, 0, 0, 1, '2022-12-26 13:36:53', 0),
	(138, 'cop', 'villas_falcon_KSP', 'Car', '76561198303262159', 1, 0, '"[[],0]"', 0, '647139', '"[]"', 0, 0, 0, 1, '2022-12-26 14:00:14', 0),
	(139, 'civ', 'd3s_brabusrocket900_63_AG', 'Car', '76561199093529621', 1, 0, '"[[],0]"', 0, '886586', '"[]"', 0, 0, 0, 1, '2022-12-26 17:10:13', 0),
	(140, 'cop', 'villas_rover_ksp', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '884996', '"[]"', 0, 1, 0, 1, '2022-12-26 17:10:21', 0),
	(141, 'cop', 'villas_falcon_sheriff', 'Car', '76561198376013446', 1, 0, '"[[],0]"', 0, '494973', '"[]"', 0, 1, 0, 1, '2022-12-26 18:58:05', 0),
	(142, 'civ', 'd3s_raptor_17_AG', 'Car', '76561199148078501', 1, 0, '"[[],0]"', 0, '283230', '"[]"', 0, 0, 0, 1, '2022-12-26 19:46:14', 0),
	(143, 'civ', 'd3s_hiluxarctic_14_AG', 'Car', '76561199148078501', 1, 0, '"[[],0]"', 0, '867638', '"[]"', 0, 0, 0, 1, '2022-12-26 20:07:30', 0),
	(144, 'civ', 'd3s_durango_18_AG', 'Car', '76561199148078501', 1, 0, '"[[],0]"', 0, '242935', '"[]"', 0, 0, 0, 1, '2022-12-26 20:14:59', 0),
	(145, 'civ', 'd3s_Tank300_21_AG', 'Car', '76561199148078501', 1, 0, '"[[],0]"', 0, '142830', '"[]"', 0, 0, 0, 1, '2022-12-26 20:16:08', 0),
	(146, 'cop', 'villas_charger_sheriff', 'Car', '76561198376013446', 1, 0, '"[[],0]"', 0, '692022', '"[]"', 0, 0, 0, 1, '2022-12-27 12:34:19', 0),
	(147, 'cop', 'villas_rover_ksp', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '604911', '"[]"', 0, 0, 0, 1, '2022-12-27 13:49:10', 0),
	(148, 'cop', 'villas_raptor_doc', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '318241', '"[]"', 0, 0, 0, 1, '2022-12-27 14:06:34', 0),
	(149, 'cop', 'AG_Bearcat_SWAT_AG', 'Car', '76561198374137014', 1, 0, '"[[],0]"', 0, '383524', '"[]"', 0, 0, 0, 1, '2022-12-27 14:18:48', 0),
	(150, 'cop', 'AG_falcon_UNM_AG', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '306245', '"[]"', 0, 0, 0, 1, '2022-12-28 04:23:16', 0),
	(151, 'cop', 'AG_CHARGER_Hellcat_Unm_AG', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '519603', '"[]"', 0, 0, 0, 1, '2022-12-28 04:26:01', 0),
	(152, 'cop', 'villas_rover_hwp', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '308718', '"[]"', 0, 0, 0, 1, '2022-12-28 12:28:03', 0),
	(153, 'cop', 'villas_charger_sheriff', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '178850', '"[]"', 0, 1, 0, 1, '2022-12-28 12:30:20', 0),
	(155, 'cop', 'villas_rover_sheriff', 'Car', '76561198424187813', 1, 0, '"[[],0]"', 0, '207361', '"[]"', 0, 0, 0, 1, '2022-12-28 21:35:51', 0),
	(156, 'cop', 'AG_Bearcat_SWAT_AG', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '126045', '"[]"', 0, 0, 0, 1, '2022-12-29 23:00:44', 0),
	(157, 'cop', 'AG_CHARGER_Hellcat_DOC_AG_TIER3', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '835045', '"[]"', 0, 0, 0, 1, '2022-12-30 05:46:21', 0),
	(158, 'cop', 'AG_CROWNVIC_DOC_AG_TIER3', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '571757', '"[]"', 0, 0, 0, 1, '2022-12-30 05:53:31', 0),
	(159, 'cop', 'AG_CROWNVIC_HWP_ST_AG', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '624119', '"[]"', 0, 0, 0, 1, '2022-12-30 05:55:26', 0),
	(160, 'cop', 'AG_MustangGT15_HWP_ST_AG_TIER3', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '942843', '"[]"', 0, 0, 0, 1, '2022-12-30 05:57:18', 0),
	(161, 'cop', 'AG_TAHOE15_HWP_ST_AG', 'Car', '76561198314493020', 1, 0, '"[[],0]"', 0, '332919', '"[]"', 0, 0, 0, 1, '2022-12-30 05:58:20', 0);

-- Dumping structure for table armalife.warrants
CREATE TABLE IF NOT EXISTS `warrants` (
  `id` int(11) DEFAULT NULL,
  `pid` varchar(17) DEFAULT NULL,
  `crime_id` varchar(50) DEFAULT NULL,
  `insert_datetime` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table armalife.warrants: ~2 rows (approximately)
INSERT INTO `warrants` (`id`, `pid`, `crime_id`, `insert_datetime`) VALUES
	(NULL, '76561198166709677', '3', '2022-12-24 02:54:49'),
	(NULL, '76561198166709677', '7', '2022-12-24 03:30:44');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
