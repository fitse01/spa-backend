-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: rejuva_spa
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(3) NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('pending','completed','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `appointment_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'booked',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `cancellation_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Blog`
--

DROP TABLE IF EXISTS `Blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blog`
--

LOCK TABLES `Blog` WRITE;
/*!40000 ALTER TABLE `Blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `Blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` json NOT NULL,
  `location` json DEFAULT NULL,
  `phone` json DEFAULT NULL,
  `workingDays` json DEFAULT NULL,
  `facebookUrl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagramUrl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergencyContact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactMessage`
--

DROP TABLE IF EXISTS `ContactMessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContactMessage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `response` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `respondedAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactMessage`
--

LOCK TABLES `ContactMessage` WRITE;
/*!40000 ALTER TABLE `ContactMessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactMessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CountAnimation`
--

DROP TABLE IF EXISTS `CountAnimation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CountAnimation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `animationDuration` int DEFAULT NULL,
  `animationType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CountAnimation`
--

LOCK TABLES `CountAnimation` WRITE;
/*!40000 ALTER TABLE `CountAnimation` DISABLE KEYS */;
/*!40000 ALTER TABLE `CountAnimation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `phone_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience_years` int NOT NULL,
  `personal_info` text COLLATE utf8mb4_unicode_ci,
  `skills` json NOT NULL,
  `employment_status` enum('Active','OnLeave','Terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `role` enum('Admin','Stylist','Manager','Receptionist','ordinary') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordinary',
  `social_media` json DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Employee_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAQ`
--

DROP TABLE IF EXISTS `FAQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FAQ` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAQ`
--

LOCK TABLES `FAQ` WRITE;
/*!40000 ALTER TABLE `FAQ` DISABLE KEYS */;
/*!40000 ALTER TABLE `FAQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pricing`
--

DROP TABLE IF EXISTS `Pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pricing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pricing`
--

LOCK TABLES `Pricing` WRITE;
/*!40000 ALTER TABLE `Pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `stockStatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'In Stock',
  `discount` double NOT NULL DEFAULT '0',
  `images` json NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Testimonial`
--

DROP TABLE IF EXISTS `Testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Testimonial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Testimonial`
--

LOCK TABLES `Testimonial` WRITE;
/*!40000 ALTER TABLE `Testimonial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Testimonial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Video`
--

DROP TABLE IF EXISTS `Video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Video`
--

LOCK TABLES `Video` WRITE;
/*!40000 ALTER TABLE `Video` DISABLE KEYS */;
/*!40000 ALTER TABLE `Video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('0c6daf2d-3a9d-4be6-a200-19b2200017eb','4c516a51e3c0621b87b5dee53cfd20aade870b0716fe6ecbd25929c8d186c320','2024-12-20 00:52:32.467','20241219232644_new',NULL,NULL,'2024-12-20 00:52:32.260',1),('5761eda3-0681-4d44-9c37-ac5654055847','a29d1caec3c725d991483609f9c3a0a92dac2dbfdd09e85f10738ebb5040894b','2024-12-18 12:42:17.348','20241218124217_add_product_model',NULL,NULL,'2024-12-18 12:42:17.171',1),('ca9e6540-5499-4c54-bf6a-4244fa9c8cb7','8ce2d3a04ade8328a69c459577b526acd064c3e02278936835b5d49a8955f1d0','2024-12-20 00:52:35.068','20241220005235_new',NULL,NULL,'2024-12-20 00:52:35.009',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(3) NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('pending','completed','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `appointment_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'booked',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `cancellation_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'https://res.cloudinary.com/doprycptz/image/upload/v1734530379/hwxnwpokizhxi5zkanbp.png','The Ultimate Guide to Facial Treatments','Facials, Skincare Tips','<p>Are you dreaming of soft, glowing, and youthful skin? At Rejuva Glow Beauty, we offer personalized facial<br>treatments that transform your complexion and bring out your natural beauty.<br><br>Facials are not just indulgent—they’re a necessity for keeping your skin healthy and rejuvenated. From<br><strong>HydraFacials </strong>that deeply cleanse and hydrate to <strong>Anti-Wrinkle Treatments </strong>that smooth out fine lines,<br>our customized facials are designed to meet the unique needs of every skin type.<br><br>Struggling with acne scars? Our targeted<strong> Acne Scar Treatments </strong>heal and renew, giving you confidence<br>in your skin once again. For a special boost, our <strong>Oxygen Facials</strong> and <strong>Nano Infusion Treatments </strong>deliver<br>deep hydration and nourishment.<br><br>Regular facials aren’t just about appearances—they’re about feeling your best. Whether you’re preparing<br>for a big day or just craving some self-care, a professional facial can work wonders.<br><strong>Book your facial at Rejuva Glow Beauty today and fall in love with your skin again!</strong><br><br></p>','2024-12-18 13:59:37.697','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:35:41.536'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734530727/k9majjddijnregbgxrjk.png','Why You Need a Head Spa: Relax, Recharge, and Boost Hair Health','Head Spa, Scalp Care','<p>Ever feel like stress is weighing you down? It might be more than just mental—it could be sitting on your<br>scalp too! At Rejuva Glow Beauty, our <strong>Head Spa Treatments</strong> offer the perfect escape to relax, recharge,<br>and promote healthier hair.<br><br>Our signature <strong>Hydro Dermabrasion Scalp Treatment </strong>cleanses deeply, removing oil buildup and<br>promoting blood circulation. Pair it with our <strong>Gua Sha Scalp Massage</strong>—a soothing technique that melts<br>away tension and enhances relaxation.<br><br>Head spas are about more than beauty—they’re about overall wellness. Healthy scalps lead to fuller,<br>shinier, and more vibrant hair. Imagine lying back in a calming environment while stress disappears.<br><strong>Ready to rejuvenate your scalp and mind? Book your head spa treatment today!<br></strong><br></p>','2024-12-18 14:05:26.387','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:05:26.390'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734530999/lxpv7d51mugiziaeumum.png','Smooth and Silky: Why Professional Waxing is Worth It','Waxing, Hair Removal','<p>Tired of shaving every other day? Frustrated with nicks, razor bumps, and stubborn stubble? It’s time to<br>experience the magic of <strong>professional waxing</strong> at Rejuva Glow Beauty.<br><br>Waxing provides smoother, longer-lasting results compared to shaving. With options like <strong>Brazilian<br>waxing</strong>, facial waxing, legs, underarms, and more, you can say goodbye to unwanted hair and hello to<br>confidence.<br><br>Our premium waxing services use gentle, high-quality wax to minimize discomfort while effectively re moving hair. Beyond hair removal, waxing exfoliates your skin, leaving it soft and smooth for weeks.<br><strong>Ditch the razor and embrace silky-smooth skin. Book your waxing appointment today!<br></strong><br></p>','2024-12-18 14:09:58.114','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:09:58.116'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734531341/euosnttiej5c4ic9msmy.png','Advanced Skincare Treatments: Transform Your Skin with Cutting Edge Techniques','Advanced Skincare','<p>When it comes to skincare, sometimes the basics aren’t enough. If you’re looking</p><p> for powerful results, it’s time to explore <strong>advanced skincare treatments</strong> at Rejuva </p><p>Glow Beauty.<br><br>We offer treatments like <strong>Chemical Peels</strong> to exfoliate away layers of dead skin </p><p>and reveal a fresh com￾plexion. For deeper scars, fine lines, and uneven texture,</p><p> our <strong>Micro needling</strong> and <strong>Microdermabrasion</strong> treatments stimulate collagen production </p><p>and renew your skin.<br><br>One of our favorite game-changers? The<strong> Photo Facial</strong>, a targeted light therapy that corrects pigmen￾tation and restores radiance.<br><br>Let us help you achieve the clear, glowing skin you’ve always wanted. Book your consulta tion today!<br><br></p>','2024-12-18 14:15:40.208','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:15:40.211'),(5,'https://res.cloudinary.com/doprycptz/image/upload/v1734531669/brk4tnadtk9xnfs7knwn.png','Relax and Unwind','Massage,Relaxation','<p>Sometimes, it’s the little things that make a big difference. At Rejuva Glow Beauty,</p><p> we offer <strong>add-on treatments </strong>that elevate your spa session to a new level of relaxation.<br><br>Feeling tense? Our <strong>Neck and Shoulder Massage</strong> melts away stress, while the</p><p> cooling and hydrating effects of our <strong>Jelly Masks</strong> rejuvenate your skin. Need more?</p><p> <strong>LED Light Therapy</strong> targets acne, wrinkles, and dullness for glowing results.<br><br>Add-on treatments are the perfect finishing touch to complete your spa experience.</p><p> Because you deserve more than just beauty—you deserve pure relaxation.<br><br><strong>Book your session today and treat yourself to the ultimate spa experience!</strong><br><br></p>','2024-12-18 14:21:08.404','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:21:08.406'),(1,'https://res.cloudinary.com/doprycptz/image/upload/v1734530379/hwxnwpokizhxi5zkanbp.png','The Ultimate Guide to Facial Treatments','Facials, Skincare Tips','<p>Are you dreaming of soft, glowing, and youthful skin? At Rejuva Glow Beauty, we offer personalized facial<br>treatments that transform your complexion and bring out your natural beauty.<br><br>Facials are not just indulgent—they’re a necessity for keeping your skin healthy and rejuvenated. From<br><strong>HydraFacials </strong>that deeply cleanse and hydrate to <strong>Anti-Wrinkle Treatments </strong>that smooth out fine lines,<br>our customized facials are designed to meet the unique needs of every skin type.<br><br>Struggling with acne scars? Our targeted<strong> Acne Scar Treatments </strong>heal and renew, giving you confidence<br>in your skin once again. For a special boost, our <strong>Oxygen Facials</strong> and <strong>Nano Infusion Treatments </strong>deliver<br>deep hydration and nourishment.<br><br>Regular facials aren’t just about appearances—they’re about feeling your best. Whether you’re preparing<br>for a big day or just craving some self-care, a professional facial can work wonders.<br><strong>Book your facial at Rejuva Glow Beauty today and fall in love with your skin again!</strong><br><br></p>','2024-12-18 13:59:37.697','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:35:41.536'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734530727/k9majjddijnregbgxrjk.png','Why You Need a Head Spa: Relax, Recharge, and Boost Hair Health','Head Spa, Scalp Care','<p>Ever feel like stress is weighing you down? It might be more than just mental—it could be sitting on your<br>scalp too! At Rejuva Glow Beauty, our <strong>Head Spa Treatments</strong> offer the perfect escape to relax, recharge,<br>and promote healthier hair.<br><br>Our signature <strong>Hydro Dermabrasion Scalp Treatment </strong>cleanses deeply, removing oil buildup and<br>promoting blood circulation. Pair it with our <strong>Gua Sha Scalp Massage</strong>—a soothing technique that melts<br>away tension and enhances relaxation.<br><br>Head spas are about more than beauty—they’re about overall wellness. Healthy scalps lead to fuller,<br>shinier, and more vibrant hair. Imagine lying back in a calming environment while stress disappears.<br><strong>Ready to rejuvenate your scalp and mind? Book your head spa treatment today!<br></strong><br></p>','2024-12-18 14:05:26.387','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:05:26.390'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734530999/lxpv7d51mugiziaeumum.png','Smooth and Silky: Why Professional Waxing is Worth It','Waxing, Hair Removal','<p>Tired of shaving every other day? Frustrated with nicks, razor bumps, and stubborn stubble? It’s time to<br>experience the magic of <strong>professional waxing</strong> at Rejuva Glow Beauty.<br><br>Waxing provides smoother, longer-lasting results compared to shaving. With options like <strong>Brazilian<br>waxing</strong>, facial waxing, legs, underarms, and more, you can say goodbye to unwanted hair and hello to<br>confidence.<br><br>Our premium waxing services use gentle, high-quality wax to minimize discomfort while effectively re moving hair. Beyond hair removal, waxing exfoliates your skin, leaving it soft and smooth for weeks.<br><strong>Ditch the razor and embrace silky-smooth skin. Book your waxing appointment today!<br></strong><br></p>','2024-12-18 14:09:58.114','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:09:58.116'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734531341/euosnttiej5c4ic9msmy.png','Advanced Skincare Treatments: Transform Your Skin with Cutting Edge Techniques','Advanced Skincare','<p>When it comes to skincare, sometimes the basics aren’t enough. If you’re looking</p><p> for powerful results, it’s time to explore <strong>advanced skincare treatments</strong> at Rejuva </p><p>Glow Beauty.<br><br>We offer treatments like <strong>Chemical Peels</strong> to exfoliate away layers of dead skin </p><p>and reveal a fresh com￾plexion. For deeper scars, fine lines, and uneven texture,</p><p> our <strong>Micro needling</strong> and <strong>Microdermabrasion</strong> treatments stimulate collagen production </p><p>and renew your skin.<br><br>One of our favorite game-changers? The<strong> Photo Facial</strong>, a targeted light therapy that corrects pigmen￾tation and restores radiance.<br><br>Let us help you achieve the clear, glowing skin you’ve always wanted. Book your consulta tion today!<br><br></p>','2024-12-18 14:15:40.208','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:15:40.211'),(5,'https://res.cloudinary.com/doprycptz/image/upload/v1734531669/brk4tnadtk9xnfs7knwn.png','Relax and Unwind','Massage,Relaxation','<p>Sometimes, it’s the little things that make a big difference. At Rejuva Glow Beauty,</p><p> we offer <strong>add-on treatments </strong>that elevate your spa session to a new level of relaxation.<br><br>Feeling tense? Our <strong>Neck and Shoulder Massage</strong> melts away stress, while the</p><p> cooling and hydrating effects of our <strong>Jelly Masks</strong> rejuvenate your skin. Need more?</p><p> <strong>LED Light Therapy</strong> targets acne, wrinkles, and dullness for glowing results.<br><br>Add-on treatments are the perfect finishing touch to complete your spa experience.</p><p> Because you deserve more than just beauty—you deserve pure relaxation.<br><br><strong>Book your session today and treat yourself to the ultimate spa experience!</strong><br><br></p>','2024-12-18 14:21:08.404','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:21:08.406'),(1,'https://res.cloudinary.com/doprycptz/image/upload/v1734530379/hwxnwpokizhxi5zkanbp.png','The Ultimate Guide to Facial Treatments','Facials, Skincare Tips','<p>Are you dreaming of soft, glowing, and youthful skin? At Rejuva Glow Beauty, we offer personalized facial<br>treatments that transform your complexion and bring out your natural beauty.<br><br>Facials are not just indulgent—they’re a necessity for keeping your skin healthy and rejuvenated. From<br><strong>HydraFacials </strong>that deeply cleanse and hydrate to <strong>Anti-Wrinkle Treatments </strong>that smooth out fine lines,<br>our customized facials are designed to meet the unique needs of every skin type.<br><br>Struggling with acne scars? Our targeted<strong> Acne Scar Treatments </strong>heal and renew, giving you confidence<br>in your skin once again. For a special boost, our <strong>Oxygen Facials</strong> and <strong>Nano Infusion Treatments </strong>deliver<br>deep hydration and nourishment.<br><br>Regular facials aren’t just about appearances—they’re about feeling your best. Whether you’re preparing<br>for a big day or just craving some self-care, a professional facial can work wonders.<br><strong>Book your facial at Rejuva Glow Beauty today and fall in love with your skin again!</strong><br><br></p>','2024-12-18 13:59:37.697','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:35:41.536'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734530727/k9majjddijnregbgxrjk.png','Why You Need a Head Spa: Relax, Recharge, and Boost Hair Health','Head Spa, Scalp Care','<p>Ever feel like stress is weighing you down? It might be more than just mental—it could be sitting on your<br>scalp too! At Rejuva Glow Beauty, our <strong>Head Spa Treatments</strong> offer the perfect escape to relax, recharge,<br>and promote healthier hair.<br><br>Our signature <strong>Hydro Dermabrasion Scalp Treatment </strong>cleanses deeply, removing oil buildup and<br>promoting blood circulation. Pair it with our <strong>Gua Sha Scalp Massage</strong>—a soothing technique that melts<br>away tension and enhances relaxation.<br><br>Head spas are about more than beauty—they’re about overall wellness. Healthy scalps lead to fuller,<br>shinier, and more vibrant hair. Imagine lying back in a calming environment while stress disappears.<br><strong>Ready to rejuvenate your scalp and mind? Book your head spa treatment today!<br></strong><br></p>','2024-12-18 14:05:26.387','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:05:26.390'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734530999/lxpv7d51mugiziaeumum.png','Smooth and Silky: Why Professional Waxing is Worth It','Waxing, Hair Removal','<p>Tired of shaving every other day? Frustrated with nicks, razor bumps, and stubborn stubble? It’s time to<br>experience the magic of <strong>professional waxing</strong> at Rejuva Glow Beauty.<br><br>Waxing provides smoother, longer-lasting results compared to shaving. With options like <strong>Brazilian<br>waxing</strong>, facial waxing, legs, underarms, and more, you can say goodbye to unwanted hair and hello to<br>confidence.<br><br>Our premium waxing services use gentle, high-quality wax to minimize discomfort while effectively re moving hair. Beyond hair removal, waxing exfoliates your skin, leaving it soft and smooth for weeks.<br><strong>Ditch the razor and embrace silky-smooth skin. Book your waxing appointment today!<br></strong><br></p>','2024-12-18 14:09:58.114','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:09:58.116'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734531341/euosnttiej5c4ic9msmy.png','Advanced Skincare Treatments: Transform Your Skin with Cutting Edge Techniques','Advanced Skincare','<p>When it comes to skincare, sometimes the basics aren’t enough. If you’re looking</p><p> for powerful results, it’s time to explore <strong>advanced skincare treatments</strong> at Rejuva </p><p>Glow Beauty.<br><br>We offer treatments like <strong>Chemical Peels</strong> to exfoliate away layers of dead skin </p><p>and reveal a fresh com￾plexion. For deeper scars, fine lines, and uneven texture,</p><p> our <strong>Micro needling</strong> and <strong>Microdermabrasion</strong> treatments stimulate collagen production </p><p>and renew your skin.<br><br>One of our favorite game-changers? The<strong> Photo Facial</strong>, a targeted light therapy that corrects pigmen￾tation and restores radiance.<br><br>Let us help you achieve the clear, glowing skin you’ve always wanted. Book your consulta tion today!<br><br></p>','2024-12-18 14:15:40.208','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:15:40.211'),(5,'https://res.cloudinary.com/doprycptz/image/upload/v1734531669/brk4tnadtk9xnfs7knwn.png','Relax and Unwind','Massage,Relaxation','<p>Sometimes, it’s the little things that make a big difference. At Rejuva Glow Beauty,</p><p> we offer <strong>add-on treatments </strong>that elevate your spa session to a new level of relaxation.<br><br>Feeling tense? Our <strong>Neck and Shoulder Massage</strong> melts away stress, while the</p><p> cooling and hydrating effects of our <strong>Jelly Masks</strong> rejuvenate your skin. Need more?</p><p> <strong>LED Light Therapy</strong> targets acne, wrinkles, and dullness for glowing results.<br><br>Add-on treatments are the perfect finishing touch to complete your spa experience.</p><p> Because you deserve more than just beauty—you deserve pure relaxation.<br><br><strong>Book your session today and treat yourself to the ultimate spa experience!</strong><br><br></p>','2024-12-18 14:21:08.404','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:21:08.406'),(1,'https://res.cloudinary.com/doprycptz/image/upload/v1734530379/hwxnwpokizhxi5zkanbp.png','The Ultimate Guide to Facial Treatments','Facials, Skincare Tips','<p>Are you dreaming of soft, glowing, and youthful skin? At Rejuva Glow Beauty, we offer personalized facial<br>treatments that transform your complexion and bring out your natural beauty.<br><br>Facials are not just indulgent—they’re a necessity for keeping your skin healthy and rejuvenated. From<br><strong>HydraFacials </strong>that deeply cleanse and hydrate to <strong>Anti-Wrinkle Treatments </strong>that smooth out fine lines,<br>our customized facials are designed to meet the unique needs of every skin type.<br><br>Struggling with acne scars? Our targeted<strong> Acne Scar Treatments </strong>heal and renew, giving you confidence<br>in your skin once again. For a special boost, our <strong>Oxygen Facials</strong> and <strong>Nano Infusion Treatments </strong>deliver<br>deep hydration and nourishment.<br><br>Regular facials aren’t just about appearances—they’re about feeling your best. Whether you’re preparing<br>for a big day or just craving some self-care, a professional facial can work wonders.<br><strong>Book your facial at Rejuva Glow Beauty today and fall in love with your skin again!</strong><br><br></p>','2024-12-18 13:59:37.697','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:35:41.536'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734530727/k9majjddijnregbgxrjk.png','Why You Need a Head Spa: Relax, Recharge, and Boost Hair Health','Head Spa, Scalp Care','<p>Ever feel like stress is weighing you down? It might be more than just mental—it could be sitting on your<br>scalp too! At Rejuva Glow Beauty, our <strong>Head Spa Treatments</strong> offer the perfect escape to relax, recharge,<br>and promote healthier hair.<br><br>Our signature <strong>Hydro Dermabrasion Scalp Treatment </strong>cleanses deeply, removing oil buildup and<br>promoting blood circulation. Pair it with our <strong>Gua Sha Scalp Massage</strong>—a soothing technique that melts<br>away tension and enhances relaxation.<br><br>Head spas are about more than beauty—they’re about overall wellness. Healthy scalps lead to fuller,<br>shinier, and more vibrant hair. Imagine lying back in a calming environment while stress disappears.<br><strong>Ready to rejuvenate your scalp and mind? Book your head spa treatment today!<br></strong><br></p>','2024-12-18 14:05:26.387','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:05:26.390'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734530999/lxpv7d51mugiziaeumum.png','Smooth and Silky: Why Professional Waxing is Worth It','Waxing, Hair Removal','<p>Tired of shaving every other day? Frustrated with nicks, razor bumps, and stubborn stubble? It’s time to<br>experience the magic of <strong>professional waxing</strong> at Rejuva Glow Beauty.<br><br>Waxing provides smoother, longer-lasting results compared to shaving. With options like <strong>Brazilian<br>waxing</strong>, facial waxing, legs, underarms, and more, you can say goodbye to unwanted hair and hello to<br>confidence.<br><br>Our premium waxing services use gentle, high-quality wax to minimize discomfort while effectively re moving hair. Beyond hair removal, waxing exfoliates your skin, leaving it soft and smooth for weeks.<br><strong>Ditch the razor and embrace silky-smooth skin. Book your waxing appointment today!<br></strong><br></p>','2024-12-18 14:09:58.114','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:09:58.116'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734531341/euosnttiej5c4ic9msmy.png','Advanced Skincare Treatments: Transform Your Skin with Cutting Edge Techniques','Advanced Skincare','<p>When it comes to skincare, sometimes the basics aren’t enough. If you’re looking</p><p> for powerful results, it’s time to explore <strong>advanced skincare treatments</strong> at Rejuva </p><p>Glow Beauty.<br><br>We offer treatments like <strong>Chemical Peels</strong> to exfoliate away layers of dead skin </p><p>and reveal a fresh com￾plexion. For deeper scars, fine lines, and uneven texture,</p><p> our <strong>Micro needling</strong> and <strong>Microdermabrasion</strong> treatments stimulate collagen production </p><p>and renew your skin.<br><br>One of our favorite game-changers? The<strong> Photo Facial</strong>, a targeted light therapy that corrects pigmen￾tation and restores radiance.<br><br>Let us help you achieve the clear, glowing skin you’ve always wanted. Book your consulta tion today!<br><br></p>','2024-12-18 14:15:40.208','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:15:40.211'),(5,'https://res.cloudinary.com/doprycptz/image/upload/v1734531669/brk4tnadtk9xnfs7knwn.png','Relax and Unwind','Massage,Relaxation','<p>Sometimes, it’s the little things that make a big difference. At Rejuva Glow Beauty,</p><p> we offer <strong>add-on treatments </strong>that elevate your spa session to a new level of relaxation.<br><br>Feeling tense? Our <strong>Neck and Shoulder Massage</strong> melts away stress, while the</p><p> cooling and hydrating effects of our <strong>Jelly Masks</strong> rejuvenate your skin. Need more?</p><p> <strong>LED Light Therapy</strong> targets acne, wrinkles, and dullness for glowing results.<br><br>Add-on treatments are the perfect finishing touch to complete your spa experience.</p><p> Because you deserve more than just beauty—you deserve pure relaxation.<br><br><strong>Book your session today and treat yourself to the ultimate spa experience!</strong><br><br></p>','2024-12-18 14:21:08.404','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:21:08.406'),(1,'https://res.cloudinary.com/doprycptz/image/upload/v1734530379/hwxnwpokizhxi5zkanbp.png','The Ultimate Guide to Facial Treatments','Facials, Skincare Tips','<p>Are you dreaming of soft, glowing, and youthful skin? At Rejuva Glow Beauty, we offer personalized facial<br>treatments that transform your complexion and bring out your natural beauty.<br><br>Facials are not just indulgent—they’re a necessity for keeping your skin healthy and rejuvenated. From<br><strong>HydraFacials </strong>that deeply cleanse and hydrate to <strong>Anti-Wrinkle Treatments </strong>that smooth out fine lines,<br>our customized facials are designed to meet the unique needs of every skin type.<br><br>Struggling with acne scars? Our targeted<strong> Acne Scar Treatments </strong>heal and renew, giving you confidence<br>in your skin once again. For a special boost, our <strong>Oxygen Facials</strong> and <strong>Nano Infusion Treatments </strong>deliver<br>deep hydration and nourishment.<br><br>Regular facials aren’t just about appearances—they’re about feeling your best. Whether you’re preparing<br>for a big day or just craving some self-care, a professional facial can work wonders.<br><strong>Book your facial at Rejuva Glow Beauty today and fall in love with your skin again!</strong><br><br></p>','2024-12-18 13:59:37.697','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:35:41.536'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734530727/k9majjddijnregbgxrjk.png','Why You Need a Head Spa: Relax, Recharge, and Boost Hair Health','Head Spa, Scalp Care','<p>Ever feel like stress is weighing you down? It might be more than just mental—it could be sitting on your<br>scalp too! At Rejuva Glow Beauty, our <strong>Head Spa Treatments</strong> offer the perfect escape to relax, recharge,<br>and promote healthier hair.<br><br>Our signature <strong>Hydro Dermabrasion Scalp Treatment </strong>cleanses deeply, removing oil buildup and<br>promoting blood circulation. Pair it with our <strong>Gua Sha Scalp Massage</strong>—a soothing technique that melts<br>away tension and enhances relaxation.<br><br>Head spas are about more than beauty—they’re about overall wellness. Healthy scalps lead to fuller,<br>shinier, and more vibrant hair. Imagine lying back in a calming environment while stress disappears.<br><strong>Ready to rejuvenate your scalp and mind? Book your head spa treatment today!<br></strong><br></p>','2024-12-18 14:05:26.387','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:05:26.390'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734530999/lxpv7d51mugiziaeumum.png','Smooth and Silky: Why Professional Waxing is Worth It','Waxing, Hair Removal','<p>Tired of shaving every other day? Frustrated with nicks, razor bumps, and stubborn stubble? It’s time to<br>experience the magic of <strong>professional waxing</strong> at Rejuva Glow Beauty.<br><br>Waxing provides smoother, longer-lasting results compared to shaving. With options like <strong>Brazilian<br>waxing</strong>, facial waxing, legs, underarms, and more, you can say goodbye to unwanted hair and hello to<br>confidence.<br><br>Our premium waxing services use gentle, high-quality wax to minimize discomfort while effectively re moving hair. Beyond hair removal, waxing exfoliates your skin, leaving it soft and smooth for weeks.<br><strong>Ditch the razor and embrace silky-smooth skin. Book your waxing appointment today!<br></strong><br></p>','2024-12-18 14:09:58.114','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:09:58.116'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734531341/euosnttiej5c4ic9msmy.png','Advanced Skincare Treatments: Transform Your Skin with Cutting Edge Techniques','Advanced Skincare','<p>When it comes to skincare, sometimes the basics aren’t enough. If you’re looking</p><p> for powerful results, it’s time to explore <strong>advanced skincare treatments</strong> at Rejuva </p><p>Glow Beauty.<br><br>We offer treatments like <strong>Chemical Peels</strong> to exfoliate away layers of dead skin </p><p>and reveal a fresh com￾plexion. For deeper scars, fine lines, and uneven texture,</p><p> our <strong>Micro needling</strong> and <strong>Microdermabrasion</strong> treatments stimulate collagen production </p><p>and renew your skin.<br><br>One of our favorite game-changers? The<strong> Photo Facial</strong>, a targeted light therapy that corrects pigmen￾tation and restores radiance.<br><br>Let us help you achieve the clear, glowing skin you’ve always wanted. Book your consulta tion today!<br><br></p>','2024-12-18 14:15:40.208','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:15:40.211'),(5,'https://res.cloudinary.com/doprycptz/image/upload/v1734531669/brk4tnadtk9xnfs7knwn.png','Relax and Unwind','Massage,Relaxation','<p>Sometimes, it’s the little things that make a big difference. At Rejuva Glow Beauty,</p><p> we offer <strong>add-on treatments </strong>that elevate your spa session to a new level of relaxation.<br><br>Feeling tense? Our <strong>Neck and Shoulder Massage</strong> melts away stress, while the</p><p> cooling and hydrating effects of our <strong>Jelly Masks</strong> rejuvenate your skin. Need more?</p><p> <strong>LED Light Therapy</strong> targets acne, wrinkles, and dullness for glowing results.<br><br>Add-on treatments are the perfect finishing touch to complete your spa experience.</p><p> Because you deserve more than just beauty—you deserve pure relaxation.<br><br><strong>Book your session today and treat yourself to the ultimate spa experience!</strong><br><br></p>','2024-12-18 14:21:08.404','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:21:08.406'),(1,'https://res.cloudinary.com/doprycptz/image/upload/v1734530379/hwxnwpokizhxi5zkanbp.png','The Ultimate Guide to Facial Treatments','Facials, Skincare Tips','<p>Are you dreaming of soft, glowing, and youthful skin? At Rejuva Glow Beauty, we offer personalized facial<br>treatments that transform your complexion and bring out your natural beauty.<br><br>Facials are not just indulgent—they’re a necessity for keeping your skin healthy and rejuvenated. From<br><strong>HydraFacials </strong>that deeply cleanse and hydrate to <strong>Anti-Wrinkle Treatments </strong>that smooth out fine lines,<br>our customized facials are designed to meet the unique needs of every skin type.<br><br>Struggling with acne scars? Our targeted<strong> Acne Scar Treatments </strong>heal and renew, giving you confidence<br>in your skin once again. For a special boost, our <strong>Oxygen Facials</strong> and <strong>Nano Infusion Treatments </strong>deliver<br>deep hydration and nourishment.<br><br>Regular facials aren’t just about appearances—they’re about feeling your best. Whether you’re preparing<br>for a big day or just craving some self-care, a professional facial can work wonders.<br><strong>Book your facial at Rejuva Glow Beauty today and fall in love with your skin again!</strong><br><br></p>','2024-12-18 13:59:37.697','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:35:41.536'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734530727/k9majjddijnregbgxrjk.png','Why You Need a Head Spa: Relax, Recharge, and Boost Hair Health','Head Spa, Scalp Care','<p>Ever feel like stress is weighing you down? It might be more than just mental—it could be sitting on your<br>scalp too! At Rejuva Glow Beauty, our <strong>Head Spa Treatments</strong> offer the perfect escape to relax, recharge,<br>and promote healthier hair.<br><br>Our signature <strong>Hydro Dermabrasion Scalp Treatment </strong>cleanses deeply, removing oil buildup and<br>promoting blood circulation. Pair it with our <strong>Gua Sha Scalp Massage</strong>—a soothing technique that melts<br>away tension and enhances relaxation.<br><br>Head spas are about more than beauty—they’re about overall wellness. Healthy scalps lead to fuller,<br>shinier, and more vibrant hair. Imagine lying back in a calming environment while stress disappears.<br><strong>Ready to rejuvenate your scalp and mind? Book your head spa treatment today!<br></strong><br></p>','2024-12-18 14:05:26.387','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:05:26.390'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734530999/lxpv7d51mugiziaeumum.png','Smooth and Silky: Why Professional Waxing is Worth It','Waxing, Hair Removal','<p>Tired of shaving every other day? Frustrated with nicks, razor bumps, and stubborn stubble? It’s time to<br>experience the magic of <strong>professional waxing</strong> at Rejuva Glow Beauty.<br><br>Waxing provides smoother, longer-lasting results compared to shaving. With options like <strong>Brazilian<br>waxing</strong>, facial waxing, legs, underarms, and more, you can say goodbye to unwanted hair and hello to<br>confidence.<br><br>Our premium waxing services use gentle, high-quality wax to minimize discomfort while effectively re moving hair. Beyond hair removal, waxing exfoliates your skin, leaving it soft and smooth for weeks.<br><strong>Ditch the razor and embrace silky-smooth skin. Book your waxing appointment today!<br></strong><br></p>','2024-12-18 14:09:58.114','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:09:58.116'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734531341/euosnttiej5c4ic9msmy.png','Advanced Skincare Treatments: Transform Your Skin with Cutting Edge Techniques','Advanced Skincare','<p>When it comes to skincare, sometimes the basics aren’t enough. If you’re looking</p><p> for powerful results, it’s time to explore <strong>advanced skincare treatments</strong> at Rejuva </p><p>Glow Beauty.<br><br>We offer treatments like <strong>Chemical Peels</strong> to exfoliate away layers of dead skin </p><p>and reveal a fresh com￾plexion. For deeper scars, fine lines, and uneven texture,</p><p> our <strong>Micro needling</strong> and <strong>Microdermabrasion</strong> treatments stimulate collagen production </p><p>and renew your skin.<br><br>One of our favorite game-changers? The<strong> Photo Facial</strong>, a targeted light therapy that corrects pigmen￾tation and restores radiance.<br><br>Let us help you achieve the clear, glowing skin you’ve always wanted. Book your consulta tion today!<br><br></p>','2024-12-18 14:15:40.208','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:15:40.211'),(5,'https://res.cloudinary.com/doprycptz/image/upload/v1734531669/brk4tnadtk9xnfs7knwn.png','Relax and Unwind','Massage,Relaxation','<p>Sometimes, it’s the little things that make a big difference. At Rejuva Glow Beauty,</p><p> we offer <strong>add-on treatments </strong>that elevate your spa session to a new level of relaxation.<br><br>Feeling tense? Our <strong>Neck and Shoulder Massage</strong> melts away stress, while the</p><p> cooling and hydrating effects of our <strong>Jelly Masks</strong> rejuvenate your skin. Need more?</p><p> <strong>LED Light Therapy</strong> targets acne, wrinkles, and dullness for glowing results.<br><br>Add-on treatments are the perfect finishing touch to complete your spa experience.</p><p> Because you deserve more than just beauty—you deserve pure relaxation.<br><br><strong>Book your session today and treat yourself to the ultimate spa experience!</strong><br><br></p>','2024-12-18 14:21:08.404','Rejuva Glow Beauty','DRAFT',0,'2024-12-18 14:21:08.406');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `workingDays` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `facebookUrl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagramUrl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergencyContact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `contact_chk_1` CHECK (json_valid(`email`)),
  CONSTRAINT `contact_chk_2` CHECK (json_valid(`location`)),
  CONSTRAINT `contact_chk_3` CHECK (json_valid(`phone`)),
  CONSTRAINT `contact_chk_4` CHECK (json_valid(`workingDays`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactmessage`
--

DROP TABLE IF EXISTS `contactmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactmessage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `response` text COLLATE utf8mb4_unicode_ci,
  `respondedAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactmessage`
--

LOCK TABLES `contactmessage` WRITE;
/*!40000 ALTER TABLE `contactmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countanimation`
--

DROP TABLE IF EXISTS `countanimation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countanimation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `animationDuration` int DEFAULT NULL,
  `animationType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countanimation`
--

LOCK TABLES `countanimation` WRITE;
/*!40000 ALTER TABLE `countanimation` DISABLE KEYS */;
/*!40000 ALTER TABLE `countanimation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `phone_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience_years` int NOT NULL,
  `personal_info` text COLLATE utf8mb4_unicode_ci,
  `skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `employment_status` enum('Active','OnLeave','Terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `role` enum('Admin','Stylist','Manager','Receptionist','ordinary') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordinary',
  `social_media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Employee_email_key` (`email`),
  CONSTRAINT `employee_chk_1` CHECK (json_valid(`skills`)),
  CONSTRAINT `employee_chk_2` CHECK (json_valid(`social_media`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricing` (
  `id` int NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricing`
--

LOCK TABLES `Pricing` WRITE;
/*!40000 ALTER TABLE `pricing` DISABLE KEYS */;
INSERT INTO `Pricing` VALUES (1,'https://res.cloudinary.com/doprycptz/image/upload/v1734552167/f08sy5iqnijt8xhyee9b.png','Facial Treatment ','<p>HydraFacial<br>Express (1 hour) ------------------------------------- $200<br>Deluxe (90 mins) -------------------------------------$260<br>Other Treatments:<br>Acne/Scar Treatment (1 hour 30 mins)-------------- $175<br>Anti Wrinkle Treatment (1 hour 30 mins)------------ $165<br>Oxygen Facial (1 hour 30 mins)----------------------$185<br>Nano Infusion (30 mins)------------------------------ $125<br>Vitamin C Facial (80 min)----------------------------- $100<br>Sunburn Soothing &amp; Healing Treatment (Starting at): $110<br>Customized Back Acne (Bacne) Treatment (1 hour): $140<br><br></p>',0.00,'2024-12-18 19:37:44.701','2024-12-18 20:02:47.330'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734552448/pgoi383t1zbtkxdagryy.png','Head Spa ','<p>(Stress Relief) - Hydro Dermabrasion<br>Gua Sha Scalp Treatment ( 1 hour ) - $150</p>',0.00,'2024-12-18 20:07:26.966','2024-12-18 20:07:26.966'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734553136/bc97yvj6wymjxzcucvi7.png','Waxing','<p>Waxing<br>Back--------------------$60<br>Under Arms----------- $25<br>Full Arm----------------$50<br>Half Arm---------------$40<br>Full Leg---------------- $70<br>Half Leg----------------$40<br>Face--------------------$50<br>Chin--------------------$10<br>Lip----------------------$10<br>Bikini--------------------$35<br>Brazilian----------------$50<br><br></p>',0.00,'2024-12-18 20:11:24.699','2024-12-18 20:18:55.728'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734553630/r7sad2zbhbm3mlsacxzq.png','Additional Service','<p>Chemical Peels<br>Mild (1 hour): -------------$130<br>Advance (90 mins):-----$200<br><strong>Face Analyzing</strong><br>Face Analyzing:---------$200<br><strong>Microdermabrasion / Micro-needling</strong><br>Microdermabrasion (1 hour): -----$140<br>Microneedling (1 hour 30 mins):-$300<br>Photo Facial (1 hour 30 mins)----$330<br><strong>Add-ons</strong><br>Dermaplaning:---------------------$100<br>High Frequency Treatment:----$100<br>LED Light Therapy:--------------$50<br>Jelly Masks: -----------------------$25<br>Gua Sha Facial Massage:-----$50<br>Neck and Shoulder Massage--$50<br><br></p>',0.00,'2024-12-18 20:22:40.900','2024-12-18 20:27:09.387'),(1,'https://res.cloudinary.com/doprycptz/image/upload/v1734552167/f08sy5iqnijt8xhyee9b.png','Facial Treatment ','<p>HydraFacial<br>Express (1 hour) ------------------------------------- $200<br>Deluxe (90 mins) -------------------------------------$260<br>Other Treatments:<br>Acne/Scar Treatment (1 hour 30 mins)-------------- $175<br>Anti Wrinkle Treatment (1 hour 30 mins)------------ $165<br>Oxygen Facial (1 hour 30 mins)----------------------$185<br>Nano Infusion (30 mins)------------------------------ $125<br>Vitamin C Facial (80 min)----------------------------- $100<br>Sunburn Soothing &amp; Healing Treatment (Starting at): $110<br>Customized Back Acne (Bacne) Treatment (1 hour): $140<br><br></p>',0.00,'2024-12-18 19:37:44.701','2024-12-18 20:02:47.330'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734552448/pgoi383t1zbtkxdagryy.png','Head Spa ','<p>(Stress Relief) - Hydro Dermabrasion<br>Gua Sha Scalp Treatment ( 1 hour ) - $150</p>',0.00,'2024-12-18 20:07:26.966','2024-12-18 20:07:26.966'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734553136/bc97yvj6wymjxzcucvi7.png','Waxing','<p>Waxing<br>Back--------------------$60<br>Under Arms----------- $25<br>Full Arm----------------$50<br>Half Arm---------------$40<br>Full Leg---------------- $70<br>Half Leg----------------$40<br>Face--------------------$50<br>Chin--------------------$10<br>Lip----------------------$10<br>Bikini--------------------$35<br>Brazilian----------------$50<br><br></p>',0.00,'2024-12-18 20:11:24.699','2024-12-18 20:18:55.728'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734553630/r7sad2zbhbm3mlsacxzq.png','Additional Service','<p>Chemical Peels<br>Mild (1 hour): -------------$130<br>Advance (90 mins):-----$200<br><strong>Face Analyzing</strong><br>Face Analyzing:---------$200<br><strong>Microdermabrasion / Micro-needling</strong><br>Microdermabrasion (1 hour): -----$140<br>Microneedling (1 hour 30 mins):-$300<br>Photo Facial (1 hour 30 mins)----$330<br><strong>Add-ons</strong><br>Dermaplaning:---------------------$100<br>High Frequency Treatment:----$100<br>LED Light Therapy:--------------$50<br>Jelly Masks: -----------------------$25<br>Gua Sha Facial Massage:-----$50<br>Neck and Shoulder Massage--$50<br><br></p>',0.00,'2024-12-18 20:22:40.900','2024-12-18 20:27:09.387'),(1,'https://res.cloudinary.com/doprycptz/image/upload/v1734552167/f08sy5iqnijt8xhyee9b.png','Facial Treatment ','<p>HydraFacial<br>Express (1 hour) ------------------------------------- $200<br>Deluxe (90 mins) -------------------------------------$260<br>Other Treatments:<br>Acne/Scar Treatment (1 hour 30 mins)-------------- $175<br>Anti Wrinkle Treatment (1 hour 30 mins)------------ $165<br>Oxygen Facial (1 hour 30 mins)----------------------$185<br>Nano Infusion (30 mins)------------------------------ $125<br>Vitamin C Facial (80 min)----------------------------- $100<br>Sunburn Soothing &amp; Healing Treatment (Starting at): $110<br>Customized Back Acne (Bacne) Treatment (1 hour): $140<br><br></p>',0.00,'2024-12-18 19:37:44.701','2024-12-18 20:02:47.330'),(2,'https://res.cloudinary.com/doprycptz/image/upload/v1734552448/pgoi383t1zbtkxdagryy.png','Head Spa ','<p>(Stress Relief) - Hydro Dermabrasion<br>Gua Sha Scalp Treatment ( 1 hour ) - $150</p>',0.00,'2024-12-18 20:07:26.966','2024-12-18 20:07:26.966'),(3,'https://res.cloudinary.com/doprycptz/image/upload/v1734553136/bc97yvj6wymjxzcucvi7.png','Waxing','<p>Waxing<br>Back--------------------$60<br>Under Arms----------- $25<br>Full Arm----------------$50<br>Half Arm---------------$40<br>Full Leg---------------- $70<br>Half Leg----------------$40<br>Face--------------------$50<br>Chin--------------------$10<br>Lip----------------------$10<br>Bikini--------------------$35<br>Brazilian----------------$50<br><br></p>',0.00,'2024-12-18 20:11:24.699','2024-12-18 20:18:55.728'),(4,'https://res.cloudinary.com/doprycptz/image/upload/v1734553630/r7sad2zbhbm3mlsacxzq.png','Additional Service','<p>Chemical Peels<br>Mild (1 hour): -------------$130<br>Advance (90 mins):-----$200<br><strong>Face Analyzing</strong><br>Face Analyzing:---------$200<br><strong>Microdermabrasion / Micro-needling</strong><br>Microdermabrasion (1 hour): -----$140<br>Microneedling (1 hour 30 mins):-$300<br>Photo Facial (1 hour 30 mins)----$330<br><strong>Add-ons</strong><br>Dermaplaning:---------------------$100<br>High Frequency Treatment:----$100<br>LED Light Therapy:--------------$50<br>Jelly Masks: -----------------------$25<br>Gua Sha Facial Massage:-----$50<br>Neck and Shoulder Massage--$50<br><br></p>',0.00,'2024-12-18 20:22:40.900','2024-12-18 20:27:09.387');
/*!40000 ALTER TABLE `pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `stockStatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'In Stock',
  `discount` double NOT NULL DEFAULT '0',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  CONSTRAINT `product_chk_1` CHECK (json_valid(`images`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Circadia - Advanced Anti-Aging Night Cream','Circadia’s Anti-Aging Night Cream is a powerful formula designed to restore and rejuvenate skin while you sleep. Infused with peptides and antioxidants, it reduces fine lines, improves elasticity, and hydrates deeply, ensuring you wake up with a radiant, youthful glow. Ideal for all skin types looking for age-defying results.',120,50,'IN_STOCK',10.5,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734526145/dinjiwrdpxx7tma0ntcn.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526144/zdac6bwgs9wyuqfw34rm.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526146/dplkjffeqbpkiky1uhse.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526145/m8g1y0pbfwsqvatfnnzp.png\"]','Anti-Aging, Skincare','2024-12-18 12:49:05.023','2024-12-18 12:49:05.023'),(2,'Dermalogica Pro - Daily Microfoliant Exfoliating Powder','A gentle yet effective daily exfoliant that brightens and smooths your complexion. Dermalogica Pro’s Microfoliant combines rice-based powder with papain enzymes to slough off dead skin cells, unclog pores, and reveal luminous, even-toned skin. Suitable for sensitive skin types.',65,74,'IN_STOCK',0,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734526804/rkak9lfj0nlfnzsyn9pe.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526796/l8ozjip0lemskjpdrdpd.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526800/pqlzh6ndno3rzcrxfiwq.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526807/bpdcu7mu5vqzpa5yzjkw.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526807/jrgyhzoc1wem8761mfy1.png\"]','Exfoliation, Skincare','2024-12-18 13:00:06.451','2024-12-18 13:00:06.451'),(3,'Glymed+ - Oxygen Deep Pore Cleanser','A revolutionary deep-cleaning formula that uses oxygen infusion to clear out impurities, oil buildup, and toxins from deep within the pores. Glymed+ Oxygen Cleanser leaves your skin refreshed, purified, and glowing. Perfect for acne-prone and oily skin',48,120,'IN_STOCK',10,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527010/god3rfot2ei46hvgi6lb.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527004/bub3mhiizis8y9u3psui.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527010/ehiynuqya1a5ucu3s54b.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527002/g0sbqf5b3kkocf5msbhm.png\"]','Deep Cleansing, Acne Care','2024-12-18 13:03:29.092','2024-12-18 13:08:23.822'),(4,'Skin Better - AlphaRet Overnight Cream','This award-winning overnight cream combines retinoid and alpha-hydroxy acid (AHA) to deliver smoother, brighter skin with minimal irritation. Skin Better’s AlphaRet cream reduces fine lines, uneven texture, and dullness while keeping your skin hydrated and soft overnight.',135,30,'IN_STOCK',5,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527161/c3m5mptrliycnsrexhvw.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527160/yijwn2okyffn9hxawstb.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527159/ihetctwblcqz5qbl7uxz.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527161/jjj7ctjk0wlxyz5qdbjm.png\"]','Anti-Aging, Night Care','2024-12-18 13:06:00.547','2024-12-18 13:09:29.746'),(5,'SkinCeuticals - C E Ferulic Serum','The gold standard of Vitamin C serums, SkinCeuticals C E Ferulic combines 15% pure Vitamin C, 1% Vitamin E, and 0.5% Ferulic Acid to protect against environmental damage while brightening and firming your skin. Perfect for those battling dullness, hyperpigmentation, and aging',169,30,'IN_STOCK',20,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527503/vxvgxzkwbgldhzi1q5kj.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527503/rxporakmopidlpy57psq.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527497/tqkvcwgkivu1decfgqzc.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527502/c1nxs6dhuixeo6e4ff27.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527500/iveamcbqpzjmqd91ofnk.png\"]','Brightening, Anti-Aging, Serums','2024-12-18 13:11:42.184','2024-12-18 13:12:34.468'),(1,'Circadia - Advanced Anti-Aging Night Cream','Circadia’s Anti-Aging Night Cream is a powerful formula designed to restore and rejuvenate skin while you sleep. Infused with peptides and antioxidants, it reduces fine lines, improves elasticity, and hydrates deeply, ensuring you wake up with a radiant, youthful glow. Ideal for all skin types looking for age-defying results.',120,50,'IN_STOCK',10.5,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734526145/dinjiwrdpxx7tma0ntcn.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526144/zdac6bwgs9wyuqfw34rm.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526146/dplkjffeqbpkiky1uhse.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526145/m8g1y0pbfwsqvatfnnzp.png\"]','Anti-Aging, Skincare','2024-12-18 12:49:05.023','2024-12-18 12:49:05.023'),(2,'Dermalogica Pro - Daily Microfoliant Exfoliating Powder','A gentle yet effective daily exfoliant that brightens and smooths your complexion. Dermalogica Pro’s Microfoliant combines rice-based powder with papain enzymes to slough off dead skin cells, unclog pores, and reveal luminous, even-toned skin. Suitable for sensitive skin types.',65,74,'IN_STOCK',0,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734526804/rkak9lfj0nlfnzsyn9pe.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526796/l8ozjip0lemskjpdrdpd.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526800/pqlzh6ndno3rzcrxfiwq.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526807/bpdcu7mu5vqzpa5yzjkw.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526807/jrgyhzoc1wem8761mfy1.png\"]','Exfoliation, Skincare','2024-12-18 13:00:06.451','2024-12-18 13:00:06.451'),(3,'Glymed+ - Oxygen Deep Pore Cleanser','A revolutionary deep-cleaning formula that uses oxygen infusion to clear out impurities, oil buildup, and toxins from deep within the pores. Glymed+ Oxygen Cleanser leaves your skin refreshed, purified, and glowing. Perfect for acne-prone and oily skin',48,120,'IN_STOCK',10,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527010/god3rfot2ei46hvgi6lb.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527004/bub3mhiizis8y9u3psui.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527010/ehiynuqya1a5ucu3s54b.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527002/g0sbqf5b3kkocf5msbhm.png\"]','Deep Cleansing, Acne Care','2024-12-18 13:03:29.092','2024-12-18 13:08:23.822'),(4,'Skin Better - AlphaRet Overnight Cream','This award-winning overnight cream combines retinoid and alpha-hydroxy acid (AHA) to deliver smoother, brighter skin with minimal irritation. Skin Better’s AlphaRet cream reduces fine lines, uneven texture, and dullness while keeping your skin hydrated and soft overnight.',135,30,'IN_STOCK',5,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527161/c3m5mptrliycnsrexhvw.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527160/yijwn2okyffn9hxawstb.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527159/ihetctwblcqz5qbl7uxz.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527161/jjj7ctjk0wlxyz5qdbjm.png\"]','Anti-Aging, Night Care','2024-12-18 13:06:00.547','2024-12-18 13:09:29.746'),(5,'SkinCeuticals - C E Ferulic Serum','The gold standard of Vitamin C serums, SkinCeuticals C E Ferulic combines 15% pure Vitamin C, 1% Vitamin E, and 0.5% Ferulic Acid to protect against environmental damage while brightening and firming your skin. Perfect for those battling dullness, hyperpigmentation, and aging',169,30,'IN_STOCK',20,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527503/vxvgxzkwbgldhzi1q5kj.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527503/rxporakmopidlpy57psq.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527497/tqkvcwgkivu1decfgqzc.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527502/c1nxs6dhuixeo6e4ff27.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527500/iveamcbqpzjmqd91ofnk.png\"]','Brightening, Anti-Aging, Serums','2024-12-18 13:11:42.184','2024-12-18 13:12:34.468'),(1,'Circadia - Advanced Anti-Aging Night Cream','Circadia’s Anti-Aging Night Cream is a powerful formula designed to restore and rejuvenate skin while you sleep. Infused with peptides and antioxidants, it reduces fine lines, improves elasticity, and hydrates deeply, ensuring you wake up with a radiant, youthful glow. Ideal for all skin types looking for age-defying results.',120,50,'IN_STOCK',10.5,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734526145/dinjiwrdpxx7tma0ntcn.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526144/zdac6bwgs9wyuqfw34rm.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526146/dplkjffeqbpkiky1uhse.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526145/m8g1y0pbfwsqvatfnnzp.png\"]','Anti-Aging, Skincare','2024-12-18 12:49:05.023','2024-12-18 12:49:05.023'),(2,'Dermalogica Pro - Daily Microfoliant Exfoliating Powder','A gentle yet effective daily exfoliant that brightens and smooths your complexion. Dermalogica Pro’s Microfoliant combines rice-based powder with papain enzymes to slough off dead skin cells, unclog pores, and reveal luminous, even-toned skin. Suitable for sensitive skin types.',65,74,'IN_STOCK',0,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734526804/rkak9lfj0nlfnzsyn9pe.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526796/l8ozjip0lemskjpdrdpd.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526800/pqlzh6ndno3rzcrxfiwq.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526807/bpdcu7mu5vqzpa5yzjkw.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734526807/jrgyhzoc1wem8761mfy1.png\"]','Exfoliation, Skincare','2024-12-18 13:00:06.451','2024-12-18 13:00:06.451'),(3,'Glymed+ - Oxygen Deep Pore Cleanser','A revolutionary deep-cleaning formula that uses oxygen infusion to clear out impurities, oil buildup, and toxins from deep within the pores. Glymed+ Oxygen Cleanser leaves your skin refreshed, purified, and glowing. Perfect for acne-prone and oily skin',48,120,'IN_STOCK',10,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527010/god3rfot2ei46hvgi6lb.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527004/bub3mhiizis8y9u3psui.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527010/ehiynuqya1a5ucu3s54b.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527002/g0sbqf5b3kkocf5msbhm.png\"]','Deep Cleansing, Acne Care','2024-12-18 13:03:29.092','2024-12-18 13:08:23.822'),(4,'Skin Better - AlphaRet Overnight Cream','This award-winning overnight cream combines retinoid and alpha-hydroxy acid (AHA) to deliver smoother, brighter skin with minimal irritation. Skin Better’s AlphaRet cream reduces fine lines, uneven texture, and dullness while keeping your skin hydrated and soft overnight.',135,30,'IN_STOCK',5,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527161/c3m5mptrliycnsrexhvw.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527160/yijwn2okyffn9hxawstb.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527159/ihetctwblcqz5qbl7uxz.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527161/jjj7ctjk0wlxyz5qdbjm.png\"]','Anti-Aging, Night Care','2024-12-18 13:06:00.547','2024-12-18 13:09:29.746'),(5,'SkinCeuticals - C E Ferulic Serum','The gold standard of Vitamin C serums, SkinCeuticals C E Ferulic combines 15% pure Vitamin C, 1% Vitamin E, and 0.5% Ferulic Acid to protect against environmental damage while brightening and firming your skin. Perfect for those battling dullness, hyperpigmentation, and aging',169,30,'IN_STOCK',20,'[\"https://res.cloudinary.com/doprycptz/image/upload/v1734527503/vxvgxzkwbgldhzi1q5kj.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527503/rxporakmopidlpy57psq.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527497/tqkvcwgkivu1decfgqzc.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527502/c1nxs6dhuixeo6e4ff27.png\",\"https://res.cloudinary.com/doprycptz/image/upload/v1734527500/iveamcbqpzjmqd91ofnk.png\"]','Brightening, Anti-Aging, Serums','2024-12-18 13:11:42.184','2024-12-18 13:12:34.468');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `Service` VALUES (1,'Achieve Glowing Skin with Our Personalized Facial Treatments','Facials, Skincare','https://res.cloudinary.com/doprycptz/image/upload/v1734528620/nyefpip5pgkofdsjbdvx.png','<p>Have you ever looked in the mirror and wished for that natural glow? Our skin is<br>constantly exposed to stress, pollution, and aging factors that take a toll on its radiance.<br>At Rejuva Glow Beauty, we believe every skin type has the potential to shine—and our<br>facial treatments are crafted to make that happen.<br><br>Whether you’re struggling with acne scars, fine lines, or dullness, we offer a range of<br>facials tailored just for you. Indulge in a rejuvenating HydraFacial to deeply cleanse,<br>hydrate, and refresh your skin, or opt for our Anti-Wrinkle Treatments to smooth<br>away time’s effects. If acne and scars are your main concern, our targeted treatments<br>will renew and heal your complexion.<br><br>The beauty of our facials lies in their customization. Our skilled estheticians analyze<br>your skin to choose the right products and techniques for optimal results. Imagine step ping out with radiant, smooth, and healthy skin that not only looks amazing but feels<br>rejuvenated too. Treat yourself to the glow you deserve—because beautiful skin starts<br>here!</p>','2024-12-18 13:30:18.843','2024-12-18 13:30:18.843',1),(2,'Head Spa','Stress Relief, Hydro Dermabrasion','https://res.cloudinary.com/doprycptz/image/upload/v1734528946/jgtrazqrid9vbpguidzq.png','<p>Stress doesn’t just live in your mind—it builds up in your body, especially on your scalp.<br>If you’ve been feeling overwhelmed, suffering from tension headaches, or noticing hair<br>thinning, it’s time to experience the magic of our <strong>Head Spa Treatments.</strong></p><p><br>At Rejuva Glow Beauty, we combine ancient techniques with modern technology to<br>offer a deeply relaxing and effective experience. Our Hydro Dermabrasion Scalp<br>Treatment thoroughly cleanses and revitalizes the scalp, promoting healthy hair growth<br>by removing buildup and stimulating circulation. Pair this with our luxurious Gua Sha<br>Scalp Massage, a treatment known to relieve stress, improve blood flow, and leave you<br>feeling recharged.<br><br>A head spa is more than just relaxation—it’s about self-care, healing, and giving your<br>scalp the attention it deserves. Close your eyes, breathe deeply, and let us melt away<br>your stress while promoting healthy, luscious hair. Because when your scalp is happy,<br>your mind and hair thrive!</p>','2024-12-18 13:35:45.146','2024-12-18 13:35:45.146',1),(3,' Waxing Services','Waxing, Hair Removal','https://res.cloudinary.com/doprycptz/image/upload/v1734529082/nr4nk3zwxrncuc7apzal.png','<p>We all know the feeling—standing in front of the mirror and noticing hair where you<br>don’t want it. Shaving every few days gets frustrating, and razors never leave your skin<br>as smooth as you want. At Rejuva Glow Beauty, we’ve got the solution: professional<br>waxing services for every part of your body.<br><br>Whether you’re prepping for vacation, a big event, or just want to feel amazing in<br>your skin, our gentle yet effective waxing services are perfect for you. From Brazilian<br>waxes for a clean, confident feel to facial waxing that smooths away pesky peach fuzz,<br>we cater to all areas: arms, legs, back, and more.<br><br>We use premium wax to ensure a quick, comfortable experience with long-lasting<br>results. Say goodbye to nicks, bumps, and stubble—waxing leaves your skin soft, smooth,<br>and hair-free for weeks. Trust us, you’ll love the confidence that comes from feeling silky smooth. Book your session today and embrace the freedom of beautiful, hair-free skin!</p>','2024-12-18 13:38:01.393','2024-12-18 13:38:01.393',1),(4,'Advanced Skincare Treatments','Chemical Peels, Micro needling','https://res.cloudinary.com/doprycptz/image/upload/v1734529503/c3ay6hxfdwezlyxpcws6.png','<p>Sometimes, our skin needs a little more than a basic routine to look and feel its best.<br>That’s where our<strong> advanced skincare treatments</strong> come in—tailored solutions designed<br>to tackle deeper concerns like wrinkles, acne scars, and uneven skin tone.<br><br>At Rejuva Glow Beauty, we offer results-driven treatments like <strong>Chemical Peels</strong> to ex foliate and renew your skin, removing layers of dullness and revealing a bright, even com plexion. For those struggling with deeper scars and signs of aging, our <strong>Micro needling</strong><br>and <strong>Microdermabrasion </strong>treatments stimulate collagen production to smooth and re juvenate your skin.<br><br>We also provide <strong>Photo Facials</strong> for precise correction and<strong> Face Analyzing</strong> services<br>to help you understand your skin’s unique needs. These treatments go beyond the surface<br>to heal, repair, and transform. Think of it as an investment in your long-term beauty<br>and confidence—because glowing, youthful skin never goes out of style!</p>','2024-12-18 13:45:01.594','2024-12-18 13:45:01.594',1),(5,'Massage and Relaxation Add-Ons','Massage, LED Therapy','https://res.cloudinary.com/doprycptz/image/upload/v1734529728/bveqkwn7xp7satjsnfti.png','<p>Life can be stressful, but self-care doesn’t have to be complicated. Our <strong>relaxation add </strong></p><p><strong>on treatments</strong> are perfect for those moments when you need to unwind, recharge, and<br>pamper yourself.<br><br>Enjoy the therapeutic touch of our <strong>Neck and Shoulder Massage</strong>, designed to melt<br>away tension and leave you feeling completely at ease. Want to elevate your facial? Try<br>a soothing <strong>Gua Sha Massage,</strong> an ancient practice that promotes circulation, reduces<br>puffiness, and relieves facial stress.<br><br>For a glow from within, experience our <strong>LED Light Therapy</strong>, a modern treatment<br>that targets everything from acne to fine lines with the power of light. These add-ons<br>are the perfect finishing touch to any beauty session, ensuring you leave feeling relaxed,<br>refreshed, and absolutely radiant. Treat yourself—you deserve it!</p>','2024-12-18 13:48:46.627','2024-12-18 13:48:46.627',1),(6,'Specialized Add-On Treatments','Dermaplaning, Jelly Masks','https://res.cloudinary.com/doprycptz/image/upload/v1734529934/nflsgduidokjnvwenzhl.png','<p>Sometimes it’s the little extras that make the biggest difference. Our<strong> specialized add-on<br>treatments </strong>are designed to enhance your beauty experience and give your skin exactly<br>what it needs.<br><br>Tired of dull, flaky skin? <strong>Dermaplaning</strong> is the ultimate exfoliation, removing dead<br>skin cells and peach fuzz to reveal smooth, glowing skin. Need a hydration boost?<br>Our cooling <strong>Jelly Masks </strong>soothe and nourish tired, stressed skin. We also offer <strong>High Frequency Treatments</strong> </p><p>to combat breakouts and improve skin tone, while our <strong>Sun burn Soothing Treatments </strong>heal and calm irritated skin.<br><br>These quick yet powerful treatments are the perfect way to customize and enhance<br>your visit, ensuring your skin feels pampered and perfected. Don’t settle for ordinary—<br>give your skin the attention it craves and enjoy exceptional results!</p>','2024-12-18 13:52:13.756','2024-12-18 13:52:13.756',1),(1,'Achieve Glowing Skin with Our Personalized Facial Treatments','Facials, Skincare','https://res.cloudinary.com/doprycptz/image/upload/v1734528620/nyefpip5pgkofdsjbdvx.png','<p>Have you ever looked in the mirror and wished for that natural glow? Our skin is<br>constantly exposed to stress, pollution, and aging factors that take a toll on its radiance.<br>At Rejuva Glow Beauty, we believe every skin type has the potential to shine—and our<br>facial treatments are crafted to make that happen.<br><br>Whether you’re struggling with acne scars, fine lines, or dullness, we offer a range of<br>facials tailored just for you. Indulge in a rejuvenating HydraFacial to deeply cleanse,<br>hydrate, and refresh your skin, or opt for our Anti-Wrinkle Treatments to smooth<br>away time’s effects. If acne and scars are your main concern, our targeted treatments<br>will renew and heal your complexion.<br><br>The beauty of our facials lies in their customization. Our skilled estheticians analyze<br>your skin to choose the right products and techniques for optimal results. Imagine step ping out with radiant, smooth, and healthy skin that not only looks amazing but feels<br>rejuvenated too. Treat yourself to the glow you deserve—because beautiful skin starts<br>here!</p>','2024-12-18 13:30:18.843','2024-12-18 13:30:18.843',1),(2,'Head Spa','Stress Relief, Hydro Dermabrasion','https://res.cloudinary.com/doprycptz/image/upload/v1734528946/jgtrazqrid9vbpguidzq.png','<p>Stress doesn’t just live in your mind—it builds up in your body, especially on your scalp.<br>If you’ve been feeling overwhelmed, suffering from tension headaches, or noticing hair<br>thinning, it’s time to experience the magic of our <strong>Head Spa Treatments.</strong></p><p><br>At Rejuva Glow Beauty, we combine ancient techniques with modern technology to<br>offer a deeply relaxing and effective experience. Our Hydro Dermabrasion Scalp<br>Treatment thoroughly cleanses and revitalizes the scalp, promoting healthy hair growth<br>by removing buildup and stimulating circulation. Pair this with our luxurious Gua Sha<br>Scalp Massage, a treatment known to relieve stress, improve blood flow, and leave you<br>feeling recharged.<br><br>A head spa is more than just relaxation—it’s about self-care, healing, and giving your<br>scalp the attention it deserves. Close your eyes, breathe deeply, and let us melt away<br>your stress while promoting healthy, luscious hair. Because when your scalp is happy,<br>your mind and hair thrive!</p>','2024-12-18 13:35:45.146','2024-12-18 13:35:45.146',1),(3,' Waxing Services','Waxing, Hair Removal','https://res.cloudinary.com/doprycptz/image/upload/v1734529082/nr4nk3zwxrncuc7apzal.png','<p>We all know the feeling—standing in front of the mirror and noticing hair where you<br>don’t want it. Shaving every few days gets frustrating, and razors never leave your skin<br>as smooth as you want. At Rejuva Glow Beauty, we’ve got the solution: professional<br>waxing services for every part of your body.<br><br>Whether you’re prepping for vacation, a big event, or just want to feel amazing in<br>your skin, our gentle yet effective waxing services are perfect for you. From Brazilian<br>waxes for a clean, confident feel to facial waxing that smooths away pesky peach fuzz,<br>we cater to all areas: arms, legs, back, and more.<br><br>We use premium wax to ensure a quick, comfortable experience with long-lasting<br>results. Say goodbye to nicks, bumps, and stubble—waxing leaves your skin soft, smooth,<br>and hair-free for weeks. Trust us, you’ll love the confidence that comes from feeling silky smooth. Book your session today and embrace the freedom of beautiful, hair-free skin!</p>','2024-12-18 13:38:01.393','2024-12-18 13:38:01.393',1),(4,'Advanced Skincare Treatments','Chemical Peels, Micro needling','https://res.cloudinary.com/doprycptz/image/upload/v1734529503/c3ay6hxfdwezlyxpcws6.png','<p>Sometimes, our skin needs a little more than a basic routine to look and feel its best.<br>That’s where our<strong> advanced skincare treatments</strong> come in—tailored solutions designed<br>to tackle deeper concerns like wrinkles, acne scars, and uneven skin tone.<br><br>At Rejuva Glow Beauty, we offer results-driven treatments like <strong>Chemical Peels</strong> to ex foliate and renew your skin, removing layers of dullness and revealing a bright, even com plexion. For those struggling with deeper scars and signs of aging, our <strong>Micro needling</strong><br>and <strong>Microdermabrasion </strong>treatments stimulate collagen production to smooth and re juvenate your skin.<br><br>We also provide <strong>Photo Facials</strong> for precise correction and<strong> Face Analyzing</strong> services<br>to help you understand your skin’s unique needs. These treatments go beyond the surface<br>to heal, repair, and transform. Think of it as an investment in your long-term beauty<br>and confidence—because glowing, youthful skin never goes out of style!</p>','2024-12-18 13:45:01.594','2024-12-18 13:45:01.594',1),(5,'Massage and Relaxation Add-Ons','Massage, LED Therapy','https://res.cloudinary.com/doprycptz/image/upload/v1734529728/bveqkwn7xp7satjsnfti.png','<p>Life can be stressful, but self-care doesn’t have to be complicated. Our <strong>relaxation add </strong></p><p><strong>on treatments</strong> are perfect for those moments when you need to unwind, recharge, and<br>pamper yourself.<br><br>Enjoy the therapeutic touch of our <strong>Neck and Shoulder Massage</strong>, designed to melt<br>away tension and leave you feeling completely at ease. Want to elevate your facial? Try<br>a soothing <strong>Gua Sha Massage,</strong> an ancient practice that promotes circulation, reduces<br>puffiness, and relieves facial stress.<br><br>For a glow from within, experience our <strong>LED Light Therapy</strong>, a modern treatment<br>that targets everything from acne to fine lines with the power of light. These add-ons<br>are the perfect finishing touch to any beauty session, ensuring you leave feeling relaxed,<br>refreshed, and absolutely radiant. Treat yourself—you deserve it!</p>','2024-12-18 13:48:46.627','2024-12-18 13:48:46.627',1),(6,'Specialized Add-On Treatments','Dermaplaning, Jelly Masks','https://res.cloudinary.com/doprycptz/image/upload/v1734529934/nflsgduidokjnvwenzhl.png','<p>Sometimes it’s the little extras that make the biggest difference. Our<strong> specialized add-on<br>treatments </strong>are designed to enhance your beauty experience and give your skin exactly<br>what it needs.<br><br>Tired of dull, flaky skin? <strong>Dermaplaning</strong> is the ultimate exfoliation, removing dead<br>skin cells and peach fuzz to reveal smooth, glowing skin. Need a hydration boost?<br>Our cooling <strong>Jelly Masks </strong>soothe and nourish tired, stressed skin. We also offer <strong>High Frequency Treatments</strong> </p><p>to combat breakouts and improve skin tone, while our <strong>Sun burn Soothing Treatments </strong>heal and calm irritated skin.<br><br>These quick yet powerful treatments are the perfect way to customize and enhance<br>your visit, ensuring your skin feels pampered and perfected. Don’t settle for ordinary—<br>give your skin the attention it craves and enjoy exceptional results!</p>','2024-12-18 13:52:13.756','2024-12-18 13:52:13.756',1),(1,'Achieve Glowing Skin with Our Personalized Facial Treatments','Facials, Skincare','https://res.cloudinary.com/doprycptz/image/upload/v1734528620/nyefpip5pgkofdsjbdvx.png','<p>Have you ever looked in the mirror and wished for that natural glow? Our skin is<br>constantly exposed to stress, pollution, and aging factors that take a toll on its radiance.<br>At Rejuva Glow Beauty, we believe every skin type has the potential to shine—and our<br>facial treatments are crafted to make that happen.<br><br>Whether you’re struggling with acne scars, fine lines, or dullness, we offer a range of<br>facials tailored just for you. Indulge in a rejuvenating HydraFacial to deeply cleanse,<br>hydrate, and refresh your skin, or opt for our Anti-Wrinkle Treatments to smooth<br>away time’s effects. If acne and scars are your main concern, our targeted treatments<br>will renew and heal your complexion.<br><br>The beauty of our facials lies in their customization. Our skilled estheticians analyze<br>your skin to choose the right products and techniques for optimal results. Imagine step ping out with radiant, smooth, and healthy skin that not only looks amazing but feels<br>rejuvenated too. Treat yourself to the glow you deserve—because beautiful skin starts<br>here!</p>','2024-12-18 13:30:18.843','2024-12-18 13:30:18.843',1),(2,'Head Spa','Stress Relief, Hydro Dermabrasion','https://res.cloudinary.com/doprycptz/image/upload/v1734528946/jgtrazqrid9vbpguidzq.png','<p>Stress doesn’t just live in your mind—it builds up in your body, especially on your scalp.<br>If you’ve been feeling overwhelmed, suffering from tension headaches, or noticing hair<br>thinning, it’s time to experience the magic of our <strong>Head Spa Treatments.</strong></p><p><br>At Rejuva Glow Beauty, we combine ancient techniques with modern technology to<br>offer a deeply relaxing and effective experience. Our Hydro Dermabrasion Scalp<br>Treatment thoroughly cleanses and revitalizes the scalp, promoting healthy hair growth<br>by removing buildup and stimulating circulation. Pair this with our luxurious Gua Sha<br>Scalp Massage, a treatment known to relieve stress, improve blood flow, and leave you<br>feeling recharged.<br><br>A head spa is more than just relaxation—it’s about self-care, healing, and giving your<br>scalp the attention it deserves. Close your eyes, breathe deeply, and let us melt away<br>your stress while promoting healthy, luscious hair. Because when your scalp is happy,<br>your mind and hair thrive!</p>','2024-12-18 13:35:45.146','2024-12-18 13:35:45.146',1),(3,' Waxing Services','Waxing, Hair Removal','https://res.cloudinary.com/doprycptz/image/upload/v1734529082/nr4nk3zwxrncuc7apzal.png','<p>We all know the feeling—standing in front of the mirror and noticing hair where you<br>don’t want it. Shaving every few days gets frustrating, and razors never leave your skin<br>as smooth as you want. At Rejuva Glow Beauty, we’ve got the solution: professional<br>waxing services for every part of your body.<br><br>Whether you’re prepping for vacation, a big event, or just want to feel amazing in<br>your skin, our gentle yet effective waxing services are perfect for you. From Brazilian<br>waxes for a clean, confident feel to facial waxing that smooths away pesky peach fuzz,<br>we cater to all areas: arms, legs, back, and more.<br><br>We use premium wax to ensure a quick, comfortable experience with long-lasting<br>results. Say goodbye to nicks, bumps, and stubble—waxing leaves your skin soft, smooth,<br>and hair-free for weeks. Trust us, you’ll love the confidence that comes from feeling silky smooth. Book your session today and embrace the freedom of beautiful, hair-free skin!</p>','2024-12-18 13:38:01.393','2024-12-18 13:38:01.393',1),(4,'Advanced Skincare Treatments','Chemical Peels, Micro needling','https://res.cloudinary.com/doprycptz/image/upload/v1734529503/c3ay6hxfdwezlyxpcws6.png','<p>Sometimes, our skin needs a little more than a basic routine to look and feel its best.<br>That’s where our<strong> advanced skincare treatments</strong> come in—tailored solutions designed<br>to tackle deeper concerns like wrinkles, acne scars, and uneven skin tone.<br><br>At Rejuva Glow Beauty, we offer results-driven treatments like <strong>Chemical Peels</strong> to ex foliate and renew your skin, removing layers of dullness and revealing a bright, even com plexion. For those struggling with deeper scars and signs of aging, our <strong>Micro needling</strong><br>and <strong>Microdermabrasion </strong>treatments stimulate collagen production to smooth and re juvenate your skin.<br><br>We also provide <strong>Photo Facials</strong> for precise correction and<strong> Face Analyzing</strong> services<br>to help you understand your skin’s unique needs. These treatments go beyond the surface<br>to heal, repair, and transform. Think of it as an investment in your long-term beauty<br>and confidence—because glowing, youthful skin never goes out of style!</p>','2024-12-18 13:45:01.594','2024-12-18 13:45:01.594',1),(5,'Massage and Relaxation Add-Ons','Massage, LED Therapy','https://res.cloudinary.com/doprycptz/image/upload/v1734529728/bveqkwn7xp7satjsnfti.png','<p>Life can be stressful, but self-care doesn’t have to be complicated. Our <strong>relaxation add </strong></p><p><strong>on treatments</strong> are perfect for those moments when you need to unwind, recharge, and<br>pamper yourself.<br><br>Enjoy the therapeutic touch of our <strong>Neck and Shoulder Massage</strong>, designed to melt<br>away tension and leave you feeling completely at ease. Want to elevate your facial? Try<br>a soothing <strong>Gua Sha Massage,</strong> an ancient practice that promotes circulation, reduces<br>puffiness, and relieves facial stress.<br><br>For a glow from within, experience our <strong>LED Light Therapy</strong>, a modern treatment<br>that targets everything from acne to fine lines with the power of light. These add-ons<br>are the perfect finishing touch to any beauty session, ensuring you leave feeling relaxed,<br>refreshed, and absolutely radiant. Treat yourself—you deserve it!</p>','2024-12-18 13:48:46.627','2024-12-18 13:48:46.627',1),(6,'Specialized Add-On Treatments','Dermaplaning, Jelly Masks','https://res.cloudinary.com/doprycptz/image/upload/v1734529934/nflsgduidokjnvwenzhl.png','<p>Sometimes it’s the little extras that make the biggest difference. Our<strong> specialized add-on<br>treatments </strong>are designed to enhance your beauty experience and give your skin exactly<br>what it needs.<br><br>Tired of dull, flaky skin? <strong>Dermaplaning</strong> is the ultimate exfoliation, removing dead<br>skin cells and peach fuzz to reveal smooth, glowing skin. Need a hydration boost?<br>Our cooling <strong>Jelly Masks </strong>soothe and nourish tired, stressed skin. We also offer <strong>High Frequency Treatments</strong> </p><p>to combat breakouts and improve skin tone, while our <strong>Sun burn Soothing Treatments </strong>heal and calm irritated skin.<br><br>These quick yet powerful treatments are the perfect way to customize and enhance<br>your visit, ensuring your skin feels pampered and perfected. Don’t settle for ordinary—<br>give your skin the attention it craves and enjoy exceptional results!</p>','2024-12-18 13:52:13.756','2024-12-18 13:52:13.756',1);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonial`
--

DROP TABLE IF EXISTS `testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonial`
--

LOCK TABLES `testimonial` WRITE;
/*!40000 ALTER TABLE `testimonial` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'johnny@gmail.com',NULL,38,'2024-12-18 18:44:11.262','$2b$10$eQzPuIrivIyKVBFPZC5iQ.3/PhtW8w0h38aFQT7dVEmvYjjmexisi','admin'),(1,'johnny@gmail.com',NULL,38,'2024-12-18 18:44:11.262','$2b$10$eQzPuIrivIyKVBFPZC5iQ.3/PhtW8w0h38aFQT7dVEmvYjjmexisi','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-20  1:20:37
