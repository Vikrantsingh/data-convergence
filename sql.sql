-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.25a - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-09-19 11:01:03
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for datarepo
CREATE DATABASE IF NOT EXISTS `datarepo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `datarepo`;


-- Dumping structure for table datarepo.dataset_keys
CREATE TABLE IF NOT EXISTS `dataset_keys` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `dataset_id` int(20) DEFAULT NULL,
  `keyname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table datarepo.dataset_keys: ~10 rows (approximately)
/*!40000 ALTER TABLE `dataset_keys` DISABLE KEYS */;
INSERT INTO `dataset_keys` (`id`, `dataset_id`, `keyname`) VALUES
	(1, 6, 'officename'),
	(2, 6, 'pincode'),
	(3, 6, 'officeType'),
	(4, 6, 'Deliverystatus'),
	(5, 6, 'divisionname'),
	(6, 6, 'regionname'),
	(7, 6, 'circlename'),
	(8, 6, 'Taluk'),
	(9, 6, 'Districtname'),
	(10, 6, 'statename');
/*!40000 ALTER TABLE `dataset_keys` ENABLE KEYS */;


-- Dumping structure for table datarepo.location_index
CREATE TABLE IF NOT EXISTS `location_index` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `department` varchar(50) NOT NULL,
  `dataset_name` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table datarepo.location_index: ~6 rows (approximately)
/*!40000 ALTER TABLE `location_index` DISABLE KEYS */;
INSERT INTO `location_index` (`id`, `country`, `state`, `district`, `department`, `dataset_name`, `date_time`) VALUES
	(1, 'sadf', 'grfd', '`hgd', 'hgdf', 'hgfd', '2013-09-13 20:03:57'),
	(2, 'india', 'maha', 'nanded', 'agri', 'population', '2013-09-15 16:23:24'),
	(3, 'india', 'maha', 'nanded', 'agri', 'population', '2013-09-15 16:40:19'),
	(4, 'single', 'single', 'single', 'sdfdsf', 'sdfasdf', '2013-09-19 00:11:17'),
	(5, 'ind', 'maha', 'ned', 'vik', 'vik2', '2013-09-19 10:14:36'),
	(6, 'ind', 'maha', 'ned', 'vik', 'vik2', '2013-09-19 10:51:42');
/*!40000 ALTER TABLE `location_index` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
