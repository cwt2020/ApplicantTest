CREATE DATABASE  IF NOT EXISTS `applicant_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `applicant_test`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: applicant_test
-- ------------------------------------------------------
-- Server version	5.6.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `line_item`
--

DROP TABLE IF EXISTS `line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_item` (
  `line_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `description` varchar(45) NOT NULL,
  `qty` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`line_item_id`),
  UNIQUE KEY `line_item_id_UNIQUE` (`line_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_item`
--

LOCK TABLES `line_item` WRITE;
/*!40000 ALTER TABLE `line_item` DISABLE KEYS */;
INSERT INTO `line_item` VALUES (1,1,1,'A',1,'2017-08-29 17:30:01',4),(2,1,2,'B',3,'2017-08-29 17:30:01',1),(3,2,3,'C',5,'2017-08-29 17:30:01',3),(4,3,2,'B',2,'2017-08-29 17:30:01',2);
/*!40000 ALTER TABLE `line_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_ordered` datetime DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2017-08-29 17:24:29',NULL,'2017-08-30 00:24:29','order A'),(2,'2017-08-29 17:24:29',NULL,'2017-08-30 00:24:29','order B'),(3,'2017-08-29 17:24:29',NULL,'2017-08-30 00:24:29','order C');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`stock_id`),
  UNIQUE KEY `stock_id_UNIQUE` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'Item A'),(2,'Item B'),(3,'Item C');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_unit`
--

DROP TABLE IF EXISTS `stock_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_unit` (
  `stock_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`stock_id`,`unit_id`),
  KEY `stock_unit_unit_id_fk_idx` (`unit_id`),
  CONSTRAINT `stock_unit_unit_id_fk` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stock_unit_stock_id_fk` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`stock_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_unit`
--

LOCK TABLES `stock_unit` WRITE;
/*!40000 ALTER TABLE `stock_unit` DISABLE KEYS */;
INSERT INTO `stock_unit` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(1,3),(3,3),(1,4);
/*!40000 ALTER TABLE `stock_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`unit_id`),
  UNIQUE KEY `unit_id_UNIQUE` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'Case',100.00),(2,'Pack',10.00),(3,'Individual',1.00),(4,'Delux',2.00);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-30 11:27:09
