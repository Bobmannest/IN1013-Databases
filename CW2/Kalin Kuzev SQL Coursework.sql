/*
Student name:  Kalin Kuzev
Student ID: 240024894
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */
CREATE TABLE Caterer (
	Caterer_ID INT PRIMARY KEY,
	Name VARCHAR(20),
	Role VARCHAR(10));

CREATE TABLE Party_Venue (
	Venue_ID INT PRIMARY KEY,
	Venue_Address VARCHAR(40),
	Location VARCHAR(30));

CREATE TABLE Birthday_Party (
	Party_ID INT PRIMARY KEY,
    	Caterer_ID INT,
    	Venue_ID INT,
	Time TIME,
	Budget INT,
	Date DATE,
    	Caterer_Area VARCHAR(30),
    	FOREIGN KEY (Caterer_ID) REFERENCES Caterer(Caterer_ID), 
    	FOREIGN KEY (Venue_ID) REFERENCES Party_Venue(Venue_ID));

CREATE TABLE Party_Host (
	Host_ID INT PRIMARY KEY,
	Party_ID INT,
	Name VARCHAR(20),
	Date_of_Birth DATE,
	FOREIGN KEY (Party_ID) REFERENCES Birthday_Party(Party_ID) ON DELETE CASCADE);

CREATE TABLE Invitation (
	Invitation_ID INT PRIMARY KEY,
	Host_ID INT,
	Date_of_Party DATE,
	Time_of_Party TIME,
	Description VARCHAR(250),
	FOREIGN KEY (Host_ID) REFERENCES Party_Host(Host_ID) ON DELETE CASCADE);

CREATE TABLE Guest (
	Guest_ID INT PRIMARY KEY,
	Invitation_ID INT,
	Name VARCHAR(20),
	Date_of_Birth DATE,
    	Address VARCHAR(40),
    	FOREIGN KEY (Invitation_ID) REFERENCES Invitation(Invitation_ID) ON DELETE CASCADE);
    
/* SECTION 2 - INSERT STATEMENTS */
INSERT INTO Caterer (Caterer_ID, Name, Role) VALUES
	(1, 'Delicious Catering', 'Cook'),
	(2, 'BBQ Masters', 'Grill Chef'),
	(3, 'Late Night Bites', 'Waiter'),
	(4, 'Gourmet Treats', 'Server'),
	(5, 'Elegant Platters', 'Chef'),
	(6, 'Picnic Delights', 'Cook'),
	(7, 'Fancy Foods', 'Waiter'),
	(8, 'Spooky Snacks', 'Server'),
	(9, 'Cozy Catering', 'Cook'),
	(10, 'Holiday Feast', 'Chef');
    
INSERT INTO Party_Venue (Venue_ID, Venue_Address, Location) VALUES
	(1, '123 Oak St', 'The classy venue'),
	(2, '456 Pine St', 'The Maple venue'),
	(3, '789 Maple Ave', 'The EPIC venue'),
	(4, '101 Birch Rd', 'The garden venue'),
	(5, '202 Cedar Blvd', 'The normal venue '),
	(6, '303 Elm St', 'The outdoors venue'),
	(7, '404 Redwood Dr', 'The spooky venue'),
	(8, '505 Willow Ln', 'The theatre venue'),
	(9, '606 Pinewood Dr', 'The EPICEST venue'),
	(10, '707 Spruce St', 'The festive venue');

INSERT INTO Birthday_Party (Party_ID, Caterer_ID, Venue_ID, Time, Budget, Date, Caterer_Area) VALUES
	(1, 1, 1, '18:00:00', 500, '2025-03-15', 'Main Hall'),
	(2, 1, 3, '14:00:00', 300, '2025-04-10', 'East Side'),
	(3, 3, 3, '20:00:00', 800, '2025-05-22', 'Dance Floor Area'),
	(4, 4, 5, '16:30:00', 450, '2025-06-05', 'Garden Area'),
	(5, 3, 5, '19:00:00', 600, '2025-07-12', 'Dining Area'),
	(6, 9, 9, '13:00:00', 250, '2025-08-09', 'East Side'),
	(7, 9, 4, '17:00:00', 700, '2025-08-09', 'Event Space'),
	(8, 10, 4, '15:00:00', 350, '2025-10-18', 'Main Hall'),
	(9, 7, 2, '18:30:00', 400, '2025-10-20', 'West Side'),
	(10, 10, 1, '14:30:00', 550, '2025-12-25', 'Main Hall');

