-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: 2mg3_1erronka
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `erreserbak`
--

DROP TABLE IF EXISTS `erreserbak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erreserbak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bezero_izena` varchar(45) NOT NULL,
  `telefonoa` varchar(9) NOT NULL,
  `pertsona_kopurua` int NOT NULL,
  `eguna_ordua` datetime NOT NULL,
  `prezio_totala` double NOT NULL,
  `faktura_ruta` varchar(45) DEFAULT NULL,
  `langileak_id` int NOT NULL,
  `mahaiak_id` int NOT NULL,
  PRIMARY KEY (`id`,`langileak_id`,`mahaiak_id`),
  KEY `fk_erreserbak_langileak1_idx` (`langileak_id`),
  KEY `fk_erreserbak_mahaiak1_idx` (`mahaiak_id`),
  KEY `langileak_id` (`langileak_id`),
  KEY `mahaiak_id` (`mahaiak_id`),
  CONSTRAINT `FK_411AD20C` FOREIGN KEY (`langileak_id`) REFERENCES `langileak` (`id`),
  CONSTRAINT `FK_9CEB933F` FOREIGN KEY (`mahaiak_id`) REFERENCES `mahaiak` (`id`),
  CONSTRAINT `fk_erreserbak_langileak1` FOREIGN KEY (`langileak_id`) REFERENCES `langileak` (`id`),
  CONSTRAINT `fk_erreserbak_mahaiak1` FOREIGN KEY (`mahaiak_id`) REFERENCES `mahaiak` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erreserbak`
--

LOCK TABLES `erreserbak` WRITE;
/*!40000 ALTER TABLE `erreserbak` DISABLE KEYS */;
INSERT INTO `erreserbak` VALUES (1,'Ane Olaizola','688123456',2,'2025-12-15 13:30:00',35,NULL,1,2),(2,'Jon Arrieta','677987654',4,'2025-12-15 14:00:00',72,NULL,2,3),(3,'Maite Zubizarreta','666112233',6,'2025-12-15 15:00:00',108,NULL,3,5),(4,'Iker Lasa','699445566',3,'2025-12-16 12:30:00',54,NULL,4,1),(5,'Nerea Goikoetxea','644778899',5,'2025-12-16 13:00:00',90,NULL,5,4),(6,'Mikel Urrutia','655334455',2,'2025-12-16 14:30:00',36,NULL,6,6),(7,'Leire Mendizabal','688998877',8,'2025-12-17 13:00:00',144,NULL,7,8),(8,'Asier Olano','677223344',4,'2025-12-17 14:00:00',72,NULL,8,7),(9,'Irati Agirre','699556677',3,'2025-12-17 15:30:00',54,NULL,9,9),(10,'Unai Salaberria','644889900',6,'2025-12-18 13:30:00',108,NULL,10,10);
/*!40000 ALTER TABLE `erreserbak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eskariak`
--

DROP TABLE IF EXISTS `eskariak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eskariak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prezioa` double NOT NULL,
  `egoera` varchar(45) NOT NULL,
  `erreserbak_id` int NOT NULL,
  `erreserbak_langileak_id` int NOT NULL,
  `erreserbak_mahaiak_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eskariak_erreserbak1_idx` (`erreserbak_id`,`erreserbak_langileak_id`,`erreserbak_mahaiak_id`),
  KEY `erreserbak_id` (`erreserbak_id`),
  KEY `erreserbak_langileak_id` (`erreserbak_langileak_id`),
  KEY `erreserbak_mahaiak_id` (`erreserbak_mahaiak_id`),
  CONSTRAINT `FK_82A96F40` FOREIGN KEY (`erreserbak_id`) REFERENCES `erreserbak` (`id`),
  CONSTRAINT `FK_8E810A89` FOREIGN KEY (`erreserbak_mahaiak_id`) REFERENCES `mahaiak` (`id`),
  CONSTRAINT `FK_A612A34C` FOREIGN KEY (`erreserbak_langileak_id`) REFERENCES `langileak` (`id`),
  CONSTRAINT `fk_eskariak_erreserbak1` FOREIGN KEY (`erreserbak_id`, `erreserbak_langileak_id`, `erreserbak_mahaiak_id`) REFERENCES `erreserbak` (`id`, `langileak_id`, `mahaiak_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eskariak`
--

LOCK TABLES `eskariak` WRITE;
/*!40000 ALTER TABLE `eskariak` DISABLE KEYS */;
INSERT INTO `eskariak` VALUES (1,25,'Egoera',1,1,2),(2,50.2,'Egoera',4,4,1),(3,29.5,'Bidalita',1,1,2),(4,38,'Bidalita',1,1,2),(5,17.5,'Bidalita',1,1,2),(6,57,'Bidalita',1,1,2),(7,17.6,'Bidalita',7,7,8),(8,62,'Bidalita',7,7,8),(9,59,'Bidalita',1,1,2),(10,20.5,'Bidalita',1,1,2),(11,15,'Bidalita',1,1,2),(13,37,'Bidalita',1,1,2),(14,9,'Bidalita',1,1,2),(15,8,'Bidalita',1,1,2),(16,36,'Bidalita',1,1,2),(17,53.5,'Bidalita',1,1,2),(18,39,'Bidalita',1,1,2),(19,10,'Bidalita',1,1,2),(20,64,'Bidalita',1,1,2),(21,43,'Bidalita',1,1,2),(22,20,'Bidalita',1,1,2),(23,18.5,'Bidalita',1,1,2),(24,35,'Bidalita',1,1,2),(25,14.5,'Bidalita',9,9,9),(26,29,'Bidalita',6,6,6),(27,27,'Bidalita',6,6,6),(28,129,'Bidalita',6,6,6),(29,59,'Bidalita',9,9,9);
/*!40000 ALTER TABLE `eskariak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eskariak_has_produktuak`
--

DROP TABLE IF EXISTS `eskariak_has_produktuak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eskariak_has_produktuak` (
  `eskariak_id` int NOT NULL,
  `produktuak_id` int NOT NULL,
  `kantitatea` int NOT NULL,
  `prezioa` double NOT NULL,
  PRIMARY KEY (`eskariak_id`,`produktuak_id`),
  KEY `fk_eskariak_has_produktuak_produktuak1_idx` (`produktuak_id`),
  KEY `fk_eskariak_has_produktuak_eskariak1_idx` (`eskariak_id`),
  KEY `eskariak_id` (`eskariak_id`),
  KEY `produktuak_id` (`produktuak_id`),
  CONSTRAINT `FK_496A0619` FOREIGN KEY (`produktuak_id`) REFERENCES `produktuak` (`id`),
  CONSTRAINT `FK_E9A6D6AA` FOREIGN KEY (`eskariak_id`) REFERENCES `eskariak` (`id`),
  CONSTRAINT `fk_eskariak_has_produktuak_eskariak1` FOREIGN KEY (`eskariak_id`) REFERENCES `eskariak` (`id`),
  CONSTRAINT `fk_eskariak_has_produktuak_produktuak1` FOREIGN KEY (`produktuak_id`) REFERENCES `produktuak` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eskariak_has_produktuak`
