-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for flightstatusdb
DROP DATABASE IF EXISTS `flightstatusdb`;
CREATE DATABASE IF NOT EXISTS `flightstatusdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `flightstatusdb`;

-- Dumping structure for table flightstatusdb.departures
CREATE TABLE IF NOT EXISTS `departures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flightno` varchar(50) DEFAULT NULL,
  `flightbanner` text DEFAULT NULL,
  `destination` varchar(60) DEFAULT NULL,
  `gate` varchar(20) DEFAULT NULL,
  `departdate` date DEFAULT curdate(),
  `departtime` varchar(20) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table flightstatusdb.departures: ~4 rows (approximately)
DELETE FROM `departures`;
/*!40000 ALTER TABLE `departures` DISABLE KEYS */;
INSERT INTO `departures` (`id`, `flightno`, `flightbanner`, `destination`, `gate`, `departdate`, `departtime`, `remarks`) VALUES
	(1, 'U 1523', NULL, 'LOS ANGELES', 'G1', '2023-03-29', '11:20', 'CALLING'),
	(2, 'C 8373', NULL, 'BEJING', 'G3', '2023-03-29', '11:20', 'OPEN'),
	(3, 'S 8472', NULL, 'SINGAPORE', 'G2', '2023-03-29', '12:20', 'OPEN'),
	(4, 'J 2637', NULL, 'TOKYO', 'G5', '2023-03-29', '13:20', NULL);
/*!40000 ALTER TABLE `departures` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
