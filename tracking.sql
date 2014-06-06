-- --------------------------------------------------------
-- Host:                         193.226.170.189
-- Server version:               5.5.28 - MySQL Community Server (GPL) by Atomicorp
-- Server OS:                    Linux
-- HeidiSQL Version:             8.1.0.4591
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for barni_harta
CREATE DATABASE IF NOT EXISTS `barni_harta` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `barni_harta`;


-- Dumping structure for table barni_harta.track_events
CREATE TABLE IF NOT EXISTS `track_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUSER` int(11) NOT NULL DEFAULT '0',
  `eventName` varchar(200) NOT NULL DEFAULT '0',
  `eventVals` varchar(1000) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table barni_harta.track_users
CREATE TABLE IF NOT EXISTS `track_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT NULL,
  `navigator` text,
  `navagent` varchar(150) DEFAULT NULL,
  `time_registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`,`navagent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
