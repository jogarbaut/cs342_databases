/*  Assignment1.sql 
    Jomel Bautista
    CS 31A, Winter 2025 */
 

--
-- Current Database: `world`
--

DROP DATABASE IF EXISTS world;

CREATE DATABASE world;

USE world;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;

CREATE TABLE city (
  ID int NOT NULL,
  Name char(35) NOT NULL DEFAULT '',
  CountryCode char(3) NOT NULL DEFAULT '',
  District char(20) NOT NULL DEFAULT '',
  Population int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID)
) ENGINE=InnoDB;

--
-- Dumping data for table `city`
--
-- ORDER BY:  `ID`


INSERT INTO city VALUES (1,'Kabul','AFG','Kabol',1780000);
INSERT INTO city VALUES (2,'Qandahar','AFG','Qandahar',237500);
INSERT INTO city VALUES (3,'Herat','AFG','Herat',186800);
INSERT INTO city VALUES (4,'Mazar-e-Sharif','AFG','Balkh',127800);
INSERT INTO city VALUES (5,'Amsterdam','NLD','Noord-Holland',731200);
INSERT INTO city VALUES (6,'Rotterdam','NLD','Zuid-Holland',593321);
INSERT INTO city VALUES (7,'Haag','NLD','Zuid-Holland',440900);
INSERT INTO city VALUES (8,'Utrecht','NLD','Utrecht',234323);
INSERT INTO city VALUES (9,'Eindhoven','NLD','Noord-Brabant',201843);
INSERT INTO city VALUES (10,'Tilburg','NLD','Noord-Brabant',193238);


/* Query 3 */

DESCRIBE city;

/* Query 4 */

SELECT * FROM city;
