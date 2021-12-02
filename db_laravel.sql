-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Current Database: `laravel`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `laravel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `laravel`;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencygetways`
--

DROP TABLE IF EXISTS `currencygetways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencygetways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usergetway_id` bigint unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `rate` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currencygetways_usergetway_id_foreign` (`usergetway_id`),
  KEY `currencygetways_currency_id_foreign` (`currency_id`),
  CONSTRAINT `currencygetways_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `currencygetways_usergetway_id_foreign` FOREIGN KEY (`usergetway_id`) REFERENCES `usergetways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencygetways`
--

LOCK TABLES `currencygetways` WRITE;
/*!40000 ALTER TABLE `currencygetways` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencygetways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `getways`
--

DROP TABLE IF EXISTS `getways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `getways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` double NOT NULL DEFAULT '1',
  `charge` double NOT NULL DEFAULT '1',
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_auto` int NOT NULL DEFAULT '0',
  `image_accept` int NOT NULL DEFAULT '0',
  `test_mode` int NOT NULL DEFAULT '0',
  `customer_status` int NOT NULL DEFAULT '1',
  `global_status` int NOT NULL DEFAULT '1',
  `fraud_checker` int NOT NULL DEFAULT '0',
  `phone_required` int NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `getways`
--

LOCK TABLES `getways` WRITE;
/*!40000 ALTER TABLE `getways` DISABLE KEYS */;
INSERT INTO `getways` VALUES (1,'Paypal','uploads/payment_gateway/paypal.png',10,2,'App\\Lib\\Paypal','USD',1,1,1,1,1,1,0,'{\"client_id\":\"AW39Kgo9jCn2s0mINcHgNXsjqvM2f2L_5kUjpYq1gOJMpRyQ8GJL1gyBmQzzBXqWuvciy9nYa5-m0zBY\",\"client_secret\":\"EF82WUMYr7qUlhGGjrpJWGGGtYnCW8ctGv8IJHqTtYlzHNKOuWRT6cwyAohMFohxXJH7OaoBtQTn4hzT\"}','2021-04-15 02:44:46','2021-11-08 12:26:22'),(2,'Stripe','uploads/payment_gateway/stripe.png',10,2,'App\\Lib\\Stripe','usd',1,0,1,1,1,1,0,'{\"publishable_key\":null,\"secret_key\":null}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(3,'Mollie','uploads/payment_gateway/mollie.png',10,2,'App\\Lib\\Mollie','usd',1,0,1,1,1,1,0,'{\"api_key\":null}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(4,'PayStack','uploads/payment_gateway/paystack.png',10,2,'App\\Lib\\Paystack','usd',1,0,1,1,1,1,0,'{\"public_key\":null,\"secret_key\":null}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(5,'Razorpay','uploads/payment_gateway/razorpay.png',10,2,'App\\Lib\\Razorpay','INR',1,0,1,1,1,1,0,'{\"key_id\":null,\"key_secret\":null}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(6,'Instamojo','uploads/payment_gateway/instamojo.png',54,2,'App\\Lib\\Instamojo','INR',1,0,1,1,1,1,1,'{\"x_api_key\":null,\"x_auth_token\":null}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(7,'ToyyibPay','uploads/payment_gateway/toyyibpay.png',54,2,'App\\Lib\\Toyyibpay','MR',1,0,1,1,1,1,1,'{\"user_secret_key\":null,\"cateogry_code\":null}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(8,'FlutterWave','uploads/payment_gateway/flutterwave.png',54,2,'App\\Lib\\Flutterwave','NGN',1,0,1,1,1,1,1,'{\"public_key\":null,\"secret_key\":null,\"encryption_key\":null,\"payment_options\":\"card\"}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(9,'Payu','uploads/payment_gateway/payu.png',54,2,'App\\Lib\\Payu','INR',1,0,1,1,1,1,1,'{\"merchant_key\":null,\"merchant_salt\":null,\"auth_header\":null}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(10,'Thawani','uploads/payment_gateway/thawani.png',0.38,1,'App\\Lib\\Thawani','OMR',1,0,1,1,1,1,1,'{\"secret_key\":null,\"publishable_key\":null}','2021-04-15 02:44:46','2021-04-15 02:44:46'),(11,'Manual','uploads/payment_gateway/manual.png',1,1,'App\\Lib\\CustomGetway','USD',0,1,1,1,1,0,0,'{\"instruction\":null}','2021-04-15 04:12:12','2021-04-15 04:12:12'),(12,'Mercadopago','uploads/payment_gateway/mercadopago.png',1.2,1,'App\\Lib\\Mercado','USD',1,0,1,1,1,0,0,'{\"secret_key\":null,\"public_key\":null}','2021-04-15 05:40:51','2021-04-15 07:17:13'),(13,'Free',NULL,1,0,'','',0,0,1,0,1,0,0,'',NULL,NULL);
/*!40000 ALTER TABLE `getways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"uuid\":\"fb644c4a-5d87-4f2f-bc23-47ad5b7485eb\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":11:{s:10:\\\"\\u0000*\\u0000details\\\";a:6:{s:6:\\\"sendTo\\\";s:0:\\\"\\\";s:5:\\\"email\\\";s:24:\\\"no-replysicugs@gmail.com\\\";s:4:\\\"name\\\";s:9:\\\"Mike Ford\\\";s:7:\\\"subject\\\";s:27:\\\"Local SEO for more business\\\";s:7:\\\"message\\\";s:422:\\\"Hi there \\r\\n \\r\\nWe will increase your Local Ranks organically and safely, using only whitehat methods, while providing Google maps and website offsite work at the same time. \\r\\n \\r\\nPlease check our pricelist here, we offer Local SEO at cheap rates. \\r\\nhttps:\\/\\/speed-seo.net\\/product\\/local-seo-package\\/ \\r\\n \\r\\nNEW: \\r\\nhttps:\\/\\/www.speed-seo.net\\/product\\/zip-codes-gmaps-citations\\/ \\r\\n \\r\\nregards \\r\\nMike Ford\\r\\n \\r\\nSpeed SEO Digital Agency\\\";s:4:\\\"type\\\";s:12:\\\"contact_mail\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634699390,1634699390),(2,'default','{\"uuid\":\"6cb87e97-543b-46c9-a511-a6f876426d41\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":11:{s:10:\\\"\\u0000*\\u0000details\\\";a:6:{s:6:\\\"sendTo\\\";s:0:\\\"\\\";s:5:\\\"email\\\";s:18:\\\"lanj7962@gmail.com\\\";s:4:\\\"name\\\";s:11:\\\"Donald Cole\\\";s:7:\\\"subject\\\";s:11:\\\"Partnership\\\";s:7:\\\"message\\\";s:276:\\\"Good day \\r\\n \\r\\nI contacted you some days back seeking your cooperation in a matter regarding funds worth $24 Million, I urge you to  get back to me through this email coledd11@cloedcolela.com if you\'re still interested. \\r\\n \\r\\nI await your response. \\r\\n \\r\\nThanks, \\r\\n \\r\\nDonald Cole\\\";s:4:\\\"type\\\";s:12:\\\"contact_mail\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634961019,1634961019),(3,'default','{\"uuid\":\"a810f4a4-4a7e-4bbd-bfa1-e6824382a0b0\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":11:{s:10:\\\"\\u0000*\\u0000details\\\";a:6:{s:6:\\\"sendTo\\\";s:0:\\\"\\\";s:5:\\\"email\\\";s:24:\\\"no-replysicugs@gmail.com\\\";s:4:\\\"name\\\";s:12:\\\"Mike Forster\\\";s:7:\\\"subject\\\";s:45:\\\"Get more dofollow backlinks for masoolpay.com\\\";s:7:\\\"message\\\";s:406:\\\"Hello \\r\\n \\r\\nWe all know the importance that dofollow link have on any website`s ranks. \\r\\nHaving most of your linkbase filled with nofollow ones is of no good for your ranks and SEO metrics. \\r\\n \\r\\nBuy quality dofollow links from us, that will impact your ranks in a positive way \\r\\nhttps:\\/\\/www.digital-x-press.com\\/product\\/150-dofollow-backlinks\\/ \\r\\n \\r\\nBest regards \\r\\nMike Forster\\r\\n \\r\\nsupport@digital-x-press.com\\\";s:4:\\\"type\\\";s:12:\\\"contact_mail\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1635831753,1635831753),(4,'default','{\"uuid\":\"bee0a35a-150f-49e2-9375-c0b1ac753c54\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":11:{s:10:\\\"\\u0000*\\u0000details\\\";a:6:{s:6:\\\"sendTo\\\";s:0:\\\"\\\";s:5:\\\"email\\\";s:24:\\\"no-replysicugs@gmail.com\\\";s:4:\\\"name\\\";s:11:\\\"Mike Taylor\\\";s:7:\\\"subject\\\";s:32:\\\"Strengthen your Domain Authority\\\";s:7:\\\"message\\\";s:433:\\\"Hi there \\r\\n \\r\\nDo you want a quick boost in ranks and sales for your website? \\r\\nHaving a high DA score, always helps \\r\\n \\r\\nGet your masoolpay.com to have a DA between 50 to 60 points in Moz with us today and reap the benefits of such a great feat. \\r\\n \\r\\nSee our offers here: \\r\\nhttps:\\/\\/www.strictlydigital.net\\/product\\/moz-da50-seo-plan\\/ \\r\\n \\r\\nOn SALE: \\r\\nhttps:\\/\\/www.strictlydigital.net\\/product\\/ahrefs-dr60\\/ \\r\\n \\r\\n \\r\\nThank you \\r\\nMike Taylor\\\";s:4:\\\"type\\\";s:12:\\\"contact_mail\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1636396821,1636396821);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en',NULL,'English',1,'2021-05-04 22:25:06','2021-10-11 16:20:20'),(2,'ar',NULL,'Arabic',1,'2021-10-11 16:17:34','2021-10-11 16:20:20');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Header','header','[{\"text\":\"الرئيسية\",\"href\":\"/\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"دليل الاستخدام\",\"href\":\"/docs\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"الاسعار\",\"href\":\"/pricing\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"المدونة\",\"href\":\"/blog\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"الخدمات\",\"href\":\"/service\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"تسجيل الدخول\",\"href\":\"/login\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"}]','ar',1,'2021-05-04 22:32:49','2021-10-11 16:19:30'),(2,'روابط مفيدة','footer_left','[{\"text\":\"معلومات عنا \",\"href\":\"/contact\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"خدماتنا\",\"href\":\"/service\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"الاسعار\",\"href\":\"/pricing\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"المدونة\",\"href\":\"/blog\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"اتصل بنا\",\"href\":\"/contact\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"}]','ar',1,'2021-05-04 23:09:16','2021-10-11 16:19:07'),(3,'الوصول السريع','footer_right','[{\"text\":\"حسابي\",\"href\":\"/merchant/dashboard\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"تسجيل الدخول\",\"href\":\"/login\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"الاشتراك\",\"href\":\"/register\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"اعادة تعيين كلمة المرور\",\"href\":\"/password/reset\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\"}]','ar',1,'2021-05-04 23:09:44','2021-10-11 16:17:48');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `metas_term_id_foreign` (`term_id`),
  CONSTRAINT `metas_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_04_01_040726_create_permission_tables',1),(5,'2021_04_01_071302_create_plans_table',1),(6,'2021_04_01_120838_create_jobs_table',1),(7,'2021_04_02_160029_create_getways_table',1),(8,'2021_04_02_160135_create_userplans_table',1),(9,'2021_04_02_160149_create_orders_table',1),(10,'2021_04_02_160202_create_options_table',1),(11,'2021_04_02_160217_create_terms_table',1),(12,'2021_04_02_160218_create_metas_table',1),(13,'2021_04_02_160247_create_currencies_table',1),(14,'2021_04_02_160321_create_usergetways_table',1),(15,'2021_04_02_160322_create_currencygetways_table',1),(16,'2021_04_02_160334_create_requests_table',1),(17,'2021_04_02_160347_create_payments_table',1),(18,'2021_04_02_162831_create_paymentmetas_table',1),(19,'2021_04_03_104916_create_termmetas_table',1),(20,'2021_04_03_173258_create_requestmetas_table',1),(21,'2021_04_06_094146_create_languages_table',1),(22,'2021_04_06_094229_create_menu_table',1),(23,'2021_04_10_092606_create_usermetas_table',1),(24,'2021_04_28_154014_create_supports_table',1),(25,'2021_04_28_154749_create_supportmetas_table',1),(26,'2021_05_09_204917_create_ordermetas_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(1,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'gateway_section','{\"first_title\":\"\\u0643\\u064a\\u0641 \\u062a\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0646\\u0627\\u061f\",\"first_des\":\"\\u064a\\u0645\\u0643\\u0646 \\u0644\\u0643\\u0644\\u0651 \\u0623\\u0635\\u062d\\u0627\\u0628 \\u0627\\u0644\\u0634\\u0651\\u0631\\u0643\\u0627\\u062a \\u0648\\u0627\\u0644\\u0645\\u062a\\u0627\\u062c\\u0631 \\u0627\\u0644\\u0651\\u062a\\u064a \\u062a\\u0642\\u062f\\u0651\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0647\\u0627 \\u0644\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u0651\\u064b\\u0627 \\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u0645\\u0646 \\u0636\\u0645\\u0646 \\u0639\\u0645\\u0644\\u0627\\u0626\\u0646\\u0627 \\u0627\\u0644\\u0643\\u0631\\u0627\\u0645\\u060c \\u062d\\u064a\\u062b \\u064a\\u0645\\u0643\\u0646 \\u0631\\u0628\\u0637 \\u0645\\u062a\\u062c\\u0631\\u0643 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0625\\u0644\\u0649 API \\u0644\\u062a\\u0643\\u0648\\u0646 \\u0645\\u0646\\u0635\\u0651\\u0629 MASOOL PAY \\u0645\\u0646 \\u0636\\u0645\\u0646 \\u062e\\u064a\\u0627\\u0631\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0645\\u062a\\u0627\\u062d\\u0629 \\u0641\\u064a \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u0627\\u0644\\u062f\\u0651\\u0641\\u0639 \\u0639\\u0646 \\u0628\\u064f\\u0639\\u062f.\",\"second_title\":\"\\u0641\\u064a \\u062d\\u0627\\u0644 \\u0643\\u0627\\u0646\\u062a \\u0634\\u0631\\u0643\\u062a\\u0643 \\u0623\\u0648 \\u0645\\u062a\\u062c\\u0631\\u0643 \\u0644\\u0627 \\u062a\\u0645\\u0627\\u0631\\u0633 \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u0627\\u0644\\u0628\\u064a\\u0639 \\u0648\\u0627\\u0644\\u062f\\u0641\\u0639 \\u0639\\u0646 \\u0628\\u0639\\u062f\",\"second_des\":\"\\u0628\\u0625\\u0645\\u0643\\u0627\\u0646\\u0643 \\u0641\\u062a\\u062d \\u062d\\u0633\\u0627\\u0628 \\u0644\\u0634\\u0631\\u0643\\u062a\\u0643 \\u0623\\u0648 \\u0645\\u062a\\u062c\\u0631\\u0643 \\u0644\\u062f\\u0649 \\u0645\\u0646\\u0635\\u0651\\u0629 MASOOL PAY\\u060c \\u062d\\u064a\\u062b \\u064a\\u062a\\u064a\\u062d \\u0644\\u0643 \\u0630\\u0644\\u0643 \\u0625\\u062a\\u0645\\u0627\\u0645 \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u0627\\u0644\\u0628\\u064a\\u0639 \\u0645\\u0639 \\u0639\\u0645\\u0644\\u0627\\u0626\\u0643 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0646\\u0638\\u0627\\u0645 \\u0627\\u0644\\u062f\\u0651\\u0641\\u0639 MASOOL PAY \\u0627\\u0644\\u0645\\u062b\\u0628\\u0651\\u062a \\u0644\\u062f\\u064a\\u0643 \\u0628\\u0645\\u0627 \\u064a\\u0642\\u062f\\u0651\\u0645\\u0647 \\u0645\\u0646 \\u062a\\u0633\\u0647\\u064a\\u0644\\u0627\\u062a \\u0644\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\\u060c \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0625\\u0635\\u062f\\u0627\\u0631 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062a\\u062a\\u0636\\u0645\\u0651\\u0646 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\\u0647\\u0627 \\u0648\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644\\u060c \\u0648\\u0625\\u0631\\u0633\\u0627\\u0644 \\u0627\\u0644\\u0631\\u0651\\u0627\\u0628\\u0637 \\u0627\\u0644\\u0646\\u0651\\u0647\\u0627\\u0626\\u064a\\u0651 \\u0625\\u0644\\u0649 \\u0631\\u0642\\u0645 \\u0627\\u0644\\u0648\\u0627\\u062a\\u0633\\u0627\\u0628 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0651 \\u0628\\u0627\\u0644\\u0639\\u0645\\u064a\\u0644. \\u0648\\u0628\\u0639\\u062f \\u0627\\u0644\\u0645\\u0648\\u0627\\u0641\\u0642\\u0629 \\u0645\\u0646 \\u0642\\u0628\\u0644 \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0639\\u0644\\u0649 \\u0625\\u062a\\u0645\\u0627\\u0645 \\u0627\\u0644\\u0639\\u0645\\u0644\\u064a\\u0651\\u0629 \\u064a\\u0636\\u064a\\u0641 \\u0631\\u0642\\u0645 \\u062d\\u0633\\u0627\\u0628\\u0647 \\u0627\\u0644\\u0628\\u0646\\u0643\\u064a\\u0651. \\u0648\\u0639\\u0646\\u062f \\u0625\\u0646\\u0647\\u0627\\u0621 \\u0627\\u0644\\u0639\\u0645\\u0644\\u064a\\u0651\\u0629 \\u0633\\u064a\\u0635\\u062f\\u0631 \\u0625\\u0634\\u0639\\u0627\\u0631 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0635\\u0651\\u0629 MASOOL PAY \\u064a\\u064f\\u0646\\u0652\\u0628\\u0650\\u0626\\u064f\\u0647\\u064e\\u0627 \\u0628\\u0630\\u0644\\u0643\\u060c \\u0639\\u0646\\u062f\\u0647\\u0627 \\u064a\\u0645\\u0643\\u0646\\u0643 \\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c\\u0627\\u062a \\u0644\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0648\\u0633\\u062a\\u0642\\u0648\\u0645  MASOOL PAY  \\u0628\\u062a\\u062d\\u0648\\u064a\\u0644 \\u0627\\u0644\\u0645\\u0628\\u0644\\u063a \\u0625\\u0644\\u0649 \\u062d\\u0633\\u0627\\u0628\\u0643 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629\\u060c \\u0645\\u062e\\u0635\\u0648\\u0645 \\u0645\\u0646\\u0647 \\u0627\\u0644\\u0646\\u0651\\u0633\\u0628\\u0629 \\u0623\\u0648 \\u0627\\u0644\\u0639\\u0645\\u0648\\u0644\\u0629 \\u0627\\u0644\\u0645\\u062a\\u0651\\u064e\\u0641\\u064e\\u0642 \\u0639\\u0644\\u064a\\u0647\\u0627 \\u0645\\u0633\\u0628\\u064b\\u0642\\u064b\\u0627\\u060c \\u0648\\u062a\\u0643\\u0648\\u0646 \\u0639\\u0644\\u0627\\u0642\\u0629 \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0628\\u0639\\u062f\\u0647\\u0627 \\u0645\\u0639 MASOOL PAY \\u0641\\u064a \\u0625\\u062a\\u0645\\u0627\\u0645 \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u062f\\u0641\\u0639 \\u0627\\u0644\\u0645\\u0628\\u0627\\u0644\\u063a \\u0627\\u0644\\u0645\\u0624\\u062c\\u0651\\u064e\\u0644\\u0629 \\u0648\\u0627\\u0644\\u0623\\u0642\\u0633\\u0627\\u0637.\",\"image\":\"uploads\\/gateway_section\\/21\\/04\\/1698171749952367.png\"}'),(2,'auto_enroll_after_payment','on'),(3,'tawk_to_property_id','6076c018f7ce1827093a4822'),(4,'cron_option','{\"status\":\"on\",\"days\":10,\"assign_default_plan\":\"on\",\"alert_message\":\"Hi, your plan will expire soon\",\"expire_message\":\"Your plan is expired!\"}'),(5,'theme_settings','{\"footer_description\":\"\\u0634\\u0631\\u0643\\u0629 \\u0645\\u0633\\u0624\\u0648\\u0644 \\u0631\\u0627\\u0626\\u062f\\u0629 \\u0641\\u064a \\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u0633\\u0648\\u064a\\u0642 \\u0627\\u0644\\u0631\\u0642\\u0645\\u064a\\u0651 \\u0648\\u062d\\u0644\\u0648\\u0644 \\u0627\\u0644\\u0623\\u0639\\u0645\\u0627\\u0644\\u060c \\u0641\\u0647\\u064a \\u0644\\u0627 \\u062a\\u0641\\u062a\\u0623 \\u062a\\u0642\\u062f\\u0651\\u0645 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u062d\\u0644\\u0648\\u0644 \\u0644\\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0645\\u0634\\u0627\\u0643\\u0644 \\u0627\\u0644\\u062a\\u064a \\u062a\\u0639\\u062a\\u0631\\u0636 \\u0645\\u062e\\u062a\\u0644\\u0641 \\u0627\\u0644\\u0623\\u0639\\u0645\\u0627\\u0644.\\r\\n\\u0648\\u0647\\u0630\\u0627 \\u0645\\u0627 \\u0642\\u062f\\u0651\\u0645\\u062a\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0641\\u064a \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0642 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0645\\u0646\\u0635\\u0651\\u0629 (MASOOL PAY).\",\"newsletter_address\":\"\\u0627\\u0644\\u0645\\u0645\\u0644\\u0643\\u0629 \\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629 \\u0627\\u0644\\u0633\\u0639\\u0648\\u062f\\u064a\\u0629\",\"new_account_button\":\"\\u0627\\u0646\\u0634\\u0627\\u0621 \\u062d\\u0633\\u0627\\u0628 \\u0645\\u062c\\u0627\\u0646\\u064a\",\"new_account_url\":\"\\/register\",\"social\":[{\"icon\":\"ri:facebook-fill\",\"link\":\"#\"},{\"icon\":\"ri:twitter-fill\",\"link\":\"#\"},{\"icon\":\"ri:google-fill\",\"link\":\"#\"},{\"icon\":\"ri:instagram-fill\",\"link\":\"#\"},{\"icon\":\"ri:pinterest-fill\",\"link\":\"#\"}]}'),(6,'seo_home','{\"site_name\":\"Home\",\"matatag\":\"Home\",\"matadescription\":\"it is an payment gateway application. you can add your payment gateway keys,id and start using your payment gateway system within 5  within 5 minutes.\",\"twitter_site_title\":\"home\"}'),(7,'seo_blog','{\"site_name\":\"Blog\",\"matatag\":\"Blog\",\"matadescription\":\"it is an payment gateway application. in this page you can view all post recently post form the application\",\"twitter_site_title\":\"Blog\"}'),(8,'seo_service','{\"site_name\":\"Service\",\"matatag\":\"Service\",\"matadescription\":\"it is an payment gateway application. in this page you can view all details about each services\",\"twitter_site_title\":\"Service\"}'),(9,'seo_contract','{\"site_name\":\"Contract\",\"matatag\":\"Contract\",\"matadescription\":\"it is an payment gateway application. in this page you can view all Contract about the application system\",\"twitter_site_title\":\"Contract\"}'),(10,'seo_pricing','{\"site_name\":\"Pricing\",\"matatag\":\"Pricing\",\"matadescription\":\"it is an payment gateway application. in this page you can view all Contract about the application system\",\"twitter_site_title\":\"Pricing\"}'),(11,'currency_symbol','$'),(12,'hero_section','{\"title\":\"\\u0645\\u0633\\u0624\\u0644 \\u0628\\u0627\\u064a ...\\u0644\\u0645\\u0633\\u0627\\u0639\\u062f\\u062a\\u0643 \\u0641\\u064a \\u062a\\u0623\\u0645\\u064a\\u0646 \\u0645\\u062f\\u0641\\u0648\\u0639\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u0629\",\"des\":\"\\u0648\\u0633\\u064a\\u0644\\u0629 \\u0641\\u0639\\u0627\\u0644\\u0629 \\u062a\\u0624\\u0645\\u0646 \\u0644\\u0643 \\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0645\\u062f\\u0641\\u0648\\u0639\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u0629 \\u0628\\u0634\\u0643\\u0644 \\u0622\\u0645\\u0646 \\u0648\\u0633\\u0647\\u0644 \\u0648\\u0623\\u0646\\u062a \\u0641\\u064a \\u0645\\u0643\\u0627\\u0646\\u0643\",\"start_text\":\"\\u0625\\u0628\\u062f\\u0623 \\u0627\\u0644\\u0622\\u0646\",\"start_url\":\"\\/register\",\"contact_text\":\"\\u0641\\u0631\\u064a\\u0642 \\u0627\\u0644\\u062f\\u0639\\u0645\",\"contact_url\":\"\\/contact\",\"image\":\"uploads\\/hero_section\\/21\\/10\\/1713400926863040.png\"}'),(13,'support_email','help@amcoders.com');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermetas`
--

DROP TABLE IF EXISTS `ordermetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordermetas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordermetas_order_id_foreign` (`order_id`),
  CONSTRAINT `ordermetas_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermetas`
--

LOCK TABLES `ordermetas` WRITE;
/*!40000 ALTER TABLE `ordermetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordermetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` bigint unsigned NOT NULL,
  `getway_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `amount` double NOT NULL,
  `exp_date` date NOT NULL,
  `payment_status` int NOT NULL,
  `status` int NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_plan_id_foreign` (`plan_id`),
  KEY `orders_getway_id_foreign` (`getway_id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_getway_id_foreign` FOREIGN KEY (`getway_id`) REFERENCES `getways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('Majdalbasha.ma@gmail.com','$2y$10$qsrPTSIA77njQ.P/XlwL6uVCTRQrTkiQlHokqqLF.gL/Wun/8l4P.','2021-10-26 11:16:13');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmetas`
--

DROP TABLE IF EXISTS `paymentmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmetas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `paymentmetas_payment_id_foreign` (`payment_id`),
  CONSTRAINT `paymentmetas_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmetas`
--

LOCK TABLES `paymentmetas` WRITE;
/*!40000 ALTER TABLE `paymentmetas` DISABLE KEYS */;
INSERT INTO `paymentmetas` VALUES (1,1,'payment_meta','{\"screenshot\":\"uploads\\/3\\/21\\/10\\/1714681021175383.jpeg\",\"comment\":\"Fdgf\"}');
/*!40000 ALTER TABLE `paymentmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `request_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `getway_id` bigint unsigned NOT NULL,
  `amount` double NOT NULL,
  `main_amount` double NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trx_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_request_id_foreign` (`request_id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_getway_id_foreign` (`getway_id`),
  CONSTRAINT `payments_getway_id_foreign` FOREIGN KEY (`getway_id`) REFERENCES `getways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,2,3,11,2,1,'USD','Za8ULwu2ty',2,'2021-10-26 11:20:51','2021-10-26 11:20:51');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'dashboard.index','web','dashboard','2021-10-08 14:07:14','2021-10-08 14:07:14'),(2,'admin.create','web','admin','2021-10-08 14:07:14','2021-10-08 14:07:14'),(3,'admin.edit','web','admin','2021-10-08 14:07:14','2021-10-08 14:07:14'),(4,'admin.update','web','admin','2021-10-08 14:07:14','2021-10-08 14:07:14'),(5,'admin.delete','web','admin','2021-10-08 14:07:14','2021-10-08 14:07:14'),(6,'admin.list','web','admin','2021-10-08 14:07:14','2021-10-08 14:07:14'),(7,'role.create','web','role','2021-10-08 14:07:14','2021-10-08 14:07:14'),(8,'role.edit','web','role','2021-10-08 14:07:14','2021-10-08 14:07:14'),(9,'role.update','web','role','2021-10-08 14:07:14','2021-10-08 14:07:14'),(10,'role.delete','web','role','2021-10-08 14:07:14','2021-10-08 14:07:14'),(11,'role.list','web','role','2021-10-08 14:07:14','2021-10-08 14:07:14'),(12,'page.create','web','page','2021-10-08 14:07:14','2021-10-08 14:07:14'),(13,'page.edit','web','page','2021-10-08 14:07:14','2021-10-08 14:07:14'),(14,'page.delete','web','page','2021-10-08 14:07:14','2021-10-08 14:07:14'),(15,'page.index','web','page','2021-10-08 14:07:14','2021-10-08 14:07:14'),(16,'blog.create','web','Blog','2021-10-08 14:07:14','2021-10-08 14:07:14'),(17,'blog.edit','web','Blog','2021-10-08 14:07:14','2021-10-08 14:07:14'),(18,'blog.delete','web','Blog','2021-10-08 14:07:14','2021-10-08 14:07:14'),(19,'blog.index','web','Blog','2021-10-08 14:07:14','2021-10-08 14:07:14'),(20,'plan.create','web','plan','2021-10-08 14:07:14','2021-10-08 14:07:14'),(21,'plan.edit','web','plan','2021-10-08 14:07:14','2021-10-08 14:07:14'),(22,'plan.index','web','plan','2021-10-08 14:07:14','2021-10-08 14:07:14'),(23,'plan.delete','web','plan','2021-10-08 14:07:14','2021-10-08 14:07:14'),(24,'currency.create','web','currency','2021-10-08 14:07:14','2021-10-08 14:07:14'),(25,'currency.edit','web','currency','2021-10-08 14:07:14','2021-10-08 14:07:14'),(26,'currency.index','web','currency','2021-10-08 14:07:14','2021-10-08 14:07:14'),(27,'currency.delete','web','currency','2021-10-08 14:07:14','2021-10-08 14:07:14'),(28,'payment-gateway.edit','web','payment-gateway','2021-10-08 14:07:14','2021-10-08 14:07:14'),(29,'payment-gateway.index','web','payment-gateway','2021-10-08 14:07:14','2021-10-08 14:07:14'),(30,'payment-gateway.delete','web','payment-gateway','2021-10-08 14:07:14','2021-10-08 14:07:14'),(31,'payment-gateway.create','web','payment-gateway','2021-10-08 14:07:14','2021-10-08 14:07:14'),(32,'support','web','support','2021-10-08 14:07:14','2021-10-08 14:07:14'),(33,'gateway-section','web','gateway-section','2021-10-08 14:07:14','2021-10-08 14:07:14'),(34,'hero-section','web','hero-section','2021-10-08 14:07:14','2021-10-08 14:07:14'),(35,'system.settings','web','Settings','2021-10-08 14:07:14','2021-10-08 14:07:14'),(36,'seo.settings','web','Settings','2021-10-08 14:07:14','2021-10-08 14:07:14'),(37,'menu','web','Settings','2021-10-08 14:07:14','2021-10-08 14:07:14'),(38,'user.create','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(39,'user.index','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(40,'user.delete','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(41,'user.edit','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(42,'user.verified','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(43,'user.show','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(44,'user.banned','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(45,'user.unverified','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(46,'user.mail','web','users','2021-10-08 14:07:14','2021-10-08 14:07:14'),(47,'user.invoice','web','users','2021-10-08 14:07:15','2021-10-08 14:07:15'),(48,'service.index','web','language','2021-10-08 14:07:15','2021-10-08 14:07:15'),(49,'service.edit','web','language','2021-10-08 14:07:15','2021-10-08 14:07:15'),(50,'service.create','web','language','2021-10-08 14:07:15','2021-10-08 14:07:15'),(51,'service.delete','web','language','2021-10-08 14:07:15','2021-10-08 14:07:15'),(52,'quick-start.index','web','quick-start','2021-10-08 14:07:15','2021-10-08 14:07:15'),(53,'language.index','web','Service','2021-10-08 14:07:15','2021-10-08 14:07:15'),(54,'language.edit','web','Service','2021-10-08 14:07:15','2021-10-08 14:07:15'),(55,'language.create','web','Service','2021-10-08 14:07:15','2021-10-08 14:07:15'),(56,'language.delete','web','Service','2021-10-08 14:07:15','2021-10-08 14:07:15'),(57,'info.index','web','info','2021-10-08 14:07:15','2021-10-08 14:07:15'),(58,'merchant.index','web','merchant','2021-10-08 14:07:15','2021-10-08 14:07:15'),(59,'merchant.edit','web','merchant','2021-10-08 14:07:15','2021-10-08 14:07:15'),(60,'merchant.create','web','merchant','2021-10-08 14:07:15','2021-10-08 14:07:15'),(61,'merchant.delete','web','merchant','2021-10-08 14:07:15','2021-10-08 14:07:15'),(62,'merchant.mail','web','merchant','2021-10-08 14:07:15','2021-10-08 14:07:15'),(63,'order.index','web','order','2021-10-08 14:07:15','2021-10-08 14:07:15'),(64,'order.edit','web','order','2021-10-08 14:07:15','2021-10-08 14:07:15'),(65,'order.create','web','order','2021-10-08 14:07:15','2021-10-08 14:07:15'),(66,'order.delete','web','order','2021-10-08 14:07:15','2021-10-08 14:07:15'),(67,'report','web','report','2021-10-08 14:07:15','2021-10-08 14:07:15'),(68,'user-plan-report','web','report','2021-10-08 14:07:15','2021-10-08 14:07:15'),(69,'payment-report','web','report','2021-10-08 14:07:15','2021-10-08 14:07:15'),(70,'transaction','web','transaction','2021-10-08 14:07:15','2021-10-08 14:07:15'),(71,'profile.index','web','profile','2021-10-08 14:07:15','2021-10-08 14:07:15'),(72,'profile.create','web','profile','2021-10-08 14:07:15','2021-10-08 14:07:15'),(73,'option','web','option','2021-10-08 14:07:15','2021-10-08 14:07:15');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `duration` int NOT NULL,
  `captcha` int NOT NULL DEFAULT '0',
  `menual_req` int NOT NULL DEFAULT '0',
  `monthly_req` int NOT NULL DEFAULT '0',
  `daily_req` int NOT NULL DEFAULT '0',
  `mail_activity` int NOT NULL DEFAULT '0',
  `storage_limit` double NOT NULL DEFAULT '0',
  `fraud_check` int NOT NULL DEFAULT '0',
  `is_featured` int NOT NULL DEFAULT '0',
  `is_auto` int NOT NULL DEFAULT '0',
  `is_trial` int NOT NULL DEFAULT '0',
  `is_default` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'اساسي',10,30,1,0,200,10,1,100,1,0,1,1,0,0,'2021-10-08 14:07:15','2021-11-12 08:55:44'),(2,'معياري',20,90,1,1,300,10,1,100,1,0,1,0,0,0,'2021-10-08 14:07:15','2021-11-12 08:55:52'),(3,'متقدم',30,110,1,1,600,25,1,150,1,1,1,0,0,0,'2021-10-08 14:07:15','2021-11-12 08:56:02'),(4,'مجاني',0,150,1,1,900,40,1,300,1,0,1,0,1,0,'2021-10-08 14:07:15','2021-11-12 08:56:09');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestmetas`
--

DROP TABLE IF EXISTS `requestmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestmetas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `request_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `requestmetas_request_id_foreign` (`request_id`),
  CONSTRAINT `requestmetas_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestmetas`
--

LOCK TABLES `requestmetas` WRITE;
/*!40000 ALTER TABLE `requestmetas` DISABLE KEYS */;
INSERT INTO `requestmetas` VALUES (1,1,'request_info','{\"purpose\":\"\\u0634\\u0627\\u0634\\u0629\"}'),(2,2,'request_info','{\"purpose\":\"test\"}'),(3,3,'request_info','{\"purpose\":\"hhhhhhhh\"}');
/*!40000 ALTER TABLE `requestmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '2',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `amount` double NOT NULL,
  `is_fallback` int NOT NULL DEFAULT '0',
  `is_test` int NOT NULL DEFAULT '1',
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `captcha_status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requests_user_id_foreign` (`user_id`),
  CONSTRAINT `requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,1,NULL,3,1,0,1,NULL,1,'2021-10-18 15:50:03','2021-10-18 15:50:03'),(2,0,NULL,3,1,0,1,'5.156.121.216',1,'2021-10-19 08:24:37','2021-10-26 11:20:50'),(3,1,NULL,4,500,0,1,NULL,1,'2021-10-24 09:59:48','2021-10-24 09:59:48');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','web','2021-10-08 14:07:14','2021-10-08 14:07:14');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportmetas`
--

DROP TABLE IF EXISTS `supportmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supportmetas` (
  `support_id` bigint unsigned NOT NULL,
  `type` int NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `supportmetas_support_id_foreign` (`support_id`),
  CONSTRAINT `supportmetas_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportmetas`
--

LOCK TABLES `supportmetas` WRITE;
/*!40000 ALTER TABLE `supportmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `supportmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `ticket_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supports_user_id_foreign` (`user_id`),
  CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termmetas`
--

DROP TABLE IF EXISTS `termmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termmetas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `termmetas_term_id_foreign` (`term_id`),
  CONSTRAINT `termmetas_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termmetas`
--

LOCK TABLES `termmetas` WRITE;
/*!40000 ALTER TABLE `termmetas` DISABLE KEYS */;
INSERT INTO `termmetas` VALUES (1,1,'quick_start_meta','{\"des\":\"\\u0634\\u0631\\u0643\\u0629 MASOOL PAY \\u062a\\u0642\\u062f\\u0651\\u0645 \\u0645\\u0646\\u0635\\u0651\\u0629 \\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u0651\\u0629 \\u0644\\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u0627\\u0644\\u062f\\u0651\\u0641\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0644\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\\u060c \\u0641\\u0647\\u064a \\u062a\\u0648\\u0641\\u0651\\u0631 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u062d\\u0644\\u0648\\u0644 \\u0644\\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0645\\u0634\\u0643\\u0644\\u0627\\u062a \\u0627\\u0644\\u0651\\u062a\\u064a \\u062a\\u0648\\u0627\\u062c\\u0647 \\u0643\\u0644\\u0651 \\u0645\\u0646 \\u064a\\u0642\\u062f\\u0651\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u0651\\u0629 \\u0648\\u064a\\u0648\\u0627\\u062c\\u0647 \\u0645\\u0634\\u0643\\u0644\\u0627\\u062a \\u0641\\u064a \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u062f\\u0641\\u0639 \\u0627\\u0644\\u062a\\u0651\\u0643\\u0644\\u0641\\u0629.\\r\\n\\u0627\\u0644\\u062f\\u0651\\u0641\\u0639 \\u0628\\u0627\\u0644\\u062a\\u0651\\u0642\\u0633\\u064a\\u0637: \\u062a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0645\\u0646\\u0635\\u0651\\u0629 \\u0639\\u0644\\u0649 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u062e\\u062f\\u0645\\u0629 \\u0627\\u0644\\u062f\\u0651\\u0641\\u0639 \\u0628\\u0627\\u0644\\u062a\\u0651\\u0642\\u0633\\u064a\\u0637 \\u0644\\u062a\\u0645\\u0646\\u062d \\u0639\\u0645\\u0644\\u0627\\u0621\\u0647\\u0627 \\u0641\\u0631\\u0635\\u0629 \\u0644\\u0644\\u0631\\u0651\\u0627\\u062d\\u0629 \\u0623\\u0645\\u0627\\u0645 \\u0645\\u0627 \\u064a\\u0648\\u0627\\u062c\\u0647\\u0647\\u0645 \\u0645\\u0646 \\u0635\\u0639\\u0648\\u0628\\u0627\\u062a \\u0641\\u064a \\u0628\\u0639\\u0636 \\u0627\\u0644\\u0623\\u062d\\u064a\\u0627\\u0646 \\u0644\\u062a\\u0623\\u0645\\u064a\\u0646 \\u0645\\u062f\\u0641\\u0648\\u0639\\u0627\\u062a \\u0645\\u0634\\u062a\\u0631\\u064a\\u0627\\u062a\\u0647\\u0645 \\u0628\\u0634\\u0643\\u0644 \\u0643\\u0627\\u0645\\u0644 \\u0645\\u0631\\u0651\\u0629 \\u0648\\u0627\\u062d\\u062f\\u0629.\\r\\n\\u0648\\u0633\\u064a\\u0644\\u0629 \\u0622\\u0645\\u0646\\u0629: \\u062a\\u0648\\u0641\\u0651\\u0631 MASOOL PAY \\u0648\\u0633\\u064a\\u0644\\u0629 \\u0622\\u0645\\u0646\\u0629 \\u0648\\u0633\\u0647\\u0644\\u0629 \\u0644\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u062a\\u0634\\u062c\\u0651\\u0639\\u0647\\u0645 \\u0639\\u0644\\u0649 \\u0625\\u062a\\u0645\\u0627\\u0645 \\u0635\\u0641\\u0642\\u0627\\u062a\\u0647\\u0645 \\u0648\\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0645\\u062f\\u0641\\u0648\\u0639\\u0627\\u062a\\u0647\\u0645 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u0651\\u0629 \\u0628\\u062e\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0633\\u062a\\u062b\\u0646\\u0627\\u0626\\u064a\\u0651\\u0629 \\u0645\\u0646\\u0627\\u0633\\u0628\\u0629.\",\"button_name\":\"\\u0627\\u0646\\u0636\\u0645 \\u0644\\u0646\\u0627 ....\",\"button_link\":\"#\",\"list\":[\"\\u0627\\u0644\\u062a\\u062d\\u062f\\u0651\\u064a \\u0627\\u0644\\u0623\\u0643\\u0628\\u0631:  \\u064a\\u0639\\u062a\\u0628\\u0631 \\u0627\\u0644\\u0628\\u064a\\u0639 \\u0627\\u0644\\u0622\\u0646\\u064a\\u0651 \\u0628\\u062f\\u064f\\u0641\\u0639\\u0629 \\u0648\\u0627\\u062d\\u062f\\u0629 \\u0623\\u062d\\u062f \\u0623\\u0647\\u0645\\u0651 \\u0627\\u0644\\u0639\\u0648\\u0627\\u0626\\u0642 \\u0623\\u0645\\u0627\\u0645 \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u0627\\u0644\\u0634\\u0631\\u0627\\u0621\\u060c \\u062d\\u064a\\u062b \\u064a\\u0636\\u0639 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0641\\u064a\\u062f \\u0623\\u0645\\u0627\\u0645 \\u062e\\u064a\\u0627\\u0631\\u0627\\u062a \\u0635\\u0639\\u0628\\u0629 \\u062a\\u062a\\u0645\\u062b\\u0651\\u0644 \\u0628\\u0642\\u062f\\u0631\\u062a\\u0647 \\u0639\\u0644\\u0649 \\u062a\\u0623\\u0645\\u064a\\u0646 \\u0627\\u0644\\u0645\\u0628\\u0644\\u063a \\u0627\\u0644\\u0645\\u062a\\u0631\\u062a\\u0651\\u0628 \\u0639\\u0644\\u064a\\u0647 \\u062f\\u0641\\u0639\\u0629 \\u0648\\u0627\\u062d\\u062f\\u0629 \\u0648\\u0641\\u064a \\u0627\\u0644\\u062d\\u0627\\u0644.\",\"\\u0645\\u0646\\u0635\\u0651\\u0629 (MASOOL PAY) \\u062a\\u0642\\u062f\\u0651\\u0645 \\u0627\\u0644\\u062d\\u0644\\u0648\\u0644 : \\u062a\\u0642\\u0648\\u0645 \\u0641\\u0643\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0646\\u0635\\u0651\\u0629 \\u0639\\u0644\\u0649 \\u062a\\u0642\\u062f\\u064a\\u0645 (MASOOL PAY) \\u0643\\u0648\\u0633\\u064a\\u0644\\u0629 \\u062f\\u0641\\u0639 \\u0645\\u062a\\u0627\\u062d\\u0629 \\u0644\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0628\\u062e\\u064a\\u0627\\u0631\\u0627\\u062a \\u0648\\u062a\\u0633\\u0647\\u064a\\u0644\\u0627\\u062a \\u0627\\u0633\\u062a\\u062b\\u0646\\u0627\\u0626\\u064a\\u0651\\u0629 \\u062a\\u0634\\u062c\\u0651\\u0639\\u0647\\u0645 \\u0639\\u0644\\u0649 \\u0625\\u062a\\u0645\\u0627\\u0645 \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u0627\\u0644\\u0634\\u0631\\u0627\\u0621\"],\"image\":\"uploads\\/quick_starts\\/21\\/04\\/1698171808225933.png\"}'),(2,2,'service_meta','{\"des\":\"\\u062e\\u062f\\u0645\\u0629 \\u062a\\u0624\\u0645\\u0651\\u0646\\u0647\\u0627 (MASOOL PAY) \\u0644\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\\u060c \\u0628\\u062d\\u064a\\u062b \\u064a\\u0645\\u0643\\u0646\\u0647\\u0645 \\u0634\\u0631\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c\\u0627\\u062a \\u0648\\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u0622\\u0646 \\u0648\\u0627\\u0644\\u062f\\u0641\\u0639 \\u0644\\u0627\\u062d\\u0642\\u064b\\u0627.\",\"short_des\":\"\\u062e\\u062f\\u0645\\u0629 \\u062a\\u0624\\u0645\\u0651\\u0646\\u0647\\u0627 \\u0645\\u0646\\u0635\\u0651\\u0629 MASOOL PAY \\u0644\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\\u060c \\u0641\\u064a\\u0642\\u0648\\u0645\\u0648\\u0646 \\u0628\\u0634\\u0631\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c\\u0627\\u062a \\u0648\\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0648\\u062f\\u0641\\u0639 \\u0642\\u064a\\u0645\\u062a\\u0647\\u0627 \\u0641\\u064a \\u0648\\u0642\\u062a \\u0644\\u0627\\u062d\\u0642\",\"image\":\"uploads\\/service\\/21\\/04\\/1698167703623495.png\"}'),(3,3,'service_meta','{\"des\":\"\\u062a\\u0642\\u062f\\u0651\\u0645 (MASOOL PAY) \\u062e\\u062f\\u0645\\u0629 \\u0627\\u0644\\u0634\\u0631\\u0627\\u0621 \\u0628\\u0627\\u0644\\u062a\\u0642\\u0633\\u064a\\u0637 \\u0648\\u0628\\u062f\\u0648\\u0646 \\u0641\\u0648\\u0627\\u0626\\u062f \\u0645\\u062a\\u0631\\u062a\\u0651\\u0628\\u0629 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\\u060c \\u0648\\u0647\\u0648 \\u0645\\u0627 \\u064a\\u062c\\u0639\\u0644 \\u0645\\u0646 \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u0627\\u0644\\u0634\\u0631\\u0627\\u0621 \\u0633\\u0647\\u0644\\u0629 \\u0648\\u0645\\u0645\\u0643\\u0646\\u0629.\",\"short_des\":\"\\u062a\\u0642\\u062f\\u0651\\u0645 \\u0627\\u0644\\u0645\\u0646\\u0635\\u0651\\u0629 \\u062e\\u062f\\u0645\\u0629 \\u0627\\u0644\\u0634\\u0651\\u0631\\u0627\\u0621 \\u0628\\u0627\\u0644\\u062a\\u0651\\u0642\\u0633\\u064a\\u0637 \\u0648\\u0628\\u062f\\u0648\\u0646 \\u0641\\u0648\\u0627\\u0626\\u062f \\u0645\\u062a\\u0631\\u062a\\u0651\\u0628\\u0629 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\\u060c \\u0648\\u0647\\u0648 \\u0623\\u0645\\u0631 \\u064a\\u062c\\u0639\\u0644 \\u0639\\u0645\\u0644\\u064a\\u0651\\u0627\\u062a \\u0627\\u0644\\u0634\\u0651\\u0631\\u0627\\u0621 \\u0623\\u0643\\u062b\\u0631 \\u0633\\u0647\\u0648\\u0644\\u0629\",\"image\":\"uploads\\/service\\/21\\/04\\/1698167800093672.png\"}'),(4,4,'service_meta','{\"des\":\"\\u0628\\u062a\\u0648\\u0627\\u0641\\u0631 \\u0625\\u0645\\u0643\\u0627\\u0646\\u064a\\u0651\\u0629 \\u0627\\u0644\\u062f\\u0651\\u0641\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0644\\u0639\\u0645\\u0644\\u0627\\u0626\\u0643 \\u0628\\u0648\\u0633\\u064a\\u0644\\u0629 \\u0633\\u0647\\u0644\\u0629 \\u0648\\u0622\\u0645\\u0646\\u0629 \\u0633\\u064a\\u0643\\u0648\\u0646 \\u0623\\u0645\\u0627\\u0645\\u0643 \\u0627\\u0644\\u0645\\u062c\\u0627\\u0644 \\u0644\\u062c\\u0630\\u0628 \\u0627\\u0644\\u0645\\u0632\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\",\"short_des\":\"\\u0628\\u062a\\u0648\\u0627\\u0641\\u0631 \\u0625\\u0645\\u0643\\u0627\\u0646\\u064a\\u0651\\u0629 \\u0627\\u0644\\u062f\\u0651\\u0641\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0644\\u0639\\u0645\\u0644\\u0627\\u0626\\u0643 \\u0628\\u0648\\u0633\\u064a\\u0644\\u0629 \\u0633\\u0647\\u0644\\u0629 \\u0648\\u0622\\u0645\\u0646\\u0629 \\u0633\\u064a\\u0643\\u0648\\u0646 \\u0623\\u0645\\u0627\\u0645\\u0643 \\u0627\\u0644\\u0645\\u062c\\u0627\\u0644 \\u0644\\u062c\\u0630\\u0628 \\u0627\\u0644\\u0645\\u0632\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\",\"image\":\"uploads\\/service\\/21\\/04\\/1698167812109136.png\"}'),(5,5,'excerpt','أصبح مصطلح الدفع الالكتروني هو حديث الساعة في الآونة الاخيرة فهو يتطور بشكل كبير وملحوظ،\r\n\r\nوقد اجتاح هذا المجال السوق بكل بشكل كبير بسبب الامتيازات المبهرة التي تقدمها التجارة الالكترونية من سهولة وأمان\r\n\r\nوغيرها من الامتيازات الأخرى، فخلال الـ 15 سنة الماضية تغير التسوق عبر الإنترنت و الدفع الالكتروني\r\n\r\nمن مجرد كونه قيمة مضافة إلي قيمة أساسية، وقد ساعد نمو متاجر التجزئة الكبري والمتاجر المتخصصة في هذا التحول،\r\n\r\nوأصبحت التجارة الإلكترونية متوفرة للجميع من خلال الدفع الالكتروني.'),(6,5,'thum_image','uploads/blog/1/21/04/1698172411060494.jpg'),(7,5,'description','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(8,6,'excerpt','قناة   الدفع  هي  بشكل  اساسي  الطريقة  او الآلية  التي  تمكن  المستفيد  الاخير  من  اجراء  عمليات  الدفع  وتحويل  الاموال   وتتعدد  قنوات  الدفع  بين  الالكترونية    والتقليدية سواء أكانت موفرة من قبل البنوك'),(9,6,'thum_image','uploads/blog/1/21/04/1698172492517038.jpg'),(10,6,'description','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(11,7,'thum_image','uploads/blog/1/21/04/3.jpg'),(12,7,'description','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(13,7,'excerpt','يضمن التحويل المصرفي للعملاء استخدام أموالهم بأمان ، نظرًا لأن كل معاملة تحتاج إلى المصادقة والموافقة عليها أولاً');
/*!40000 ALTER TABLE `termmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `featured` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'من هو مسؤول باي؟','mn-ho-msool-bay','quick_start',1,NULL,'2021-04-27 04:47:44','2021-11-12 08:47:10'),(2,'اشترِ الآن وادفع لاحقًا','ashtr-alan-oadfaa-lahka','service',1,NULL,'2021-04-27 04:47:45','2021-11-12 08:45:26'),(3,'اشترِ وادفع بالتّقسيط بدون فوائد','ashtr-oadfaa-baltksyt-bdon-foayd','service',1,NULL,'2021-04-27 04:47:45','2021-11-12 08:45:50'),(4,'احصل على المزيد من العملاء','ahsl-aal-almzyd-mn-alaamlaaa','service',1,NULL,'2021-04-27 04:47:45','2021-11-12 08:46:27'),(5,'ما هو الدفع الالكتروني وما هى مميزاته؟','ma-ho-aldfaa-alalktrony-oma-h-mmyzath','blog',1,1,'2021-04-27 06:03:33','2021-10-15 15:17:05'),(6,'قنوات مدفوعات التجزئة','knoat-mdfoaaat-altgzy','blog',1,1,'2021-04-27 06:04:50','2021-10-15 15:19:43'),(7,'أهمية الدفع الالكتروني للمتاجر الالكترونية','ahmy-aldfaa-alalktrony-llmtagr-alalktrony','blog',1,1,'2021-04-27 06:04:50','2021-10-15 15:21:28');
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergetways`
--

DROP TABLE IF EXISTS `usergetways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergetways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `getway_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_required` int NOT NULL DEFAULT '0',
  `sandbox` text COLLATE utf8mb4_unicode_ci,
  `production` text COLLATE utf8mb4_unicode_ci,
  `data` text COLLATE utf8mb4_unicode_ci,
  `rate` double NOT NULL DEFAULT '1',
  `charge` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usergetways_getway_id_foreign` (`getway_id`),
  KEY `usergetways_user_id_foreign` (`user_id`),
  CONSTRAINT `usergetways_getway_id_foreign` FOREIGN KEY (`getway_id`) REFERENCES `getways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergetways_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergetways`
--

LOCK TABLES `usergetways` WRITE;
/*!40000 ALTER TABLE `usergetways` DISABLE KEYS */;
INSERT INTO `usergetways` VALUES (1,11,3,1,'Manual','USD',1,'null','null','{\"instruction\":\"\\u0642\\u0645 \\u0628\\u062a\\u062d\\u0648\\u064a\\u0644 \\u0627\\u0644\\u0641\\u0644\\u0648\\u0633 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u062d\\u0633\\u0627\\u0628 \\u0627\\u0644\\u0645\\u062d\\u062f\\u062f\"}',1,1,'2021-10-19 09:57:04','2021-11-08 12:24:35'),(2,1,3,1,'Paypal','USD',1,'{\"client_id\":\"AW39Kgo9jCn2s0mINcHgNXsjqvM2f2L_5kUjpYq1gOJMpRyQ8GJL1gyBmQzzBXqWuvciy9nYa5-m0zBY\",\"client_secret\":\"EF82WUMYr7qUlhGGjrpJWGGGtYnCW8ctGv8IJHqTtYlzHNKOuWRT6cwyAohMFohxXJH7OaoBtQTn4hzT\"}','{\"client_id\":\"AWotQeHQmyP-8_UkmWBPwPNAdqgDwRBGmfHaI-8xXlxbfGW0XVLaUSNkTJTDRM5T6Vln70Y5I_F8IidH\",\"client_secret\":\"EPdNfMxAeKyOTM76M3mE7y1DccKpPgjqYqlvrpZY6vSYI3TSIiwcU4iPpSp0qaACFaRDXjl9JJMaM3Nr\"}',NULL,1,1,'2021-11-08 12:21:05','2021-11-08 13:08:02');
/*!40000 ALTER TABLE `usergetways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermetas`
--

DROP TABLE IF EXISTS `usermetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usermetas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `usermetas_user_id_foreign` (`user_id`),
  CONSTRAINT `usermetas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermetas`
--

LOCK TABLES `usermetas` WRITE;
/*!40000 ALTER TABLE `usermetas` DISABLE KEYS */;
INSERT INTO `usermetas` VALUES (1,3,'user_info','{\"company_name\":\"apolo\",\"company_address\":null,\"company_city\":null,\"company_email\":\"apolo@gmail.com\",\"company_phone\":\"65456456456\",\"invoice_description\":null}');
/*!40000 ALTER TABLE `usermetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userplans`
--

DROP TABLE IF EXISTS `userplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userplans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `captcha` int NOT NULL DEFAULT '0',
  `menual_req` int NOT NULL DEFAULT '0',
  `monthly_req` int NOT NULL DEFAULT '0',
  `daily_req` int NOT NULL DEFAULT '0',
  `mail_activity` int NOT NULL DEFAULT '0',
  `storage_limit` double NOT NULL DEFAULT '0',
  `fraud_check` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userplans_user_id_foreign` (`user_id`),
  CONSTRAINT `userplans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userplans`
--

LOCK TABLES `userplans` WRITE;
/*!40000 ALTER TABLE `userplans` DISABLE KEYS */;
INSERT INTO `userplans` VALUES (1,3,'free',1,1,300,10,1,100,1,'2021-10-18 09:26:57','2021-10-18 14:00:24'),(2,4,'free',1,1,10,2,1,0,1,'2021-10-24 09:37:40','2021-10-24 09:59:19'),(3,5,'free',0,0,0,0,0,0,0,'2021-10-26 12:08:56','2021-10-26 12:08:56'),(4,6,'free',0,0,0,0,0,0,0,'2021-11-03 10:58:57','2021-11-03 10:58:57'),(5,7,'free',0,0,0,0,0,0,0,'2021-11-03 11:05:56','2021-11-03 11:05:56'),(6,8,'free',0,0,0,0,0,0,0,'2021-11-03 11:35:40','2021-11-03 11:35:40'),(7,9,'free',0,0,0,0,0,0,0,'2021-11-04 22:31:33','2021-11-04 22:31:33'),(8,10,'free',0,0,0,0,0,0,0,'2021-11-10 08:06:17','2021-11-10 08:06:17');
/*!40000 ALTER TABLE `userplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL DEFAULT '2',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `image` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com',NULL,NULL,NULL,NULL,1,NULL,NULL,'$2y$10$RLoQ29JjIFdOyNmvPEtkX.Snz1j.V9ErDdtvIeI9W9iOb9Txpt1pm','z0jG2jnZWtxSyN2UjuE6I371d9Cl6Pxlm0iD5ePtXYLBGGCjcutEhLUufBKT','2021-10-08 14:07:14','2021-10-08 14:07:14'),(2,1,'webadmin','support_web2@zanobia.me','55555',NULL,NULL,NULL,1,NULL,NULL,'$2y$10$AQSLZkZimZCsiJMj2x34CuicbN1ki8hVD3ce1IpEFtoOG2RDcXfke','BiyLEcjaBM6MQAnrObbJPBoMaGlFx66szr53zfZlMLijcQBQU4yiCKpvDrvq','2021-10-08 14:23:55','2021-10-08 14:23:55'),(3,2,'mohamed','saukutricrole-4862@yopmail.com','555555555','Q5SORnSEyLW8lIigRT2FIp7cWdBbr4kkitJFoyMkKHSUC61uEt','bCpe0jrjWDusQtyLxESkJdwVxKVdTMKkG2EjuE1gjkYBKNuEh5','USD',1,'uploads/user/21/10/1714678107538320.jpg',NULL,'$2y$10$.Fwb263V1ZxZkfLegOD.luC1.wfmTdxiDfwHwnuixklAJWEfmh8qO','2iz94QZNAMdLpJtalT4ZZfC4qjG3mZG1Lo31nzS2pteE9pJBDRs8yjtI2Hqb','2021-10-18 09:26:57','2021-11-03 11:02:08'),(4,2,'Majdalbasha','Majdalbasha.ma@gmail.com',NULL,'QPlZTXdBRoKxl91Ru9cPjzm0ITlcEW8hrJv9wP7DQxSD2zSZJh','dgmlAe0lvctOmTqHS0dJ13LZNbay08a1mbXaDUkJk74L2EMgZ4','RS',1,NULL,NULL,'$2y$10$7PwmIcdGpA.iQN3ZwXSsaO.ZHPS4PxPEiI1PFBaCGylWZugwGGLNa',NULL,'2021-10-24 09:37:40','2021-10-24 09:43:59'),(5,2,'Saod Algehani','saod365@icloud.com',NULL,'BWSy4I3ZpDG51PMaFgap8CW35UW68XSSyAbIXbw816jG2CJqfK','cx5LA9ll3DT4I4WWsIVNgQezltt0vx65AT1ne5k5lC1b9hXmW2','USD',1,NULL,NULL,'$2y$10$PU/RJ0GIs.L8SL8vOyhFa.GYuhmsWMnZaDYXO8hdUSGqdYQNlWBWe',NULL,'2021-10-26 12:08:56','2021-10-26 12:08:56'),(6,2,'testing register','testing.register@yopmail.com',NULL,'VOM3yXE0XY3enVjF78CpAR6RiiCrNCE2DUlJQ2x7YdqMXMK0hy','0o958gU31FvfsFEsDzw8UbGl08xxVYsBD9n1aIyC4MEEwdGVwJ','USD',1,NULL,NULL,'$2y$10$E383a51.Rwwd0OK4wsLcluKS3Cfg991iQP6HKZiNFeveN5l0XVWgi',NULL,'2021-11-03 10:58:57','2021-11-03 10:58:57'),(7,2,'Testing Register2','testing.register2@yopmail.com',NULL,'KL2gUuhGNX7lp0X7pi3fe2YX5Ck2pccmLpreJBEipwDSqEFuEy','yN4zyoLS0nnRvu8TSKa46GcoKQUjvY3m2faOfj7ciMBzgBLHUV','USD',1,NULL,NULL,'$2y$10$E0DcrhGV2HScdTgDlMgxbepUpDv8dlK1./X/X55WGcc/4vEtK/Rwu',NULL,'2021-11-03 11:05:56','2021-11-03 11:05:56'),(8,2,'Testing Register3','testing.register3@yopmail.com',NULL,'uK6JbjGOH4osoXnPafGxPbMFuIMX6yDvzWuRY8cVuWO7Dd6Te8','FgXWJcCDTdzdfTSq3OkFagi2frFkH3x1SHOYzuObrvO5MBYBtc','USD',1,NULL,NULL,'$2y$10$Gukl5JYsI3qqYPCN312B..R603TBoNp9s2Y0okHpm95YYDCyl2YpK',NULL,'2021-11-03 11:35:40','2021-11-03 11:35:40'),(9,2,'Ich empfehle Ihnen Wem:masoolpay.com https://audi.com','everodo24@mail.ru',NULL,'77snrTqJ0o0QSDHPseuDVwfVW03FPeXDBRKhS6HuY3GtonMYRY','4vVai6lAj01lvlIE8WGIgqnY94UaGZTzVUS0rPGqC9hRaEsa2k','USD',1,NULL,NULL,'$2y$10$F/PJQu5k4DJjNTB.LkPkvulrypV9yiIFksFa3UUKliC7zo0c7SiGq',NULL,'2021-11-04 22:31:33','2021-11-04 22:31:33'),(10,2,'mohamed','mohamed@gmail.com',NULL,'0kTC7ZSaeggUvM5RjJ5jfwsZEeRV0PBhhVZPg2JE3bv1H2un45','0Z9DTXPTi2SioI7qi4n7slRM7rznWTcs3FHtTz4o5SrHxEGIYH','USD',1,NULL,NULL,'$2y$10$8PuVvXg9hUq9RXKB0D3zZ.d5BG0vfg8M.HUXibLPlseA2krPzrwg.',NULL,'2021-11-10 08:06:17','2021-11-10 08:06:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-12  9:33:57
