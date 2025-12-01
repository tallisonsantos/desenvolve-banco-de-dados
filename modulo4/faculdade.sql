-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: faculdade
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `matricula` varchar(10) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('Marcos Oliveira','2001-11-05','1198765432','Av. Central, 300'),('Joaquim Bezerra','1993-09-12','1234567890','Rua A, 42'),('Larissa Andrade','1995-07-19','2199988776','Rua do Sol, 88'),('Fernando Lima','1999-02-28','3197776655','Rua Primavera, 15'),('Camila Duarte','2002-12-01','7196655443','Av. Bahia, 210'),('Bianca Benício','1998-04-23','9876543210','Rua das Flores, 120');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disc`
--

DROP TABLE IF EXISTS `aluno_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disc` (
  `matricula` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`matricula`,`nome`),
  KEY `nome` (`nome`),
  CONSTRAINT `aluno_disc_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `aluno` (`matricula`),
  CONSTRAINT `aluno_disc_ibfk_2` FOREIGN KEY (`nome`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disc`
--

LOCK TABLES `aluno_disc` WRITE;
/*!40000 ALTER TABLE `aluno_disc` DISABLE KEYS */;
INSERT INTO `aluno_disc` VALUES ('1198765432','Banco de Dados'),('1234567890','Banco de Dados'),('2199988776','Banco de Dados'),('3197776655','Banco de Dados'),('7196655443','Banco de Dados'),('9876543210','Banco de Dados'),('1198765432','Engenharia de Software'),('1234567890','Engenharia de Software'),('2199988776','Engenharia de Software'),('3197776655','Engenharia de Software'),('7196655443','Engenharia de Software'),('9876543210','Engenharia de Software'),('1198765432','Estruturas de Dados'),('1234567890','Estruturas de Dados'),('2199988776','Estruturas de Dados'),('3197776655','Estruturas de Dados'),('7196655443','Estruturas de Dados'),('9876543210','Estruturas de Dados'),('1198765432','Matemática Básica'),('1234567890','Matemática Básica'),('2199988776','Matemática Básica'),('3197776655','Matemática Básica'),('7196655443','Matemática Básica'),('9876543210','Matemática Básica'),('1198765432','Programação I'),('1234567890','Programação I'),('2199988776','Programação I'),('3197776655','Programação I'),('7196655443','Programação I'),('9876543210','Programação I'),('1198765432','Redes de Computadores'),('1234567890','Redes de Computadores'),('2199988776','Redes de Computadores'),('3197776655','Redes de Computadores'),('7196655443','Redes de Computadores'),('9876543210','Redes de Computadores');
/*!40000 ALTER TABLE `aluno_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `prof_cpf` varchar(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `nota` int DEFAULT NULL,
  PRIMARY KEY (`prof_cpf`,`data_hora`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES ('12345678901','2025-01-10 14:30:00','A aula foi muito clara e o professor explicou bem o conteúdo.',9),('45678912344','2025-01-12 16:20:00','A matéria é difícil, mas o professor sempre ajuda quando temos dúvidas.',7),('98765432100','2025-01-11 09:45:00','Gostei da didática, mas poderia dar mais exemplos práticos.',10);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_prof`
--

DROP TABLE IF EXISTS `contato_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_prof` (
  `prof_cpf` varchar(11) NOT NULL,
  `contato` varchar(14) NOT NULL,
  PRIMARY KEY (`prof_cpf`,`contato`),
  CONSTRAINT `contato_prof_ibfk_1` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_prof`
--

LOCK TABLES `contato_prof` WRITE;
/*!40000 ALTER TABLE `contato_prof` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato_prof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `local` varchar(255) DEFAULT NULL,
  `prof_chefe_cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prof_chefe_cpf` (`prof_chefe_cpf`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`prof_chefe_cpf`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Ciências Exatas','Belo Horizonte','32165498712');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int NOT NULL DEFAULT '30',
  `ementa` text,
  `disc_pre_req` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nome`),
  KEY `disc_pre_req` (`disc_pre_req`),
  CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`disc_pre_req`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES ('Banco de Dados',60,'Modelagem relacional, SQL, normalização e manipulação de dados.','Programação I'),('Engenharia de Software',60,'Processos de desenvolvimento, requisitos, UML, versionamento e boas práticas.','Redes de Computadores'),('Estruturas de Dados',80,'Listas, pilhas, filas, árvores, grafos e seus algoritmos básicos.','Banco de Dados'),('Matemática Básica',60,'Introdução à matemática, operações fundamentais, resolução de problemas.',NULL),('Programação I',80,'Lógica de programação, estruturas de controle, vetores e funções em linguagem C.',NULL),('Redes de Computadores',40,'Fundamentos de redes, modelos OSI e TCP/IP, dispositivos e protocolos.','Banco de Dados');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_disc`
--

DROP TABLE IF EXISTS `prof_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_disc` (
  `prof_cpf` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`prof_cpf`,`nome`),
  KEY `nome` (`nome`),
  CONSTRAINT `prof_disc_ibfk_1` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`),
  CONSTRAINT `prof_disc_ibfk_2` FOREIGN KEY (`nome`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_disc`
--

LOCK TABLES `prof_disc` WRITE;
/*!40000 ALTER TABLE `prof_disc` DISABLE KEYS */;
INSERT INTO `prof_disc` VALUES ('45678912344','Banco de Dados'),('65498732155','Engenharia de Software'),('74125896300','Estruturas de Dados'),('12345678901','Matemática Básica'),('98765432100','Programação I'),('32165498712','Redes de Computadores');
/*!40000 ALTER TABLE `prof_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `inicio_contrato` date DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('2020-03-15','Marcos Pereira','12345678901',NULL),('2018-11-22','Fernanda Martins','32165498712',NULL),('2021-01-10','Carlos Alberto','45678912344',NULL),('2022-05-30','Ricardo Monteiro','65498732155',NULL),('2023-02-14','Patrícia Costa','74125896300',NULL),('2019-08-01','Juliana Ribeiro','98765432100',NULL);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 15:58:36
