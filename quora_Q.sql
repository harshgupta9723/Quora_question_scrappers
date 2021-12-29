-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: database_1
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `quora_questions`
--

DROP TABLE IF EXISTS `quora_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_questions`
--

LOCK TABLES `quora_questions` WRITE;
/*!40000 ALTER TABLE `quora_questions` DISABLE KEYS */;
INSERT INTO `quora_questions` VALUES (1,'Is a gig economy good for us in general?'),(2,'Is it possible to make a decent living in todays gig economy'),(3,'Do you think the gig economy is a good or bad thing'),(4,'Is the gig economy good for working professionals'),(5,'Is working in the gig economy worth it'),(6,'How reliable are gig economy jobs'),(7,'What makes gig economy so horrible'),(8,'What type of jobs are included in the term gig economy?'),(9,'What are the advantages of a gig economy'),(10,'Is the gig economy going to become the new normal'),(11,'How reliable are gig economy jobs'),(12,'What will be the best job opportunities created in a gig economy'),(13,'What is better, participating in the gig economy or having a 9 to 5 job with benefits'),(14,'What job in the gig economy is worth it'),(15,'Can people earn a real living off of “gig economy” jobs?'),(16,'What makes gig economy so horrible'),(17,'Why is the number of Gig Worker increasing'),(18,'How reliable are gig economy jobs'),(19,'Can you make a living with just gig-economy apps'),(20,'Can you become wealthy from the GIG economy'),(21,'What will be the best job opportunities created in a gig economy'),(22,'What is the meaning of a gig economy job?'),(23,'What are the best gig economy jobs'),(24,'What are the pros and cons of gig economy'),(25,'What type of jobs are included in the term gig economy'),(26,'Is the gig economy going to become the new normal'),(27,'How reliable are gig economy jobs'),(28,'What is a gig economy'),(29,'What opportunities are in the gig economy?'),(30,'What will be the best job opportunities created in a gig economy'),(31,'What is the future of gig economy'),(32,'What are the best gig economy jobs'),(33,'What are the downsides to working in the gig economy'),(34,'What started the gig economy'),(35,'What are the pros and cons of gig economy'),(36,'How important is the rise of GIG economy?'),(37,'What are the pros and cons of gig economy'),(38,'Is the gig economy going to become the new normal'),(39,'What are the advantages of a gig economy'),(40,'Is the gig economy growing'),(41,'How reliable are gig economy jobs'),(42,'Why do top companies choose a gig economy for their work'),(43,'What are the pros and cons of gig economy?'),(44,'What are the benefits of gig economy workers'),(45,'What is a gig economy'),(46,'What makes gig economy so horrible'),(47,'Can people earn a real living off of “gig economy” jobs'),(48,'How important is the rise of GIG economy'),(49,'What is the disadvantage of gig economy for customer'),(50,'What is a gig employee?'),(51,'What do you mean by gig worker'),(52,'Are gig workers employees'),(53,'Are gig workers contractors, employees or other'),(54,'What is a gig job'),(55,'What is an example of a gig worker'),(56,'What is a gig company'),(57,'What are the best gig economy jobs?'),(58,'What opportunities are in the gig economy'),(59,'Whats the best bank for gig economy jobs'),(60,'What are the pros and cons of gig economy'),(61,'What is a gig job'),(62,'What will be the best job opportunities created in a gig economy'),(63,'How reliable are gig economy jobs'),(64,'How can workers thrive in the gig economy?'),(65,'Is gig economy a threat to permanent employment and experienced professionals'),(66,'What is a gig economy'),(67,'Can people earn a real living off of “gig economy” jobs'),(68,'Do you live by the gig economy and how successful have you been'),(69,'How can you apply the gig economy to yourself'),(70,'What are the benefits of gig economy workers');
/*!40000 ALTER TABLE `quora_questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-29 15:44:50
