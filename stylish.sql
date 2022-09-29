-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: stylish
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int unsigned NOT NULL,
  `category` varchar(15) NOT NULL,
  `img_src` varchar(2000) NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'mc_1',300,'m','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg'),(2,'wc_1',350,'w','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg'),(3,'wc_2',410,'w','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg'),(4,'wc_3',420,'w','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg'),(5,'wc_4',420,'w','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg'),(6,'wc_5',430,'w','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg'),(7,'wc_6',450,'w','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg'),(8,'wc_6',500,'w','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg'),(9,'acc_1',1000,'a','https://upload.wikimedia.org/wikipedia/commons/f/f7/Rpb_clothing_icon.svg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `prod_id` int unsigned NOT NULL,
  `color` varchar(20) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,1,'#000000','M',10),(2,1,'#0000ff','M',10),(3,2,'#0000ff','S',10),(4,2,'#0000ff','M',10),(5,3,'#ff00ff','XL',10),(6,3,'#0000ff','M',10),(7,3,'#0000ff','L',10),(8,4,'#0000ff','S',10),(9,5,'#0000ff','M',10),(10,5,'#0000ff','XS',10),(11,6,'#0000ff','XL',10),(12,6,'#0000ff','M',10),(13,7,'#0000ff','L',10),(14,7,'#0000ff','M',10),(15,8,'#0000ff','L',10),(16,8,'#0000ff','XS',10),(17,8,'#0000ff','M',10),(18,9,'#0000ff','M',10),(19,9,'#ff00ff','S',10);
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29 14:19:00
