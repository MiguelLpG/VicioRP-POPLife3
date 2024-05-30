-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2022 at 02:47 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pop3`
--

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
--

CREATE TABLE `gangs` (
  `id` int(11) NOT NULL,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text DEFAULT NULL,
  `maxmembers` int(11) DEFAULT 8,
  `bank` int(11) DEFAULT 0,
  `active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text DEFAULT NULL,
  `containers` text DEFAULT NULL,
  `owned` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `log` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `id` int(11) NOT NULL,
  `prices` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `uid` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(11) NOT NULL DEFAULT 0,
  `bankacc` int(11) NOT NULL DEFAULT 0,
  `coplevel` enum('0','1','2','3','4','5','6','7','8') NOT NULL DEFAULT '0',
  `cop_licenses` text DEFAULT NULL,
  `civ_licenses` text DEFAULT NULL,
  `med_licenses` text DEFAULT NULL,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT 0,
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `experiencia` text DEFAULT NULL,
  `jailtime` int(11) DEFAULT 0,
  `arrestreason` text DEFAULT NULL,
  `op_licenses` text DEFAULT NULL,
  `op_gear` text NOT NULL,
  `oplevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `mafialvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `terrolvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `position` varchar(64) NOT NULL DEFAULT '"[]"',
  `insert_time` timestamp NULL DEFAULT current_timestamp(),
  `blacklist` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`uid`, `name`, `playerid`, `cash`, `bankacc`, `coplevel`, `cop_licenses`, `civ_licenses`, `med_licenses`, `cop_gear`, `med_gear`, `mediclevel`, `arrested`, `aliases`, `adminlevel`, `donatorlvl`, `civ_gear`, `experiencia`, `jailtime`, `arrestreason`, `op_licenses`, `op_gear`, `oplevel`, `mafialvl`, `terrolvl`, `position`, `insert_time`, `blacklist`) VALUES
(1, 'Eme Call', '76561198243440740', 21500, 7992, '8', '\"[[`license_cop_air`,0],[`license_cop_swat`,0],[`license_cop_cg`,0]]\"', '\"[[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,0],[`license_civ_depan`,0],[`license_civ_policiaon`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_bus`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_transporte`,0],[`license_civ_donator`,1],[`license_civ_alcalde`,0]]\"', '\"[]\"', '\"[``,``,`mochila_pequena`,``,``,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemGPS`],`hlc_smg_mp5sd5`,`RH_bullb`,[],[],[],[`26_cartridge`,`26_cartridge`,`26_cartridge`,`26_cartridge`,`26_cartridge`],[],[],[``,``,``,``],[``,``,``,``]]\"', '\"[]\"', '0', 0, '\"[`Eme Call`]\"', '5', '5', '\"[`TRYK_U_B_BLKBLK_R_CombatUniform`,`A3L_fbivest1`,``,`G_Aviator`,`mgsr_beret`,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemGPS`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]\"', '[114,1,1500,0,0,0,0,0,0,0,0,0,0,0]', 0, '\"\"', '\"[]\"', '\"[]\"', '0', '5', '5', '\"[]\"', '2022-07-10 02:11:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `politica`
--

CREATE TABLE `politica` (
  `id` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `votos` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `politicados`
--

CREATE TABLE `politicados` (
  `votantes` varchar(50) DEFAULT NULL,
  `candidato` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `pid` varchar(32) NOT NULL,
  `inventario` text DEFAULT NULL,
  `capacidad` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(105) NOT NULL,
  `nombre_user` varchar(105) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `steamid` varchar(255) NOT NULL,
  `permisos` enum('Super Admin','Moderador','Administrador','Game Master','Admin Mafias','Responsable Donaciones','Jefatura Policial','Jefatura EMS','Encargado Devoluciones') NOT NULL,
  `estado` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `side` varchar(15) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `plate` varchar(8) NOT NULL,
  `color` int(11) NOT NULL,
  `fuel` varchar(16) NOT NULL DEFAULT '"1"'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `side`, `classname`, `type`, `pid`, `alive`, `active`, `plate`, `color`, `fuel`) VALUES
(1, 'cop', 'c4_picasso_16_cnp', 'Car', '76561198243440740', 1, 1, '723864', 0, '\"1\"'),
(2, 'cop', 'c4_picasso_16_cnp', 'Car', '76561198243440740', 1, 1, '350096', 0, '\"1\"'),
(3, 'civ', 'V12_KAWASAKIH2_2017_noir', 'Car', '76561198243440740', 1, 1, '15951', 0, '\"1\"'),
(4, 'cop', 'c4_picasso_16_cnp', 'Car', '76561198243440740', 1, 1, '116073', 0, '\"1\"');

-- --------------------------------------------------------

--
-- Table structure for table `wanted`
--

CREATE TABLE `wanted` (
  `list` text DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `whitelist`
--

CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` varchar(64) DEFAULT NULL,
  `guid` varchar(64) DEFAULT NULL,
  `uid` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gangs`
--
ALTER TABLE `gangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`,`pid`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `playerid` (`playerid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `politica`
--
ALTER TABLE `politica`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pid` (`pid`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `side` (`side`),
  ADD KEY `pid` (`pid`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `wanted`
--
ALTER TABLE `wanted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gangs`
--
ALTER TABLE `gangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `storages`
--
ALTER TABLE `storages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `whitelist`
--
ALTER TABLE `whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
