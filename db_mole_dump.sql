CREATE DATABASE  IF NOT EXISTS `db_mole` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_mole`;
-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: db_mole
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `tb_chat`
--

DROP TABLE IF EXISTS `tb_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `season_id` smallint(6) NOT NULL,
  `challenger_id` int(11) NOT NULL,
  `challenged_id` int(11) NOT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `fk_season_chat_id` (`season_id`),
  KEY `fk_player_chat_id` (`challenger_id`),
  KEY `fk_opponent_chat_id` (`challenged_id`),
  CONSTRAINT `fk_opponent_chat_id` FOREIGN KEY (`challenged_id`) REFERENCES `tb_player` (`player_id`),
  CONSTRAINT `fk_player_chat_id` FOREIGN KEY (`challenger_id`) REFERENCES `tb_player` (`player_id`),
  CONSTRAINT `fk_season_chat_id` FOREIGN KEY (`season_id`) REFERENCES `tb_season` (`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_chat`
--

LOCK TABLES `tb_chat` WRITE;
/*!40000 ALTER TABLE `tb_chat` DISABLE KEYS */;
INSERT INTO `tb_chat` VALUES (1,1,2,1),(2,1,3,6),(3,2,4,1),(4,2,2,4);
/*!40000 ALTER TABLE `tb_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_chat_details`
--

DROP TABLE IF EXISTS `tb_chat_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_chat_details` (
  `chat_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) NOT NULL,
  `chatter_id` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `message_timestamp` datetime NOT NULL,
  PRIMARY KEY (`chat_details_id`),
  KEY `fk_chat_details_chat_id` (`chat_id`),
  KEY `fk_chat_details_player_id` (`chatter_id`),
  CONSTRAINT `fk_chat_details_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `tb_chat` (`chat_id`),
  CONSTRAINT `fk_chat_details_player_id` FOREIGN KEY (`chatter_id`) REFERENCES `tb_player` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_chat_details`
--

LOCK TABLES `tb_chat_details` WRITE;
/*!40000 ALTER TABLE `tb_chat_details` DISABLE KEYS */;
INSERT INTO `tb_chat_details` VALUES (1,1,2,'Yo! What\'s up? When do we play? :D','2024-01-07 14:00:04'),(2,1,1,'Not playing yet. I\'ll let you know when I am','2024-01-07 14:47:18'),(3,1,1,'Hi there. I\'m back in action. Wanna play this Sunday at 19GMT? :)','2024-04-13 18:34:59'),(4,1,2,'Alright. See you in the game. ;D','2024-04-14 08:25:54'),(5,2,3,'I can play this weekend any time. How about you, mate?','2024-01-05 16:32:45'),(6,2,6,'Alright, let\'s do it at 16GMT.','2024-01-06 09:35:31'),(7,2,3,'Sorry, I couldn\'t come and neither could warn you beforehand. :( Can we play the next weekend same time?','2024-01-11 17:52:01'),(8,2,6,'Sure, np. :)','2024-01-11 22:00:33'),(9,3,4,'Hi there. I can play on Wednesdays from 10GMT to 15GMT. Can we make it that time any day? Cheers! :)','2025-07-07 12:11:44'),(10,3,1,'Sorry, won\'t be possible for me. How about Saturday or Sunday? I can play at any time these days. Just let me know.','2025-07-09 20:10:38'),(11,3,4,'Sorry, I work in the weekend. :( Any other day/time you can make it?','2025-07-10 11:32:25'),(12,3,1,'I could play on next Tuesday at 13GMT. Is that ok for you?','2025-07-11 11:47:23'),(13,3,4,'No, that does\'t work either. ;( How about same day but one hour later?','2025-07-11 19:14:05'),(14,3,1,'Alright.','2025-07-11 20:49:19'),(15,3,1,'GL! ;D','2025-07-11 20:50:15'),(16,4,2,'Hello there. Wanna play on July 1st at 17GMT?','2025-06-22 08:12:18'),(17,4,4,'That time does\'t work for me. Can you play earlier this day?','2025-06-23 15:32:16'),(18,4,2,'No. How about 3rd at 13GMT?','2025-06-23 23:22:15'),(19,4,4,'How about 16 at 16GMT?','2025-07-10 20:33:44'),(20,4,2,'OK, works for me. :D','2025-07-11 17:32:21');
/*!40000 ALTER TABLE `tb_chat_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_flag`
--

DROP TABLE IF EXISTS `tb_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_flag` (
  `flag_id` smallint(6) NOT NULL,
  `flag_name` varchar(40) DEFAULT NULL,
  `flag_img` varchar(100) NOT NULL,
  PRIMARY KEY (`flag_id`),
  UNIQUE KEY `flag_name` (`flag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_flag`
--

LOCK TABLES `tb_flag` WRITE;
/*!40000 ALTER TABLE `tb_flag` DISABLE KEYS */;
INSERT INTO `tb_flag` VALUES (1,'Algeria',''),(2,'Argentina',''),(3,'Australia',''),(4,'Austria',''),(5,'Belarus',''),(6,'Belgium',''),(7,'Bosnia and Herzegovina',''),(8,'Brazil',''),(9,'Bulgaria',''),(10,'Canada',''),(11,'Costa Rica',''),(12,'Croatia',''),(13,'Chile',''),(14,'China',''),(15,'Colombia',''),(16,'Cyprus',''),(17,'Czech Republic',''),(18,'Denmark',''),(19,'Ecuador',''),(20,'Egypt',''),(21,'El Salvador',''),(22,'Estonia',''),(23,'Finland',''),(24,'France',''),(25,'Georgia',''),(26,'Germany',''),(27,'Greece',''),(28,'Guatemala',''),(29,'Hong Kong',''),(30,'Hungary',''),(31,'Iceland',''),(32,'India',''),(33,'Indonesia',''),(34,'Iran',''),(35,'Iraq',''),(36,'Ireland',''),(37,'Israel',''),(38,'Italy',''),(39,'Jamaica',''),(40,'Japan',''),(41,'Kazakhstan',''),(42,'Kyrgyztan',''),(43,'Latvia',''),(44,'Lebanon',''),(45,'Liechtenstein',''),(46,'Lithuania',''),(47,'Luxembourg',''),(48,'Macedonia',''),(49,'Malaysia',''),(50,'Malta',''),(51,'Marshall Islands',''),(52,'Moldova',''),(53,'Morocco',''),(54,'New Zealand',''),(55,'Norway',''),(56,'Peru',''),(57,'Poland',''),(58,'Portugal',''),(59,'Puerto Rico',''),(60,'Romania',''),(61,'Russia',''),(62,'Saudi Arabia',''),(63,'Serbia',''),(64,'Singapore',''),(65,'Slovakia',''),(66,'Slovenia',''),(67,'South Africa',''),(68,'South Korea',''),(69,'Spain',''),(70,'Sweden',''),(71,'Switzerland',''),(72,'Taiwan',''),(73,'Turkey',''),(74,'Ukraine',''),(75,'United Arab Emirates',''),(76,'United Kingdom',''),(77,'United States of America',''),(78,'Unknown',''),(79,'Uruguay',''),(80,'Venezuela',''),(81,'Vietnam',''),(82,'Bangladesh',''),(83,'Mexico','');
/*!40000 ALTER TABLE `tb_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_map`
--

DROP TABLE IF EXISTS `tb_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_map` (
  `map_number` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `author` int(11) NOT NULL,
  `map_file` varchar(100) NOT NULL,
  `background` varchar(12) NOT NULL,
  PRIMARY KEY (`map_number`),
  KEY `fk_author` (`author`),
  CONSTRAINT `fk_author` FOREIGN KEY (`author`) REFERENCES `tb_player` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_map`
--

LOCK TABLES `tb_map` WRITE;
/*!40000 ALTER TABLE `tb_map` DISABLE KEYS */;
INSERT INTO `tb_map` VALUES (1,'The Long Tree',1,'','-Beach'),(2,'Pole',2,'','Art'),(3,'Hellish Hell',6,'','-Hell'),(4,'Statue of Liberty',4,'','Manhattan'),(5,'Relaxing Beach',5,'','-Desert'),(6,'Jungle',4,'','Fruit');
/*!40000 ALTER TABLE `tb_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_match`
--

DROP TABLE IF EXISTS `tb_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `season_id` smallint(6) NOT NULL,
  `player_name_id` int(11) NOT NULL,
  `opponent_name_id` int(11) NOT NULL,
  `player_wins` tinyint(1) DEFAULT NULL,
  `opponent_wins` tinyint(1) DEFAULT NULL,
  `draws` tinyint(1) DEFAULT NULL,
  `player_rh` tinyint(1) DEFAULT NULL,
  `opponent_rh` tinyint(1) DEFAULT NULL,
  `disconnects` tinyint(1) DEFAULT NULL,
  `player_rep` tinyint(1) DEFAULT NULL,
  `player_rep_timestamp` datetime DEFAULT NULL,
  `opponent_neg_rep_post` varchar(200) DEFAULT NULL,
  `player_neg_rep_reply` varchar(200) DEFAULT NULL,
  `player_rep_reply_timestamp` datetime DEFAULT NULL,
  `opponent_rep` tinyint(1) DEFAULT NULL,
  `opponent_rep_timestamp` datetime DEFAULT NULL,
  `player_neg_rep_post` varchar(200) DEFAULT NULL,
  `opponent_neg_rep_reply` varchar(200) DEFAULT NULL,
  `opponent_rep_reply_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `fk_season_match_id` (`season_id`),
  KEY `fk_player_match_id` (`player_name_id`),
  KEY `fk_opponent_match_id` (`opponent_name_id`),
  CONSTRAINT `fk_opponent_match_id` FOREIGN KEY (`opponent_name_id`) REFERENCES `tb_player` (`player_id`),
  CONSTRAINT `fk_player_match_id` FOREIGN KEY (`player_name_id`) REFERENCES `tb_player` (`player_id`),
  CONSTRAINT `fk_season_match_id` FOREIGN KEY (`season_id`) REFERENCES `tb_season` (`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_match`
--

LOCK TABLES `tb_match` WRITE;
/*!40000 ALTER TABLE `tb_match` DISABLE KEYS */;
INSERT INTO `tb_match` VALUES (2,1,2,3,1,3,1,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,5,1,3,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,2,4,1,2,1,0,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,2,5,0,1,0,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,1,4,3,1,0,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,3,2,2,2,2,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,2,4,5,0,0,1,0,0,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,1,3,4,2,2,0,1,0,2,-1,'2024-12-03 16:00:07','Very bad loser... pulled his cable as soon as he made a mistake','It just happened dude... it was bad luck, just that!','2024-12-03 17:24:18',-1,'2024-12-04 22:02:03','Called me a lier just because my net dropped once.','I don\'t believe you.','2024-12-05 13:36:33'),(11,3,5,3,1,1,0,0,1,1,1,'2026-06-24 13:47:11',NULL,NULL,NULL,1,'2026-06-24 13:47:11',NULL,NULL,NULL),(12,3,1,4,2,1,1,0,0,2,1,'2026-03-21 14:30:15',NULL,NULL,NULL,1,'2026-03-21 14:30:15',NULL,NULL,NULL),(13,2,4,3,1,3,2,1,0,3,1,'2025-11-08 12:22:59',NULL,NULL,NULL,1,'2025-11-08 12:22:59',NULL,NULL,NULL),(14,1,1,3,0,1,0,0,0,0,1,'2024-02-14 17:53:56',NULL,NULL,NULL,1,'2024-02-14 17:53:56',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_match_details`
--

DROP TABLE IF EXISTS `tb_match_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_match_details` (
  `match_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `match_event` enum('Player Win','Opponent Win','Draw','Player RH','Opponent RH','Disconnect') NOT NULL,
  `event_timestamp` datetime NOT NULL,
  `replay` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`match_details_id`),
  KEY `fk_match_details_id` (`match_id`),
  CONSTRAINT `fk_match_details_id` FOREIGN KEY (`match_id`) REFERENCES `tb_match` (`match_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_match_details`
--

LOCK TABLES `tb_match_details` WRITE;
/*!40000 ALTER TABLE `tb_match_details` DISABLE KEYS */;
INSERT INTO `tb_match_details` VALUES (1,2,'Player Win','2024-02-15 10:40:22','server/games/NouSvsPawelddz55(1).xgame'),(2,2,'Draw','2024-03-25 11:40:32','server/games/NouSvsPawelddz55(2).xgame'),(3,2,'Opponent Win','2024-03-25 13:55:02','server/games/NouSvsPawelddz55(3).xgame'),(4,2,'Disconnect','2024-03-25 15:41:42','server/games/NouSvsPawelddz55(4).xgame'),(5,2,'Opponent Win','2024-03-26 10:30:11','server/games/NouSvsPawelddz55(5).xgame'),(6,2,'Opponent Win','2024-04-03 01:00:09','server/games/NouSvsPawelddz55(6).xgame'),(7,3,'Player Win','2024-04-13 15:30:12',NULL),(8,3,'Player Win','2024-04-13 20:44:22',NULL),(9,3,'Player Win','2024-04-13 22:00:00',NULL),(10,4,'Opponent Win','2024-06-10 12:33:10',NULL),(11,4,'Opponent RH','2024-06-11 19:55:43',NULL),(12,4,'Player Win','2024-06-14 23:20:10',NULL),(13,4,'Disconnect','2024-06-20 18:20:27',NULL),(14,4,'Opponent Win','2024-06-24 15:33:29',NULL),(15,4,'Draw','2024-06-28 23:09:09',NULL),(16,5,'Opponent Win','2025-02-22 22:04:11',NULL),(17,5,'Player RH','2025-03-01 20:50:40',NULL),(18,5,'Disconnect','2025-03-14 11:14:19',NULL),(19,5,'Opponent RH','2025-03-19 17:07:17',NULL);
/*!40000 ALTER TABLE `tb_match_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message_box`
--

DROP TABLE IF EXISTS `tb_message_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_message_box` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `message_subject` varchar(80) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `message_timestamp` datetime NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `fk_sender_id` (`sender_id`),
  KEY `fk_recipient_id` (`recipient_id`),
  CONSTRAINT `fk_recipient_id` FOREIGN KEY (`recipient_id`) REFERENCES `tb_player` (`player_id`),
  CONSTRAINT `fk_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `tb_player` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message_box`
--

LOCK TABLES `tb_message_box` WRITE;
/*!40000 ALTER TABLE `tb_message_box` DISABLE KEYS */;
INSERT INTO `tb_message_box` VALUES (2,5,1,'Hi!','Hi there. How are you doing? :)','2024-02-01 15:56:03'),(3,3,2,'How are you doing, bro?','Hey! About what you asked me, there was nothing I could find about it. Sorry to disappoint you.','2024-07-26 09:44:19'),(4,6,4,'Pending Game','Hi there. I haven\' heard from you in a while. Are you ok? Let me know when we can play. :)','2024-06-22 11:00:49'),(5,2,1,'Check this video out lol','Video is attached below. Let me know what you think later. xDDD','2025-01-03 02:05:13'),(6,3,2,'','Dont expect me to play with you again after what you did, just saying...','2025-07-02 12:07:17'),(7,4,1,'Favour','Yo, he said he can\'. :/','2024-11-29 07:53:37');
/*!40000 ALTER TABLE `tb_message_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_player`
--

DROP TABLE IF EXISTS `tb_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_player` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(16) NOT NULL,
  `wormnet_flag_id` smallint(6) NOT NULL,
  `country_flag_id` smallint(6) NOT NULL,
  `hides_country_flag` tinyint(1) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password_enc` char(60) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `pronoun` enum('He/Him','She/Her','They/Them') NOT NULL,
  `birth_date` date DEFAULT NULL,
  `availability_time` varchar(200) DEFAULT NULL,
  `is_fanatic` tinyint(1) NOT NULL,
  `allows_replays` tinyint(1) NOT NULL,
  `subscribed_to_next_season` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_name` (`player_name`),
  KEY `fk_flag_id1` (`wormnet_flag_id`),
  KEY `fk_flag_id2` (`country_flag_id`),
  CONSTRAINT `fk_flag_id1` FOREIGN KEY (`wormnet_flag_id`) REFERENCES `tb_flag` (`flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_flag_id2` FOREIGN KEY (`country_flag_id`) REFERENCES `tb_flag` (`flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_player`
--

LOCK TABLES `tb_player` WRITE;
/*!40000 ALTER TABLE `tb_player` DISABLE KEYS */;
INSERT INTO `tb_player` VALUES (1,'Magnus',10,8,0,'magnus@gmail.com','KGBAkgad7yg2i13gbr173fbukvkVBKvbfiuasgfr7ia6fa7fagvHVsavfd7d','server/players/magnus/piece.png','He/Him','1986-08-11','Not playing currently yet.',1,0,1),(2,'NouS',8,8,0,'nousito@gmail.com','sdukdiusduiUI7sdgfsGAdAgba789dfiausfgiahbfr3egh7wge3h873hoed','server/players/nous/mage.png','He/Him','1985-09-02','I\'m free on the weekends.',1,1,1),(3,'Pawelddz55',57,57,0,'pawelddzbaby@gmail.com','nudsisdgkjsdgbsuighi437gtui234bkebjkbjksdfjbgbghGGYjAHduigIU','server/players/pawelddz55/cup.png','He/Him','1989-06-12','',1,1,1),(4,'Mark',74,74,0,'ohhimark@hotmail.com','udhnflkuhfuhfuhAHDAOI88787adhaiod8a9dy0adhAIODAHaadiou89a7dd','server/players/mark/peace.png','He/Him','1987-10-10','',0,1,1),(5,'niex',27,27,0,'niexniexniex@hotmail.com','auifhgad8uftge87gHJHJhjGFYUkIH78Tdfdgfyufig7ifgd7asifgbibjs4','server/players/niex/beach.png','She/Her','1991-08-30','My times are varied and I don\' play very often.',0,1,1),(6,'Moun',76,80,1,'mouning@gmail.com','ihnoihfadufhy987y89dashfuiodashg9hJJjshf8977Hfhsjh8hf8sfef78','server/players/moun/triangle.png','They/Them','1992-02-09','I can play Mondays and Wednesdays at 10GMT and any time on Saturday. Sometimes I can play on Sundays too.',0,0,0);
/*!40000 ALTER TABLE `tb_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_season`
--

DROP TABLE IF EXISTS `tb_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_season` (
  `season_id` smallint(6) NOT NULL,
  `season_year` smallint(6) NOT NULL,
  PRIMARY KEY (`season_id`),
  UNIQUE KEY `season_year` (`season_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_season`
--

LOCK TABLES `tb_season` WRITE;
/*!40000 ALTER TABLE `tb_season` DISABLE KEYS */;
INSERT INTO `tb_season` VALUES (1,2024),(2,2025),(3,2026),(4,2027);
/*!40000 ALTER TABLE `tb_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_season_subscribed`
--

DROP TABLE IF EXISTS `tb_season_subscribed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_season_subscribed` (
  `season_id` smallint(6) NOT NULL,
  `player_id` int(11) NOT NULL,
  `class` enum('The Mole Site Founder','Honorable and Trustworthy','Known Moler','Unknown Moler','Bad Moler','Banned Moler') NOT NULL DEFAULT 'Unknown Moler',
  `positive_rep` int(11) NOT NULL DEFAULT 5,
  `negative_rep` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`season_id`,`player_id`),
  KEY `fk_subscribed_player_id` (`player_id`),
  CONSTRAINT `fk_subscribed_player_id` FOREIGN KEY (`player_id`) REFERENCES `tb_player` (`player_id`),
  CONSTRAINT `fk_subscribed_season_id` FOREIGN KEY (`season_id`) REFERENCES `tb_season` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_season_subscribed`
--

LOCK TABLES `tb_season_subscribed` WRITE;
/*!40000 ALTER TABLE `tb_season_subscribed` DISABLE KEYS */;
INSERT INTO `tb_season_subscribed` VALUES (1,1,'The Mole Site Founder',28,3,1),(1,2,'Honorable and Trustworthy',18,2,1),(1,3,'Known Moler',8,1,1),(1,4,'Known Moler',4,0,0),(1,5,'Known Moler',3,0,1),(1,6,'Banned Moler',6,15,0),(2,1,'The Mole Site Founder',34,4,1),(2,2,'Honorable and Trustworthy',23,2,1),(2,3,'Known Moler',11,2,1),(2,4,'Known Moler',9,1,0),(2,5,'Honorable and Trustworthy',12,0,1),(2,6,'Unknown Moler',7,0,1);
/*!40000 ALTER TABLE `tb_season_subscribed` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-09 15:13:26