--

LOCK TABLES `eskariak_has_produktuak` WRITE;
/*!40000 ALTER TABLE `eskariak_has_produktuak` DISABLE KEYS */;
INSERT INTO `eskariak_has_produktuak` VALUES (1,46,2,4),(1,51,1,11),(1,55,1,10),(2,31,4,7.2),(2,53,2,28),(2,54,1,15),(3,46,1,2),(3,47,1,3.5),(3,51,1,11),(3,52,1,13),(4,41,1,6.5),(4,46,2,4),(4,47,1,3.5),(4,48,2,6),(4,60,2,18),(5,41,1,6.5),(5,42,2,8),(5,48,1,3),(6,40,2,14),(6,41,2,13),(6,46,2,4),(6,52,2,26),(7,31,2,3.6),(7,32,1,6.5),(7,57,1,7.5),(8,42,2,8),(8,52,2,26),(8,53,2,28),(9,36,1,8),(9,40,1,7),(9,41,1,6.5),(9,42,1,4),(9,47,1,3.5),(9,48,1,3),(9,52,1,13),(9,53,1,14),(10,41,1,6.5),(10,42,1,4),(10,47,2,7),(10,48,1,3),(11,54,1,15),(13,52,1,13),(13,54,1,15),(13,60,1,9),(14,60,1,9),(15,42,2,8),(16,48,2,6),(16,54,2,30),(17,35,1,5.5),(17,41,1,6.5),(17,47,1,3.5),(17,51,1,11),(17,52,1,13),(17,53,1,14),(18,54,2,30),(18,60,1,9),(19,39,1,6),(19,46,2,4),(20,53,2,28),(20,54,2,30),(20,58,1,6),(21,53,2,28),(21,54,1,15),(22,36,2,16),(22,42,1,4),(23,35,1,5.5),(23,41,2,13),(24,47,2,7),(24,53,2,28),(25,41,1,6.5),(25,42,1,4),(25,46,2,4),(26,53,1,14),(26,54,1,15),(27,60,3,27),(28,45,2,5),(28,53,2,28),(28,54,2,30),(28,59,2,21),(28,60,5,45),(29,41,2,13),(29,42,1,4),(29,53,3,42);
/*!40000 ALTER TABLE `eskariak_has_produktuak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gordetzeko_elementuak`
--

DROP TABLE IF EXISTS `gordetzeko_elementuak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gordetzeko_elementuak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kantitatea` int NOT NULL,
  `hornitzaileak_id` int NOT NULL,
  PRIMARY KEY (`id`,`hornitzaileak_id`),
  KEY `fk_gordetzeko_elementuak_hornitzaileak1_idx` (`hornitzaileak_id`),
  CONSTRAINT `fk_gordetzeko_elementuak_hornitzaileak1` FOREIGN KEY (`hornitzaileak_id`) REFERENCES `hornitzaileak` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gordetzeko_elementuak`
--

LOCK TABLES `gordetzeko_elementuak` WRITE;
/*!40000 ALTER TABLE `gordetzeko_elementuak` DISABLE KEYS */;
/*!40000 ALTER TABLE `gordetzeko_elementuak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hornitzaileak`
--

DROP TABLE IF EXISTS `hornitzaileak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hornitzaileak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(45) NOT NULL,
  `kontaktua` varchar(50) NOT NULL,
  `helbidea` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hornitzaileak`
--

LOCK TABLES `hornitzaileak` WRITE;
/*!40000 ALTER TABLE `hornitzaileak` DISABLE KEYS */;
INSERT INTO `hornitzaileak` VALUES (1,'Arrieta Harategia','arrieta@harategia.eus','Kale Nagusia 12, Lazkao'),(2,'Etxeberria Okindegia','etxeberria@okindegia.eus','San Juan kalea 8, Beasain'),(3,'Lasa Taberna','lasa@taberna.eus','Euskadi plaza 3, Ordizia'),(4,'Zubizarreta Frutategia','zubizarreta@frutak.eus','Iturria kalea 5, Tolosa'),(5,'Garcia Liburudenda','garcia@liburuak.eus','Santa Klara kalea 7, Donostia'),(6,'Urrutia Kafetegia','urrutia@kafea.eus','Loiola kalea 3, Hernani'),(7,'Mendizabal Denda','mendizabal@denda.eus','Txalupa kalea 11, Irun'),(8,'Goikoetxea Harategia','goikoetxea@harategia.eus','Egia kalea 14, Donostia'),(9,'Olano Okindegia','olano@okindegia.eus','Araba kalea 9, Gasteiz'),(10,'Agirre Taberna','agirre@taberna.eus','Larramendi kalea 6, Azpeitia'),(11,'Elorza Frutategia','elorza@frutak.eus','Urumea kalea 6, Astigarraga'),(12,'Lertxundi Kafetegia','lertxundi@kafea.eus','Txalaparta kalea 10, Hondarribia'),(13,'Salaberria Liburudenda','salaberria@liburuak.eus','Benta kalea 4, Beasain'),(14,'Aranburu Denda','aranburu@denda.eus','Errekalde kalea 13, Eibar'),(15,'Mujika Harategia','mujika@harategia.eus','Zumalakarregi kalea 2, Bergara'),(16,'Urkizu Okindegia','urkizu@okindegia.eus','Arriaga kalea 17, Durango'),(17,'Etxegarai Taberna','etxegarai@taberna.eus','Zuloaga kalea 19, Azkoitia'),(18,'Arriaga Frutategia','arriaga@frutak.eus','Mendizorrotz kalea 21, Donostia'),(19,'Larralde Kafetegia','larralde@kafea.eus','Ametzagaña kalea 15, Lasarte'),(20,'Olaizola Liburudenda','olaizola@liburuak.eus','Eguzki kalea 18, Oñati'),(21,'Zuloaga Denda','zuloaga@denda.eus','Arantzazu kalea 23, Arrasate'),(22,'Etxebarria Harategia','etxebarria@harategia.eus','Urkiola kalea 25, Gernika'),(23,'Arrieta Okindegia','arrieta@okindegia.eus','Ibaiondo kalea 27, Lekeitio'),(24,'Zubia Taberna','zubia@taberna.eus','Bidebieta kalea 29, Donostia'),(25,'Egaña Frutategia','egana@frutak.eus','Altza kalea 31, Donostia'),(26,'Aramburu Kafetegia','aramburu@kafea.eus','Zubieta kalea 33, Donostia'),(27,'Etxeondo Liburudenda','etxeondo@liburuak.eus','Miramon kalea 35, Donostia'),(28,'Zubeldia Denda','zubeldia@denda.eus','Amara kalea 37, Donostia'),(29,'Larrañaga Harategia','larranaga@harategia.eus','Intxaurrondo kalea 39, Donostia');
/*!40000 ALTER TABLE `hornitzaileak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langileak`
--

DROP TABLE IF EXISTS `langileak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `langileak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(20) NOT NULL,
  `abizena` varchar(45) NOT NULL,
  `NAN` varchar(9) NOT NULL,
  `erabiltzaile_izena` varchar(20) NOT NULL,
  `langile_kodea` int NOT NULL,
  `pasahitza` longtext NOT NULL,
  `gerentea` tinyint NOT NULL,
  `helbidea` varchar(100) NOT NULL,
  `tpv_sarrera` tinyint NOT NULL,
  `TpvSarrera` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langileak`
--

LOCK TABLES `langileak` WRITE;
/*!40000 ALTER TABLE `langileak` DISABLE KEYS */;
INSERT INTO `langileak` VALUES (1,'adm','adm','1','adm',1234,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',1,'a',1,NULL),(2,'Ane','Etxeberria','12345678A','aneetx',1001,'1234',1,'Kale Nagusia 12, Ordizia',0,NULL),(3,'Jon','Zubizarreta','23456789B','jonzub',1002,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',0,'San Juan kalea 8, Beasain',1,NULL),(4,'Maite','Lasa','34567890C','maitelasa',1003,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',0,'Euskadi plaza 3, Tolosa',1,NULL),(5,'Iker','Goikoetxea','45678901D','ikergoi',1004,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',1,'Iturria kalea 5, Lazkao',0,NULL),(6,'Nerea','Arrieta','56789012E','nerearri',1005,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',0,'Santa Klara kalea 7, Donostia',1,NULL),(7,'Mikel','Urrutia','67890123F','mikelurru',1006,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',0,'Loiola kalea 3, Hernani',1,NULL),(8,'Leire','Mendizabal','78901234G','leiremendi',1007,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',1,'Txalupa kalea 11, Irun',0,NULL),(9,'Asier','Olano','89012345H','asierolano',1008,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',0,'Araba kalea 9, Gasteiz',1,NULL),(10,'Irati','Agirre','90123456I','iratiagirre',1009,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',0,'Larramendi kalea 6, Azpeitia',1,NULL),(11,'Unai','Salaberria','01234567J','unaisala',1010,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',1,'Urumea kalea 6, Astigarraga',0,NULL);
/*!40000 ALTER TABLE `langileak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahaiak`
--

DROP TABLE IF EXISTS `mahaiak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mahaiak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `zenbakia` int NOT NULL,
  `pertsona_kopuru` int NOT NULL,
  `kokapena` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahaiak`
--

LOCK TABLES `mahaiak` WRITE;
/*!40000 ALTER TABLE `mahaiak` DISABLE KEYS */;
INSERT INTO `mahaiak` VALUES (1,1,4,'barneko gunea'),(2,2,2,'kanpoko terraza'),(3,3,6,'barneko gunea'),(4,4,4,'leiho ondoan'),(5,5,8,'areto nagusia'),(6,6,2,'kanpoko terraza'),(7,7,4,'barneko gunea'),(8,8,10,'areto nagusia'),(9,9,6,'leiho ondoan'),(10,10,2,'kanpoko terraza');
/*!40000 ALTER TABLE `mahaiak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialak`
--

DROP TABLE IF EXISTS `materialak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(20) NOT NULL,
  `prezioa` double NOT NULL,
  `stock` int NOT NULL,
  `hornitzaileak_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_materialak_hornitzaileak1_idx` (`hornitzaileak_id`),
  CONSTRAINT `fk_materialak_hornitzaileak1` FOREIGN KEY (`hornitzaileak_id`) REFERENCES `hornitzaileak` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialak`
--

LOCK TABLES `materialak` WRITE;
/*!40000 ALTER TABLE `materialak` DISABLE KEYS */;
/*!40000 ALTER TABLE `materialak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osagaiak`
--

DROP TABLE IF EXISTS `osagaiak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osagaiak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(20) NOT NULL,
  `prezioa` double NOT NULL,
  `stock` int NOT NULL,
  `hornitzaileak_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_osagaiak_hornitzaileak1_idx` (`hornitzaileak_id`),
  CONSTRAINT `fk_osagaiak_hornitzaileak1` FOREIGN KEY (`hornitzaileak_id`) REFERENCES `hornitzaileak` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osagaiak`
--

LOCK TABLES `osagaiak` WRITE;
/*!40000 ALTER TABLE `osagaiak` DISABLE KEYS */;
INSERT INTO `osagaiak` VALUES (61,'Coca-Cola',1.2,100,1),(62,'Patata',0.35,200,2),(63,'Lubina',7.5,30,3),(64,'Ardi Txuleta',12,15,4),(65,'Tomatea',0.8,150,5),(66,'Tipula',0.6,180,6),(67,'Oliba olioa',4.5,50,7),(68,'Gatza',0.2,300,8),(69,'Piperbeltz beltza',0.25,250,9),(70,'Arrautza',0.4,120,10),(71,'Txorizoa',2.5,60,11),(72,'Gazta',3.8,40,12),(73,'Esnea',1.1,90,13),(74,'Txanpinoiak',1.7,70,14),(75,'Pasta',1.3,100,15),(76,'Arroz',1,110,16),(77,'Atuna',2.2,80,17),(78,'Sagarra',0.9,130,18),(79,'Banana',1,140,19),(80,'Letxuga',0.75,160,20),(81,'Azenarioa',0.5,170,21),(82,'Brokolia',1.6,60,22),(83,'Kalabaza',1.2,55,23),(84,'Txerri solomo',5.5,35,24),(85,'Oilasko bularra',4.8,40,25),(86,'Indioilar xerra',6,25,26),(87,'Ketchup',1.5,90,27),(88,'Mostaza',1.4,85,28),(89,'Maionesa',1.6,95,29),(90,'Barazki nahasketa',2,70,28),(91,'Txokolatea',2.5,60,1),(92,'Madaria',1.1,100,2),(93,'Kiwi',1.3,90,3),(94,'Laranja',1,120,4),(95,'Limoi',0.8,110,5),(96,'Ogi zuria',1.2,80,6),(97,'Ogi integrala',1.3,70,7),(98,'Galletak',2,60,8),(99,'Mermelada',2.5,50,9),(100,'Eztia',3,40,10),(101,'Txanpi freskoak',1.8,65,11),(102,'Perretxikoak',2.2,55,12),(103,'Txipiroiak',6.5,35,13),(104,'Bakailaoa',7,30,14),(105,'Izokina',8,25,15),(106,'Olagarroa',9.5,20,16),(107,'Gambak',5,45,17),(108,'Mejilloiak',4,50,18),(109,'Berakatz',0.4,200,19),(110,'Perrexila',0.3,180,20),(111,'Oregano',0.25,170,21),(112,'Albahaka',0.35,160,22),(113,'Kurry hautsa',0.5,150,23),(114,'Piper gorria',0.9,140,24),(115,'Piper berdea',0.85,130,25),(116,'Barazki saltsa',2.2,60,26),(117,'Tomate frijitua',1.8,70,27),(118,'Txerri urdaiazpikoa',3.5,40,28),(119,'Oilasko hegalak',4.2,35,29),(120,'Ardi gazta',4.8,30,28);
/*!40000 ALTER TABLE `osagaiak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktuak`
--

DROP TABLE IF EXISTS `produktuak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produktuak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(60) NOT NULL,
  `prezioa` double NOT NULL,
  `mota` varchar(20) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktuak`
--

LOCK TABLES `produktuak` WRITE;
/*!40000 ALTER TABLE `produktuak` DISABLE KEYS */;
INSERT INTO `produktuak` VALUES (31,'Coca-Cola',1.8,'edaria',100),(32,'Tortilla patata',6.5,'platera',30),(33,'Lubina plantxan',12,'platera',20),(34,'Ardi txuleta',15,'platera',15),(35,'Ensalada mistoa',5.5,'platera',25),(36,'Pizza margarita',8,'platera',20),(37,'Pizza barazkiekin',9,'platera',18),(38,'Txanpinoi errea',4.5,'platera',22),(39,'Arroz frijitua',6,'platera',20),(40,'Pasta tomatearekin',7,'platera',25),(41,'Atun entsalada',6.5,'platera',20),(42,'Sagar tarta',4,'postrea',15),(43,'Txokolate mousse',4.5,'postrea',18),(44,'Madari konpota',3.8,'postrea',12),(45,'Kiwi freskoa',2.5,'postrea',20),(46,'Laranja zukua',2,'edaria',30),(47,'Ogi txigortua gaztarekin',3.5,'platera',25),(48,'Galleta eta mermelada',3,'postrea',20),(49,'Eztia eta jogurta',3.2,'postrea',18),(50,'Perretxiko risottoa',9.5,'platera',15),(51,'Txipiroi plantxan',11,'platera',12),(52,'Bakailao pil-pil',13,'platera',10),(53,'Izokin xerra',14,'platera',10),(54,'Olagarroa galiziar erara',15,'platera',8),(55,'Gamba saltsarekin',10,'platera',14),(56,'Mejilloiak lurrinez',9,'platera',16),(57,'Barazki wok',7.5,'platera',20),(58,'Tomate eta mozzarella entsalada',6,'platera',22),(59,'Txerri solomo patatekin',10.5,'platera',18),(60,'Oilasko hegalak ketchuparekin',9,'platera',20);
/*!40000 ALTER TABLE `produktuak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktuak_has_osagaiak`
--

DROP TABLE IF EXISTS `produktuak_has_osagaiak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produktuak_has_osagaiak` (
  `produktuak_id` int NOT NULL,
  `osagaiak_id` int NOT NULL,
  PRIMARY KEY (`produktuak_id`,`osagaiak_id`),
  KEY `fk_produktuak_has_osagaiak_osagaiak1_idx` (`osagaiak_id`),
  KEY `fk_produktuak_has_osagaiak_produktuak1_idx` (`produktuak_id`),
  KEY `produktuak_id` (`produktuak_id`),
  KEY `osagaiak_id` (`osagaiak_id`),
  CONSTRAINT `FK_200FAAF` FOREIGN KEY (`osagaiak_id`) REFERENCES `osagaiak` (`id`),
  CONSTRAINT `FK_980955FB` FOREIGN KEY (`produktuak_id`) REFERENCES `produktuak` (`id`),
  CONSTRAINT `fk_produktuak_has_osagaiak_osagaiak1` FOREIGN KEY (`osagaiak_id`) REFERENCES `osagaiak` (`id`),
  CONSTRAINT `fk_produktuak_has_osagaiak_produktuak1` FOREIGN KEY (`produktuak_id`) REFERENCES `produktuak` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktuak_has_osagaiak`
--

LOCK TABLES `produktuak_has_osagaiak` WRITE;
/*!40000 ALTER TABLE `produktuak_has_osagaiak` DISABLE KEYS */;
INSERT INTO `produktuak_has_osagaiak` VALUES (31,61),(32,62),(59,62),(33,63),(34,64),(35,65),(41,65),(58,65),(35,66),(37,66),(32,67),(33,67),(35,67),(38,67),(39,67),(41,67),(50,67),(51,67),(52,67),(53,67),(54,67),(56,67),(57,67),(58,67),(59,67),(32,68),(33,68),(34,68),(35,68),(38,68),(39,68),(40,68),(50,68),(51,68),(52,68),(53,68),(54,68),(55,68),(56,68),(57,68),(59,68),(60,68),(34,69),(32,70),(43,70),(36,72),(37,72),(47,72),(58,72),(43,73),(49,73),(38,74),(36,75),(37,75),(40,75),(39,76),(50,76),(41,77),(42,78),(35,80),(41,80),(35,81),(59,84),(60,87),(39,90),(57,90),(43,91),(44,92),(45,93),(46,94),(44,95),(42,96),(47,96),(48,98),(48,99),(42,100),(44,100),(49,100),(50,102),(51,103),(52,104),(53,105),(54,106),(55,107),(56,108),(52,109),(54,109),(33,110),(56,110),(36,111),(58,111),(37,114),(37,115),(55,116),(57,116),(36,117),(37,117),(40,117),(60,119);
/*!40000 ALTER TABLE `produktuak_has_osagaiak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txandak`
--

DROP TABLE IF EXISTS `txandak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `txandak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `txanda_zenbakia` int NOT NULL,
  `langileak_id` int NOT NULL,
  PRIMARY KEY (`id`,`langileak_id`),
  KEY `fk_txandak_langileak_idx` (`langileak_id`),
  CONSTRAINT `fk_txandak_langileak` FOREIGN KEY (`langileak_id`) REFERENCES `langileak` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txandak`
--

LOCK TABLES `txandak` WRITE;
/*!40000 ALTER TABLE `txandak` DISABLE KEYS */;
/*!40000 ALTER TABLE `txandak` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-18 14:56:38
