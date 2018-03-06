-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: mesh
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionID` int(11) NOT NULL,
  `answerContent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `isCorrect` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appearances`
--

DROP TABLE IF EXISTS `appearances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appearances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `spaceID` int(10) unsigned NOT NULL,
  `eventID` int(11) DEFAULT NULL,
  `occasion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appearances_spaceid_foreign` (`spaceID`),
  CONSTRAINT `appearances_spaceid_foreign` FOREIGN KEY (`spaceID`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearances`
--

LOCK TABLES `appearances` WRITE;
/*!40000 ALTER TABLE `appearances` DISABLE KEYS */;
/*!40000 ALTER TABLE `appearances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spaceID` int(10) unsigned NOT NULL,
  `resourceID` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_spaceid_foreign` (`spaceID`),
  CONSTRAINT `bookings_spaceid_foreign` FOREIGN KEY (`spaceID`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendars`
--

DROP TABLE IF EXISTS `calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `eventID` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_eventid_foreign` (`eventID`),
  CONSTRAINT `calendars_eventid_foreign` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendars`
--

LOCK TABLES `calendars` WRITE;
/*!40000 ALTER TABLE `calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categorySlug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categoryImage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `categoryCount` int(11) NOT NULL,
  `categoryColor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categoryTextColor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbinds`
--

DROP TABLE IF EXISTS `cbinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbinds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) NOT NULL,
  `challengeID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbinds`
--

LOCK TABLES `cbinds` WRITE;
/*!40000 ALTER TABLE `cbinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbinds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spaceID` int(11) NOT NULL,
  `challengeImage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `challengeTitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `challengeSlug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `challengeContent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `startDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (1,1,'http://localhost:8000/challenge/bikJ.jpg','title','title','<p>rrr</p>',NULL,NULL,'Approved','2018-03-01 11:03:54','2018-03-01 11:03:54');
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completes`
--

DROP TABLE IF EXISTS `completes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `lectureID` int(11) NOT NULL,
  `grade` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completes`
--

LOCK TABLES `completes` WRITE;
/*!40000 ALTER TABLE `completes` DISABLE KEYS */;
/*!40000 ALTER TABLE `completes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `courseName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseSummary` longtext COLLATE utf8_unicode_ci,
  `courseInformation` longtext COLLATE utf8_unicode_ci,
  `courseImage` longtext COLLATE utf8_unicode_ci,
  `courseThumbnail` longtext COLLATE utf8_unicode_ci,
  `courseInstructorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseInstructorInfo` longtext COLLATE utf8_unicode_ci,
  `courseInstructorAvatar` longtext COLLATE utf8_unicode_ci,
  `courseFeatured` tinyint(1) NOT NULL DEFAULT '0',
  `courseStatus` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Draft',
  `coursePrice` int(11) DEFAULT '0',
  `courseVideo` longtext COLLATE utf8_unicode_ci,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customerID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spaceID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'28','cus_CQu1MUdyfmrMAe','1','2018-03-05 00:09:38','2018-03-05 00:09:38'),(2,'29','cus_CRFR3HO6ezKhoh','1','2018-03-05 22:17:44','2018-03-05 22:17:44'),(3,'30','cus_CRG7Wb9XV4ftvE','1','2018-03-05 22:59:50','2018-03-05 22:59:50'),(4,'31','cus_CRGAZz07fXfxye','1','2018-03-05 23:02:26','2018-03-05 23:02:26');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lectureID` int(11) NOT NULL,
  `fileData` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolls`
--

DROP TABLE IF EXISTS `enrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `enrollStatus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolls`
--

LOCK TABLES `enrolls` WRITE;
/*!40000 ALTER TABLE `enrolls` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventdates`
--

DROP TABLE IF EXISTS `eventdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventdates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(10) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventdates_eventid_foreign` (`eventID`),
  CONSTRAINT `eventdates_eventid_foreign` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventdates`
--

LOCK TABLES `eventdates` WRITE;
/*!40000 ALTER TABLE `eventdates` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventorganizers`
--

DROP TABLE IF EXISTS `eventorganizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventorganizers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `eventID` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventorganizers_eventid_foreign` (`eventID`),
  CONSTRAINT `eventorganizers_eventid_foreign` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventorganizers`
--

LOCK TABLES `eventorganizers` WRITE;
/*!40000 ALTER TABLE `eventorganizers` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventorganizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `spaceID` int(11) NOT NULL,
  `multiday` tinyint(1) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` double(8,2) DEFAULT NULL,
  `lon` double(8,2) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventskills`
--

DROP TABLE IF EXISTS `eventskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventskills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(10) unsigned NOT NULL,
  `skillID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventskills_eventid_foreign` (`eventID`),
  CONSTRAINT `eventskills_eventid_foreign` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventskills`
--

LOCK TABLES `eventskills` WRITE;
/*!40000 ALTER TABLE `eventskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `eventID` int(10) unsigned NOT NULL,
  `path` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_eventid_foreign` (`eventID`),
  CONSTRAINT `files_eventid_foreign` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `spaceID` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invites_spaceid_foreign` (`spaceID`),
  CONSTRAINT `invites_spaceid_foreign` FOREIGN KEY (`spaceID`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonID` int(11) NOT NULL,
  `lectureName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lectureContent` longtext COLLATE utf8_unicode_ci,
  `lectureType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lectureVideo` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseID` int(11) NOT NULL,
  `lessonName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000003_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_11_12_000000_create_roles_table',1),(4,'2017_09_26_193904_workspaces',1),(5,'2017_09_26_194037_events',1),(6,'2017_09_26_194130_calendars',1),(7,'2017_09_26_194217_appearances',1),(8,'2017_09_26_194310_invites',1),(9,'2017_09_26_194600_bookings',1),(10,'2017_09_26_200959_skills',1),(11,'2017_09_26_201337_userskills',1),(12,'2017_09_26_205823_notifications',1),(13,'2017_09_26_210059_files',1),(14,'2017_09_26_210224_opts',1),(15,'2017_12_03_032431_challenges',1),(16,'2017_12_03_032550_categories',1),(17,'2017_12_03_032654_uploads',1),(18,'2017_12_03_034252_cbinds',1),(19,'2017_12_04_035711_ptbinds',1),(20,'2017_12_06_161312_sponsers',1),(21,'2017_12_07_015531_sponserevents',1),(22,'2017_12_07_015608_sponserspaces',1),(23,'2017_12_19_040840_eventdates',1),(24,'2017_12_19_052748_eventskills',1),(25,'2017_12_19_155643_eventorganizers',1),(26,'2018_01_04_192951_Subscriptionplans',1),(27,'2018_01_19_151909_photos',1),(28,'2018_01_23_025233_resources',1),(29,'2018_02_26_205200_courses',1),(30,'2018_02_26_205215_lessons',1),(31,'2018_02_26_205223_lectures',1),(32,'2018_02_26_205240_enrolls',1),(33,'2018_02_26_205250_completes',1),(34,'2018_02_26_205256_questions',1),(35,'2018_02_26_205303_answers',1),(36,'2018_02_26_205314_solutions',1),(37,'2018_02_26_205338_documents',1),(38,'2018_02_26_205359_subjects',1),(39,'2018_03_04_163132_subscriptions',2),(40,'2018_03_04_181446_customers',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `body` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opts`
--

DROP TABLE IF EXISTS `opts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spaceID` int(11) NOT NULL,
  `eventID` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opts_eventid_foreign` (`eventID`),
  CONSTRAINT `opts_eventid_foreign` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opts`
--

LOCK TABLES `opts` WRITE;
/*!40000 ALTER TABLE `opts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spaceID` int(11) NOT NULL,
  `photoUrl` text COLLATE utf8_unicode_ci NOT NULL,
  `photoThumbnail` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (9,1,'http://localhost:8000/storage/gallery/vpM8cACuSJEyTne.jpg','http://localhost:8000/storage/gallery/thumbnails/vpM8cACuSJEyTne_thumbnail.png','2018-03-01 10:21:27','2018-03-01 10:21:27');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ptbinds`
--

DROP TABLE IF EXISTS `ptbinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ptbinds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `challengeID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ptbinds`
--

LOCK TABLES `ptbinds` WRITE;
/*!40000 ALTER TABLE `ptbinds` DISABLE KEYS */;
INSERT INTO `ptbinds` VALUES (1,1,1,'2018-03-01 11:04:10','2018-03-01 11:04:10');
/*!40000 ALTER TABLE `ptbinds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lectureID` int(11) NOT NULL,
  `questionContent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questionType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spaceID` int(11) NOT NULL,
  `resourceName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resourceEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resourceDays` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resourceStartTime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resourceEndTime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resourceIncrement` int(11) NOT NULL DEFAULT '60',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'html',NULL,NULL);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solutions`
--

DROP TABLE IF EXISTS `solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solutions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponserevents`
--

DROP TABLE IF EXISTS `sponserevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponserevents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(10) unsigned NOT NULL,
  `sponserID` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sponserevents_eventid_foreign` (`eventID`),
  KEY `sponserevents_sponserid_foreign` (`sponserID`),
  CONSTRAINT `sponserevents_eventid_foreign` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sponserevents_sponserid_foreign` FOREIGN KEY (`sponserID`) REFERENCES `sponsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponserevents`
--

LOCK TABLES `sponserevents` WRITE;
/*!40000 ALTER TABLE `sponserevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponserevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsers`
--

DROP TABLE IF EXISTS `sponsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sponsers_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsers`
--

LOCK TABLES `sponsers` WRITE;
/*!40000 ALTER TABLE `sponsers` DISABLE KEYS */;
INSERT INTO `sponsers` VALUES (1,'sponsor','google.com','http://localhost:8000/storage/logo/e9d10e63d70a1c1a934fcfbbce74adc5.jpg','2018-02-28 23:25:34','2018-02-28 23:25:34');
/*!40000 ALTER TABLE `sponsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponserspaces`
--

DROP TABLE IF EXISTS `sponserspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponserspaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spaceID` int(10) unsigned NOT NULL,
  `sponserID` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sponserspaces_spaceid_foreign` (`spaceID`),
  KEY `sponserspaces_sponserid_foreign` (`sponserID`),
  CONSTRAINT `sponserspaces_spaceid_foreign` FOREIGN KEY (`spaceID`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sponserspaces_sponserid_foreign` FOREIGN KEY (`sponserID`) REFERENCES `sponsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponserspaces`
--

LOCK TABLES `sponserspaces` WRITE;
/*!40000 ALTER TABLE `sponserspaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponserspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionplans`
--

DROP TABLE IF EXISTS `subscriptionplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptionplans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spaceID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionplans`
--

LOCK TABLES `subscriptionplans` WRITE;
/*!40000 ALTER TABLE `subscriptionplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subcriptionID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spaceID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,'27','sub_CQtqgJQdFnJRhc','1','2018-03-04 23:59:02','2018-03-04 23:59:02'),(2,'28','sub_CQu1wcWFMXR2En','1','2018-03-05 00:09:38','2018-03-05 00:09:38'),(3,'29','sub_CRFR0JZ7kC9nNS','1','2018-03-05 22:17:44','2018-03-05 22:17:44'),(4,'31','sub_CRGA07TzN5EzhV','1','2018-03-05 23:02:26','2018-03-05 23:02:26');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `challengeID` int(11) NOT NULL,
  `fileData` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fileName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roleID` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spaceID` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `avatar` mediumtext COLLATE utf8_unicode_ci,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `github` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `behance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  `subscriber` tinyint(1) NOT NULL DEFAULT '0',
  `skills` text COLLATE utf8_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'austin',2,'austin@mail.com','$2y$10$8O2m/ASpo77PPe2vhFdOoOs0EyGx0pDLBA3Zn/REFxjbcWjKa2hRu',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/mop.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'2018-02-28 23:22:55','2018-02-28 23:22:55'),(2,'foobarman',3,'foo@mail.com','$2y$10$30ld2Ec6lY938iFfvEI8u.ruXXBrlQ8PPGlR33hw3IkI6kJj0cNVC',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-03 07:07:00','2018-03-03 07:07:00'),(3,'ddd',3,'ddd@mail.com','$2y$10$fYauPwdzvQMPw.oMC4ZBM.Say4Qnd5X7HTETJkTHSJ6Olupi1kGda',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_o4iky2gRae1s2wio8o2_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-03 22:54:44','2018-03-03 22:54:44'),(4,'ggg',3,'ggg@mail.com','$2y$10$ac0bP7IhK2OVEh7xIBR5MOk3faKPyTx5Ug7MjAtCQmrZ.H46RX6wW',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-03 23:45:16','2018-03-03 23:45:16'),(5,'sssa',3,'sssa@mail.com','$2y$10$KkgqX0DsDNNWmYvr.xywh.vb0lRUV8r9RiMxXL7cMYTlx57XT3HEa',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-03 23:51:17','2018-03-03 23:51:17'),(6,'dd',3,'dd','$2y$10$n/sPBuVRD2.wTdOhqMwIuOKtUsxVK9GGllMKKfDEt7jwVmJdpVupe',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:01:39','2018-03-04 00:01:39'),(7,'k',3,'k@mail.com','$2y$10$ugNQlovyIhKtZfREFUPIRu6jm.Uu3JvGfFKZ0wr82qbx8m72YLPCi',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_o4iky2gRae1s2wio8o2_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:04:14','2018-03-04 00:04:14'),(8,'ks',3,'ks@mail.com','$2y$10$qT/1jojE8gIfpLdUITftLuPnxZB91/KrXq.9e1oW7HVu//WJtvvC.',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_o4iky2gRae1s2wio8o2_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:05:35','2018-03-04 00:05:35'),(9,'ks',3,'kss@mail.com','$2y$10$LxK1yBU4h3H7c/9akKRw/.//ngvcjPLMMGJxWET7PmU1V3i5FS3Aq',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_o4iky2gRae1s2wio8o2_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:06:32','2018-03-04 00:06:32'),(10,'ks',3,'ksss@mail.com','$2y$10$x7zKmtDXqPfe5ICLrnUI1O8t51/k2y/VwFdM213Pqhu0ZExeN7UW.',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_o4iky2gRae1s2wio8o2_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:12:29','2018-03-04 00:12:29'),(11,'ks',3,'kssss@mail.com','$2y$10$48H4sd4AlDqCMb5Dxwp.Wu4HnkeKFS3vF2b2sIdL8ea2XYZjpvphC',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_o4iky2gRae1s2wio8o2_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:13:17','2018-03-04 00:13:17'),(12,'ks',3,'ksssds@mail.com','$2y$10$BI3W8zaNo0ZBemmmIZzuA.piecFU.iOyT4RfOhmIY3MaVU/iofVY2',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_o4iky2gRae1s2wio8o2_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:14:16','2018-03-04 00:14:16'),(13,'dd',3,'zz@mail.com','$2y$10$vfqj.mmLhx54NbC9MMKn9uDvuge0S7TCHcPb9DV4rCo2QmKsH9a.2',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:37:56','2018-03-04 00:37:56'),(14,'jj',3,'jj@mail.com','$2y$10$5gAalO0ft6l3JIR2IAaL7u1/10jjGbirsFqmtmdnZIDx3drzySMIG',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/Anne-Kendrick-Deep-Thoughts-2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:42:06','2018-03-04 00:42:06'),(15,'aaa',3,'dddswww@mail.com','$2y$10$IiBTQvZ9jWmc8E/OKHnMu.jMV9VwxauJC4hV4Q90F3St.JH7VYtaG',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:47:44','2018-03-04 00:47:44'),(16,'ggg',3,'jjjj','$2y$10$X0mS71JleGfp3CeQZQ9FbObL9R3li6taKbSmsdoBmgL5LRUc/5dpS',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:49:36','2018-03-04 00:49:36'),(17,'mmm',3,'mmmm@mail.com','$2y$10$RXPTNZ9PwRVvj6eWaFxBUOohsmQyPrtH8X41Grb096SBCjGNNFJy.',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:54:27','2018-03-04 00:54:27'),(18,'ddd',3,'xxx@mail.com','$2y$10$rFhe5Krt4hvfwLLSeT6CMutIW83lRWCNekK8tBY.yX347emOgZpQC',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 00:59:38','2018-03-04 00:59:38'),(19,'kkk',3,'kkk','$2y$10$jPWAXR4tZYZGJqHfQ/QS1uIZeogjKeBBklyrXb4xqDqVJAZct5hnW',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 01:02:58','2018-03-04 01:02:58'),(20,'dddd',3,'gggg@mail.com','$2y$10$okeiydHB.dHYWsUivwuZN.wlRRaGL/H2KHKxVe8pKdEt1gzuIlv8.',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/mop.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 06:22:58','2018-03-04 06:22:58'),(21,'gggg',3,'ggtt@mail.com','$2y$10$Hf2MVhmx1O6Gv68Lv0sfBufaij8Oxx8UK1f3DJW.PEoOYMLxVooWO',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/mop.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 06:26:30','2018-03-04 06:26:30'),(22,'ddd',3,'dudeman@mail.com','$2y$10$RvONcxH07ALLhbPzFL9TLe/tNXok5MXlvmkCQ1Ulodr8JKXbUc8me',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/mop.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 06:47:23','2018-03-04 06:47:23'),(23,'lll',3,'lll','$2y$10$JrchLjKXnVg22DLKheWJJOAbMEm/Ju1IBM5vyKROmDtXw38aPZNMC',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'html',NULL,'2018-03-04 22:55:31','2018-03-04 22:55:31'),(24,'sssss',3,'sssssss','$2y$10$gpHMNPXxRAYBWLpi5nBY4eLjNVMM5oWcHqHAevboOeUzzBjrTbtea',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 23:28:53','2018-03-04 23:28:53'),(25,'lkj',3,'lkj','$2y$10$HK3jkt2lLxSFy8Sdwx9ilOBeTBOrnFW7JPT07Zi/ixTDYodjINy72',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 23:39:54','2018-03-04 23:39:54'),(26,'ttt',3,'ttt','$2y$10$7ljaPH28GPvoeBa4XqDeYO2vQ19jxuLoRonwy8qHsP/Y1TsSYP3j2',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 23:50:35','2018-03-04 23:50:35'),(27,'qqq',3,'qqqss@mail.com','$2y$10$YuENJJwQKRbZW5rTxG2AS.n2vV2F69xUM9jSIXnbe7CUbKkQRMKz6',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-04 23:59:02','2018-03-04 23:59:02'),(28,'hhh',3,'hhh','$2y$10$jywGD/V.N0bXLbcEsvAg/.iU2X1Jl8Sa1zf6WIVeXkQyCttm3yfN.',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_o4iky2gRae1s2wio8o2_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-05 00:09:38','2018-03-05 00:09:38'),(29,'newdude',3,'newdude@mail.com','$2y$10$zVX23WAnSlleFb2m60mQnekstva4xf5IYwCvLumyVRfd8p7z2wEDO',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-05 22:17:44','2018-03-05 22:17:44'),(30,'newlady',3,'newlady','$2y$10$1bjPZNw7oedEzuMWIJc8uuYFQpGmRqeYNduRvbfp7oDZ6Tw4ehwdi',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'html',NULL,'2018-03-05 22:59:50','2018-03-05 22:59:50'),(31,'janedoe',3,'janedoe@mail.com','$2y$10$NcS0sX3dM2AMkh4z0Duig.ksZUs/ks5ykCWpq6yW/WMssseTlwK9e',1,NULL,NULL,NULL,'http://localhost:8000/storage/avatar/tumblr_myzpatPKnO1s9ica0o1_1280.jpg',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'html',NULL,'2018-03-05 23:02:26','2018-03-05 23:02:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userskills`
--

DROP TABLE IF EXISTS `userskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userskills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `skillID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userskills`
--

LOCK TABLES `userskills` WRITE;
/*!40000 ALTER TABLE `userskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `userskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspaces`
--

DROP TABLE IF EXISTS `workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workspaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `lon` double(8,2) NOT NULL,
  `lat` double(8,2) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `logo` mediumtext COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `stripe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pub_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageVisits` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspaces`
--

LOCK TABLES `workspaces` WRITE;
/*!40000 ALTER TABLE `workspaces` DISABLE KEYS */;
INSERT INTO `workspaces` VALUES (1,'space','space','Augusta','540 Telfair St','GA',30909,-81.96,33.47,'austin@mail.com','google.com','1234566','<p>foobar</p>','http://localhost:8000/storage/logo/tumblr_o4iky2gRae1s2wio8o1_1280.jpg','pending','sk_test_mFK7v2MxoaazV6TqJ0dHURiM','pk_test_rJKqFRMRduGAyguxdWT2TfcI',NULL,NULL,NULL,NULL,0,'2018-02-28 23:22:55','2018-02-28 23:22:55');
/*!40000 ALTER TABLE `workspaces` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-06 12:39:08
