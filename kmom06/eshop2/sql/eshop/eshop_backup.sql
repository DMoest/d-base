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
INSERT INTO `customer_phones` VALUES (1,752431154),(1,762315644),(2,716),(3,2147483647),(4,123098014),(5,1409810498),(6,131353467),(7,8678654),(8,334534647),(10,356457457);
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
INSERT INTO `customers` VALUES (1,'Janne','Lundqvist','Hejhoppgatan','34','72541','örebro','sweden','janne@janne.com','1951-10-13'),(2,'Bertil','Svensson','Härvardetasfaltsväge','3','11301','stockholm','sweden','bert@bert.com','2001-01-01'),(3,'Pelle','Karlsson','Brevidhavetvägen','1276','32154','västerås','sweden','pelle@pelle.se','1985-06-13'),(4,'Kalle','Anka','Ankeborgsgatan','2','11314','ankeborg','kalle anka land','kalle@anka.nu','1974-12-31'),(5,'Jonas','Svensson','Därbortavägen','642','54123','göteborg','sweden','svensson@jonas.io','1076-10-21'),(6,'Anders','Andersson','Kompåfestgatan','112','11208','jönköping','sweden','anders@anders.ju','2048-01-01'),(7,'Hamid','Hamidsson','NewDeligatn','91','987-154-1','new deli','indien','hamid@h.io','1932-11-13'),(8,'Dennis','Andersson','Runthörnetvägen','71','98563','kiruna','sweden','andersson.dennis@da.se','1945-06-23'),(9,'Sven-Bertil','Taube','Södermalmsgatan','50','11405','stockholm','sweden','svennesemail@email.com','1900-04-21'),(10,'Donald','Kvack','Ankeborgsgatan','1','11313','ankeborg','kalle anka land','donald.kvack@kvack.kvack','1863-07-07');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'AA','1','1',11,30),(2,'AA','1','2',12,5),(3,'AA','1','3',9,3),(4,'AA','2','1',11,50),(5,'AA','2','2',12,83),(6,'AA','2','3',7,35),(7,'AA','3','1',1,423),(8,'AA','3','2',8,4),(9,'AA','3','3',2,13),(10,'AA','4','1',8,31),(11,'AA','4','2',3,25),(12,'AA','4','3',4,100),(13,'AA','5','1',4,63),(14,'AA','5','2',4,50),(15,'AA','5','3',4,50),(16,'AB','1','1',6,20),(17,'AB','1','2',2,100),(18,'AB','1','3',3,91),(19,'AB','2','1',5,62),(20,'AB','2','2',5,46),(21,'AB','2','3',5,24),(22,'AB','3','1',5,324),(23,'AB','3','2',6,90),(24,'AB','3','3',6,58),(25,'AB','4','1',7,73),(26,'AB','4','2',8,150),(27,'AB','4','3',13,0),(28,'AB','5','1',2,35),(29,'AB','5','2',2,50),(30,'AB','5','3',12,100);
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
-- Table structure for table `log_products`
--

