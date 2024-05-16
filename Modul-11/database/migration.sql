-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for jualbeli
CREATE DATABASE IF NOT EXISTS `jualbeli` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jualbeli`;

-- Dumping structure for table jualbeli.jenis_minuman
CREATE TABLE IF NOT EXISTS `jenis_minuman` (
  `id_jenis` int NOT NULL AUTO_INCREMENT,
  `nm_jenis` varchar(50) DEFAULT NULL,
  `merek` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
)

-- Data exporting was unselected.

-- Dumping structure for table jualbeli.jualbeli
CREATE TABLE IF NOT EXISTS `jualbeli` (
  `id_jualbeli` int NOT NULL AUTO_INCREMENT,
  `id_minuman` int DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `jenis` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_jualbeli`),
  KEY `FK__register` (`username`),
  KEY `FK_jualbeli_minuman` (`id_minuman`),
  CONSTRAINT `FK__register` FOREIGN KEY (`username`) REFERENCES `register` (`username`),
  CONSTRAINT `FK_jualbeli_minuman` FOREIGN KEY (`id_minuman`) REFERENCES `minuman` (`id_minuman`)
) 

-- Data exporting was unselected.

-- Dumping structure for table jualbeli.minuman
CREATE TABLE IF NOT EXISTS `minuman` (
  `id_minuman` int NOT NULL AUTO_INCREMENT,
  `id_jenis` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `ukuran` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  PRIMARY KEY (`id_minuman`),
  KEY `FK__jenis_minuman` (`id_jenis`),
  CONSTRAINT `FK__jenis_minuman` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_minuman` (`id_jenis`)
) 

-- Data exporting was unselected.

-- Dumping structure for table jualbeli.register
CREATE TABLE IF NOT EXISTS `register` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) 

-- Data exporting was unselected.

-- Dumping structure for trigger jualbeli.beli
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `beli` AFTER INSERT ON `jualbeli` FOR EACH ROW BEGIN
	UPDATE minuman
	SET jumlah=jumlah+NEW.jumlah
	WHERE id_minuman=NEW.id_minuman AND NEW.jenis = 'Beli';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jualbeli.jual
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `jual` AFTER INSERT ON `jualbeli` FOR EACH ROW BEGIN
	UPDATE minuman
	SET jumlah=jumlah-NEW.jumlah
	WHERE id_minuman=NEW.id_minuman AND NEW.jenis = 'Jual';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
