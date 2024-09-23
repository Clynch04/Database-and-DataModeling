-- Lynch, Connor
-- ISTE230, Fall 2024

SOURCE C:\ISTE230\source\createContactInfo.sql
SOURCE C:\ISTE230\source\insertContactInfo.sql

-- T1
INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, birthday, notes)
	VALUES (2, 'Connor', 'P', 'Lynch', 'clynch113@gmail.com', '2004-01-13', 'Student');
INSERT INTO contactInfo
	VALUES (3, 'Eli', 'T', 'Wallowby', 'etwallowby@concor.com', 'www.concor.com/~wallowby', '1956-03-26', 'All meetings must be scheduled through his assistant.');
INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, birthday, notes)
	VALUES (4, 'Eve', 'C', 'Sampson', 'esampson@concor.com', '1972-05-11', 'Very helpful.');
INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, birthday, notes)
	VALUES (5, 'Carson', 'B', 'Campbell', 'cbc232@mvch.org', '1955-01-05', 'Wife: Lisa Kids: Lucas, Lucy, and Lucinda.');
SELECT * FROM contactInfo;

-- T2
ALTER TABLE contactInfo ADD COLUMN nickname varchar(20) DEFAULT 'To Be Determined';
SELECT * FROM contactInfo;

-- T3
ALTER TABLE contactInfo DROP PRIMARY KEY;
ALTER TABLE contactInfo ADD PRIMARY KEY (contactID, firstName, lastName);
DESC contactInfo;

-- T4
UPDATE contactInfo SET nickname = 'Dave'
	WHERE contactID = 1;
SELECT * FROM contactInfo;
	
-- T5
DELETE FROM contactInfo
	WHERE URL = 'www.concor.com/~wallowby';
SELECT * FROM contactInfo;