-- Lynch, Connor
-- ISTE230, Fall 2024
-- PE09

DROP DATABASE IF EXISTS PE09;

CREATE DATABASE PE09;
USE PE09;

CREATE TABLE GolfCompany(
	StoreNumber	TINYINT UNSIGNED NOT NULL PRIMARY KEY,
	StoreName	varchar(25) NOT NULL,
	Address		varchar(50) NOT NULL,
	WeekdayHours	varchar(25) NOT NULL,
	WeekendHours	varchar(25) NOT NULL
	);

CREATE TABLE GolfClubs(
	StoreNumber		TINYINT UNSIGNED NOT NULL,
	ClubType		varchar(25) NOT NULL,
	ClubModel		varchar(25) NOT NULL,
	ClubLength_In		DECIMAL(3,1) NOT NULL,
	ClubLoft_Degrees	DECIMAL(3,1) NOT NULL,
	ClubPrice		DECIMAL(5,2) NOT NULL,
	
	CONSTRAINT GolfClubs_PK PRIMARY KEY(StoreNumber, ClubType, ClubModel),
	CONSTRAINT StoreNumber_FK FOREIGN KEY(StoreNumber) REFERENCES GolfCompany(StoreNumber)
	);
	
INSERT INTO GolfCompany VALUES 
	(1, 'Callaway', '123 Callaway Way', '8am - 8pm', '10am - 6pm'),
	(2, 'Titleist', '456 Titleist Street', '9am - 8pm', '11am - 6pm'),
	(3, 'Taylormade', '789 Taylormade Road', '8am - 8pm', '10am - 6pm'),
	(4, 'PXG', '234 PXG Drive', '10am - 9pm', '12pm - 8pm');
	
INSERT INTO GolfClubs VALUES
	(1, 'Driver', 'Big Bertha', 45.5, 10.5, 399.99),
	(1, '7 iron', 'Apex', 37.0, 30.0, 49.99),
	(2, '3 wood', 'TSR2', 43.0, 15.0, 299.99),
	(2, '3 wood', 'TSR3', 43.0, 16.5, 299.99),
	(3, 'Putter', 'Spider Tour X', 34.0, 3.0, 349.99),
	(3, 'Wedge', 'Hi-Toe 3', 35.5, 50.0, 139.99),
	(4, 'Driver', '0311 Gen5', 45.0, 10.0, 274.99),
	(4, '5 iron', '0311P Gen5', 38.0, 23.0, 74.99);

SELECT * FROM GolfCompany;

SELECT * FROM GolfClubs;

SELECT StoreName, Address, ClubType, ClubModel, ClubPrice
	FROM GolfCompany JOIN GolfClubs USING (StoreNumber)
	ORDER BY ClubPrice DESC;