INSERT INTO Party_Host (Host_ID, Party_ID, Name, Date_of_Birth) VALUES
	(1, 1, 'Alice Johnson', '1990-03-10'),
	(2, 2, 'Bob Smith', '1985-07-25'),
	(3, 3, 'Charlie Davis', '1988-09-15'),
	(4, 4, 'Dana Lee', '1992-12-05'),
	(5, 5, 'Eva Green', '1995-06-22'),
	(6, 6, 'Frank Martin', '1987-11-30'),
	(7, 7, 'Grace Wilson', '1993-02-10'),
	(8, 8, 'Hank Evans', '1980-10-01'),
	(9, 9, 'Ivy Carter', '1991-08-17'),
	(10, 10, 'Jack Turner', '1994-05-12');
    
INSERT INTO Invitation (Invitation_ID, Host_ID, Date_of_Party, Time_of_Party, Description) VALUES
	(1, 1, '2025-03-15', '18:00:00', 'Alices birthday party with Blue Cake'),
	(2, 2, '2025-04-10', '14:00:00', 'Bobs BBQ Birthday'),
	(3, 3, '2025-05-22', '20:00:00', 'Charlies EPIC party!'),
	(4, 4, '2025-06-05', '16:30:00', 'Danas garden party with concert'),
	(5, 5, '2025-07-12', '19:00:00', 'Evas birthday with chocolate fountain'),
	(6, 6, '2025-08-09', '13:00:00', 'Franks picnic party.'),
	(7, 7, '2025-09-20', '17:00:00', 'Graces Halloween party'),
	(8, 8, '2025-10-18', '15:00:00', 'Hanks theatre party'),
	(9, 9, '2025-11-03', '18:30:00', 'Ivys board game birthday party'),
	(10, 10, '2025-12-25', '14:30:00', 'Jacks Christmas party');

INSERT INTO Guest (Guest_ID, Invitation_ID, Name, Date_of_Birth, Address) VALUES
	(1, 1, 'Zoe Adams', '1990-04-15', '234 Elm Street'),
	(2, 1, 'Mike Brown', '1987-05-22', '678 Oak Avenue'),
	(3, 1, 'Lily Clark', '1993-08-30', '101 Maple Drive'),
	(4, 2, 'Oliver Davis', '1985-01-12', '321 Birch Road'),
	(5, 2, 'Sophia Evans', '1996-11-03', '765 Pine Lane'),
	(6, 3, 'Ethan Fisher', '1989-09-28', '468 Cedar Boulevard'),
	(7, 4, 'Mia Green', '1992-12-19', '357 Willow Way'),
	(8, 5, 'Noah Harris', '1983-06-10', '539 Aspen Court'),
	(9, 5, 'Chloe Jackson', '1991-07-21', '642 Redwood Terrace'),
	(10, 6, 'Lucas King', '1994-03-08', '690 Sequoia Street'),
    	(11, 6, 'Amelia Lee', '1992-10-05', '123 Cedarwood Lane'),
	(12, 7, 'Jackson Martin', '1986-02-17', '456 Elm Boulevard'),
	(13, 7, 'Grace Nelson', '1995-01-24', '789 Birchwood Drive'),
	(14, 7, 'Benjamin Connor', '1988-07-30', '135 Maple Street'),
	(15, 8, 'Harper Perez', '1990-12-11', '246 Pinewood Avenue'),
	(16, 8, 'Samuel Quintero', '1984-04-03', '369 Oakwood Road'),
	(17, 9, 'Zara Roberts', '1993-09-18', '258 Willowbrook Lane'),
	(18, 9, 'William Scott', '1981-11-09', '147 Redwood Street'),
	(19, 9, 'Emily Turner', '1997-03-12', '532 Ash Circle'),
	(20, NULL, 'Daniel Walker', '1994-06-25', '864 Cedar Ridge');

                     
/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Update the Date of Birth for Alice Johnson to be 1990-05-12 */

UPDATE Party_Host SET Date_of_Birth = '1990-05-12' WHERE Name = 'Alice Johnson';

/* 2) The Birthday Parties that had Delicious Catering get to have their budget increased to 1000 as a result of a massive sale*/