DROP TABLE IF EXISTS `log_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
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
INSERT INTO `log_products` VALUES (1,1,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 1 NAME: Badbrallor'),(2,2,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 2 NAME: Bikini'),(3,3,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 3 NAME: Baddräkt'),(4,4,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 4 NAME: Baddräkt'),(5,5,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 5 NAME: Shorts'),(6,6,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 6 NAME: T-Shirt'),(7,7,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 7 NAME: T-Shirt'),(8,8,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 8 NAME: Hoodie'),(9,9,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 9 NAME: Hoodie'),(10,10,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 10 NAME: Hoodie'),(11,11,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 11 NAME: Jeans'),(12,12,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 12 NAME: Chinos'),(13,13,'2020-09-01 12:44:40','2020-09-01','TRIGGER - New product was registered.','Empty','New product -> ID: 13 NAME: Polotröja');
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
  `id` int NOT NULL,
  `customer` int NOT NULL,
  `picking_list` int NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `customer` (`customer`),
  KEY `picking_list` (`picking_list`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`picking_list`) REFERENCES `picking_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

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
  `name` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `position` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `product` (`product`),
  KEY `position` (`position`),
  FULLTEXT KEY `product_name` (`name`),
  CONSTRAINT `picking_lists_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  CONSTRAINT `picking_lists_ibfk_2` FOREIGN KEY (`position`) REFERENCES `inventory` (`id`) ON DELETE CASCADE
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
  `picture` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `product` (`product`),
  FULLTEXT KEY `description` (`description`),
  CONSTRAINT `product_pictures_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_pictures`
--

LOCK TABLES `product_pictures` WRITE;
/*!40000 ALTER TABLE `product_pictures` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types`
--

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;
INSERT INTO `product_types` VALUES (1,1,'Badkläder'),(2,1,'Herrkläder'),(3,2,'Badkläder'),(4,2,'Damkläder'),(5,3,'Badkläder'),(6,3,'Damkläder'),(7,4,'Badkläder'),(8,4,'Damkläder'),(9,5,'Kläder'),(10,5,'Unisex'),(11,6,'Tröjor'),(12,7,'Tröjor'),(13,8,'Tröjor'),(14,8,'Unisex'),(15,9,'Tröjor'),(16,9,'Unisex'),(17,10,'Tröjor'),(18,10,'Unisex'),(19,11,'Byxor'),(20,11,'Herrkläder'),(21,12,'Byxor'),(22,12,'Herrkläder'),(23,13,'Tröjor'),(24,13,'Herrkläder');
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
INSERT INTO `products` VALUES (1,'Badbrallor','Svart badbyxa. Snörning fram och ficka på höger baksida.',399.00),(2,'Bikini','Röd bikini. Består av två delar.',599.00),(3,'Baddräkt','Lila baddräkt.',799.00),(4,'Baddräkt','Gul baddärkt. Du kommer se ut som en kyckling.',799.00),(5,'Shorts','Bruna shorts av vardaglig modell.',499.00),(6,'T-Shirt','Vit t-shirt.',199.00),(7,'T-Shirt','Svart t-shirt.',199.00),(8,'Hoodie','Grå hoodie/munktröja. Varm och go.',699.00),(9,'Hoodie','Grön hoodie/munktröja. Varm och go.',699.00),(10,'Hoodie','Röd hoodie/munktröja. Varm och go.',699.00),(11,'Jeans','Regular cut jeans av dålig kvalitet. Går hål på väldigt lätt.',349.00),(12,'Chinos','Vanliga chinos av sämsta möjliga kvalitet. Man behöver inte mer än att titta på dem så ramlar de nästan isär.',299.00),(13,'Polotröja','Svart polotröja, en sån som Steve Jobs alltid hade på sig. Du vet den med \"turtle neck\" eller vad det kallas.',999.00);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_product_insert` AFTER INSERT ON `products` FOR EACH ROW insert into log_products (`product`, `date`, `time`, `activity`, `before`, `after`)
            values (new.id, curdate(), current_timestamp(), "TRIGGER - New product was registered.", "Empty", concat("New product -> ID: ", new.id, " NAME: ", new.name)) */;;
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
insert into log_products (`product`, `date`, `time`, `activity`, `before`, `after`)
    values (old.id, curdate(), current_timestamp(), "TRIGGER - Product was updated.", concat("Old data -> NAME: ", old.name, " INFO: ", old.info, " PRICE: ", old.price), concat("New data -> NAME: ", new.name, " INFO: ", new.info, " PRICE: ", new.price));
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
    insert into log_products (`product`, `date`, `time`, `activity`, `before`, `after`)
        values (old.id, curdate(), current_timestamp(), "TRIGGER - Deleted product was registered.", concat("Product -> ID: ", old.id, " NAME: ", old.name, " INFO: ", old.info, " PRICE: ", old.price), "Deleted");
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
  `picking_list` int NOT NULL,
  `id` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`picking_list`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `products_to_picking_list_ibfk_1` FOREIGN KEY (`id`) REFERENCES `products` (`id`) ON DELETE CASCADE
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
  `date` tinyint NOT NULL,
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
  `picking_list` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `status` tinyint NOT NULL
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
  `stored` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
/*!50001 VIEW `v_inventory` AS select `i`.`id` AS `id`,`i`.`product` AS `product`,`p`.`name` AS `name`,concat(`i`.`section`,'-',`i`.`position`,'-',`i`.`level`) AS `position`,`i`.`amount` AS `amount` from (`inventory` `i` join `products` `p` on((`i`.`product` = `p`.`id`))) */;
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
/*!50001 VIEW `v_log_products` AS select `log_products`.`id` AS `id`,`log_products`.`product` AS `product`,`log_products`.`time` AS `time`,`log_products`.`date` AS `date`,`log_products`.`activity` AS `activity`,`log_products`.`before` AS `before`,`log_products`.`after` AS `after` from `log_products` */;
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
/*!50001 VIEW `v_orders` AS select `orders`.`id` AS `id`,`orders`.`customer` AS `customer`,`orders`.`picking_list` AS `picking_list`,`orders`.`date` AS `date`,`orders`.`status` AS `status` from `orders` */;
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
/*!50001 VIEW `v_products` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`info` AS `info`,`p`.`price` AS `price`,group_concat(distinct `pt`.`type` separator ', ') AS `types`,group_concat(distinct concat(`i`.`section`,'-',`i`.`position`,'-',`i`.`level`) separator ', ') AS `stored` from ((`products` `p` left join `product_types` `pt` on((`p`.`id` = `pt`.`product`))) join `inventory` `i` on((`p`.`id` = `i`.`product`))) group by `p`.`id` */;
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

-- Dump completed on 2020-09-01 14:44:40
