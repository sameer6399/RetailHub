CREATE DATABASE  IF NOT EXISTS RetailHub /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `RetailHub`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: mysql-302a674e-retailhub.a.aivencloud.com    Database: RetailHub
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- Table structure for table `chain_items_vendors_orderpunch`
--

DROP TABLE IF EXISTS `chain_items_vendors_orderpunch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chain_items_vendors_orderpunch` (
  `reference_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `vendor_id` int NOT NULL,
  `chain_id` int NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purchase_qty` int NOT NULL DEFAULT '0',
  `price_per_qty` int NOT NULL DEFAULT '0',
  `status` enum('Failed','Pending','Success') NOT NULL DEFAULT 'Pending',
  UNIQUE KEY `reference_id` (`reference_id`),
  KEY `fk_vendor_orderpunch_chain` (`chain_id`),
  KEY `fk_vendor_orderpunch_items` (`item_id`),
  KEY `fk_vendor_orderpunch_vendors` (`vendor_id`),
  CONSTRAINT `fk_vendor_orderpunch_chain` FOREIGN KEY (`chain_id`) REFERENCES `chains` (`chain_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vendor_orderpunch_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vendor_orderpunch_vendors` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain_items_vendors_orderpunch`
--

LOCK TABLES `chain_items_vendors_orderpunch` WRITE;
/*!40000 ALTER TABLE `chain_items_vendors_orderpunch` DISABLE KEYS */;
INSERT INTO `chain_items_vendors_orderpunch` VALUES (1,5,1,1,'2023-12-08 22:47:35',50,100,'Success'),(2,3,1,1,'2023-12-08 22:48:08',2,2,'Success'),(3,2,1,1,'2023-12-08 22:49:21',2,20,'Success'),(4,3,1,1,'2023-12-08 22:49:45',2,2,'Success'),(5,17,3,1,'2023-12-08 23:29:49',400,5,'Failed'),(204,5,1,1,'2023-12-08 22:47:35',50,100,'Success'),(205,3,1,1,'2023-12-08 22:48:08',2,2,'Success'),(206,2,1,1,'2023-12-08 22:49:21',2,20,'Success'),(207,3,1,1,'2023-12-08 22:49:45',2,2,'Success'),(208,10,5,2,'2023-12-08 23:00:00',5,30,'Success'),(209,15,8,2,'2023-12-08 23:15:00',10,15,'Pending'),(210,8,12,2,'2023-12-08 23:30:00',8,25,'Failed'),(211,18,7,3,'2023-12-09 00:00:00',3,40,'Success'),(212,20,10,3,'2023-12-09 01:00:00',15,10,'Failed'),(213,12,15,3,'2023-12-09 02:00:00',5,18,'Success'),(214,7,18,3,'2023-12-09 03:00:00',7,22,'Pending'),(215,4,3,1,'2023-12-09 04:00:00',1,5,'Success'),(216,6,5,1,'2023-12-09 05:00:00',4,12,'Success'),(217,9,8,2,'2023-12-09 06:00:00',6,8,'Success'),(218,11,10,2,'2023-12-09 07:00:00',7,7,'Pending'),(219,13,12,3,'2023-12-09 08:00:00',3,15,'Success'),(220,4,3,1,'2023-12-09 04:00:00',1,5,'Pending'),(221,6,5,1,'2023-12-09 05:00:00',4,12,'Success'),(222,9,8,2,'2023-12-09 06:00:00',6,8,'Success'),(223,11,10,2,'2023-12-09 07:00:00',7,7,'Pending'),(224,13,12,3,'2023-12-09 08:00:00',3,15,'Success'),(225,16,15,3,'2023-12-09 09:00:00',2,25,'Pending'),(226,19,18,3,'2023-12-09 10:00:00',4,18,'Failed'),(227,21,20,1,'2023-12-09 11:00:00',8,10,'Success'),(228,23,22,2,'2023-12-09 12:00:00',3,30,'Pending'),(229,25,24,3,'2023-12-09 13:00:00',5,22,'Success'),(240,27,26,2,'2023-12-09 14:00:00',2,15,'Pending'),(241,29,28,3,'2023-12-09 15:00:00',7,20,'Success'),(242,21,30,1,'2023-12-09 16:00:00',4,12,'Success'),(243,23,32,2,'2023-12-09 17:00:00',6,28,'Pending'),(244,25,34,3,'2023-12-09 18:00:00',10,15,'Failed'),(261,27,26,3,'2023-12-10 00:00:00',6,12,'Success'),(262,29,18,1,'2023-12-10 01:00:00',2,15,'Failed'),(263,11,20,2,'2023-12-10 02:00:00',9,18,'Success'),(264,13,12,3,'2023-12-10 03:00:00',3,30,'Pending'),(265,25,24,1,'2023-12-10 04:00:00',5,22,'Success'),(266,2,1,2,'2023-12-10 05:00:00',7,25,'Success'),(267,4,3,2,'2023-12-10 06:00:00',4,15,'Pending'),(268,6,5,3,'2023-12-10 07:00:00',6,20,'Failed'),(269,8,7,3,'2023-12-10 08:00:00',8,12,'Success'),(270,10,9,1,'2023-12-10 09:00:00',3,18,'Success'),(271,12,11,1,'2023-12-10 10:00:00',5,10,'Pending'),(272,14,13,2,'2023-12-10 11:00:00',9,22,'Success'),(273,16,15,2,'2023-12-10 12:00:00',2,28,'Pending'),(274,18,17,3,'2023-12-10 13:00:00',7,18,'Failed'),(275,20,19,3,'2023-12-10 14:00:00',10,20,'Success'),(276,22,21,1,'2023-12-10 15:00:00',6,15,'Pending'),(277,24,23,1,'2023-12-10 16:00:00',4,12,'Success'),(278,26,25,2,'2023-12-10 17:00:00',8,25,'Success'),(279,28,27,2,'2023-12-10 18:00:00',7,30,'Pending'),(280,20,29,3,'2023-12-10 19:00:00',5,18,'Success'),(281,22,11,3,'2023-12-10 20:00:00',3,15,'Failed'),(282,24,13,1,'2023-12-10 21:00:00',6,22,'Success'),(283,16,15,1,'2023-12-10 22:00:00',2,12,'Pending'),(284,18,27,2,'2023-12-10 23:00:00',4,18,'Success'),(285,20,19,2,'2023-12-11 00:00:00',9,20,'Success'),(286,2,1,3,'2023-12-11 01:00:00',7,25,'Pending'),(287,24,3,3,'2023-12-11 02:00:00',8,30,'Failed'),(288,16,5,1,'2023-12-11 03:00:00',10,15,'Success'),(289,28,17,1,'2023-12-11 04:00:00',5,22,'Success'),(290,20,29,2,'2023-12-11 05:00:00',3,18,'Pending'),(291,22,1,2,'2023-12-11 06:00:00',4,12,'Success'),(292,24,3,3,'2023-12-11 07:00:00',8,25,'Success'),(293,26,15,3,'2023-12-11 08:00:00',6,20,'Failed'),(294,2,17,1,'2023-12-11 09:00:00',9,18,'Success'),(295,10,19,1,'2023-12-11 10:00:00',2,22,'Success');
/*!40000 ALTER TABLE `chain_items_vendors_orderpunch` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sameer`@`%`*/ /*!50003 TRIGGER `UpdateItemDetailsOnOrderStatusChange` BEFORE UPDATE ON `chain_items_vendors_orderpunch` FOR EACH ROW BEGIN
    -- Check if the status changes from 'Pending' to 'Success'
    IF OLD.status = 'Pending' AND NEW.status = 'Success' THEN
        UPDATE items
        SET quantity = quantity + NEW.purchase_qty,
            purchase_price = NEW.price_per_qty,
            selling_price = NEW.price_per_qty * 1.20,
            vendor_id = NEW.vendor_id
        WHERE item_id = NEW.item_id;
    ELSEIF NEW.status = 'Failed' THEN
        SET NEW.status = 'Failed'; -- Update the status to 'Failed'
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `chains`
--

DROP TABLE IF EXISTS `chains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chains` (
  `chain_id` int NOT NULL AUTO_INCREMENT,
  `street_no` varchar(8) NOT NULL,
  `street_name` varchar(64) NOT NULL,
  `town` varchar(64) NOT NULL,
  `zip_code` int NOT NULL,
  PRIMARY KEY (`chain_id`),
  UNIQUE KEY `street_no` (`street_no`,`street_name`,`town`,`zip_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chains`
--

LOCK TABLES `chains` WRITE;
/*!40000 ALTER TABLE `chains` DISABLE KEYS */;
INSERT INTO `chains` VALUES (1,'123','Main Street','Boston',12345),(2,'456','High Street','NewYork',23456),(3,'789','Broadway','California',34567);
/*!40000 ALTER TABLE `chains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(64) NOT NULL,
  `customer_email` varchar(64) DEFAULT NULL,
  `customer_phone_number` varchar(15) NOT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_phone_number` (`customer_phone_number`),
  KEY `fk_customer_order` (`order_id`),
  CONSTRAINT `fk_customer_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alice Johnson','alice@email.com','1111111111',1),(2,'Bob Smith','bob@email.com','2222222222',2),(3,'Charlie Davis','charlie@email.com','3333333333',3);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `hourly_pay` int NOT NULL DEFAULT '25',
  `employee_start_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `staff_id` (`staff_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,4,15,'2023-03-01 00:00:00'),(2,NULL,25,'2023-12-07 10:26:53'),(3,2,25,'2023-12-07 10:28:14'),(7,29,25,'2023-12-07 12:20:25'),(8,30,25,'2023-12-07 12:20:25'),(9,31,25,'2023-12-07 12:20:25'),(10,32,25,'2023-12-07 12:20:25'),(11,33,25,'2023-12-07 12:20:25'),(12,34,25,'2023-12-07 12:20:25'),(13,35,25,'2023-12-07 12:20:25'),(14,36,25,'2023-12-07 12:20:25'),(15,37,25,'2023-12-07 12:20:25'),(16,38,25,'2023-12-07 12:20:25'),(17,39,25,'2023-12-07 12:20:25'),(18,40,25,'2023-12-07 12:20:25'),(19,41,25,'2023-12-07 15:18:08'),(20,42,25,'2023-12-07 15:18:08'),(21,43,25,'2023-12-07 15:18:08'),(22,44,25,'2023-12-07 15:18:08'),(23,45,25,'2023-12-07 15:18:08'),(24,46,25,'2023-12-07 15:18:08'),(25,47,25,'2023-12-07 15:18:08'),(26,48,25,'2023-12-07 15:18:08'),(27,49,25,'2023-12-07 15:18:08'),(28,50,25,'2023-12-07 15:18:08'),(29,51,25,'2023-12-07 15:18:38'),(30,52,25,'2023-12-07 15:18:38'),(31,53,25,'2023-12-07 15:18:38'),(32,54,25,'2023-12-07 15:18:38'),(33,55,25,'2023-12-07 15:18:38'),(34,56,25,'2023-12-07 15:18:38'),(35,57,25,'2023-12-07 15:18:38'),(36,58,25,'2023-12-07 15:18:38'),(37,59,25,'2023-12-07 15:18:38'),(38,60,25,'2023-12-07 15:18:38'),(39,61,25,'2023-12-07 15:23:46');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcategory`
--

DROP TABLE IF EXISTS `itemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemcategory` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_description` varchar(1024) DEFAULT NULL,
  `emoji` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcategory`
--

LOCK TABLES `itemcategory` WRITE;
/*!40000 ALTER TABLE `itemcategory` DISABLE KEYS */;
INSERT INTO `itemcategory` VALUES (1,'Books','Dive into a world of literary wonders with our extensive collection of books. Whether you\'re a seasoned reader or just starting your reading journey, our selection covers a broad range of genres and interests. From comprehensive guides for SQL beginners to classic works on electronic design, our library caters to every book lover\'s taste. Explore, discover, and embark on an adventure through the pages of our carefully curated books.','?'),(2,'Electronics','Immerse yourself in the realm of cutting-edge electronic gadgets that redefine innovation. Our Electronics category brings you the latest and most advanced tech gadgets for enthusiasts and early adopters alike. From state-of-the-art smartphones and wireless earbuds to 4K UHD smart TVs, we showcase the forefront of technological evolution. Explore the possibilities, stay connected, and embrace the future with our dynamic electronic collection.','?'),(4,'Home Decor','Transform your living space into a haven of style and comfort with our decorative items. Our Home Decor category features a curated selection of pieces that enhance the aesthetics of your home. Discover modern wall clocks, decorative throw pillows, and artificial potted plants that add a touch of personality to every room. Create an ambiance that reflects your taste and personality with our collection of home decor essentials.','?'),(5,'Toys','Spark joy and creativity with our collection of fun and engaging toys for all ages. In the Toys category, you\'ll find a world of play waiting to be explored. From remote control cars and board game collections to adorable stuffed animal sets, our diverse selection ensures that every playtime is filled with laughter and imagination. Bring smiles to faces young and old with our delightful toy offerings.','?'),(6,'Furniture','Elevate your living spaces with our stylish and functional furniture collection. Whether you\'re in need of a comfortable sectional sofa, an elegant dining table and chairs, or a functional bedroom dresser, our Furniture category has you covered. Discover quality craftsmanship and timeless designs for every room in your home.','?️'),(7,'Appliances','Make life easier with our Kitchen and Home Appliances collection. From coffee makers with grinders to versatile toaster ovens and efficient blenders with smoothie cups, our selection is designed to enhance your culinary experience. Explore innovative appliances for everyday use.','?️'),(8,'Sports & Outdoors','Stay active and enjoy the outdoors with our Gear for Sports & Outdoors. Whether you\'re a soccer enthusiast in need of a high-quality ball, a camping enthusiast seeking a spacious and durable tent, or a fitness enthusiast looking for a reliable fitness tracker, our collection has something for every outdoor adventure.','⚽'),(9,'Health & Beauty','Discover a range of products for personal care and well-being in our Health & Beauty category. From luxurious skincare gift sets to hair dryers with ionic technology and essential oil diffusers, our collection is curated to help you look and feel your best.','?'),(10,'Jewelry & Accessories','Elevate your style with our fashionable accessories and jewelry collection. From trendy and timeless pieces, our Jewelry & Accessories category adds the perfect finishing touch to any outfit. Explore our curated selection to find the perfect accessories to express your unique style.','?'),(11,'Automotive','Keep your vehicle in top condition with our Car Accessories and Maintenance Products. Our Automotive category offers a diverse selection of products to enhance your driving experience and maintain your car\'s performance. Explore our collection for everything you need for your automotive needs.','?'),(13,'Pets & Pet Supplies','Ensure the happiness and health of your furry friends with our Pets & Pet Supplies collection. From essential pet supplies to delightful toys, our collection is designed to meet the needs of your beloved pets. Explore a world of pet care and well-being.','?'),(14,'Stationery & Office Supplies','Stay organized and productive with our Office Essentials and Stationery Items. Whether you\'re working from home or need supplies for your office, our Stationery & Office Supplies category offers a diverse selection of items. Explore our collection to find the tools you need for a productive work environment.','?'),(15,'Outdoor Furniture','Enjoy the outdoors with our Comfortable and Durable Furniture for Outdoor Spaces. Our Outdoor Furniture category features quality pieces designed to withstand the elements while providing comfort and style. Create a relaxing and inviting outdoor space with our collection.','?'),(16,'Electrical Appliances','Discover the latest in Electrical Gadgets for Everyday Use. Our Electrical Appliances category brings you innovative and practical gadgets that make your daily life more convenient. Explore a range of devices designed to enhance your everyday experiences.','?'),(17,'Party Supplies','Make every event special with our Decorations and Supplies for Celebrations. Our Party Supplies category offers a variety of decorations, balloons, and accessories to add a festive touch to your celebrations. Explore our collection and make your next event unforgettable.','?'),(18,'Gourmet Foods','Indulge in exquisite and unique culinary delights with our Gourmet Foods selection. From gourmet chocolates to specialty olive oils, our collection is curated to satisfy the cravings of food enthusiasts. Elevate your dining experience with our diverse and high-quality gourmet offerings.','?'),(19,'Vintage Collectibles','Explore rare and nostalgic items for collectors in our Vintage Collectibles category. From antique books and vintage vinyl records to unique memorabilia, our collection offers a journey through time. Discover one-of-a-kind pieces to add to your collection.','?️'),(20,'Tech Gadgets','Stay on the forefront of technology with our Cutting-Edge and Innovative Tech Gadgets. Our Tech Gadgets category brings you the latest advancements in electronic devices, from smart home gadgets to high-performance laptops. Explore the possibilities of technology with our curated selection.','?'),(21,'Artisanal Crafts','Discover the beauty of handcrafted and one-of-a-kind artistic creations in our Artisanal Crafts category. From handmade pottery to unique sculptures, our collection showcases the talent and creativity of artisans. Bring a touch of artistry into your home with our carefully curated artisanal items.','?'),(22,'Green Living','Embrace an eco-friendly and sustainable lifestyle with our Green Living products. Our environmentally conscious items in the Green Living category include reusable products, sustainable home goods, and eco-friendly alternatives. Explore our collection and make choices that align with a greener and more sustainable world.','?'),(23,'Sci-Fi & Fantasy','Immerse yourself in merchandise from your favorite fictional worlds with our Sci-Fi & Fantasy collection. From collectible figures to iconic memorabilia, our collection caters to fans of science fiction and fantasy genres. Explore the magical and otherworldly with our curated selection.','?'),(31,'Test','ok','⌚');
/*!40000 ALTER TABLE `itemcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(64) NOT NULL,
  `item_description` varchar(64) DEFAULT NULL,
  `selling_price` int NOT NULL DEFAULT '0',
  `purchase_price` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  `vendor_id` int DEFAULT '37',
  `category_id` int unsigned DEFAULT NULL,
  `chain_id` int DEFAULT NULL,
  UNIQUE KEY `item_id` (`item_id`),
  KEY `fk_items_chain` (`chain_id`),
  KEY `fk_items_category` (`category_id`),
  CONSTRAINT `fk_items_category` FOREIGN KEY (`category_id`) REFERENCES `itemcategory` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_items_chain` FOREIGN KEY (`chain_id`) REFERENCES `chains` (`chain_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,'The Art of Electronics','Classic book on electronic design',24,20,10,1,1,1),(3,'Programming in Python','Learn Python programming from scratch',2,2,30,1,2,1),(4,'Data Science Essentials','Key concepts and techniques for data science',6,5,13,3,2,1),(5,'Java Programming','Master Java programming language',58,35,10,11,1,1),(6,'Algorithms Unlocked','A guide to algorithms and problem-solving',52,29,10,11,1,1),(7,'The C Programming Language','Timeless classic for C programming',35,23,15,11,1,1),(8,'Web Development with HTML and CSS','Build responsive websites with HTML and CSS',51,31,10,11,2,1),(9,'Machine Learning in Action','Practical introduction to machine learning',66,56,8,11,2,1),(10,'Database Design Fundamentals','Essential principles for designing databases',38,38,12,11,2,1),(11,'Modern Wall Clock','Sleek and modern design for your home',60,40,10,1,4,1),(12,'Decorative Throw Pillows','Add style and comfort to your living room',55,25,15,1,4,2),(13,'Artificial Potted Plant','Low-maintenance greenery for any room',60,30,20,1,4,3),(14,'Remote Control Car','Fun for kids and adults alike',60,50,8,3,5,1),(15,'Board Game Collection','Family-friendly board games for game night',55,35,12,3,5,2),(16,'Stuffed Animal Set','Cuddly companions for little ones',20,20,20,3,5,2),(17,'Sectional Sofa','Comfortable and stylish seating for your living room',800,800,5,4,6,1),(18,'Dining Table and Chairs','Elegant dining set for family gatherings',500,500,8,4,6,3),(19,'Bedroom Dresser','Functional and attractive storage solution',250,250,10,4,6,3),(20,'Coffee Maker with Grinder','Grind and brew your favorite coffee',80,80,15,6,2,1),(21,'Toaster Oven','Versatile appliance for toasting and baking',50,50,20,6,2,1),(22,'Blender with Smoothie Cups','Blend delicious smoothies and shakes',35,35,12,7,2,1),(23,'Soccer Ball','High-quality ball for soccer enthusiasts',20,20,25,9,8,1),(24,'Camping Tent','Spacious and durable tent for outdoor adventures',90,90,10,9,8,2),(25,'Fitness Tracker','Track your workouts and stay active',60,60,15,9,8,2),(26,'Skincare Gift Set','Luxurious skincare products for self-care',70,70,8,8,9,2),(27,'Hair Dryer with Ionic Technology','Efficient drying for healthy-looking hair',50,50,12,8,9,2),(28,'Essential Oil Diffuser','Create a calming atmosphere at home',35,35,15,9,9,2),(29,'Smartphone X','Flagship smartphone with advanced features',900,900,20,7,2,1),(30,'Wireless Earbuds','High-quality wireless earbuds for music enthusiasts',80,80,30,7,2,2),(31,'4K UHD Smart TV','65-inch smart TV with stunning 4K resolution',1299,1299,10,7,2,3),(32,'Fashionable Denim Jeans','Stylish denim jeans for a trendy look',60,60,15,10,1,1),(33,'Classic White T-Shirt','Essential white t-shirt for casual wear',20,20,25,10,1,1),(34,'Winter Jacket','Warm and stylish winter jacket for cold days',130,130,12,10,1,1),(38,'Essential Pet Supplies Bundle','Everything your pet needs in one convenient bundle.',50,40,20,31,13,1),(39,'Interactive Dog Toys Set','Keep your dog entertained with this set of interactive toys.',30,20,35,32,13,1),(40,'Cat Scratching Post','Durable cat scratching post for your feline friend.',40,30,25,33,13,1),(41,'Comfortable Outdoor Lounge Chair','Relax in style with this comfortable outdoor lounge chair.',100,80,15,37,15,1),(42,'Durable Patio Dining Set','Enjoy outdoor dining with this durable patio dining set.',300,250,10,38,15,1),(43,'Portable Folding Picnic Table','Convenient folding picnic table for outdoor gatherings.',50,40,20,39,15,1),(44,'Sample','This is a sample item',0,0,0,NULL,1,1),(45,'Sample','This is a sample item',0,0,0,NULL,1,1),(46,'Sample','This is a sample item',0,0,0,NULL,1,1),(47,'sfgfsdf','gdfgd',0,0,0,NULL,1,1),(48,'dfvgdvg','gdfgdggg',0,0,0,NULL,1,1),(49,'Harry Potter','Harry Potter Part 1',0,0,1,37,1,1),(50,'Mastery Magic','Made for students interested in magic.',0,0,0,37,1,1),(51,'Dummy Item','This is a dummy description',0,0,0,37,1,1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sameer`@`%`*/ /*!50003 TRIGGER `BeforeInsertItem` BEFORE INSERT ON `items` FOR EACH ROW BEGIN
    DECLARE item_count INT;

    -- Check if the item is already present in the store
    SELECT COUNT(*)
    INTO item_count
    FROM items
    WHERE item_id = NEW.item_id AND chain_id = NEW.chain_id;

    -- If the item is already present, throw an error
    IF item_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Item is already present in the store';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `hourly_pay` int NOT NULL DEFAULT '25',
  `manager_start_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `responsiblities` varchar(256) NOT NULL DEFAULT 'Manage the store premises. Manage stocking and restocking of items in the store. Manage employees and distribute work',
  `starting_date` date DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `staff_id` (`staff_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,2,30,'2023-01-01 00:00:00','Manage the store premises. Manage stocking and restocking of items in the store. Manage employees and distribute work','2023-01-01'),(2,3,25,'2023-02-01 00:00:00','Manage the store premises. Manage stocking and restocking of items in the store. Manage employees and distribute work','2023-02-01');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_consists_of_items`
--

DROP TABLE IF EXISTS `order_consists_of_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_consists_of_items` (
  `order_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `order_consists_of_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_consists_of_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_consists_of_items`
--

LOCK TABLES `order_consists_of_items` WRITE;
/*!40000 ALTER TABLE `order_consists_of_items` DISABLE KEYS */;
INSERT INTO `order_consists_of_items` VALUES (1,3),(2,2),(2,4),(3,5),(3,7);
/*!40000 ALTER TABLE `order_consists_of_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `chain_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `chain_id` (`chain_id`),
  CONSTRAINT `fk_orders_chain` FOREIGN KEY (`chain_id`) REFERENCES `chains` (`chain_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,1,'2023-12-07 00:53:11'),(2,6,2,'2023-12-07 00:53:11'),(3,2,3,'2023-12-07 00:53:11');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `member_of_bod` tinyint(1) NOT NULL,
  `owner_percentage` int DEFAULT NULL,
  `owner_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`owner_id`),
  UNIQUE KEY `staff_id` (`staff_id`),
  CONSTRAINT `owner_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,100,1,1);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(128) NOT NULL,
  `staff_email` varchar(114) NOT NULL,
  `phone_number` int NOT NULL,
  `street_no` varchar(64) NOT NULL,
  `street_name` varchar(64) NOT NULL,
  `town` varchar(64) NOT NULL,
  `zip_code` int NOT NULL,
  `user_name` varchar(64) DEFAULT NULL,
  `user_password` varchar(128) DEFAULT NULL,
  `role_type` enum('Owner','Manager','Employee') NOT NULL,
  `chain_id` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_id` (`staff_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `fk_chain_Staff` (`chain_id`),
  CONSTRAINT `fk_chain_Staff` FOREIGN KEY (`chain_id`) REFERENCES `chains` (`chain_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_chk_1` CHECK ((((`user_name` is null) and (`user_password` is null)) or ((`user_name` is not null) and (`user_password` is not null))))
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Sameer Ahire','sameerahire@emial.com',111222333,'123','Main Street','Boston',12345,'sameer_ahire','123','Owner',NULL),(2,'Akshay Chavan','chavan.ak@northeastern.edu',11121423,'145','Roxbury','Boston',2121,'akshaychavan7','12345','Manager',1),(3,'Jane Smith','jane.smith@email.com',444555666,'456','High Street','NJ',23456,'jane_smith','456','Manager',2),(4,'Bob Johnson','bob.johnson@email.com',777888999,'789','Broadway','NY',34567,'bob_johnson','789','Employee',3),(29,'John Smith','john.smith@email.com',1234567890,'123','Main Street','Boston',12345,NULL,NULL,'Employee',1),(30,'Alice Johnson','alice.johnson@email.com',3489140,'456','High Street','Boston',23456,NULL,NULL,'Employee',1),(31,'Michael Davis','michael.davis@email.com',3456789,'789','Broadway','NY',34567,NULL,NULL,'Employee',1),(32,'Emily Brown','emily.brown@email.com',5678901,'101','Park Avenue','NY',45678,NULL,NULL,'Employee',1),(33,'Daniel Lee','daniel.lee@email.com',7890123,'202','Oak Street','Boston',56789,NULL,NULL,'Employee',1),(34,'Sophia Rodriguez','sophia.rodriguez@email.com',90145678,'303','Maple Lane','Boston',67890,NULL,NULL,'Employee',1),(35,'Matthew Wilson','matthew.wilson@email.com',12345890,'404','Cedar Avenue','NY',78901,NULL,NULL,'Employee',1),(36,'Olivia Moore','olivia.moore@email.com',2345671,'505','Elm Street','NY',89012,NULL,NULL,'Employee',1),(37,'Ethan Garcia','ethan.garcia@email.com',34569012,'606','Pine Road','NY',90123,NULL,NULL,'Employee',1),(38,'Ava Martinez','ava.martinez@email.com',45690123,'707','Sycamore Street','Boston',12345,NULL,NULL,'Employee',1),(39,'Logan Taylor','logan.taylor@email.com',58901234,'808','Walnut Lane','NY',23456,NULL,NULL,'Employee',1),(40,'Grace Harris','grace.harris@email.com',67812345,'909','Cherry Avenue','Boston',34567,NULL,NULL,'Employee',1),(41,'Emma Johnson','emma.johnson@email.com',98765410,'123','Main Street','Boston',12345,NULL,NULL,'Employee',2),(42,'Noah Davis','noah.davis@email.com',87654390,'456','High Street','Boston',23456,NULL,NULL,'Employee',2),(43,'Ava Smith','ava.smith@email.com',76543280,'789','Broadway','NY',34567,NULL,NULL,'Employee',2),(44,'Liam Wilson','liam.wilson@email.com',65439870,'101','Park Avenue','NY',45678,NULL,NULL,'Employee',2),(45,'Sophia Lee','sophia.lee@email.com',54321760,'202','Oak Street','Boston',56789,NULL,NULL,'Employee',2),(46,'Mason Rodriguez','mason.rodriguez@email.com',43219850,'303','Maple Lane','Boston',67890,NULL,NULL,'Employee',2),(47,'Amelia Moore','amelia.moore@email.com',32198740,'404','Cedar Avenue','NY',78901,NULL,NULL,'Employee',2),(48,'Ethan Garcia','ethan.garcia@email.com',21098543,'505','Elm Street','NY',89012,NULL,NULL,'Employee',2),(49,'Avery Martinez','avery.martinez@email.com',18765432,'606','Pine Road','NY',90123,NULL,NULL,'Employee',2),(50,'Oliver Taylor','oliver.taylor@email.com',9876541,'707','Sycamore Street','Boston',12345,NULL,NULL,'Employee',2),(51,'Liam Wilson','liam.wilson@email.com',87652109,'123','Main Street','Boston',12345,NULL,NULL,'Employee',3),(52,'Olivia Brown','olivia.brown@email.com',76541098,'456','High Street','Boston',23456,NULL,NULL,'Employee',3),(53,'Mia Taylor','mia.taylor@email.com',65430987,'789','Broadway','NY',34567,NULL,NULL,'Employee',3),(54,'Ethan Smith','ethan.smith@email.com',54329876,'101','Park Avenue','NY',45678,NULL,NULL,'Employee',3),(55,'Ava Lee','ava.lee@email.com',43218765,'202','Oak Street','Boston',56789,NULL,NULL,'Employee',3),(56,'Jackson Rodriguez','jackson.rodriguez@email.com',32107654,'303','Maple Lane','Boston',67890,NULL,NULL,'Employee',3),(57,'Sophia Moore','sophia.moore@email.com',21876543,'404','Cedar Avenue','NY',78901,NULL,NULL,'Employee',3),(58,'Logan Garcia','logan.garcia@email.com',10987432,'505','Elm Street','NY',89012,NULL,NULL,'Employee',3),(59,'Avery Martinez','avery.martinez@email.com',9854321,'606','Pine Road','NY',90123,NULL,NULL,'Employee',3),(60,'Oliver Taylor','oliver.taylor@email.com',8765410,'707','Sycamore Street','Boston',12345,NULL,NULL,'Employee',3),(61,'Active Singh','active.singh@email.com',8734539,'125','Active Street','Boston',12345,NULL,NULL,'Employee',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sameer`@`%`*/ /*!50003 TRIGGER `InsertIntoSubclassTable` AFTER INSERT ON `staff` FOR EACH ROW BEGIN
    DECLARE role_name VARCHAR(255);

    -- Get the role of the newly inserted staff member
    SELECT role_type INTO role_name
    FROM staff
    WHERE staff_id = NEW.staff_id;

    -- Insert into the appropriate subclass table based on the role
    CASE role_name
        WHEN 'Owner' THEN
            INSERT INTO owner (member_of_bod, owner_percentage, staff_id)
            VALUES (0, NULL, NEW.staff_id);
        WHEN 'Manager' THEN
            INSERT INTO manager (staff_id, hourly_pay, manager_start_date, responsiblities, starting_date)
            VALUES (NEW.staff_id, 25, CURRENT_TIMESTAMP, 'Default responsibilities for Manager', CURRENT_DATE);
        WHEN 'Employee' THEN
            INSERT INTO employee (staff_id, hourly_pay, employee_start_date)
            VALUES (NEW.staff_id, 25, CURRENT_TIMESTAMP);
    END CASE;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheet` (
  `timesheet_id` int NOT NULL AUTO_INCREMENT,
  `date_filled` date DEFAULT NULL,
  `employee_id` int NOT NULL,
  `hours_worked` int DEFAULT '0',
  PRIMARY KEY (`timesheet_id`),
  UNIQUE KEY `date_filled` (`date_filled`,`employee_id`),
  KEY `fk_timesheet_staff` (`employee_id`),
  CONSTRAINT `fk_timesheet_staff` FOREIGN KEY (`employee_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ck_timesheet_hours_worked` CHECK ((`hours_worked` between 1 and 9))
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (1,'2023-01-01',2,8),(2,'2023-02-01',2,7),(3,'2023-01-01',3,8),(4,'2023-02-01',3,7),(5,'2023-03-01',3,9),(6,'2023-12-07',4,2),(19,'2023-01-14',4,8),(20,'2023-01-13',4,3),(21,'2023-01-12',4,1),(22,'2023-01-11',4,6),(23,'2023-01-10',4,7),(24,'2023-01-09',4,8),(25,'2023-01-08',4,8),(26,'2023-01-07',4,9),(27,'2023-01-06',4,8),(28,'2023-01-05',4,8),(31,'2023-12-07',2,6),(32,'2023-12-07',1,7),(33,'2023-12-06',4,6),(34,'2023-12-06',3,3),(35,'2023-12-06',2,3),(36,'2023-12-06',1,4),(37,'2023-12-05',4,5),(38,'2023-12-05',3,6),(39,'2023-12-05',2,4),(40,'2023-12-05',1,2),(41,'2023-12-04',4,6),(42,'2023-12-04',3,8),(43,'2023-12-04',2,5),(44,'2023-12-04',1,2),(45,'2023-12-03',4,8),(46,'2023-12-03',3,8),(47,'2023-12-03',2,3),(48,'2023-12-03',1,5),(49,'2023-12-02',4,2),(50,'2023-12-02',3,8),(51,'2023-12-02',2,1),(52,'2023-12-02',1,5),(53,'2023-12-01',4,6),(54,'2023-12-01',3,5),(55,'2023-12-01',2,7),(56,'2023-12-01',1,2),(57,'2023-11-30',4,6),(58,'2023-11-30',3,6),(59,'2023-11-30',2,2),(60,'2023-11-30',1,2),(61,'2023-11-29',4,5),(62,'2023-11-29',3,1),(63,'2023-11-29',2,7),(64,'2023-11-29',1,6),(65,'2023-11-28',4,1),(66,'2023-11-28',3,1),(67,'2023-11-28',2,3),(68,'2023-11-28',1,5),(69,'2023-11-27',4,6),(70,'2023-11-27',3,8),(71,'2023-11-27',2,4),(72,'2023-11-27',1,3),(73,'2023-11-26',4,2),(74,'2023-11-26',3,7),(75,'2023-11-26',2,7),(76,'2023-11-26',1,6),(77,'2023-11-25',4,6),(78,'2023-11-25',3,3),(79,'2023-11-25',2,7),(80,'2023-11-25',1,1),(81,'2023-11-24',4,7),(82,'2023-11-24',3,6),(83,'2023-11-24',2,2),(84,'2023-11-24',1,8),(85,'2023-11-23',4,8),(86,'2023-11-23',3,7),(87,'2023-11-23',2,3),(88,'2023-11-23',1,2),(89,'2023-11-22',4,2),(90,'2023-11-22',3,4),(91,'2023-11-22',2,2),(92,'2023-11-22',1,1),(93,'2023-11-21',4,4),(94,'2023-11-21',3,3),(95,'2023-11-21',2,8),(96,'2023-11-21',1,6),(97,'2023-11-20',4,7),(98,'2023-11-20',3,6),(99,'2023-11-20',2,3),(100,'2023-11-20',1,6),(101,'2023-11-19',4,2),(102,'2023-11-19',3,8),(103,'2023-11-19',2,1),(104,'2023-11-19',1,5),(105,'2023-11-18',4,5),(106,'2023-11-18',3,3),(107,'2023-11-18',2,8),(108,'2023-11-18',1,4),(109,'2023-11-17',4,4),(110,'2023-11-17',3,1),(111,'2023-11-17',2,2),(112,'2023-11-17',1,3),(113,'2023-11-16',4,3),(114,'2023-11-16',3,5),(115,'2023-11-16',2,8),(116,'2023-11-16',1,6),(117,'2023-11-15',4,7),(118,'2023-11-15',3,7),(119,'2023-11-15',2,5),(120,'2023-11-15',1,5),(121,'2023-11-14',4,2),(122,'2023-11-14',3,3),(123,'2023-11-14',2,7),(124,'2023-11-14',1,8),(125,'2023-11-13',4,4),(126,'2023-11-13',3,5),(127,'2023-11-13',2,4),(128,'2023-11-13',1,6),(129,'2023-11-12',4,8),(130,'2023-11-12',3,4),(131,'2023-11-12',2,6),(132,'2023-11-12',1,2),(133,'2023-11-11',4,5),(134,'2023-11-11',3,5),(135,'2023-11-11',2,7),(136,'2023-11-11',1,6),(137,'2023-11-10',4,8),(138,'2023-11-10',3,6),(139,'2023-11-10',2,5),(140,'2023-11-10',1,6),(141,'2023-11-09',4,5),(142,'2023-11-09',3,2),(143,'2023-11-09',2,8),(144,'2023-11-09',1,1),(145,'2023-11-08',4,6),(146,'2023-11-08',3,1),(147,'2023-11-08',2,2),(148,'2023-11-08',1,1),(149,'2023-11-07',4,7),(150,'2023-11-07',3,7),(151,'2023-11-07',2,5),(152,'2023-11-07',1,2),(153,'2023-11-06',4,3),(154,'2023-11-06',3,2),(155,'2023-11-06',2,6),(156,'2023-11-06',1,1),(157,'2023-11-05',4,4),(158,'2023-11-05',3,6),(159,'2023-11-05',2,4),(160,'2023-11-05',1,8),(161,'2023-11-04',4,4),(162,'2023-11-04',3,5),(163,'2023-11-04',2,2),(164,'2023-11-04',1,4),(165,'2023-11-03',4,7),(166,'2023-11-03',3,3),(167,'2023-11-03',2,5),(168,'2023-11-03',1,5),(169,'2023-11-02',4,4),(170,'2023-11-02',3,3),(171,'2023-11-02',2,2),(172,'2023-11-02',1,8),(173,'2023-11-01',4,2),(174,'2023-11-01',3,4),(175,'2023-11-01',2,2),(176,'2023-11-01',1,7),(177,'2023-10-31',4,3),(178,'2023-10-31',3,2),(179,'2023-10-31',2,1),(180,'2023-10-31',1,5),(181,'2023-10-30',4,1),(182,'2023-10-30',3,2),(183,'2023-10-30',2,6),(184,'2023-10-30',1,3),(185,'2023-10-29',4,1),(186,'2023-10-29',3,5),(187,'2023-10-29',2,7),(188,'2023-10-29',1,8),(189,'2023-10-28',4,6),(190,'2023-10-28',3,5),(191,'2023-10-28',2,6),(192,'2023-10-28',1,8),(193,'2023-10-27',4,6),(194,'2023-10-27',3,4),(195,'2023-10-27',2,4),(196,'2023-10-27',1,5),(197,'2023-10-26',4,3),(198,'2023-10-26',3,2),(199,'2023-10-26',2,7),(200,'2023-10-26',1,5),(201,'2023-10-25',4,5),(202,'2023-10-25',3,8),(203,'2023-10-25',2,8),(204,'2023-10-25',1,1),(205,'2023-10-24',4,4),(206,'2023-10-24',3,1),(207,'2023-10-24',2,2),(208,'2023-10-24',1,6),(209,'2023-10-23',4,6),(210,'2023-10-23',3,3),(211,'2023-10-23',2,7),(212,'2023-10-23',1,1),(213,'2023-10-22',4,6),(214,'2023-10-22',3,1),(215,'2023-10-22',2,6),(216,'2023-10-22',1,7),(217,'2023-10-21',4,3),(218,'2023-10-21',3,2),(219,'2023-10-21',2,7),(220,'2023-10-21',1,5),(221,'2023-10-20',4,3),(222,'2023-10-20',3,8),(223,'2023-10-20',2,7),(224,'2023-10-20',1,8),(225,'2023-10-19',4,4),(226,'2023-10-19',3,2),(227,'2023-10-19',2,7),(228,'2023-10-19',1,2),(229,'2023-10-18',4,7),(230,'2023-10-18',3,4),(231,'2023-10-18',2,8),(232,'2023-10-18',1,2),(233,'2023-10-17',4,3),(234,'2023-10-17',3,7),(235,'2023-10-17',2,2),(236,'2023-10-17',1,3),(237,'2023-10-16',4,3),(238,'2023-10-16',3,4),(239,'2023-10-16',2,5),(240,'2023-10-16',1,2),(241,'2023-10-15',4,5),(242,'2023-10-15',3,2),(243,'2023-10-15',2,8),(244,'2023-10-15',1,5),(245,'2023-10-14',4,5),(246,'2023-10-14',3,4),(247,'2023-10-14',2,5),(248,'2023-10-14',1,4),(249,'2023-10-13',4,4),(250,'2023-10-13',3,1),(251,'2023-10-13',2,6),(252,'2023-10-13',1,3),(253,'2023-10-12',4,4),(254,'2023-10-12',3,4),(255,'2023-10-12',2,6),(256,'2023-10-12',1,2),(257,'2023-10-11',4,1),(258,'2023-10-11',3,6),(259,'2023-10-11',2,3),(260,'2023-10-11',1,4),(261,'2023-10-10',4,8),(262,'2023-10-10',3,7),(263,'2023-10-10',2,1),(264,'2023-10-10',1,2),(265,'2023-10-09',4,4),(266,'2023-10-09',3,5),(267,'2023-10-09',2,7),(268,'2023-10-09',1,1),(269,'2023-10-08',4,8),(270,'2023-10-08',3,5),(271,'2023-10-08',2,2),(272,'2023-10-08',1,3),(273,'2023-10-07',4,7),(274,'2023-10-07',3,8),(275,'2023-10-07',2,3),(276,'2023-10-07',1,8),(277,'2023-10-06',4,4),(278,'2023-10-06',3,4),(279,'2023-10-06',2,8),(280,'2023-10-06',1,2),(281,'2023-10-05',4,4),(282,'2023-10-05',3,2),(283,'2023-10-05',2,1),(284,'2023-10-05',1,5),(285,'2023-10-04',4,7),(286,'2023-10-04',3,3),(287,'2023-10-04',2,2),(288,'2023-10-04',1,8),(289,'2023-10-03',4,8),(290,'2023-10-03',3,7),(291,'2023-10-03',2,3),(292,'2023-10-03',1,4),(293,'2023-10-02',4,8),(294,'2023-10-02',3,2),(295,'2023-10-02',2,5),(296,'2023-10-02',1,8),(297,'2023-10-01',4,1),(298,'2023-10-01',3,4),(299,'2023-10-01',2,1),(300,'2023-10-01',1,8),(301,'2023-09-30',4,6),(302,'2023-09-30',3,4),(303,'2023-09-30',2,2),(304,'2023-09-30',1,7),(305,'2023-09-29',4,2),(306,'2023-09-29',3,5),(307,'2023-09-29',2,5),(308,'2023-09-29',1,7),(309,'2023-09-28',4,6),(310,'2023-09-28',3,1),(311,'2023-09-28',2,7),(312,'2023-09-28',1,2),(313,'2023-09-27',4,5),(314,'2023-09-27',3,2),(315,'2023-09-27',2,4),(316,'2023-09-27',1,3),(317,'2023-09-26',4,5),(318,'2023-09-26',3,8),(319,'2023-09-26',2,1),(320,'2023-09-26',1,2),(321,'2023-09-25',4,6),(322,'2023-09-25',3,7),(323,'2023-09-25',2,8),(324,'2023-09-25',1,2),(325,'2023-09-24',4,2),(326,'2023-09-24',3,5),(327,'2023-09-24',2,3),(328,'2023-09-24',1,6),(329,'2023-09-23',4,3),(330,'2023-09-23',3,7),(331,'2023-09-23',2,2),(332,'2023-09-23',1,5),(333,'2023-09-22',4,8),(334,'2023-09-22',3,2),(335,'2023-09-22',2,7),(336,'2023-09-22',1,7),(337,'2023-09-21',4,6),(338,'2023-09-21',3,6),(339,'2023-09-21',2,4),(340,'2023-09-21',1,1),(341,'2023-09-20',4,1),(342,'2023-09-20',3,8),(343,'2023-09-20',2,5),(344,'2023-09-20',1,2),(345,'2023-09-19',4,8),(346,'2023-09-19',3,5),(347,'2023-09-19',2,6),(348,'2023-09-19',1,6),(349,'2023-09-18',4,3),(350,'2023-09-18',3,4),(351,'2023-09-18',2,4),(352,'2023-09-18',1,6),(353,'2023-09-17',4,4),(354,'2023-09-17',3,7),(355,'2023-09-17',2,7),(356,'2023-09-17',1,4),(357,'2023-09-16',4,8),(358,'2023-09-16',3,4),(359,'2023-09-16',2,4),(360,'2023-09-16',1,6),(361,'2023-09-15',4,2),(362,'2023-09-15',3,8),(363,'2023-09-15',2,3),(364,'2023-09-15',1,3),(365,'2023-09-14',4,1),(366,'2023-09-14',3,2),(367,'2023-09-14',2,8),(368,'2023-09-14',1,8),(369,'2023-09-13',4,7),(370,'2023-09-13',3,3),(371,'2023-09-13',2,3),(372,'2023-09-13',1,6),(373,'2023-09-12',4,4),(374,'2023-09-12',3,2),(375,'2023-09-12',2,4),(376,'2023-09-12',1,4),(377,'2023-09-11',4,1),(378,'2023-09-11',3,2),(379,'2023-09-11',2,7),(380,'2023-09-11',1,2),(381,'2023-09-10',4,4),(382,'2023-09-10',3,6),(383,'2023-09-10',2,4),(384,'2023-09-10',1,8),(385,'2023-09-09',4,1),(386,'2023-09-09',3,8),(387,'2023-09-09',2,3),(388,'2023-09-09',1,8),(389,'2023-09-08',4,7),(390,'2023-09-08',3,3),(391,'2023-09-08',2,1),(392,'2023-09-08',1,4),(393,'2023-09-07',4,2),(394,'2023-09-07',3,3),(395,'2023-09-07',2,3),(396,'2023-09-07',1,3),(397,'2023-09-06',4,8),(398,'2023-09-06',3,7),(399,'2023-09-06',2,2),(400,'2023-09-06',1,4),(401,'2023-09-05',4,6),(402,'2023-09-05',3,8),(403,'2023-09-05',2,5),(404,'2023-09-05',1,8),(405,'2023-09-04',4,8),(406,'2023-09-04',3,7),(407,'2023-09-04',2,4),(408,'2023-09-04',1,6),(409,'2023-09-03',4,4),(410,'2023-09-03',3,6),(411,'2023-09-03',2,3),(412,'2023-09-03',1,5),(413,'2023-09-02',4,7),(414,'2023-09-02',3,2),(415,'2023-09-02',2,7),(416,'2023-09-02',1,3),(417,'2023-09-01',4,1),(418,'2023-09-01',3,5),(419,'2023-09-01',2,5),(420,'2023-09-01',1,8),(421,'2023-08-31',4,3),(422,'2023-08-31',3,4),(423,'2023-08-31',2,4),(424,'2023-08-31',1,6),(425,'2023-08-30',4,2),(426,'2023-08-30',3,6),(427,'2023-08-30',2,3),(428,'2023-08-30',1,1),(429,'2023-08-29',4,7),(430,'2023-08-29',3,6),(431,'2023-08-29',2,8),(432,'2023-08-29',1,5),(581,'2023-12-07',3,8);
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilitybill`
--

DROP TABLE IF EXISTS `utilitybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilitybill` (
  `bill_no` int NOT NULL AUTO_INCREMENT,
  `bill_type` varchar(64) DEFAULT NULL,
  `billing_date` date NOT NULL,
  `due_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `chain_id` int NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`bill_no`),
  KEY `utility_bill_chain_fk` (`chain_id`),
  CONSTRAINT `utility_bill_chain_fk` FOREIGN KEY (`chain_id`) REFERENCES `chains` (`chain_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilitybill`
--

LOCK TABLES `utilitybill` WRITE;
/*!40000 ALTER TABLE `utilitybill` DISABLE KEYS */;
INSERT INTO `utilitybill` VALUES (1,'Electricity','2023-01-01','2023-01-15',500.00,1,'2023-01-14'),(2,'Water','2023-02-01','2023-02-15',300.00,2,'2023-02-14'),(3,'Gas','2023-03-01','2023-03-15',400.00,3,'2023-03-14');
/*!40000 ALTER TABLE `utilitybill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `point_of_contact_phone_number` int NOT NULL,
  `point_of_contact_name` varchar(64) NOT NULL,
  `street_no` varchar(8) DEFAULT NULL,
  `street_name` varchar(64) DEFAULT NULL,
  `town` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'HomeAccents','homeaccents@email.com',111222333,'John Vendor','111','First Street','TownA','StateA',11111),(2,'CozyHomeGoods','cozyhomegoods@email.com',444555666,'Jane Vendor','222','Second Street','TownB','StateB',22222),(3,'ToyLand','toyland@email.com',777888999,'Bob Vendor','333','Third Street','TownC','StateC',33333),(4,'FurnitureHaven','furniturehaven@email.com',111222,'Alice Vendor','444','Fourth Street','TownD','StateD',44444),(5,'GadgetGalaxy','gadgetgalaxy@email.com',555666777,'Gary Vendor','555','Fifth Street','TownE','StateE',55555),(6,'HomeHarmony','homeharmony@email.com',888999000,'Helen Vendor','666','Sixth Street','TownF','StateF',66666),(7,'ToyWonderland','toywonderland@email.com',123456789,'Tina Vendor','777','Seventh Street','TownG','StateG',77777),(8,'ModernFurnish','modernfurnish@email.com',111222333,'Max Vendor','888','Eighth Street','TownH','StateH',88888),(9,'TechTrends','techtrends@email.com',444555666,'Tom Vendor','999','Ninth Street','TownI','StateI',99999),(10,'EcoHomeGoods','ecohomegoods@email.com',777888999,'Ella Vendor','101','Tenth Street','TownJ','StateJ',10101),(11,'PlayPalace','playpalace@email.com',111222,'Penny Vendor','121','Twelfth Street','TownK','StateK',12121),(12,'TimelessTreasures','timelesstreasures@email.com',333444555,'Tony Vendor','141','Fourteenth Street','TownL','StateL',14141),(13,'ChicChairs','chicchairs@email.com',666777888,'Charlie Vendor','161','Sixteenth Street','TownM','StateM',16161),(14,'SoundSolutions','soundsolutions@email.com',999000111,'Sara Vendor','181','Eighteenth Street','TownN','StateN',18181),(15,'GreenLivingHub','greenlivinghub@email.com',222333444,'George Vendor','202','Twentieth Street','TownO','StateO',20202),(16,'CraftyCreations','craftycreations@email.com',555666777,'Cathy Vendor','222','Twenty-Second Street','TownP','StateP',22222),(17,'AdventureAwaits','adventureawaits@email.com',888999000,'Andy Vendor','242','Twenty-Fourth Street','TownQ','StateQ',24242),(18,'HealthfulHome','healthfulhome@email.com',123456789,'Heather Vendor','262','Twenty-Sixth Street','TownR','StateR',26262),(19,'FashionFiesta','fashionfiesta@email.com',444555666,'Frank Vendor','282','Twenty-Eighth Street','TownS','StateS',28282),(20,'PetParadise','petparadise@email.com',777888999,'Peter Vendor','303','Thirtieth Street','TownT','StateT',30303),(21,'OfficeOasis','officeoasis@email.com',111222,'Olivia Vendor','323','Thirty-Second Street','TownU','StateU',32323),(22,'OutdoorOpulence','outdooropulence@email.com',333444555,'Oscar Vendor','343','Thirty-Fourth Street','TownV','StateV',34343),(23,'ElectroElite','electroelite@email.com',666777888,'Eva Vendor','363','Thirty-Sixth Street','TownW','StateW',36363),(24,'PartyPalooza','partypalooza@email.com',999000111,'Paul Vendor','383','Thirty-Eighth Street','TownX','StateX',38383),(25,'GourmetGala','gourmetgala@email.com',222333444,'Grace Vendor','404','Fortieth Street','TownY','StateY',40404),(26,'VintageVogue','vintagevogue@email.com',555666777,'Vincent Vendor','424','Forty-Second Street','TownZ','StateZ',42424),(27,'TechTales','techtales@email.com',888999000,'Tiffany Vendor','444','Forty-Fourth Street','TownAA','StateAA',44444),(28,'RetroRevival','retrorevival@email.com',123456789,'Rick Vendor','464','Forty-Sixth Street','TownAB','StateAB',46464),(29,'ArtisanAvenue','artisanavenue@email.com',444555666,'Amy Vendor','484','Forty-Eighth Street','TownAC','StateAC',48484),(30,'SunsetSweets','sunsetsweets@email.com',777888999,'Sam Vendor','505','Fiftieth Street','TownAD','StateAD',50505),(31,'HarmonyHues','harmonyhues@email.com',111222,'Harry Vendor','525','Fifty-Second Street','TownAE','StateAE',52525),(32,'UrbanUtopia','urbanutopia@email.com',333444555,'Ursula Vendor','545','Fifty-Fourth Street','TownAF','StateAF',54545),(33,'JovialJewels','jovialjewels@email.com',666777888,'Jared Vendor','565','Fifty-Sixth Street','TownAG','StateAG',56565),(34,'VividVoyage','vividvoyage@email.com',999000111,'Violet Vendor','585','Fifty-Eighth Street','TownAH','StateAH',58585),(35,'CulinaryCraze','culinarycraze@email.com',222333444,'Cameron Vendor','606','Sixtieth Street','TownAI','StateAI',60606),(36,'NatureNest','naturenest@email.com',555666777,'Nathan Vendor','626','Sixty-Second Street','TownAJ','StateAJ',62626),(37,'DefaultVendor','default@email.com',12121212,'Default Store','111','tore','TS','StateA',11511);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'RetailHub'
--
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCategoryById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE DeleteCategoryById(IN category_id_param INT)
BEGIN
    -- Declare a variable to store the count of items in the category
    DECLARE item_count INT;

    -- Check if the category_id exists
    SELECT COUNT(*) INTO item_count
    FROM items
    WHERE category_id = category_id_param;

    -- Check if there are items in the category
    IF item_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete category with items. Remove items from the category first.';
    ELSE
        -- Delete the category
        DELETE FROM itemcategory WHERE category_id = category_id_param;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE DeleteItem(IN item_id_param INT)
BEGIN
    DELETE FROM items WHERE item_id = item_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllChains` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetAllChains()
BEGIN
    SELECT * FROM chains;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllVendors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetAllVendors()
BEGIN
    -- Select all vendors from the vendors table
    SELECT *
    FROM vendors;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDailyTotalHoursWorkedLast30Days` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetDailyTotalHoursWorkedLast30Days(IN chain_id_param INT)
BEGIN
    -- Declare variables
    DECLARE total_hours_worked DECIMAL(8, 2);
	DECLARE current_date_var DATETIME;
    DECLARE start_date DATETIME;
    -- Create a temporary table to store daily results
    CREATE TEMPORARY TABLE temp_daily_hours (
        work_date DATETIME PRIMARY KEY,
        total_hours DECIMAL(8, 2)
    );

    -- Calculate the timestamp for 30 days ago from today
    SET current_date_var = NOW();
    
    SET start_date = current_date_var - INTERVAL 30 DAY;

    -- Loop through each day in the last 30 days
    WHILE current_date_var >= start_date DO
        -- Get the sum of total hours worked for each day
        SELECT
            IFNULL(SUM(hours_worked), 0) AS total_hours
        INTO
            total_hours_worked
        FROM
            timesheet
        WHERE
            chain_id = chain_id_param
            AND work_date >= start_date
            AND work_date < current_date_var;

        -- Insert the result into the temporary table
        INSERT INTO temp_daily_hours (work_date, total_hours)
        VALUES (current_date_var, total_hours_worked);

        -- Move to the previous day
        SET current_date_var = current_date_var - INTERVAL 1 DAY;
    END WHILE;

    -- Display the daily results
    SELECT * FROM temp_daily_hours;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_daily_hours;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetInfoCounts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetInfoCounts(IN store_id_param INT)
BEGIN
    -- Declare variables for counts
    DECLARE pending_orders_count INT;
    DECLARE total_employees INT;
    DECLARE total_vendors INT;
    DECLARE total_customers INT;
    DECLARE total_stores INT;
    DECLARE total_categories INT;

    -- Get pending orders count
    SELECT COUNT(*) INTO pending_orders_count
    FROM chain_items_vendors_orderpunch
    WHERE chain_id = store_id_param AND status = 'Pending';

    -- Get total employees count
    SELECT COUNT(*) INTO total_employees
    FROM staff
    WHERE chain_id = store_id_param;

    -- Get total vendors count
    SELECT COUNT(*) INTO total_vendors
    FROM vendors;

    -- Get total customers count
    SELECT COUNT(*) INTO total_customers
    FROM customers;

    -- Get total stores count
    SELECT COUNT(*) INTO total_stores
    FROM chains;

    -- Get total categories count
    SELECT COUNT(*) INTO total_categories
    FROM itemcategory;

    -- Return the counts
    SELECT pending_orders_count, total_employees, total_vendors, total_customers, total_stores, total_categories;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetItemCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetItemCategories()
BEGIN
    -- Select all item categories
    SELECT * FROM itemcategory;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetItemsByCategoryAndChainId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetItemsByCategoryAndChainId(
    IN chain_id_param INT,
    IN category_id_param INT
)
BEGIN
    -- Select items based on chain_id and category_id
    SELECT 
        i.item_id,
        i.item_name,
        i.item_description,
        i.selling_price,
        i.purchase_price,
        i.quantity,
        v.vendor_name,
        CASE WHEN i.quantity > 0 THEN 'In Stock' ELSE 'Out of Stock' END AS stock_status,
        COALESCE(((i.selling_price - i.purchase_price) / i.purchase_price) * 100, 0) AS margin_percentage
    FROM items i
    INNER JOIN vendors v ON i.vendor_id = v.vendor_id
    WHERE i.chain_id = chain_id_param
        AND i.category_id = category_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLast30DaysTimesheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetLast30DaysTimesheet(
    IN staff_id_param INT
)
BEGIN
    SELECT *
    FROM timesheet
    WHERE employee_id = staff_id_param
        AND date_filled >= CURDATE() - INTERVAL 30 DAY
    ORDER BY date_filled DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrderDetailsWithNames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetOrderDetailsWithNames()
BEGIN
    -- Declare variables
    DECLARE reference_id_val INT;
    DECLARE item_id_val INT;
    DECLARE vendor_id_val INT;
    DECLARE chain_id_val INT;
    DECLARE purchase_date_val TIMESTAMP;
    DECLARE purchase_qty_val INT;
    DECLARE price_per_qty_val INT;
    DECLARE status_val ENUM('Failed', 'Pending', 'Success');
    DECLARE vendor_name_val VARCHAR(64);
    DECLARE item_name_val VARCHAR(64);
    DECLARE item_total_cost DECIMAL(10, 2);
    -- Declare a variable to check for the end of the cursor
    DECLARE done BOOLEAN DEFAULT FALSE;
    -- Declare a cursor handler
    DECLARE cur CURSOR FOR SELECT * FROM chain_items_vendors_orderpunch ORDER BY purchase_date DESC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -- Create a temporary table to store results
    CREATE TEMPORARY TABLE temp_order_details (
        reference_id INT,
        vendor_name VARCHAR(64),
        item_name VARCHAR(64),
        purchase_date TIMESTAMP,
        purchase_qty INT,
        price_per_qty INT,
        PRIMARY KEY(reference_id),
        status ENUM('Failed', 'Pending', 'Success'),
        item_total_cost DECIMAL(10, 2)
    );
	OPEN cur;
    read_loop: LOOP
        FETCH cur INTO reference_id_val, item_id_val, vendor_id_val, chain_id_val, purchase_date_val, purchase_qty_val, price_per_qty_val, status_val;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Get vendor_name
        SELECT vendor_name INTO vendor_name_val
        FROM vendors
        WHERE vendor_id = vendor_id_val;
        -- Get item_name and calculate item_total_cost
        SELECT item_name INTO item_name_val
        FROM items
        WHERE item_id = item_id_val;
        SET item_total_cost = purchase_qty_val * price_per_qty_val;
        -- Insert into temporary table
        INSERT INTO temp_order_details (reference_id, vendor_name, item_name, purchase_date, purchase_qty, price_per_qty, status, item_total_cost)
        VALUES (reference_id_val, vendor_name_val, item_name_val, purchase_date_val, purchase_qty_val, price_per_qty_val, status_val, item_total_cost);
    END LOOP;
    CLOSE cur;
    -- Select results from the temporary table
    SELECT * FROM temp_order_details;
    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_order_details;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPasswordByUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetPasswordByUsername(
    IN username_param VARCHAR(64)
)
BEGIN
    -- Declare a variable to store the password
    DECLARE password_value VARCHAR(128);

    -- Attempt to retrieve the password for the given username
    SELECT user_password INTO password_value
    FROM staff
    WHERE user_name = username_param;

    -- Check if the username exists
    IF (password_value IS NOT NULL) THEN
        -- Return the retrieved password
        SELECT password_value AS 'Password';
    ELSE
        -- Username does not exist, throw an error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username not found.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStaffByChainID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetStaffByChainID(IN chain_id_param INT)
BEGIN
    SELECT 
        s.*,
        e.employee_start_date AS joining_date
    FROM staff s
    INNER JOIN employee e ON s.staff_id = e.staff_id
    WHERE s.chain_id = chain_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStaffDetailsByUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetStaffDetailsByUsername(IN username_param VARCHAR(64))
BEGIN
    DECLARE staff_exists INT;

    -- Check if staff with the given username exists
    SELECT COUNT(*) INTO staff_exists FROM staff WHERE user_name = username_param;

    IF staff_exists > 0 THEN
        -- If staff exists, retrieve details
        SELECT * FROM staff WHERE user_name = username_param;
    ELSE
        -- If staff does not exist, throw an error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Staff with the provided username does not exist';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopItemCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetTopItemCategories(IN store_id_param INT)
BEGIN
    -- Declare variables
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE category_name_val VARCHAR(64);
    DECLARE total_quantity_val INT;
    
    -- Declare a cursor to fetch multiple rows
    DECLARE cur CURSOR FOR
        SELECT
            ic.category_name,
            SUM(i.quantity) AS total_quantity
        FROM
            items i
        INNER JOIN
            itemcategory ic ON i.category_id = ic.category_id
        WHERE
            i.chain_id = store_id_param
        GROUP BY
            ic.category_id
        ORDER BY
            total_quantity DESC
        LIMIT 4;
-- Declare handler for cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -- Create a temporary table to store results
    CREATE TEMPORARY TABLE temp_top_categories (
        category_name VARCHAR(64) PRIMARY KEY,
        total_quantity INT
    );
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO category_name_val, total_quantity_val;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Insert into temporary table
        INSERT INTO temp_top_categories (category_name, total_quantity)
        VALUES (category_name_val, total_quantity_val);
    END LOOP;

    CLOSE cur;

    -- Display the result from the temporary table
    SELECT * FROM temp_top_categories;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_top_categories;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopVendorsForChain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetTopVendorsForChain(IN chain_id_param INT)
BEGIN
    SELECT
        v.vendor_id,
        v.vendor_name,
        COUNT(civo.item_id) AS total_items_supplied,
        SUM(civo.purchase_qty) AS total_quantity_supplied
    FROM
        vendors v
    JOIN
        chain_items_vendors_orderpunch civo ON v.vendor_id = civo.vendor_id
    WHERE
        civo.chain_id = chain_id_param
    GROUP BY
        v.vendor_id
    ORDER BY
        total_quantity_supplied DESC
    LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVendorsByChainID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE GetVendorsByChainID(IN chain_id_param INT)
BEGIN
    SELECT * FROM vendors WHERE vendor_id IN (SELECT DISTINCT vendor_id FROM items WHERE chain_id = chain_id_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE InsertItem(
    IN item_name_param VARCHAR(64),
    IN item_description_param VARCHAR(64),
    IN category_id_param INT,
    IN chain_id_param INT
)
BEGIN

    -- Insert into the items table
    INSERT INTO items (
        item_name,
        item_description,
        category_id,
        chain_id
    )
    VALUES (
        item_name_param,
        item_description_param,
        category_id_param,
        chain_id_param
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertItemCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE InsertItemCategory(
    IN category_name_param VARCHAR(100),
    IN category_description_param VARCHAR(1024),
    IN emoji_param VARCHAR(255)
)
BEGIN
    -- Insert item category into the itemcategory table
    INSERT INTO itemcategory (category_name, category_description, emoji)
    VALUES (category_name_param, category_description_param, emoji_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertOrderFromJson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE InsertOrderFromJson(
    IN store_id_param INT,
    IN vendor_id_param INT,
    IN item_id_param INT,
    IN price_param DECIMAL(10, 2),
    IN count_param INT
)
BEGIN
    -- Insert into chain_items_vendors_orderpunch table
    INSERT INTO chain_items_vendors_orderpunch (item_id, vendor_id, chain_id, purchase_qty, price_per_qty, status, purchase_date)
    VALUES (item_id_param, vendor_id_param, store_id_param, count_param, price_param, 'Pending', CURRENT_TIMESTAMP);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertStaffMembers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE InsertStaffMembers(
    IN staff_name_param VARCHAR(128),
    IN role_type_param ENUM('Owner', 'Manager', 'Employee'),
    IN staff_email_param VARCHAR(114),
    IN phone_number_param INT,
    IN street_no_param VARCHAR(64),
    IN street_name_param VARCHAR(64),
    IN town_param VARCHAR(64),
    IN zip_code_param INT,
    IN chain_id_param INT
)
BEGIN
    -- Insert staff members into the staff table
    INSERT INTO staff (staff_name, staff_email, phone_number, street_no, street_name, town, zip_code, user_name, user_password, role_type, chain_id)
    VALUES (staff_name_param, staff_email_param, phone_number_param, street_no_param, street_name_param, town_param, zip_code_param, username_param, password_param, role_type_param, chain_id_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertTimesheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE InsertTimesheet(
    IN staff_id_param INT,
    IN hoursworked_param DECIMAL(10, 2)
)
BEGIN
    -- Insert timesheet information into the timesheet table
    INSERT INTO timesheet (employee_id, hours_worked, date_filled)
    VALUES (staff_id_param, hoursworked_param, CURRENT_DATE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCredentials` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE UpdateCredentials(
    IN staff_id_param INT,
    IN username_param VARCHAR(64),
    IN password_param VARCHAR(128)
)
BEGIN
    -- Declare variables to store existing username and password
    DECLARE existing_username VARCHAR(64);
    DECLARE existing_password VARCHAR(128);

    -- Check if the new username already exists
    SELECT user_name INTO existing_username
    FROM staff
    WHERE user_name = username_param AND staff_id != staff_id_param
    LIMIT 1;

    -- Check if the new password already exists
    SELECT user_password INTO existing_password
    FROM staff
    WHERE user_password = password_param AND staff_id != staff_id_param
    LIMIT 1;

    -- If the new username or password already exists, return an error or handle accordingly
    IF existing_username IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username already exists for another staff.';
    END IF;

    IF existing_password IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Password already exists for another staff.';
    END IF;

    -- Update credentials in the staff table
    UPDATE staff
    SET user_name = username_param, user_password = password_param
    WHERE staff_id = staff_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateItemCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE UpdateItemCategory(
    IN category_id_param INT,
    IN new_category_name_param VARCHAR(64),
    IN new_category_description_param VARCHAR(200),
    IN new_emoji_param VARCHAR(10)
)
BEGIN
    -- Update the item category
    UPDATE itemcategory
    SET
        category_name = new_category_name_param,
        category_description = new_category_description_param,
        emoji = new_emoji_param
    WHERE category_id = category_id_param;

    -- Check if the update was successful
    IF ROW_COUNT() > 0 THEN
        SELECT 'Item category updated successfully.' AS result;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Category not found or no changes made.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateItemDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE UpdateItemDetails(
    IN item_id_param INT,
    IN margin_percentage INT,
    IN new_quantity INT,
    IN new_description VARCHAR(64)
)
BEGIN
    DECLARE purchase_price_d INT;

    -- Get the current purchase price of the item
    SELECT purchase_price INTO purchase_price_d
    FROM items
    WHERE item_id = item_id_param;
    SELECT purchase_price_d;
	SELECT purchase_price_d * (1 + (margin_percentage / 100));
    -- Update item details in the items table
    UPDATE items
		SET 
		selling_price = purchase_price_d * (1 + (margin_percentage / 100)),
		quantity = new_quantity,
		item_description = new_description
	WHERE item_id = item_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateVendorOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE UpdateVendorOrder(
    IN reference_id_param INT,
    IN status_param ENUM('Failed', 'Pending', 'Success')
)
BEGIN
    -- Update the status for the specified reference_id
    UPDATE chain_items_vendors_orderpunch
    SET status = status_param
    WHERE reference_id = reference_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 20:31:20
