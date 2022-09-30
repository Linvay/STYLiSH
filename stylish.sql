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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `des_img`
--

LOCK TABLES `des_img` WRITE;
/*!40000 ALTER TABLE `des_img` DISABLE KEYS */;
INSERT INTO `des_img` VALUES (1,1,'https://s3-alpha-sig.figma.com/img/170f/5323/f3fc1f9902db2bca2704a9323720b320?Expires=1665360000&Signature=Fao2m6UTjt4M8seFhX159km4MyRa1RZbB7T1r8imXcIAsYk~PBI6lmHApEDlMDNmHtwAbxTQO8UfWAqUqme1w9l7MDCVg1MEEEbGwKYy8Cwrp1bwS~YE9~RmoISuCd-BoZMtbw3v3YLG5pTnEL--3WXvDTAaPDqxxQxcmjj8jf5TpDP9d56OQskpfLJt2fllyG6LjT5Ca9jvmkYwDmjjcs3kr4IX-WfcLeqjx~7ONGWVvBSGQz-H0dqGXjiupyMRFunSDMRv~CjtZ9BwQfGC4AqE9bQHKPO5Mst3MsrALTDmhsdkgseVc-lI~3YfUmO7VUsv00EMBYjCsai2aWRJew__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),(2,1,'https://s3-alpha-sig.figma.com/img/a571/64d6/d4eb6bb501df7dcd9e94f8b47a421718?Expires=1665360000&Signature=B5L-3Hf3PiS58GrL0BpcuDNFpN71VguHCnos~gPmKSPProAR4n7WyYtlIHci4VylSVOsCk9M6-JdpkuWI3dRtKNJOukGETeKbLayHfJMT1YW2gut4f0q54fS~6dpJ~MeQD-70lETunudpzSY~rZki7M87z2zWXs2LFuXBO7sJqdDpppAh3E~DAdYNySpO7U7aBN0Ldbby4VT-aNsdN2C1yuNfR85zC1-4y0a1V9V~QmYAxkCSaDtqU9G56gshd1shc~eDci9aEAWlfJgMlgTCYXV3~YDdYFSKLn7RsVLzZf94ZonpYEmkaFCLp2tOUQSCVuMWp2q7XKRqd3BjTncxA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),(3,2,'https://justonemall.tw/web/product/shopping_mall/product/2209/DA26181/LJ-220914DA26181_00.jpg'),(4,2,'https://justonemall.tw/web/product/shopping_mall/product/2209/DA26181/LJ-220914DA26181_m_tw.jpg'),(5,3,'https://justonemall.tw/web/product/shopping_mall/product/2108/DA23677/SJ-210819DA23677_02.jpg'),(6,3,'https://justonemall.tw/web/product/shopping_mall/product/2108/DA23677/SJ-210819DA23677_m_tw_05.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (1,10,'實品顏色依單品照為主\n\n棉 100%\n厚薄：薄\n彈性：無\n\n清洗：手洗，溫水\n產地：中國','O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey, making it even lighter for those who prefer their summer style extra-breezy.'),(2,11,'純色系的洋裝款式，是好駕馭的優雅單品。\n半排釦的上身設計，方便穿脫又增添造型。\n鬆緊帶的腰部收合，自在地襯托窈窕身形。\n百分百的純棉質感，給肌膚最溫柔的呵護！',''),(3,12,'搭配好的套裝款式，讓妳不用再傷透腦筋。\n無印花的純色上衣，穿搭駕馭不需要技巧。\n抓皺設計的泡泡袖，修飾手臂又滿載甜味。\n側綁帶的背心洋裝，展現巧思更增添美感。',''),(4,11,'純色系的洋裝款式，是好駕馭的優雅單品。\n半排釦的上身設計，方便穿脫又增添造型。\n鬆緊帶的腰部收合，自在地襯托窈窕身形。\n百分百的純棉質感，給肌膚最溫柔的呵護！',''),(5,12,'搭配好的套裝款式，讓妳不用再傷透腦筋。\n無印花的純色上衣，穿搭駕馭不需要技巧。\n抓皺設計的泡泡袖，修飾手臂又滿載甜味。\n側綁帶的背心洋裝，展現巧思更增添美感。','');
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
  `img_src` varchar(2000) NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'mc_1',300,'m','shorturl.at/joTY6'),(2,'wc_1',350,'w','shorturl.at/joTY6'),(3,'wc_2',410,'w','shorturl.at/joTY6'),(4,'wc_3',420,'w','shorturl.at/joTY6'),(5,'wc_4',420,'w','shorturl.at/joTY6'),(6,'wc_5',430,'w','shorturl.at/joTY6'),(7,'wc_6',450,'w','shorturl.at/joTY6'),(8,'wc_7',500,'w','shorturl.at/joTY6'),(9,'acc_1',1000,'a','shorturl.at/joTY6'),(10,'厚實毛呢格子外套',3000,'w','shorturl.at/joTY6'),(11,'鬆緊腰半排釦洋裝',950,'w','https://justonemall.tw/web/product/big/202209/c2e47b27575409162030278c53937d3d.jpg'),(12,'泡泡袖上衣綁帶背心洋裝',950,'w','https://justonemall.tw/web/product/big/202108/0669475c316a4b8c9ce8b518d5b32ba2.jpg');
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
  PRIMARY KEY (`var_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,1,'#000000','M',10),(2,1,'#0000ff','M',10),(3,2,'#0000ff','S',10),(4,2,'#0000ff','M',10),(5,3,'#ff00ff','XL',10),(6,3,'#0000ff','M',10),(7,3,'#0000ff','L',10),(8,4,'#0000ff','S',10),(9,5,'#0000ff','M',10),(10,5,'#0000ff','XS',10),(11,6,'#0000ff','XL',10),(12,6,'#0000ff','M',10),(13,7,'#0000ff','L',10),(14,7,'#0000ff','M',10),(15,8,'#0000ff','L',10),(16,8,'#0000ff','XS',10),(17,8,'#0000ff','M',10),(18,9,'#0000ff','M',10),(19,9,'#ff00ff','S',10),(20,10,'#333333','M',15),(21,10,'#331133','L',15),(22,11,'#313533','M',5),(23,11,'#316933','S',10),(24,11,'#301033','L',10),(25,12,'#30ff33','M',13),(26,12,'#201933','S',19);
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

-- Dump completed on 2022-09-30 17:52:18
