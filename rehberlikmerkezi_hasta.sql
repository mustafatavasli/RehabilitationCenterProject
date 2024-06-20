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
-- Table structure for table `hasta`
--

DROP TABLE IF EXISTS `hasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasta` (
  `hasta_id` int NOT NULL AUTO_INCREMENT,
  `hasta_tc` varchar(11) NOT NULL,
  `hasta_adı` varchar(45) DEFAULT NULL,
  `hasta_soyadı` varchar(45) DEFAULT NULL,
  `hasta_yaş` tinyint DEFAULT NULL,
  `hasta_erkek_mi` varchar(5) DEFAULT NULL,
  `hasta_şehir` varchar(45) DEFAULT NULL,
  `hasta_mahalle` varchar(45) DEFAULT NULL,
  `hasta_ev_no` varchar(45) DEFAULT NULL,
  `merkez_id` int NOT NULL,
  PRIMARY KEY (`hasta_id`),
  KEY `fk_hasta_merkez1_idx` (`merkez_id`),
  CONSTRAINT `fk_hasta_merkez1` FOREIGN KEY (`merkez_id`) REFERENCES `merkez` (`merkez_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasta`
--

LOCK TABLES `hasta` WRITE;
/*!40000 ALTER TABLE `hasta` DISABLE KEYS */;
INSERT INTO `hasta` VALUES 
(1,'1234567890','Ayşe','Kaya',35,'Hayır','Trabzon','İnönü','10',4),
(2,'1234567891','Mustafa','Yılmaz',45,'Evet','İstanbul','Gazi','30',2),
(3,'1234567892','Fatma','Şahin',25,'Hayır','Ankara','Dost','10',5),
(4,'1234567893','Mehmet','Demir',50,'Evet','İzmir','Sevgi','6',2),
(5,'1234567894','Zeynep','Arslan',30,'Hayır','Ankara','Saygı','12',1),
(6,'1234567895','Ali','Çelik',40,'Evet','Konya','Huzur','4',3),
(7,'1234567896','Aylin','Koç',28,'Hayır','İstanbul','Yeditepe','22',1),
(8,'1234567897','Emre','Yıldırım',55,'Evet','Mersin','Atatürk','1',2),
(9,'1234567898','Elif','Güneş',33,'Hayır','Ankara','Bayar','3',3),
(10,'1234567899','Murat','Aktaş',48,'Evet','Antalya','Çakmak','8',5),
(11,'1234567801','Sevgi','Şimşek',38,'Hayır','Konya','Dost','19',2),
(12,'1234567802','Hakan','Doğan',42,'Evet','İstanbul','İnönü','13',1),
(13,'1234567803','Nur','Taş',31,'Hayır','İzmir','Sevgi','15',2),
(14,'1234567804','Cem','Uçar',47,'Evet','Ankara','Kardeş','9',4),
(15,'1234567805','Deniz','Kurt',27,'Evet','Trabzon','İnönü','14',3);



/*!40000 ALTER TABLE `hasta` ENABLE KEYS */;
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
