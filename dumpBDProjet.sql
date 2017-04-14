-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: projet
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Current Database: `projet`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `projet` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `projet`;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe` (
  `num_classe` int(10) NOT NULL,
  `Annee` int(10) NOT NULL,
  PRIMARY KEY (`num_classe`),
  KEY `fk` (`Annee`),
  CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`Annee`) REFERENCES `promotion` (`Annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES (1,2016),(2,2017);
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleve` (
  `ID_eleve` int(10) NOT NULL,
  `prenom` varchar(60) DEFAULT NULL,
  `nom` varchar(60) DEFAULT NULL,
  `adresse1` varchar(64) DEFAULT NULL,
  `adresse2` varchar(64) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Tel` int(15) DEFAULT NULL,
  `CodePostal` int(10) DEFAULT NULL,
  `NumSecu` int(20) DEFAULT NULL,
  `num_classe` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_eleve`),
  KEY `fk` (`num_classe`),
  CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`num_classe`) REFERENCES `classe` (`num_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleve`
--

LOCK TABLES `eleve` WRITE;
/*!40000 ALTER TABLE `eleve` DISABLE KEYS */;
INSERT INTO `eleve` VALUES (1,'benjamin','choukroun','montepllier','montarnaud','zhfozhf@gmail.com',467556972,34570,5454684,1),(2,'Jack','Nicholson','New-York','Los Angeles','jacky34@jsuisungamin.fr',4598586,84590,113113,2),(3,'Nikky','Larson','1026 angle-street','Tokyo','NKpro@japan.jp',0712345678,106-8514,2),(4,'Albert','Denvert','22 rue du chateau','Cours du roi','Lemousquetaire@duroi.fr',0000000000,72000,1);
/*!40000 ALTER TABLE `eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enseigne`
--

DROP TABLE IF EXISTS `enseigne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enseigne` (
  `num_classe` int(10) NOT NULL,
  `ID_prof` int(10) NOT NULL,
  PRIMARY KEY (`num_classe`,`ID_prof`),
  KEY `fk` (`ID_prof`),
  CONSTRAINT `enseigne_ibfk_1` FOREIGN KEY (`ID_prof`) REFERENCES `professeur` (`ID_prof`),
  CONSTRAINT `enseigne_ibfk_2` FOREIGN KEY (`num_classe`) REFERENCES `classe` (`num_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseigne`
--

LOCK TABLES `enseigne` WRITE;
/*!40000 ALTER TABLE `enseigne` DISABLE KEYS */;
INSERT INTO `enseigne` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `enseigne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examen` (
  `DateExam` date NOT NULL,
  `ID_prof` int(10) NOT NULL,
  `ID_matiere` int(10) NOT NULL,
  `ID_eleve` int(10) NOT NULL,
  `coef` int(10) DEFAULT NULL,
  `note` int(10) DEFAULT NULL,
  PRIMARY KEY (`DateExam`,`ID_prof`,`ID_matiere`,`ID_eleve`),
  KEY `fk` (`ID_prof`),
  KEY `fk1` (`ID_matiere`),
  KEY `fk2` (`ID_eleve`),
  CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`ID_prof`) REFERENCES `professeur` (`ID_prof`),
  CONSTRAINT `examen_ibfk_2` FOREIGN KEY (`ID_matiere`) REFERENCES `matiere` (`ID_matiere`),
  CONSTRAINT `examen_ibfk_3` FOREIGN KEY (`ID_eleve`) REFERENCES `eleve` (`ID_eleve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
INSERT INTO `examen` VALUES ('2016-02-02',1,1,1,4,15),('2017-04-12',2,2,2,12,5);
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faitetudier`
--

DROP TABLE IF EXISTS `faitetudier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faitetudier` (
  `ID_matiere` int(10) NOT NULL,
  `ID_prof` int(10) NOT NULL,
  PRIMARY KEY (`ID_matiere`,`ID_prof`),
  KEY `fk1` (`ID_prof`),
  CONSTRAINT `faitetudier_ibfk_1` FOREIGN KEY (`ID_matiere`) REFERENCES `matiere` (`ID_matiere`),
  CONSTRAINT `faitetudier_ibfk_2` FOREIGN KEY (`ID_prof`) REFERENCES `professeur` (`ID_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faitetudier`
--

LOCK TABLES `faitetudier` WRITE;
/*!40000 ALTER TABLE `faitetudier` DISABLE KEYS */;
INSERT INTO `faitetudier` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `faitetudier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matiere` (
  `ID_matiere` int(10) NOT NULL,
  `nom` varchar(60) DEFAULT NULL,
  `IdUE` int(20) DEFAULT NULL,
  PRIMARY KEY (`ID_matiere`),
  KEY `fk` (`IdUE`),
  CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`IdUE`) REFERENCES `ue` (`IdUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matiere`
--

LOCK TABLES `matiere` WRITE;
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` VALUES (1,'Maths',1),(2,'Réseau',2);
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeur` (
  `ID_prof` int(10) NOT NULL,
  `prenom` varchar(60) DEFAULT NULL,
  `nom` varchar(60) DEFAULT NULL,
  `adresse1` varchar(64) DEFAULT NULL,
  `adresse2` varchar(64) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Tel` int(15) DEFAULT NULL,
  `CodePostal` int(10) DEFAULT NULL,
  `NumSecu` int(20) DEFAULT NULL,
  PRIMARY KEY (`ID_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur`
--

LOCK TABLES `professeur` WRITE;
/*!40000 ALTER TABLE `professeur` DISABLE KEYS */;
INSERT INTO `professeur` VALUES (1,'albert','dupontel','montepllier','montarnaud','kikou@gmail.com',467555840,34570,18113),(2,'Brad','Clooney','Bilbao','Vimioso','cloclo@epsi.fr',628466610,45896,147852369);
/*!40000 ALTER TABLE `professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `Annee` int(10) NOT NULL,
  PRIMARY KEY (`Annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (2016),(2017);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suit`
--

DROP TABLE IF EXISTS `suit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suit` (
  `ID_matiere` int(10) NOT NULL,
  `ID_eleve` int(10) NOT NULL,
  `moyenne` int(10) DEFAULT NULL,
  `appreciation` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`ID_matiere`,`ID_eleve`),
  KEY `fk` (`ID_eleve`),
  CONSTRAINT `suit_ibfk_1` FOREIGN KEY (`ID_eleve`) REFERENCES `eleve` (`ID_eleve`),
  CONSTRAINT `suit_ibfk_2` FOREIGN KEY (`ID_matiere`) REFERENCES `matiere` (`ID_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suit`
--

LOCK TABLES `suit` WRITE;
/*!40000 ALTER TABLE `suit` DISABLE KEYS */;
INSERT INTO `suit` VALUES (1,1,12,'élève sérieux'),(2,2,15,'Moyen peu faire mieux, en gros t est une merde voilà');
/*!40000 ALTER TABLE `suit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ue`
--

DROP TABLE IF EXISTS `ue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ue` (
  `IdUE` int(11) NOT NULL,
  `Semestre` varchar(60) DEFAULT NULL,
  `Crédit` int(20) DEFAULT NULL,
  PRIMARY KEY (`IdUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ue`
--

LOCK TABLES `ue` WRITE;
/*!40000 ALTER TABLE `ue` DISABLE KEYS */;
INSERT INTO `ue` VALUES (1,'Semestre1',2),(2,'Smestre2',5);
/*!40000 ALTER TABLE `ue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-28 16:50:34
