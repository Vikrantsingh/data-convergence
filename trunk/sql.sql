-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.25a - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.0.0.4396
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
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;

-- Dumping data for table datarepo.dataset_keys: ~63 rows (approximately)
/*!40000 ALTER TABLE `dataset_keys` DISABLE KEYS */;
INSERT INTO `dataset_keys` (`dataset_key_id`, `location_index_id`, `keyname`) VALUES
	(71, 14, 'officename'),
	(72, 14, 'pincode'),
	(73, 14, 'officeType'),
	(74, 14, 'Deliverystatus'),
	(75, 14, 'divisionname'),
	(76, 14, 'regionname'),
	(77, 14, 'circlename'),
	(78, 14, 'Taluk'),
	(79, 14, 'Districtname'),
	(80, 14, 'statename'),
	(105, 18, '"Sector"'),
	(106, 18, '"2004-05"'),
	(107, 18, '"2005-06"'),
	(108, 18, '"2006-07"'),
	(109, 18, '"2007-08"'),
	(110, 18, '"2008-09"'),
	(111, 18, '"2009-10"'),
	(112, 18, '"2010-11"'),
	(113, 18, '"2011-12"'),
	(114, 19, '"Sector"'),
	(115, 19, '"2004-05"'),
	(116, 19, '"2005-06"'),
	(117, 19, '"2006-07"'),
	(118, 19, '"2007-08"'),
	(119, 19, '"2008-09"'),
	(120, 19, '"2009-10"'),
	(121, 19, '"2010-11"'),
	(122, 19, '"2011-12"'),
	(123, 19, '"2012-13"'),
	(124, 20, '"Sector"'),
	(125, 20, '"2004-05"'),
	(126, 20, '"2005-06"'),
	(127, 20, '"2006-07"'),
	(128, 20, '"2007-08"'),
	(129, 20, '"2008-09"'),
	(130, 20, '"2009-10"'),
	(131, 20, '"2010-11"'),
	(132, 20, '"2011-12"'),
	(133, 20, '"2012-13"'),
	(144, 22, 'Name_of_Agency'),
	(145, 22, 'Address'),
	(146, 22, 'Phone'),
	(147, 22, 'Fax'),
	(148, 22, 'Email'),
	(149, 22, 'Region'),
	(150, 22, 'City'),
	(151, 22, 'State'),
	(152, 22, 'Contact_Person'),
	(153, 22, 'TYPE'),
	(154, 23, 'Year'),
	(155, 23, 'Foreign_Tourist_Ariivals_in_Numbers'),
	(156, 23, 'Foreign_Exchange_Earnings_in_Crores'),
	(157, 23, 'Foreign_Exchange_Earnings_in_USD_Millions'),
	(158, 23, 'Domestic_Tourist_Visits_in_Numbers'),
	(159, 24, 'HOTEL_NAME'),
	(160, 24, 'ADDRESS'),
	(161, 24, 'STATE'),
	(162, 24, 'PHONE'),
	(163, 24, 'FAX'),
	(164, 24, 'EMAIL_ID'),
	(165, 24, 'WEBSITE'),
	(166, 24, 'TYPE'),
	(167, 24, 'Rooms');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table datarepo.location_index: ~7 rows (approximately)
/*!40000 ALTER TABLE `location_index` DISABLE KEYS */;
INSERT INTO `location_index` (`location_index_id`, `country`, `state`, `district`, `department`, `dataset_name`, `date_time`) VALUES
	(14, 'india', '', '', 'address', 'pincode', '2013-09-25 12:08:00'),
	(18, 'india', 'gujrat', '', 'finance', 'gsdp_cons_guj', '2013-09-25 22:32:52'),
	(19, 'india', 'maharashtra', '', 'finance', 'gsdp_cons_maha', '2013-09-25 22:33:12'),
	(20, 'india', 'andhra  pradesh', '', 'finance', 'gsdp_cons_ap', '2013-09-25 22:33:31'),
	(22, 'india', '', '', 'tourism', 'travel_tour_data', '2013-09-26 19:12:48'),
	(23, 'india', '', '', 'tourism', 'tourism_statistics', '2013-09-26 19:14:03'),
	(24, 'india', '', '', 'tourism', 'hotel_tourism_data', '2013-09-26 19:14:38');
/*!40000 ALTER TABLE `location_index` ENABLE KEYS */;


-- Dumping structure for view datarepo.dataset_loc_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `dataset_loc_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `datarepo`.`dataset_loc_view` AS SELECT * from location_index natural join dataset_keys ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