UPDATE Birthday_Party SET Budget = 1000 WHERE Caterer_ID IN (SELECT Caterer_ID FROM Caterer WHERE Caterer.Name = 'Delicious Catering');

/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs */

/* 1) Select the IDs of the birthday parties which happened on the 2025-08-09 and had a budget of over £500 */

SELECT Party_ID FROM Birthday_Party WHERE (Date = '2025-08-09' OR Date = '2025-12-25') AND Budget > 500;

/* 2) Select all caterers who were involved in parties with a budget greater than 400, where the caterer role is 'Cook', and the party area is 'Main Hall' */

SELECT DISTINCT Name FROM Caterer JOIN Birthday_Party ON Caterer.Caterer_ID = Birthday_Party.Caterer_ID
WHERE Budget > 400 AND Role = 'Cook' AND Caterer_Area = 'Main Hall';

/* 3) Select all unique party venues that are 'The EPIC venue' or 'The EPICEST venue' and list their addresses */

SELECT DISTINCT Venue_Address FROM Party_Venue WHERE Location IN ('The EPIC venue', 'The EPICEST venue');

/* 4) Select the names and birth dates of hosts whose parties have more than 2 guests, and the parties occur in the year 2025 */

SELECT Party_Host.Name, Party_Host.Date_of_Birth FROM Party_Host 
JOIN Birthday_Party ON Party_Host.Party_ID = Birthday_Party.Party_ID
JOIN Invitation ON Party_Host.Host_ID = Invitation.Host_ID
JOIN Guest ON Invitation.Invitation_ID = Guest.Invitation_ID
WHERE Birthday_Party.Date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY Party_Host.Host_ID HAVING COUNT(Guest.Guest_ID) > 2;

/* 5) Select the unique names(no repeats) of the guests who were invited to parties hosted by either Alice Johnson or Bob Smith */

SELECT DISTINCT Guest.Name AS Guest_Name FROM Guest
JOIN Invitation ON Guest.Invitation_ID = Invitation.Invitation_ID
JOIN Party_Host ON Invitation.Host_ID = Party_Host.Host_ID
WHERE Party_Host.Name IN ('Alice Johnson', 'Bob Smith');

/* 6) List the caterer names which hosted more than 1 party and the average budget of parties(in descending order) hosted by each caterer*/

SELECT Caterer.Name, AVG(Budget) FROM Caterer 
JOIN Birthday_Party ON Caterer.Caterer_ID = Birthday_Party.Caterer_ID
GROUP BY Caterer.Caterer_ID HAVING COUNT(Birthday_Party.Party_ID) > 1
ORDER BY AVG(Budget) DESC;

/* 7) List the names of guests who have not recieved an invitation*/

SELECT Name FROM Guest WHERE NOT EXISTS(
	SELECT 1 FROM Invitation WHERE Invitation.Invitation_ID = Guest.Invitation_ID);

/* 8) List the venue names and their addresses that have hosted parties with a budget greater than 400 and the parties were on or after 2025-07-01 */

SELECT Party_Venue.Location, Party_Venue.Venue_Address FROM Party_Venue
JOIN Birthday_Party ON Party_Venue.Venue_ID = Birthday_Party.Venue_ID
WHERE Birthday_Party.Budget > 400 AND Birthday_Party.Date >= '2025-07-01' UNION
select Party_Venue.Location, Party_Venue.Venue_Address FROM Party_Venue
JOIN Birthday_Party ON Party_Venue.Venue_ID = Birthday_Party.Venue_ID
WHERE Birthday_Party.Date >= '2025-07-01';

/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Birthday Party for the 2025-05-22 was cancelled */

DELETE FROM Birthday_Party WHERE Date = '2025-05-22';

/* 2) Remove the guest Mike Brown that lives on 678 Oak Avenue */

DELETE FROM Guest WHERE Name = 'Mike Brown' AND Address = '678 Oak Avenue';

/* SECTION 6 DROP TABLES */
DROP TABLE IF EXISTS Guest;
DROP TABLE IF EXISTS Invitation;
DROP TABLE IF EXISTS Party_Host;
DROP TABLE IF EXISTS Birthday_Party;
DROP TABLE IF EXISTS Party_Venue;
DROP TABLE IF EXISTS Caterer;