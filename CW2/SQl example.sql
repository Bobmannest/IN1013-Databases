/*
Student name: 
Student ID: 
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE mccPlayer (
	registration_number VARCHAR(4) PRIMARY KEY,
	name VARCHAR(40),
	age TINYINT,
	p_street VARCHAR(20),
	p_town VARCHAR(20),
	p_postcode VARCHAR(8));
	

CREATE TABLE mccGround (
	ground_name VARCHAR(20) PRIMARY KEY,
	g_street VARCHAR(20),
	g_town VARCHAR(20),
	g_postcode VARCHAR(8));

	
CREATE TABLE mccMatches (
	match_date INTEGER PRIMARY KEY,
	opposing_team VARCHAR(20),
	ground_name VARCHAR(20),
	FOREIGN KEY (ground_name) REFERENCES mccGround (ground_name));
	
CREATE TABLE mccMatch_performance (
	registration_number VARCHAR(4),
	match_date INTEGER,
	batting_score SMALLINT,
	FOREIGN KEY (registration_number) REFERENCES mccPlayer (registration_number),
	FOREIGN KEY (match_date) REFERENCES mccMatches (match_date),
	PRIMARY KEY (registration_number, match_date));

/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO mccPlayer VALUES
	("1001", "AB de Villers", 29, "Damside", "Morpeth", "NE61 3RP"),
	("1002", "Hashim Amla", 30, "Old Gate", "Morpeth", "NE61 9LZ"),
	("1003", "Michael Clarke", 32, "Hotspur Street", "Alnwick", "NE66 8FQ"),
	("1004", "Kumar Sangakkara", 36, "Percy Street", "Alnwick", "NE66 6ST"),
	("1005", "Shivnarine Chanderpaul", 39, "Well Way", "Morpeth", "NE65 9DR"),
	("1006", "Dale Steyn", 30, "Wellbeck Road", "Byker", "NE6 3RE"),
	("1007", "Vernon Philander", 28, "Hollon Street", "Morpeth", "NE65 9DS"),
	("1008", "Rangana Herath", 35, "Whickham Gardens", "Byker", "NE6 3RB"),
	("1009", "Saeed Ajmal", 36, "Priory Orchard", "Durham", "DH3 9PQ"),
	("1010","Ravichandran Ashwin", 27, "Foyle Street", "Sunderland", "SR2 4PO"),
	("1011", "Shane Watson", 32, "Hawthorne Terrace", "Durham", "DH3 9PS"),
	("1012", "Sachin Tendulkar", 40, "Millburn Street", "Sunderland", "SR3 9LV");

INSERT INTO mccGround VALUES 
	("Riverside Ground", "Chester-le-Street", "Durham", "DH3 3QR"),
	("Ashbrooke", "West Lawn", "Sunderland", "SR2 7HH"),
	("Whitburn Hall", "Whitburn Road", "Sunderland", "SR6 7BZ"),
	("The Oval", "Kennington", "London", "SE11 5SS"),
	("Trent Bridge", "Bridgeford Road", "Nottingham", "NG2 6AG"),
	("Collingwood Fields", "Crown Street", "Darlington", "DA2 5RL"),
	("Crystal Palace Park", "Anerley Road", "London", "SE19 2GA"),
	("Gasworks", "King Edward Road", "Tynemouth", "NE30 2HA"),
	("Leaside", "Haldane Street", "Darlington", "N63 8EJ");

INSERT INTO mccMatches VALUES
	(100907, "Alnwick", "Leaside"),
	(110621, "Whitley Bay","Gasworks"),
	(110710, "Darlington", "Collingwood Fields"),
	(110902, "Alnwick", "Leaside"),
	(120608, "Whitley Bay","Gasworks"),
	(120829, "Darlington", "Collingwood Fields"),
	(130705, "Whitley Bay","Gasworks"),
	(130817, "Darlington", "Collingwood Fields"),
	(130906, "Alnwick", "Leaside");

INSERT INTO mccMatch_performance VALUES
	("1009", 100907, 17),
	("1011", 100907, 151),
	("1012", 110710, 100),
	("1001", 110902, 59),
	("1002", 110902, 24),
	("1003", 110902, 38),
	("1001", 120608, 59),
	("1011", 120608, 151),
	("1012", 120608, 100),
	("1001", 120829, 59),
	("1012", 120829, 100),
	("1001", 130705, 59),
	("1002", 130705, 0),
	("1011", 130705, 151),
	("1009", 130817, 17),
	("1010", 130817, 19),
	("1001", 130906, 59),
	("1011", 130906, 151),
	("1012", 130906, 100);

                     
/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Change Hashim Amla on Kam Pal. */

UPDATE mccPlayer SET name = 'Kam Pal' WHERE name = 'Hashim Amla';

/* 2) All players of 30 years old should be of 31 years. */

UPDATE mccPlayer SET age = 31 WHERE age = 30;


/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs */


/* 1) List the names of players who are more than 30 years old and live in 'Morpeth' or 'Alnwick'. */
select '1)' AS '';

SELECT name
FROM mccPlayer
WHERE (p_town = 'Morpeth' OR p_town = 'Alnwick') AND age > 30;


/* 2) What is the average batting score of all match performances? */
select '2)' AS '';

SELECT AVG(batting_score)
FROM mccMatch_performance;


/* 3) List the names of the teams, the ground names and street names that MCC have played against at grounds located in the town Darlington. */
select '3)' AS '';

SELECT DISTINCT opposing_team, G.ground_name, g_street
FROM mccMatches M
INNER JOIN mccGround G
ON M.ground_name = G.ground_name
WHERE g_town = 'Darlington';


/* 4) List the names of players who had a batting score of zero on the 5th July 2013? */
select '4)' AS '';

SELECT name
FROM mccPlayer P
INNER JOIN mccMatch_performance MP
ON P.registration_number = MP.registration_number
WHERE batting_score = 0
AND match_date = 130705;


/* 5) List the names of the grounds that 'AB de Villers' has played at. */
select '5)' AS '';

SELECT DISTINCT ground_name
FROM mccPlayer P
INNER JOIN mccMatch_performance MP
ON P.registration_number = MP.registration_number
INNER JOIN mccMatches M
ON MP.match_date = M.match_date
WHERE name = 'AB de Villers';


/* 6) List the names of players who live in Durham and who played in the match on the 28th May 2013. */
select '6)' AS '';

SELECT name
FROM mccPlayer P
INNER JOIN mccMatch_performance MP
ON P.registration_number = MP.registration_number
WHERE p_town = 'Durham'
AND match_date = 130705;


/* 7) List the names of players who live in the same town as 'Shane Watson'. */
select '7)' AS '';

SELECT P2.name
FROM mccPlayer P1
INNER JOIN mccPlayer P2
ON P1.p_town = P2.p_town
WHERE P1.name = 'Shane Watson';


/* 8) List the towns where either a player lives or a ground is located. */
select '8)' AS '';

SELECT p_town FROM mccPlayer
UNION
SELECT g_town FROM mccGround;

/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Hashim Amla is no longer the player. */

DELETE FROM mccPlayer WHERE name = 'Hashim Amla';

/* 2) Remove all the information about the records with batting score less than 3. */

DELETE FROM mccMatch_performance WHERE batting_score < 3;

/* SECTION 6 DROP TABLES */

DROP TABLE mccMatch_performance;
DROP TABLE mccMatches;
DROP TABLE mccPlayer;
DROP TABLE mccGround;

SHOW TABLES;