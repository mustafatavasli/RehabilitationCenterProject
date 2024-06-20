-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: rehberlikmerkezi
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `terapist`
--

DROP TABLE IF EXISTS `terapist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terapist` (
  `terapist_id` int NOT NULL AUTO_INCREMENT,
  `terapist_tc` varchar(11) NOT NULL,
  `terapist_adı` varchar(45) DEFAULT NULL,
  `terapist_soyadı` varchar(45) DEFAULT NULL,
  `terapist_uzmanlık` varchar(45) DEFAULT NULL,
  `hasta_id` int NOT NULL,
  `merkez_id` int NOT NULL,
  PRIMARY KEY (`terapist_id`),
  KEY `fk_terapsit_hasta1_idx` (`hasta_id`),
  KEY `fk_terapsit_merkez1_idx` (`merkez_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terapist`
--

LOCK TABLES `terapist` WRITE;
/*!40000 ALTER TABLE `terapist` DISABLE KEYS */;
INSERT INTO `terapist` VALUES (1,'36472812935','Özlem','Ülger','Temel Fizyoterapi',1,1),(2,'78593410267','Ayşe ','Livanelioğlu','Kalp ve Solunum',2,2),(3,'50928374615','Tülin ','Düger','Kas İskelet Fizyoterapisi',3,3),(4,'92184730563','Türkan ','Akbayrak','Nörolojik Fizyoterapi',4,4),(5,'94572882891','Türkan ','Akbayrak','Nörolojik Fizyoterapi',4,4),(6,'64827395012','Barış  ','Çetin','Sporda Fizyoterapi ',4,4);
/*!40000 ALTER TABLE `terapist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-24 20:11:03
