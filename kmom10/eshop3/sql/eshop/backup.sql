-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `eshop`
--

/*!40000 DROP DATABASE IF EXISTS `eshop`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `eshop`;

--
-- Table structure for table `customer_phones`
--

DROP TABLE IF EXISTS `customer_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_phones` (
  `id` int NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`phone`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `phone_2` (`phone`),
  KEY `id` (`id`),
  CONSTRAINT `customer_phones_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phones`
--

LOCK TABLES `customer_phones` WRITE;
/*!40000 ALTER TABLE `customer_phones` DISABLE KEYS */;
INSERT INTO `customer_phones` VALUES (1,752431154),(1,762315644),(2,716),(3,2147483647),(4,123098014),(5,1409810498),(6,131353467),(7,8678654),(8,334534647),(10,356457457),(11,4574747),(12,47474747);
/*!40000 ALTER TABLE `customer_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `street` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `number` varchar(6) COLLATE utf8_swedish_ci NOT NULL,
  `post_code` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `city` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `country` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_swedish_ci NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `birthday` (`birthday`),
  FULLTEXT KEY `firstname` (`firstname`),
  FULLTEXT KEY `lastname` (`lastname`),
  FULLTEXT KEY `street` (`street`),
  FULLTEXT KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Mikael','Roos','Denfiktivagatan','1','12345','Karlskrona','sweden','mikael@roos.com','1951-10-13'),(2,'Emil','Folino','Härvardetasfaltsväge','3','11301','Stockholm','sweden','emil@folino.se','2001-01-01'),(3,'Andreas','Arnesson','Brevidhavetvägen','1276','32154','Gisslevik','sweden','andreas@arnesson.se','1985-06-13'),(4,'Gåtte','Gås','Gåsgatan','4','54123','Ankeborg','Kalle Anka Land','gåsen@anka.nu','1964-03-21'),(5,'Kalle','Anka','Ankeborgsgatan','2','11314','Ankeborg','Kalle Anka Land','kalle@anka.nu','1974-12-31'),(6,'Knatte','Anka','Ankeborgsgatan','642','54123','Ankeborg','Kalle Anka Land','knatte@anka.nu','1076-10-21'),(7,'Donna','Anka','Ankeborgsgatan','2','11208','Ankeborg','Kalle Anka Land','donna@anka.nu','2048-01-01'),(8,'Åsnan','Basilio','Ankeborgsgatan','91','987-154-1','Ankeborg','Kalle Anka Land','asna@anka.nu','1932-11-13'),(9,'Strutsen','Hortensia','Ankeborgsgatan','71','98563','Ankeborg','Kalle Anka Land','strutsen@anka.nu','1945-06-23'),(10,'Sven-Bertil','Taube','Södermalmsgatan','50','11405','stockholm','sweden','svennesemail@email.com','1900-04-21'),(11,'Mårten','Gås','Ankeborgsgatan','43','11313','Ankeborg','Kalle Anka Land','marten@anka.nu','1863-07-07'),(12,'Farmor','Anka','Ankeborgsgatan','99','5196','Ankeborg','Kalle Anka Land','farmor@anka.nu','1924-12-31'),(13,'Kajsa','Anka','Ankeborgsgatan','112','11212','Ankeborg','Kalle Anka Land','kajsa@anka.nu','0000-00-00');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section` char(2) COLLATE utf8_swedish_ci NOT NULL DEFAULT 'AA',
  `position` char(2) COLLATE utf8_swedish_ci NOT NULL DEFAULT '01',
  `level` char(2) COLLATE utf8_swedish_ci NOT NULL DEFAULT '01',
  `product` int NOT NULL DEFAULT '0',
  `amount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `product` (`product`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'AA','1','1',11,4),(2,'AA','1','2',12,15),(3,'AA','1','3',9,3),(4,'AA','2','1',11,10),(5,'AA','2','2',12,2),(6,'AA','2','3',7,32),(7,'AA','3','1',1,1),(8,'AA','3','2',8,4),(9,'AA','3','3',2,13),(10,'AA','4','1',8,20),(11,'AA','4','2',3,25),(12,'AA','4','3',4,10),(13,'AA','5','1',4,11),(14,'AA','5','2',4,5),(15,'AA','5','3',4,6),(16,'AB','1','1',6,2),(17,'AB','1','2',2,11),(18,'AB','1','3',3,9),(19,'AB','2','1',5,6),(20,'AB','2','2',5,4),(21,'AB','2','3',5,2),(22,'AB','3','1',5,32),(23,'AB','3','2',6,9),(24,'AB','3','3',6,5),(25,'AB','4','1',7,7),(26,'AB','4','2',8,8),(27,'AB','4','3',13,1),(28,'AB','5','1',2,3),(29,'AB','5','2',2,5),(30,'AB','5','3',12,10),(31,'AC','1','1',10,0),(32,'AC','1','2',0,0),(33,'AC','1','3',0,0),(34,'AC','2','1',0,0),(35,'AC','2','2',0,0),(36,'AC','2','3',0,0),(37,'AC','3','1',0,0),(38,'AC','3','2',0,0),(39,'AC','3','3',0,0),(40,'AC','4','1',0,0),(41,'AC','4','2',0,0),(42,'AC','4','3',0,0),(43,'AC','5','1',0,0),(44,'AC','5','2',0,0),(45,'AC','5','3',0,0),(46,'AD','1','1',0,0),(47,'AD','1','2',0,0),(48,'AD','1','3',0,0),(49,'AD','2','1',0,0),(50,'AD','2','2',0,0),(51,'AD','2','3',0,0),(52,'AD','3','1',0,0),(53,'AD','3','2',0,0),(54,'AD','3','3',0,0),(55,'AD','4','1',0,0),(56,'AD','4','2',0,0),(57,'AD','4','3',0,0),(58,'AD','5','1',0,0),(59,'AD','5','2',0,0),(60,'AD','5','3',0,0),(61,'AE','1','1',0,0),(62,'AE','1','2',0,0),(63,'AE','1','3',0,0),(64,'AE','2','1',0,0),(65,'AE','2','2',0,0),(66,'AE','2','3',0,0),(67,'AE','3','1',0,0),(68,'AE','3','2',0,0),(69,'AE','3','3',0,0),(70,'AE','4','1',0,0),(71,'AE','4','2',0,0),(72,'AE','4','3',0,0),(73,'AE','5','1',0,0),(74,'AE','5','2',0,0),(75,'AE','5','3',0,0),(76,'AF','1','1',0,0),(77,'AF','1','2',0,0),(78,'AF','1','3',0,0),(79,'AF','2','1',0,0),(80,'AF','2','2',0,0),(81,'AF','2','3',0,0),(82,'AF','3','1',0,0),(83,'AF','3','2',0,0),(84,'AF','3','3',0,0),(85,'AF','4','1',0,0),(86,'AF','4','2',0,0),(87,'AF','4','3',0,0),(88,'AF','5','1',0,0),(89,'AF','5','2',0,0),(90,'AF','5','3',0,0),(91,'AG','1','1',0,0),(92,'AG','1','2',0,0),(93,'AG','1','3',0,0),(94,'AG','2','1',0,0),(95,'AG','2','2',0,0),(96,'AG','2','3',0,0),(97,'AG','3','1',0,0),(98,'AG','3','2',0,0),(99,'AG','3','3',0,0),(100,'AG','4','1',0,0),(101,'AG','4','2',0,0),(102,'AG','4','3',0,0),(103,'AG','5','1',0,0),(104,'AG','5','2',0,0),(105,'AG','5','3',0,0);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer` int NOT NULL,
  `product_list` int NOT NULL,
  `adress` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `order_id` (`order_id`),
  KEY `customer` (`customer`),
  KEY `product_list` (`product_list`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `customers` (`id`),
  CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`product_list`) REFERENCES `picking_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_orders`
--

DROP TABLE IF EXISTS `log_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `customer` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `before` varchar(250) COLLATE utf8_swedish_ci NOT NULL,
  `after` varchar(250) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  FULLTEXT KEY `log_activity` (`activity`),
  FULLTEXT KEY `log_before` (`before`),
  FULLTEXT KEY `log_after` (`after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_orders`
--

LOCK TABLES `log_orders` WRITE;
/*!40000 ALTER TABLE `log_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_products`
--

DROP TABLE IF EXISTS `log_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `before` varchar(250) COLLATE utf8_swedish_ci NOT NULL,
  `after` varchar(250) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `product` (`product`),
  FULLTEXT KEY `log_activity` (`activity`),
  FULLTEXT KEY `log_before` (`before`),
  FULLTEXT KEY `log_after` (`after`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_products`
--

LOCK TABLES `log_products` WRITE;
/*!40000 ALTER TABLE `log_products` DISABLE KEYS */;
INSERT INTO `log_products` VALUES (1,1,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 1 NAME: Bikini med långärmad top'),(2,2,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 2 NAME: Baddräkt i ljusblått'),(3,3,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 3 NAME: Bikini'),(4,4,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 4 NAME: Baddräkt'),(5,5,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 5 NAME: Kimono'),(6,6,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 6 NAME: Kimono'),(7,7,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 7 NAME: Beach robe'),(8,8,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 8 NAME: Hoodie'),(9,9,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 9 NAME: Hoodie'),(10,10,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 10 NAME: Hoodie'),(11,11,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 11 NAME: Boardshorts'),(12,12,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 12 NAME: Boardshorts retro stil'),(13,13,'2020-09-13 19:25:51','TRIGGER - New product was registered.','Empty','New product -> ID: 13 NAME: Polotröja');
/*!40000 ALTER TABLE `log_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_from_customer`
--

DROP TABLE IF EXISTS `order_from_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_from_customer` (
  `id` int NOT NULL,
  `customer` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `customer` (`customer`),
  CONSTRAINT `order_from_customer_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_from_customer`
--

LOCK TABLES `order_from_customer` WRITE;
/*!40000 ALTER TABLE `order_from_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_from_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer` int NOT NULL,
  `picking_list` int NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ordered` timestamp NULL DEFAULT NULL,
  `shipped` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `customer` (`customer`),
  KEY `picking_list` (`picking_list`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`id`) ON DELETE SET DEFAULT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_order_create` AFTER INSERT ON `orders` FOR EACH ROW insert into log_orders (`order`, `customer`, `time`, `activity`, `before`, `after`)
            values (new.id, new.customer, current_timestamp(), "TRIGGER - New order was registered.", "Empty", concat("New order -> ID: ", new.id, " CUSTOMER: ", new.customer)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_order_update` AFTER UPDATE ON `orders` FOR EACH ROW begin
insert into log_orders (`order`, `customer`, `time`, `activity`, `before`, `after`)
    values (old.id, old.customer, current_timestamp(), "TRIGGER - order was updated.", concat("Old data -> CUSTOMER: ", old.customer, " OLD PICKING LIST: ", old.picking_list), concat("New data -> CUSTOMER: ", new.customer, " NEW PICKING LIST: ", new.picking_list));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_order_delete` AFTER DELETE ON `orders` FOR EACH ROW begin
    insert into log_orders (`order`, `customer`, `time`, `activity`, `before`, `after`)
        values (old.id, old.customer, current_timestamp(), "TRIGGER - Deleted order was registered.", concat("order -> ID: ", old.id, " CUSTOMER: ", old.customer, " OLD PICKING LIST: ", old.picking_list), "Deleted");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `picking_lists`
--

DROP TABLE IF EXISTS `picking_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picking_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `index` int NOT NULL,
  `product` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `product` (`product`),
  CONSTRAINT `picking_lists_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picking_lists`
--

LOCK TABLES `picking_lists` WRITE;
/*!40000 ALTER TABLE `picking_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `picking_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_pictures`
--

DROP TABLE IF EXISTS `product_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_pictures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `picture` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `text` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `alt` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `product` (`product`),
  FULLTEXT KEY `text` (`text`),
  CONSTRAINT `product_pictures_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_pictures`
--

LOCK TABLES `product_pictures` WRITE;
/*!40000 ALTER TABLE `product_pictures` DISABLE KEYS */;
INSERT INTO `product_pictures` VALUES (1,1,'/img/product/MP-1.jpg','Musim Panas produktbild.','En produktbild.\r'),(2,2,'/img/product/MP-2.jpg','Musim Panas produktbild.','En produktbild.\r'),(3,3,'/img/product/MP-3.jpg','Musim Panas produktbild.','En produktbild.\r'),(4,4,'/img/product/MP-4.jpg','Musim Panas produktbild.','En produktbild.\r'),(5,5,'/img/product/MP-5.jpg','Musim Panas produktbild.','En produktbild.\r'),(6,6,'/img/product/MP-6.jpg','Musim Panas produktbild.','En produktbild.\r'),(7,7,'/img/product/MP-7.jpg','Musim Panas produktbild.','En produktbild.\r'),(8,8,'/img/product/MP-8.jpg','Musim Panas produktbild.','En produktbild.\r'),(9,9,'/img/product/MP-9.jpg','Musim Panas produktbild.','En produktbild.\r'),(10,10,'/img/product/MP-10.jpg','Musim Panas produktbild.','En produktbild.\r'),(11,11,'/img/product/MP-11.jpg','Musim Panas produktbild.','En produktbild.\r'),(12,12,'/img/product/MP-12.jpg','Musim Panas produktbild.','En produktbild.\r'),(13,13,'/img/product/MP-13.jpg','Musim Panas produktbild.','En produktbild.\r'),(14,14,'/img/product/MP-14.jpg','Musim Panas produktbild.','En produktbild.\r'),(15,15,'/img/product/MP-15.jpg','Musim Panas produktbild.','En produktbild.\r'),(16,16,'/img/product/MP-16.jpg','Musim Panas produktbild.','En produktbild.\r'),(17,17,'/img/product/MP-17.jpg','Musim Panas produktbild.','En produktbild.\r'),(18,18,'/img/product/MP-18.jpg','Musim Panas produktbild.','En produktbild.\r'),(19,19,'/img/product/MP-19.jpg','Musim Panas produktbild.','En produktbild.\r'),(20,20,'/img/product/MP-20.jpg','Musim Panas produktbild.','En produktbild.\r'),(21,21,'/img/product/MP-21.jpg','Musim Panas produktbild.','En produktbild.\r'),(22,22,'/img/product/MP-22.jpg','Musim Panas produktbild.','En produktbild.\r'),(23,23,'/img/product/MP-23.jpg','Musim Panas produktbild.','En produktbild.');
/*!40000 ALTER TABLE `product_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `type` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `product` (`product`),
  FULLTEXT KEY `type` (`type`),
  CONSTRAINT `product_types_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types`
--

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;
INSERT INTO `product_types` VALUES (1,1,'Badkläder'),(2,1,'Damkläder'),(3,1,'Bikini'),(4,2,'Badkläder'),(5,2,'Damkläder'),(6,2,'Baddräkt'),(7,3,'Badkläder'),(8,3,'Damkläder'),(9,3,'Bikini'),(10,4,'Badkläder'),(11,4,'Damkläder'),(12,4,'Baddräkt'),(13,5,'Damkläder'),(14,5,'Badkläder'),(15,5,'Kimono'),(16,6,'Kimono'),(17,6,'Damkläder'),(18,6,'Badkläder'),(19,7,'Badkläder'),(20,7,'Handduk'),(21,7,'Unisex'),(22,8,'Unisex'),(23,8,'Tröjor'),(24,9,'Tröjor'),(25,9,'Unisex'),(26,10,'Tröjor'),(27,10,'Unisex'),(28,11,'Boardshorts'),(29,11,'Herrkläder'),(30,12,'Byxor'),(31,12,'Herrkläder'),(32,12,'Boardshorts'),(33,13,'Tröjor'),(34,13,'Herrkläder');
/*!40000 ALTER TABLE `product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `info` varchar(500) COLLATE utf8_swedish_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `product_id` (`id`),
  KEY `name` (`name`),
  FULLTEXT KEY `name_2` (`name`),
  FULLTEXT KEY `info` (`info`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Bikini med långärmad top','Bikini med långärmad top. Färgsättning i grön kombinerat med ett svart och vitt mönster.',399.00),(2,'Baddräkt i ljusblått','Blå baddräkt med korta ärmar.',599.00),(3,'Bikini','Blå och vit bikini med mönstrad mesh textur. ',499.00),(4,'Baddräkt','Grå och blå baddräkt av enklare model.',799.00),(5,'Kimono','Strandkimono i olika mönster. Mönstren är i olika kombinationer av Indonesisk batik.',599.00),(6,'Kimono','Strandkimono i olika mönster. Mönstren är i olika kombinationer av Indonesisk batik.',599.00),(7,'Beach robe','Mysig strand mantel med utsidan i batikmönster och insidan i handuksmaterial. Två fickor för att lägga saker i och luva för att torka håret med. Fungerar bra att byta om i på stranden innan och efter surfsession eller simturen.',799.00),(8,'Hoodie','Grå hoodie/munktröja. Varm och go.',699.00),(9,'Hoodie','Grön hoodie/munktröja. Varm och go.',699.00),(10,'Hoodie','Röd hoodie/munktröja. Varm och go.',699.00),(11,'Boardshorts','Svarta badbrallor med tre fickor, en bakficka på höger sida och två normala sidofickor. Snörning och kardborre för att hålla dem på plats.',449.00),(12,'Boardshorts retro stil','Svarta boardshorts i en retro modell. En ficka på höger baksida och snörning fram.',449.00),(13,'Polotröja','Svart polotröja, en sån som Steve Jobs alltid hade på sig. Du vet den med \"turtle neck\" eller vad det kallas.',999.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_product_insert` AFTER INSERT ON `products` FOR EACH ROW insert into log_products (`product`, `time`, `activity`, `before`, `after`)
            values (new.id, current_timestamp(), "TRIGGER - New product was registered.", "Empty", concat("New product -> ID: ", new.id, " NAME: ", new.name)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_product_update` AFTER UPDATE ON `products` FOR EACH ROW begin
insert into log_products (`product`, `time`, `activity`, `before`, `after`)
    values (old.id, current_timestamp(), "TRIGGER - Product was updated.", concat("Old data -> NAME: ", old.name, " INFO: ", old.info, " PRICE: ", old.price), concat("New data -> NAME: ", new.name, " INFO: ", new.info, " PRICE: ", new.price));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_product_delete` AFTER DELETE ON `products` FOR EACH ROW begin
    insert into log_products (`product`, `time`, `activity`, `before`, `after`)
        values (old.id, current_timestamp(), "TRIGGER - Deleted product was registered.", concat("Product -> ID: ", old.id, " NAME: ", old.name, " INFO: ", old.info, " PRICE: ", old.price), "Deleted");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products_to_picking_list`
--

DROP TABLE IF EXISTS `products_to_picking_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_to_picking_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `order` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `product` (`product`),
  CONSTRAINT `products_to_picking_list_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_to_picking_list`
--

LOCK TABLES `products_to_picking_list` WRITE;
/*!40000 ALTER TABLE `products_to_picking_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_to_picking_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_customers`
--

DROP TABLE IF EXISTS `v_customers`;
/*!50001 DROP VIEW IF EXISTS `v_customers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_customers` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `adress` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `phone` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_inventory`
--

DROP TABLE IF EXISTS `v_inventory`;
/*!50001 DROP VIEW IF EXISTS `v_inventory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_inventory` (
  `id` tinyint NOT NULL,
  `product` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `position` tinyint NOT NULL,
  `amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_log_orders`
--

DROP TABLE IF EXISTS `v_log_orders`;
/*!50001 DROP VIEW IF EXISTS `v_log_orders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_log_orders` (
  `id` tinyint NOT NULL,
  `order` tinyint NOT NULL,
  `customer` tinyint NOT NULL,
  `time` tinyint NOT NULL,
  `activity` tinyint NOT NULL,
  `before` tinyint NOT NULL,
  `after` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_log_products`
--

DROP TABLE IF EXISTS `v_log_products`;
/*!50001 DROP VIEW IF EXISTS `v_log_products`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_log_products` (
  `id` tinyint NOT NULL,
  `product` tinyint NOT NULL,
  `time` tinyint NOT NULL,
  `activity` tinyint NOT NULL,
  `before` tinyint NOT NULL,
  `after` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_orders`
--

DROP TABLE IF EXISTS `v_orders`;
/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_orders` (
  `id` tinyint NOT NULL,
  `customer` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `rows` tinyint NOT NULL,
  `created` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_picking_lists`
--

DROP TABLE IF EXISTS `v_picking_lists`;
/*!50001 DROP VIEW IF EXISTS `v_picking_lists`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_picking_lists` (
  `id` tinyint NOT NULL,
  `order` tinyint NOT NULL,
  `index` tinyint NOT NULL,
  `product` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `info` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `position` tinyint NOT NULL,
  `stored` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_product`
--

DROP TABLE IF EXISTS `v_product`;
/*!50001 DROP VIEW IF EXISTS `v_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_product` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `info` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_product_categories`
--

DROP TABLE IF EXISTS `v_product_categories`;
/*!50001 DROP VIEW IF EXISTS `v_product_categories`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_product_categories` (
  `type` tinyint NOT NULL,
  `products` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_products`
--

DROP TABLE IF EXISTS `v_products`;
/*!50001 DROP VIEW IF EXISTS `v_products`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_products` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `info` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `types` tinyint NOT NULL,
  `stored` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `picture` tinyint NOT NULL,
  `alt` tinyint NOT NULL,
  `text` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'eshop'
--
/*!50003 DROP FUNCTION IF EXISTS `order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` FUNCTION `order_status`(
    time_created timestamp,
    time_updated timestamp,
    time_ordered timestamp,
    time_shipped timestamp,
    time_deleted timestamp
) RETURNS char(10) CHARSET utf8mb4
    DETERMINISTIC
begin
    if time_deleted is not null then
        return 'Raderad';
    elseif time_shipped is not null then
        return 'Skickad';
    elseif time_ordered is not null then
        return 'Beställd';
    elseif time_updated is not null then
        return 'Uppdaterad';
    elseif time_created is not null then
        return 'Skapad';
    end if;
    return 'Status okänd';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_product_to_picking_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `add_product_to_picking_list`(
    order_id int,
    product_id int,
    amount int
)
begin
insert into products_to_picking_list
    (`order`, `product`, `amount`)
values (order_id, product_id, amount);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clear_product_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `clear_product_categories`(
    input_id int
)
begin
    delete
    from product_types
        where `product` = input_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `create_order`(
    customer_id int
)
begin
insert into orders
        (customer)
    values
        (customer_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `create_product`(
    p_id int,
    p_name varchar(30),
    p_info varchar(500),
    p_price decimal(7, 2)
)
begin
    insert into
        products 
    values
        (p_id, p_name, p_info, p_price);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `delete_order`(
    order_id int
)
begin
update orders
    set `deleted` = current_timestamp
    where id = order_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `delete_product`(
    p_id int
)
begin
    delete from products
    where
        `id` = p_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_from_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `get_all_from_table`(
    t_table varchar(30)
)
begin
    select * from t_table;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_from_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `get_customer_from_order`(
    order_id int
)
begin
    declare customer_id int;

    set customer_id = (
    select
        customer
    from v_orders
        where
            id = order_id
    );

    select * from customers
        where id = customer_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_picking_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `get_picking_list`(
    input_order int
)
begin
select *
    from v_picking_lists
        where `order` = `input_order`;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_products_of_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `get_products_of_type`(
    input_type varchar(30)
)
begin
select * from v_products
    where `types` like `input_type`;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `give_category_to_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `give_category_to_product`(
    product_id int,
    type varchar(30)
)
begin
    insert into product_types
        (`product`, `type`)
    values (product_id, type);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `place_the_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `place_the_order`(
    input_order int
)
begin
start transaction;

insert into picking_lists
    (`order`, `index`, `product`, `amount`)
select
    `order`,
    `id`,
    `product`,
    `amount`
from products_to_picking_list as ptpl
    where ptpl.order = input_order;

update orders
    set `ordered` = current_timestamp
    where id = input_order;

delete from products_to_picking_list
    where `order` like input_order;

commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `position_product_on_shelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `position_product_on_shelf`(
    i_section char(2),
    i_position char(2),
    i_level char(2),
    p_id int,
    p_amount int
)
begin
start transaction;
    update inventory 
        set
            `product` = p_id,
            `amount` = `amount` + p_amount
        where
            `section` = i_section and
            `position` = i_position and
            `level` = i_level
        ;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_product_from_shelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `remove_product_from_shelf`(
    i_section char(2),
    i_position char(2),
    i_level char(2),
    p_id int,
    p_amount int
)
begin
    declare current_amount int;
    declare product_on_shelf int;

    start transaction;

    set current_amount = 
        (select amount from inventory 
            where 
                section = i_section and
                position = i_position and
                level = i_level
        );

    select current_amount;
    
    set product_on_shelf = 
        (select product from inventory 
            where 
                section = i_section and
                position = i_position and
                level = i_level
        );

    select product_on_shelf;

    if (current_amount - p_amount < 0) or (product_on_shelf != p_id) then
        rollback;
        select 'Product amount is not enough to make transaction' as message;
    else
        update inventory
            set amount = current_amount - p_amount
            where 
                section = i_section and
                position = i_position and
                level = i_level;
        commit;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `search_inventory`(
    i_search varchar(20)
)
begin
    select * from v_inventory
        where 
            product like i_search or
            name like i_search or
            position like i_search;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `search_orders`(
    search_for varchar(150)
)
begin
select *
from v_orders
    where 
        `id` like search_for or
        `customer` like search_for or
        `picking_list` like search_for or
        `date` like search_for or
        `status` like search_for;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_order_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `search_order_log`(
    input_search varchar(500)
)
begin
    select * 
    from v_log_orders
        where 
            `id` like input_search or
            `order` like input_search or
            `customer` like input_search or
            `time` like input_search or
            `activity` like input_search or
            `before` like input_search or
            `after` like input_search
        order by `id` asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `search_products`(
    i_search varchar(500)
)
begin
    select * 
    from v_products
        where 
            id like i_search or
            name like i_search or
            info like i_search or
            types like i_search
        order by id asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_product_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `search_product_log`(
    input_search varchar(500)
)
begin
    select * 
    from v_log_products
        where 
            `id` like input_search or
            `product` like input_search or
            `activity` like input_search or
            `before` like input_search or
            `after` like input_search
        order by `id` asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ship_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `ship_order`(
    order_id int
)
begin
update orders
    set `shipped` = current_timestamp
    where id = order_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_all_customers`()
begin
select * from v_customers order by id asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_all_orders`()
begin
    select * from v_orders;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_all_products`()
begin
    select * from v_products;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_shelves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_all_shelves`()
begin
select
    *
from v_inventory
    order by position asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_full_product_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_full_product_log`()
begin
select * from v_log_products
    order by 'time' desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_inventory`()
begin
    select * from v_inventory;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_order`(
    order_id int
)
begin
select * from v_orders
where
    id like order_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_product`(
    p_id int
)
begin
    select * from v_products where id = p_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_product_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_product_categories`()
begin
    select * from v_product_categories;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_rows_from_order_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_rows_from_order_log`(
    l_limit int
)
begin
select * from v_log_orders
    order by 'time' desc
    limit l_limit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_rows_from_product_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_rows_from_product_log`(
    l_limit int
)
begin
select * from v_log_products
    order by 'time' desc
    limit l_limit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `update_product`(
    p_id int,
    p_name varchar(30),
    p_info varchar(500),
    p_price decimal(7, 2)
)
begin
    update products set
        `id` = p_id,
        `name` = p_name,
        `info` = p_info,
        `price` = p_price
    where
        `id` = p_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `eshop`
--

USE `eshop`;

--
-- Final view structure for view `v_customers`
--

/*!50001 DROP TABLE IF EXISTS `v_customers`*/;
/*!50001 DROP VIEW IF EXISTS `v_customers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_customers` AS select `c`.`id` AS `id`,concat(`c`.`firstname`,' ',`c`.`lastname`) AS `name`,concat(`c`.`street`,' ',`c`.`number`,' ',`c`.`post_code`,' ',`c`.`city`,' ',`c`.`country`) AS `adress`,`c`.`email` AS `email`,group_concat(distinct `cp`.`phone` separator ', ') AS `phone` from (`customers` `c` join `customer_phones` `cp` on((`c`.`id` = `cp`.`id`))) group by `c`.`id` order by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_inventory`
--

/*!50001 DROP TABLE IF EXISTS `v_inventory`*/;
/*!50001 DROP VIEW IF EXISTS `v_inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_inventory` AS select `i`.`id` AS `id`,`i`.`product` AS `product`,`p`.`name` AS `name`,concat(`i`.`section`,'-',`i`.`position`,'-',`i`.`level`) AS `position`,`i`.`amount` AS `amount` from (`inventory` `i` join `products` `p` on((`i`.`product` = `p`.`id`))) group by `i`.`id` order by `i`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_log_orders`
--

/*!50001 DROP TABLE IF EXISTS `v_log_orders`*/;
/*!50001 DROP VIEW IF EXISTS `v_log_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_log_orders` AS select `log_orders`.`id` AS `id`,`log_orders`.`order` AS `order`,`log_orders`.`customer` AS `customer`,`log_orders`.`time` AS `time`,`log_orders`.`activity` AS `activity`,`log_orders`.`before` AS `before`,`log_orders`.`after` AS `after` from `log_orders` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_log_products`
--

/*!50001 DROP TABLE IF EXISTS `v_log_products`*/;
/*!50001 DROP VIEW IF EXISTS `v_log_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_log_products` AS select `log_products`.`id` AS `id`,`log_products`.`product` AS `product`,`log_products`.`time` AS `time`,`log_products`.`activity` AS `activity`,`log_products`.`before` AS `before`,`log_products`.`after` AS `after` from `log_products` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orders`
--

/*!50001 DROP TABLE IF EXISTS `v_orders`*/;
/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orders` AS select `o`.`id` AS `id`,`o`.`customer` AS `customer`,concat(`c`.`firstname`,' ',`c`.`lastname`) AS `name`,count(`pl`.`order`) AS `rows`,`o`.`created` AS `created`,`order_status`(`o`.`created`,`o`.`updated`,`o`.`ordered`,`o`.`shipped`,`o`.`deleted`) AS `status` from ((`orders` `o` join `customers` `c` on((`o`.`customer` = `c`.`id`))) left join `picking_lists` `pl` on((`o`.`id` = `pl`.`order`))) group by `o`.`id` order by `o`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_picking_lists`
--

