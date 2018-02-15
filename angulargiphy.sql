CREATE DATABASE  IF NOT EXISTS `angulargiphy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `angulargiphy`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: angulargiphy
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `angulargiphy`
--

DROP TABLE IF EXISTS `angulargiphy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angulargiphy` (
  `id` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `collectionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angulargiphy`
--

LOCK TABLES `angulargiphy` WRITE;
/*!40000 ALTER TABLE `angulargiphy` DISABLE KEYS */;
INSERT INTO `angulargiphy` VALUES ('10LKovKon8DENq','pika','pika'),('13hwobIccdiC2I','test','kitty'),('13lWraa7dfb7G0','test','testcol'),('26gstigw6XFNo2Zgs','test','kitty'),('3o85xHnflvkLwi2nQY','test','kitty'),('3oEduV4SOS9mmmIOkw','pika','pika'),('474MaOHaHXyla','test','testcol'),('6jMwJu1ldoowM','digimon','digimon1'),('6RuhlzSdhIAqk','test','kitty'),('7iizPhPPgxJHa','test','testcol'),('7T200DTPdx31e','test','testcol'),('8qQtJM19hUPjG','test','kitty'),('BRwgvFM9BfP8c','test','testcol'),('d3JtCNegRi2zgmpG','pika','pika'),('EfstMjU18SUwM','test','kitty'),('FghFqUrZe4XWE','pika','pika2'),('GckBRC6RCdvYA','pika','pika2'),('GckBRC6RCdvYA','test','testcol'),('gPirTyBK6cPIc','test','testcol'),('HHl7fUQN6CWxa','test','testcol'),('IHFWXeXn1xcEU','digimon','digimon1'),('iPvKbXfbCRy7K','digimon','digimon1'),('jWD0CazNPo6MU','digimon','digimon1'),('kVQDeD59wVK5W','pika','pika2'),('l0HlUHo5drbl5DMDm','test','testcol'),('l41m3pCCdMLTNky4M','test','testcol'),('l4HnWueIARPE9HtcI','test','kitty'),('qtaEOaOCNfoKA','pika','pika'),('TanVv1ZFb8BCE','test','testcol'),('texPPGdPu32q4','test','testcol'),('UNiTh1W6H5wnC','digimon','digimon1'),('UOvFfXGINpmN2','digimon','digimon1'),('vDhDcIEmShbUI','test','testcol'),('vf3LO38xXNRrq','pika','pika'),('XrJ5Am20gHuTe','pika','pika2'),('XrJ5Am20gHuTe','test','testcol'),('y3cVeG1GUBu92','test','testcol'),('yzsonlmWtvuko','pika','pika2'),('Z7EnHiV4KVCve','test','testcol'),('zjJm5UpTf9jry','test','testcol');
/*!40000 ALTER TABLE `angulargiphy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-15 22:53:30
