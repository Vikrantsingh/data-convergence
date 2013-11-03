-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.71-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for datarepo
CREATE DATABASE IF NOT EXISTS `datarepo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `datarepo`;


-- Dumping structure for table datarepo.dataset_keys
CREATE TABLE IF NOT EXISTS `dataset_keys` (
  `dataset_key_id` int(20) NOT NULL AUTO_INCREMENT,
  `location_index_id` int(20) DEFAULT NULL,
  `keyname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dataset_key_id`),
  KEY `FK_dataset_keys_location_index` (`location_index_id`),
  CONSTRAINT `FK_dataset_keys_location_index` FOREIGN KEY (`location_index_id`) REFERENCES `location_index` (`location_index_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table datarepo.dataset_keys: ~34 rows (approximately)
/*!40000 ALTER TABLE `dataset_keys` DISABLE KEYS */;
INSERT INTO `dataset_keys` (`dataset_key_id`, `location_index_id`, `keyname`) VALUES
	(1, 1, 'officename'),
	(2, 1, 'pincode'),
	(3, 1, 'officeType'),
	(4, 1, 'Deliverystatus'),
	(5, 1, 'divisionname'),
	(6, 1, 'regionname'),
	(7, 1, 'circlename'),
	(8, 1, 'Taluk'),
	(9, 1, 'Districtname'),
	(10, 1, 'statename'),
	(11, 2, 'HOTEL_NAME'),
	(12, 2, 'ADDRESS'),
	(13, 2, 'STATE'),
	(14, 2, 'PHONE'),
	(15, 2, 'FAX'),
	(16, 2, 'EMAIL_ID'),
	(17, 2, 'WEBSITE'),
	(18, 2, 'TYPE'),
	(19, 2, 'Rooms'),
	(20, 3, 'Name_of_Agency'),
	(21, 3, 'Address'),
	(22, 3, 'Phone'),
	(23, 3, 'Fax'),
	(24, 3, 'Email'),
	(25, 3, 'Region'),
	(26, 3, 'City'),
	(27, 3, 'State'),
	(28, 3, 'Contact_Person'),
	(29, 3, 'TYPE'),
	(30, 4, 'Year'),
	(31, 4, 'Foreign_Tourist_Ariivals_in_Numbers'),
	(32, 4, 'Foreign_Exchange_Earnings_in_Crores'),
	(33, 4, 'Foreign_Exchange_Earnings_in_USD_Millions'),
	(34, 4, 'Domestic_Tourist_Visits_in_Numbers');
/*!40000 ALTER TABLE `dataset_keys` ENABLE KEYS */;


-- Dumping structure for view datarepo.dataset_loc_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `dataset_loc_view` (
	`location_index_id` INT(20) NOT NULL,
	`country` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`state` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`district` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`department` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`dataset_name` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`date_time` TIMESTAMP NOT NULL,
	`dataset_key_id` INT(20) NOT NULL,
	`keyname` VARCHAR(100) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for table datarepo.location_index
CREATE TABLE IF NOT EXISTS `location_index` (
  `location_index_id` int(20) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `department` varchar(50) NOT NULL,
  `dataset_name` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_index_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table datarepo.location_index: ~4 rows (approximately)
/*!40000 ALTER TABLE `location_index` DISABLE KEYS */;
INSERT INTO `location_index` (`location_index_id`, `country`, `state`, `district`, `department`, `dataset_name`, `date_time`) VALUES
	(1, 'india', '', '', 'address', 'pincode', '2013-10-27 00:23:03'),
	(2, 'India', '', '', 'Tourism', 'HotelData', '2013-10-27 00:31:07'),
	(3, 'India', '', '', 'Tourism', 'TravelTour', '2013-10-27 00:31:23'),
	(4, 'India', '', '', 'Tourism', 'Tourism Statistics', '2013-10-27 00:31:42');
/*!40000 ALTER TABLE `location_index` ENABLE KEYS */;


-- Dumping structure for view datarepo.dataset_loc_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `dataset_loc_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `dataset_loc_view` AS SELECT * from location_index natural join dataset_keys ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
