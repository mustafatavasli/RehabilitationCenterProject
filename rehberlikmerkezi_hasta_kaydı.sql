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
-- Table structure for table `hasta_kaydı`
--

DROP TABLE IF EXISTS `hasta_kaydı`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasta_kaydı` (
  `hasta_kaydı_id` int NOT NULL AUTO_INCREMENT,
  `hasta_kaydı_no` int DEFAULT NULL,
  `hasta_kaydı_tarih` date DEFAULT NULL,
  `hasta_kaydı_teşhis` varchar(45) DEFAULT NULL,
  `hasta_kaydı_tedavi_yöntemi` varchar(45) DEFAULT NULL,
  `hasta_id` int NOT NULL,
  PRIMARY KEY (`hasta_kaydı_id`),
  KEY `fk_hasta_kaydı_hasta1_idx` (`hasta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasta_kaydı`
--

LOCK TABLES `hasta_kaydı` WRITE;
/*!40000 ALTER TABLE `hasta_kaydı` DISABLE KEYS */;
INSERT INTO `hasta_kaydı` VALUES (1,1,'2020-09-15','Temel Fizyoterapi Teşhisi','Fiziksel Terapi',1),(2,2,'2023-05-28','Kalp ve Solunum Teşhisi','Solunum Terapisi',2),(3,3,'2022-11-03','Kas İskelet Fizyoterapisi Teşhisi','İlaç',3),(4,4,'2024-07-21','Nörolojik Fizyoterapi Teşhisi','İlaç',4),(5,5,'2021-12-09','Nörolojik Fizyoterapi Teşhisi','Fizik Tedavi',5),(6,6,'2020-02-17','Sporda Fizyoterapi Teşhisi','Fizik Tedavi',6);
/*!40000 ALTER TABLE `hasta_kaydı` ENABLE KEYS */;
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
