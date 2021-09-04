-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: etudiant
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `coordinateur`
--

DROP TABLE IF EXISTS `coordinateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinateur` (
  `idcoordinateur` varchar(40) NOT NULL,
  `mdp` varchar(45) DEFAULT NULL,
  `filiereCoo` varchar(4) DEFAULT 'N/A',
  PRIMARY KEY (`idcoordinateur`),
  KEY `fil_idx` (`filiereCoo`),
  KEY `filCoo_idx` (`filiereCoo`),
  CONSTRAINT `filCoo` FOREIGN KEY (`filiereCoo`) REFERENCES `filiere` (`idfiliere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinateur`
--

LOCK TABLES `coordinateur` WRITE;
/*!40000 ALTER TABLE `coordinateur` DISABLE KEYS */;
INSERT INTO `coordinateur` VALUES ('Zine','dine','STPI');
/*!40000 ALTER TABLE `coordinateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiant` (
  `cne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `mdp` varchar(45) DEFAULT NULL,
  `filiereEtu` varchar(45) DEFAULT NULL,
  `semestreEtu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cne`),
  KEY `filiere_idx` (`filiereEtu`),
  KEY `semestre_idx` (`semestreEtu`),
  CONSTRAINT `filiereEtu` FOREIGN KEY (`filiereEtu`) REFERENCES `filiere` (`idfiliere`),
  CONSTRAINT `semEtu` FOREIGN KEY (`semestreEtu`) REFERENCES `semestre` (`idSemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
INSERT INTO `etudiant` VALUES (1,'Alaoui Ismaili','Imadeddine','imad','SIC','S4'),(2,'Benchkroune','Othman','chibre','SIC','S4'),(6,'Zaim','Othman','z','GE','S3'),(69,'Nice','Hamid',NULL,'TRC','S2');
/*!40000 ALTER TABLE `etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiere`
--

DROP TABLE IF EXISTS `filiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filiere` (
  `idfiliere` varchar(4) NOT NULL,
  `nbmodule` varchar(45) DEFAULT NULL,
  `module` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfiliere`),
  KEY `idfiliere` (`idfiliere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiere`
--

LOCK TABLES `filiere` WRITE;
/*!40000 ALTER TABLE `filiere` DISABLE KEYS */;
INSERT INTO `filiere` VALUES ('GE',NULL,NULL),('GME',NULL,NULL),('SIC',NULL,NULL),('STPI',NULL,NULL),('TRC',NULL,NULL);
/*!40000 ALTER TABLE `filiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matiere` (
  `idmatiere` varchar(40) NOT NULL,
  `nomMatiere` text,
  `coefEcrit` int DEFAULT '1',
  `coefTP` int DEFAULT '0',
  `nbSeanceTP` text,
  `session` text,
  `module` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmatiere`),
  KEY `module_idx` (`module`),
  CONSTRAINT `module` FOREIGN KEY (`module`) REFERENCES `module` (`idModule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matiere`
--

LOCK TABLES `matiere` WRITE;
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` VALUES ('Alg 1','',9,3,'6','','STPI 1'),('Alg 2','',1,0,'','','STPI 4'),('Alg 3','',1,0,'','','SIC 1'),('Algo Prog','',1,0,'','','SIC 2'),('Anal 1','',1,0,'','','STPI 1'),('Anal 2','',1,0,'','','STPI 4'),('Anal 3','',1,0,'','','SIC 1'),('Archi ordi','',1,0,'','','SIC 3'),('CCA 1','Culture et Communication en Anglais',1,0,'12','','SHES 1'),('CCA 2','',1,0,'','','SHES 2'),('CCA 3','',1,0,'','','SHES 3'),('CCA 4','',1,0,'','','SHES 4'),('CCE 1','Culture et Communication Euromediteranienne',1,1,'4','','SHES 1'),('CCE 2','',1,0,'','','SHES 2'),('CCE 3','',1,0,'','','SHES 3'),('CCE 4','',1,0,'','','SHES 4'),('CCI 1','Culture et Communication pour Ingénieur',3,1,'4','','SHES 1'),('CCI 2','',2,1,'4','','SHES 2'),('CCI 3','',1,0,'','','SHES 3'),('Chimie','',1,0,'','','STPI 2'),('ECO','',1,0,'','','STPI 4'),('Electro Num','',1,0,'','','SIC 3'),('Electromag 1','',1,0,'','','STPI 3'),('Electromag 2','',1,0,'','','STPI 6'),('Info 1','',1,0,'','','STPI 3'),('Info 2','',1,0,'','','STPI 6'),('Méca 1','',1,0,'','','STPI 2'),('Méca 2','',1,0,'','','STPI 5'),('N/A',NULL,1,0,NULL,NULL,'N/A'),('Opt','',1,0,'','','STPI 6'),('Proba','',1,0,'','','SIC 1'),('Réseaux','',1,0,'','','SIC 3'),('SE','',1,0,'','','SIC 2'),('Thermo','',1,0,'','','STPI 5');
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `idModule` varchar(45) NOT NULL,
  `nomModule` text,
  `volumeHoraireModule` int DEFAULT NULL,
  `coefficientModule` int DEFAULT '1',
  `semestre` varchar(45) DEFAULT NULL,
  `filiere` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idModule`),
  KEY `semestre_idx` (`semestre`),
  KEY `filiere_idx` (`filiere`),
  CONSTRAINT `fil` FOREIGN KEY (`filiere`) REFERENCES `filiere` (`idfiliere`),
  CONSTRAINT `semestre` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`idSemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES ('AAA','Approches Avancées d\'Apprentissage',50,1,'S9','SIC'),('ASI 1','Architecture des SI 1',50,1,'S5','SIC'),('ASI 2','Architecture des SI 2',50,1,'S7','SIC'),('ASI 3','Architecture de SI 3',50,1,'S9','SIC'),('GP','Gestion de Projets',50,1,'S8','SIC'),('IDM','Infrastructures pour les Donnée Massives',50,1,'S9','SIC'),('MD','Mesures et Distribution',50,1,'S6','SIC'),('ME 2',NULL,NULL,1,'S3','GME'),('MRH','Management des ressources humaines',50,1,'S9','SIC'),('N/A',NULL,NULL,1,NULL,'TRC'),('Opt','Optimisation 1',50,1,'S7','SIC'),('PID','Analyse - Apprentissage',100,1,'S8','SIC'),('POC','Telecom 3 - Vision 2',100,1,'S8','SIC'),('Prog 2','Programmation 2',50,1,'S6','SIC'),('Prog 3','Programmation 3',50,1,'S7','SIC'),('Prog 4','Programmation 4',50,1,'S9','SIC'),('Prog1','Programmation 1',50,1,'S5','SIC'),('Proj1','Projet de fin d\'études',0,1,'S6','SIC'),('PS','Probabilité - Statiqtiques 1',50,1,'S5','SIC'),('PS 2','Probabilité - Statistique 2',50,1,'S6','SIC'),('Qlt','Génie logiciel - Assurance Qualité',50,1,'S8','SIC'),('RO-G','Graphes - Recherche Opérationnelle',50,1,'S8','SIC'),('Sg','Signal',50,1,'S5','SIC'),('SGBD','Base de donnée',50,1,'S6','SIC'),('SHES 1','Sciences Humaines Economiques et Sociales 1',100,1,'S1','STPI'),('SHES 2','Sciences Humaines Economiques et Sociales 2',100,1,'S2','STPI'),('SHES 3','Sciences Humaines Economiques et Sociales 3',100,1,'S3','SIC'),('SHES 4','Sciences Humaines Economiques et Sociales 4',100,1,'S4','SIC'),('SHES 5','Sciences Humaines Economiques et Sociales 5',100,1,'S5','SIC'),('SHES 6','Sciences Humaines Economiques et Sociales 6',100,1,'S6','SIC'),('SHES 7','Sciences Humaines Economiques et Sociales 7',100,1,'S7','SIC'),('SHES 8','Sciences Humaines Economiques et Sociales 8',50,1,'S8','SIC'),('SHES 9','Sciences Humaines Economiques et Sociales 9',100,1,'S9','SIC'),('SIC 1','Math 3',NULL,1,'S3','SIC'),('SIC 2','Algo - Système d\'exploitation',NULL,1,'S3','SIC'),('SIC 3','Electronique - Réseaux',NULL,1,'S3','SIC'),('SIC 4','Calcul différenciel',0,1,'S4','SIC'),('SIC 5','Modélisation Poo - Projet Programation',0,1,'S4','SIC'),('SIC 6','Automatique - Codage Modélisation',0,1,'S4','SIC'),('SSI 1','Cyber Sécurité',50,1,'S7','SIC'),('STPI 1','Mathématiques 1',96,1,'S1','STPI'),('STPI 2','Mécanique 1 - Chimie',99,1,'S1','STPI'),('STPI 3','Electromagnétisme 1 - Informatique 1',102,1,'S1','STPI'),('STPI 4','Math 2',104,1,'S2','STPI'),('STPI 5','Mécanique 2 - Thermodynamique',90,1,'S2','STPI'),('STPI 6','Optique - Electromagnétique 2 - Enseignement électif',105,1,'S2','TRC'),('TD 1','Traitement des Données 1',50,1,'S5','SIC'),('TD 2','Traitement des Données 2',50,1,'S7','SIC'),('TD 3','Traitement des Données 3',50,1,'S8','SIC'),('Tlc 1','Telecom 1',50,1,'S5','SIC'),('Tllc 2','Telecom 2',50,1,'S6','SIC'),('Vs 1','Vision 1',50,1,'S7','SIC');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `idEtudiant` int NOT NULL,
  `idMatiere` varchar(45) NOT NULL DEFAULT 'N/A',
  `noteECRIT` decimal(4,2) DEFAULT '0.00',
  `noteTP` decimal(4,2) DEFAULT '0.00',
  PRIMARY KEY (`idEtudiant`,`idMatiere`),
  KEY `matiere_idx` (`idMatiere`),
  CONSTRAINT `etudiant` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`cne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,'Alg 1',5.00,0.00),(1,'Algo Prog',17.00,0.00),(1,'Proba',13.00,0.00),(2,'Alg 1',12.00,0.00),(2,'Algo Prog',16.00,0.00),(6,'Alg 1',16.00,0.00);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notemodule`
--

DROP TABLE IF EXISTS `notemodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notemodule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idEtudiant` int DEFAULT NULL,
  `idModule` varchar(40) DEFAULT NULL,
  `noteModule` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mod_idx` (`idModule`),
  KEY `idetu_idx` (`idEtudiant`),
  CONSTRAINT `idetu` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`cne`),
  CONSTRAINT `mod` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notemodule`
--

LOCK TABLES `notemodule` WRITE;
/*!40000 ALTER TABLE `notemodule` DISABLE KEYS */;
INSERT INTO `notemodule` VALUES (1,1,'SIC 1',NULL);
/*!40000 ALTER TABLE `notemodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notesemestre`
--

DROP TABLE IF EXISTS `notesemestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notesemestre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idEtudiant` int DEFAULT NULL,
  `idSemestre` varchar(40) DEFAULT NULL,
  `noteSemestre` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sem_idx` (`idSemestre`),
  KEY `idetu_idx` (`idEtudiant`),
  KEY `idetud_idx` (`idEtudiant`),
  CONSTRAINT `idetud` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`cne`),
  CONSTRAINT `sem` FOREIGN KEY (`idSemestre`) REFERENCES `semestre` (`idSemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notesemestre`
--

LOCK TABLES `notesemestre` WRITE;
/*!40000 ALTER TABLE `notesemestre` DISABLE KEYS */;
INSERT INTO `notesemestre` VALUES (1,69,'S2',10),(2,1,'S1',15);
/*!40000 ALTER TABLE `notesemestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_to_matiere`
--

DROP TABLE IF EXISTS `prof_to_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_to_matiere` (
  `idprof` varchar(40) NOT NULL,
  `idmatiere` varchar(45) NOT NULL,
  PRIMARY KEY (`idprof`,`idmatiere`),
  KEY `idMat_idx` (`idmatiere`),
  CONSTRAINT `idMat` FOREIGN KEY (`idmatiere`) REFERENCES `matiere` (`idmatiere`),
  CONSTRAINT `idProf` FOREIGN KEY (`idprof`) REFERENCES `professeur` (`idprofesseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_to_matiere`
--

LOCK TABLES `prof_to_matiere` WRITE;
/*!40000 ALTER TABLE `prof_to_matiere` DISABLE KEYS */;
INSERT INTO `prof_to_matiere` VALUES ('Zine','Algo Prog'),('Zineb','CCI 1'),('Zineb','CCI 2'),('Zineb','CCI 3');
/*!40000 ALTER TABLE `prof_to_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professeur` (
  `idprofesseur` varchar(40) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `Mdp` varchar(45) NOT NULL,
  PRIMARY KEY (`idprofesseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur`
--

LOCK TABLES `professeur` WRITE;
/*!40000 ALTER TABLE `professeur` DISABLE KEYS */;
INSERT INTO `professeur` VALUES ('lina',NULL,NULL,'alaoui'),('zine',NULL,NULL,'dine'),('zineb',NULL,NULL,'Chairai');
/*!40000 ALTER TABLE `professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre` (
  `idSemestre` varchar(3) NOT NULL,
  `nbModule` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idSemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` VALUES ('S1',NULL),('S2',NULL),('S3',NULL),('S4',NULL),('S5',NULL),('S6',NULL),('S7',NULL),('S8',NULL),('S9',NULL);
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 17:54:52
