-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 10, 2014 at 04:29 PM
-- Server version: 5.5.33-cll-lve
-- PHP Version: 5.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `barni_harta_spania`
--
CREATE DATABASE IF NOT EXISTS `barni_harta_spania` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `barni_harta_spania`;

-- --------------------------------------------------------

--
-- Table structure for table `track_events`
--

CREATE TABLE IF NOT EXISTS `track_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUSER` int(11) NOT NULL DEFAULT '0',
  `trackName` varchar(200) NOT NULL,
  `eventName` varchar(200) NOT NULL DEFAULT '0',
  `eventVals` varchar(1000) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

-- --------------------------------------------------------

--
-- Table structure for table `track_users`
--

CREATE TABLE IF NOT EXISTS `track_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT NULL,
  `navigator` text,
  `navagent` varchar(150) DEFAULT NULL,
  `time_registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`,`navagent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