/*!50001 DROP TABLE IF EXISTS `v_picking_lists`*/;
/*!50001 DROP VIEW IF EXISTS `v_picking_lists`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_picking_lists` AS select `pl`.`id` AS `id`,`pl`.`order` AS `order`,`pl`.`index` AS `index`,`pl`.`product` AS `product`,`p`.`name` AS `name`,`p`.`info` AS `info`,`pl`.`amount` AS `amount`,group_concat(distinct concat(`i`.`section`,'-',`i`.`position`,'-',`i`.`level`) separator ', ') AS `position`,sum(distinct `i`.`amount`) AS `stored` from ((`picking_lists` `pl` join `products` `p` on((`pl`.`product` = `p`.`id`))) join `inventory` `i` on((`p`.`id` = `i`.`product`))) group by `pl`.`id`,`pl`.`product`,`i`.`product` order by `pl`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_product`
--

/*!50001 DROP TABLE IF EXISTS `v_product`*/;
/*!50001 DROP VIEW IF EXISTS `v_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_product` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`info` AS `info`,`p`.`price` AS `price`,sum(distinct `i`.`amount`) AS `amount` from ((`products` `p` join `product_types` `pt` on((`p`.`id` = `pt`.`product`))) join `inventory` `i` on((`p`.`id` = `i`.`product`))) group by `p`.`id` order by `p`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_product_categories`
--

/*!50001 DROP TABLE IF EXISTS `v_product_categories`*/;
/*!50001 DROP VIEW IF EXISTS `v_product_categories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_product_categories` AS select `product_types`.`type` AS `type`,(select count(`product_types`.`product`)) AS `products` from `product_types` group by `product_types`.`type` order by `product_types`.`type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_products`
--

/*!50001 DROP TABLE IF EXISTS `v_products`*/;
/*!50001 DROP VIEW IF EXISTS `v_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_products` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`info` AS `info`,`p`.`price` AS `price`,group_concat(distinct `pt`.`type` separator ', ') AS `types`,group_concat(distinct concat(`i`.`section`,'-',`i`.`position`,'-',`i`.`level`) separator ', ') AS `stored`,sum(`i`.`amount`) AS `amount`,`pp`.`picture` AS `picture`,`pp`.`alt` AS `alt`,`pp`.`text` AS `text` from (((`products` `p` left join `product_types` `pt` on((`p`.`id` = `pt`.`product`))) left join `product_pictures` `pp` on((`p`.`id` = `pp`.`product`))) left join `inventory` `i` on((`p`.`id` = `i`.`product`))) group by `p`.`id`,`pp`.`picture`,`pp`.`alt`,`pp`.`text` order by `p`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-13 22:17:45
