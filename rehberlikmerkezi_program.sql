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
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `program_id` int NOT NULL AUTO_INCREMENT,
  `program_kodu` varchar(4) DEFAULT NULL,
  `program_adı` varchar(45) DEFAULT NULL,
  `program__kac_hafta` int DEFAULT NULL,
  `terapist_id` int NOT NULL,
  `hasta_id` int NOT NULL,
  `merkez_id` int NOT NULL,
  PRIMARY KEY (`program_id`),
  KEY `fk_program_terapsit1_idx` (`terapist_id`),
  KEY `fk_program_merkez1_idx` (`merkez_id`),
  KEY `fk_program_hasta1_idx` (`hasta_id`),
  CONSTRAINT `fk_program_hasta1` FOREIGN KEY (`hasta_id`) REFERENCES `hasta` (`hasta_id`),
  CONSTRAINT `fk_program_merkez1` FOREIGN KEY (`merkez_id`) REFERENCES `merkez` (`merkez_id`),
  CONSTRAINT `fk_program_terapsit1` FOREIGN KEY (`terapist_id`) REFERENCES `terapist` (`terapist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'PK1','Temel Fizyoterapi Programı',7,2,4,1),(2,'PK2','Kalp ve Solunum Programı',2,5,2,3),(3,'PK3','Kas İskelet Fizyoterapisi Programı',5,1,3,2),(4,'PK4','Nörolojik Fizyoterapi Programı',8,3,1,4),(5,'PK5','Nörolojik Fizyoterapi Programı',5,4,6,5),(6,'PK6','Sporda Fizyoterapi Programı',10,6,12,2);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
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
