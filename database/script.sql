-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: sandy_moon
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `student_id` varchar(255) NOT NULL,
  `card_id` varchar(255) NOT NULL,
  `week_1` tinyint DEFAULT '0',
  `week_2` tinyint DEFAULT '0',
  `week_3` tinyint DEFAULT '0',
  `week_4` tinyint DEFAULT '0',
  `week_5` tinyint DEFAULT '0',
  `week_6` tinyint DEFAULT '0',
  `week_7` tinyint DEFAULT '0',
  `week_8` tinyint DEFAULT '0',
  `week_9` tinyint DEFAULT '0',
  `week_10` tinyint DEFAULT '0',
  `week_11` tinyint DEFAULT '0',
  `week_12` tinyint DEFAULT '0',
  `last_seen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `student_information` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `id` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES ('6644142e-c3b7-4bf4-be5f-cc339dfe2c21','adeoye','adefemi','drizzle','$2b$13$Kk9sA/KqeWt.RfTLrXpXy.ViR/tmAT1ScY3NvYOPfqs4tLEApy3Ny','2021-12-28 21:59:06'),('b9f289c0-036d-42de-a814-79f54d6a7f2d','adeoye','adefemi','admin','$2b$13$Phr7TTbmk9SViAx6ZeZI1eNMtsJkytWhmqsiF7cHuMnzmcB3jKEze','2021-12-27 21:45:01'),('c5724685-7ee1-4b75-b506-0b93cf745056','adeoye','adefemi','maximus','$2b$13$ykleSNVu5IErwwtQyTmUOe/lt3NXbUinQdEljiOItfertbKCIvVsC','2021-12-28 21:58:07');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_information`
--

DROP TABLE IF EXISTS `student_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_information` (
  `student_id` varchar(255) NOT NULL,
  `matric_number` int NOT NULL,
  `student_first_name` varchar(255) NOT NULL,
  `student_last_name` varchar(255) NOT NULL,
  `student_middle_name` varchar(255) DEFAULT NULL,
  `student_email` varchar(255) NOT NULL,
  `registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `student_gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_id` (`student_id`),
  UNIQUE KEY `matric_number` (`matric_number`),
  UNIQUE KEY `student_email` (`student_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_information`
--

LOCK TABLES `student_information` WRITE;
/*!40000 ALTER TABLE `student_information` DISABLE KEYS */;
INSERT INTO `student_information` VALUES ('1',20181684,'onanuga','oreoluwa','micheal','onanugaom.18@student.funaab.edu.ng','2021-12-26 20:20:41','male'),('2',20181659,'falade','vincent','michael','faladeov.18@student.funaab.edu.ng','2021-12-26 20:28:29','male'),('3',20191661,'bolarinwa','emmanuel','ayomide','bolarinwaea.19@student.funaab.edu.ng','2021-12-26 20:28:29','male'),('4',20181681,'olorunnishola','taiwo','oluwadamilola','olorunnisholato.18@student.funaab.edu.ng','2021-12-26 20:28:29','female'),('5',20183210,'onabanjo','peter','olamide','onabanjopo.18@student.funaab.edu.ng','2021-12-26 20:28:29','male');
/*!40000 ALTER TABLE `student_information` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-28 22:48:06
