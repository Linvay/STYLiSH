-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: stylish
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `des_img`
--

DROP TABLE IF EXISTS `des_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `des_img` (
  `img_id` int unsigned NOT NULL AUTO_INCREMENT,
  `des_id` int unsigned NOT NULL,
  `img_src` varchar(2083) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`img_id`),
  KEY `des_id` (`des_id`),
  CONSTRAINT `des_img_ibfk_1` FOREIGN KEY (`des_id`) REFERENCES `description` (`des_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `des_img`
--

LOCK TABLES `des_img` WRITE;
/*!40000 ALTER TABLE `des_img` DISABLE KEYS */;
INSERT INTO `des_img` VALUES (1,1,'upload\\images\\簡約素面下擺撞色休閒長袖衛衣_extra.jpg');
/*!40000 ALTER TABLE `des_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description` (
  `des_id` int unsigned NOT NULL AUTO_INCREMENT,
  `prod_id` int unsigned NOT NULL,
  `main` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`des_id`),
  KEY `prod_id` (`prod_id`),
  FULLTEXT KEY `body` (`main`,`extra`),
  CONSTRAINT `description_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (1,1,'小二布屋BOY2【NZ762007】。\r\n質感舒適，休閒百搭。\r\n4色 現+預',''),(10,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNulla sagittis turpis sed sapien imperdiet placerat.\nCras malesuada ligula non nisl varius, in fringilla risus egestas.','In vitae sem turpis. Donec sed varius erat. In a aliquam dui. Proin ac lacus felis. Nam vitae pulvinar ante. Sed ullamcorper id velit sit amet mattis. Sed efficitur nibh quis mi sollicitudin, quis fermentum odio mattis. Duis vulputate pharetra arcu, id aliquam quam vulputate sed. Curabitur velit elit, commodo eu dignissim at, tristique non justo.'),(11,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNulla sagittis turpis sed sapien imperdiet placerat.\nCras malesuada ligula non nisl varius, in fringilla risus egestas.','In vitae sem turpis. Donec sed varius erat. In a aliquam dui. Proin ac lacus felis. Nam vitae pulvinar ante. Sed ullamcorper id velit sit amet mattis. Sed efficitur nibh quis mi sollicitudin, quis fermentum odio mattis. Duis vulputate pharetra arcu, id aliquam quam vulputate sed. Curabitur velit elit, commodo eu dignissim at, tristique non justo.'),(12,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNulla sagittis turpis sed sapien imperdiet placerat.\nCras malesuada ligula non nisl varius, in fringilla risus egestas.','In vitae sem turpis. Donec sed varius erat. In a aliquam dui. Proin ac lacus felis. Nam vitae pulvinar ante. Sed ullamcorper id velit sit amet mattis. Sed efficitur nibh quis mi sollicitudin, quis fermentum odio mattis. Duis vulputate pharetra arcu, id aliquam quam vulputate sed. Curabitur velit elit, commodo eu dignissim at, tristique non justo.'),(13,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNulla sagittis turpis sed sapien imperdiet placerat.\nCras malesuada ligula non nisl varius, in fringilla risus egestas.','In vitae sem turpis. Donec sed varius erat. In a aliquam dui. Proin ac lacus felis. Nam vitae pulvinar ante. Sed ullamcorper id velit sit amet mattis. Sed efficitur nibh quis mi sollicitudin, quis fermentum odio mattis. Duis vulputate pharetra arcu, id aliquam quam vulputate sed. Curabitur velit elit, commodo eu dignissim at, tristique non justo.'),(14,6,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNulla sagittis turpis sed sapien imperdiet placerat.\nCras malesuada ligula non nisl varius, in fringilla risus egestas.','In vitae sem turpis. Donec sed varius erat. In a aliquam dui. Proin ac lacus felis. Nam vitae pulvinar ante. Sed ullamcorper id velit sit amet mattis. Sed efficitur nibh quis mi sollicitudin, quis fermentum odio mattis. Duis vulputate pharetra arcu, id aliquam quam vulputate sed. Curabitur velit elit, commodo eu dignissim at, tristique non justo.'),(15,7,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNulla sagittis turpis sed sapien imperdiet placerat.\nCras malesuada ligula non nisl varius, in fringilla risus egestas.','In vitae sem turpis. Donec sed varius erat. In a aliquam dui. Proin ac lacus felis. Nam vitae pulvinar ante. Sed ullamcorper id velit sit amet mattis. Sed efficitur nibh quis mi sollicitudin, quis fermentum odio mattis. Duis vulputate pharetra arcu, id aliquam quam vulputate sed. Curabitur velit elit, commodo eu dignissim at, tristique non justo.'),(16,8,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNulla sagittis turpis sed sapien imperdiet placerat.\nCras malesuada ligula non nisl varius, in fringilla risus egestas.','In vitae sem turpis. Donec sed varius erat. In a aliquam dui. Proin ac lacus felis. Nam vitae pulvinar ante. Sed ullamcorper id velit sit amet mattis. Sed efficitur nibh quis mi sollicitudin, quis fermentum odio mattis. Duis vulputate pharetra arcu, id aliquam quam vulputate sed. Curabitur velit elit, commodo eu dignissim at, tristique non justo.'),(17,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNulla sagittis turpis sed sapien imperdiet placerat.\nCras malesuada ligula non nisl varius, in fringilla risus egestas.','In vitae sem turpis. Donec sed varius erat. In a aliquam dui. Proin ac lacus felis. Nam vitae pulvinar ante. Sed ullamcorper id velit sit amet mattis. Sed efficitur nibh quis mi sollicitudin, quis fermentum odio mattis. Duis vulputate pharetra arcu, id aliquam quam vulputate sed. Curabitur velit elit, commodo eu dignissim at, tristique non justo.');
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'簡約素面下擺撞色休閒長袖衛衣',680,'m'),(2,'厚實毛呢格子外套',500,'w'),(3,'泡泡袖上衣綁帶背心洋裝套裝',810,'w'),(4,'半排釦針織背心洋裝',950,'w'),(5,'微笑標籤七分袖條紋大學T',720,'w'),(6,'燒花荷葉邊後釦褶縫上衣',550,'w'),(7,'百褶格紋褲裙',880,'w'),(8,'寬百褶後鬆緊腰長裙',950,'w'),(9,'優雅925銀珍珠耳環',1000,'a');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant` (
  `var_id` int unsigned NOT NULL AUTO_INCREMENT,
  `prod_id` int unsigned NOT NULL,
  `color` varchar(20) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int unsigned NOT NULL,
  `img_src` varchar(2083) NOT NULL,
  PRIMARY KEY (`var_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,1,'#ffffff','S',20,'upload\\images\\簡約素面下擺撞色休閒長袖衛衣.jpeg'),(2,1,'#000000','M',18,'upload\\images\\簡約素面下擺撞色休閒長袖衛衣_黑.jpeg'),(21,2,'#4202ad','S',20,''),(22,2,'#6bffd1','M',20,''),(23,3,'#9848bc','S',20,''),(24,3,'#70c752','L',20,''),(25,4,'#4202ad','S',20,''),(26,4,'#101edd','S',20,''),(27,5,'#a974a2','L',20,''),(28,5,'#53a26e','M',20,''),(29,6,'#b4cf08','S',20,''),(30,6,'#4202ad','S',20,''),(31,7,'#c471c3','L',20,''),(32,7,'#101edd','S',20,''),(33,8,'#4202ad','S',20,''),(34,8,'#4202ad','L',20,''),(35,8,'#53a26e','S',20,''),(36,8,'#c471c3','M',20,''),(37,9,'#b4cf08','S',20,''),(38,9,'#70c752','L',20,'');
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

-- Dump completed on 2022-10-02  2:08:19
