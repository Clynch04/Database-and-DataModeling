DROP DATABASE IF EXISTS HW02;

CREATE DATABASE HW02;
USE HW02;

CREATE TABLE item(
	itemID		varchar(25) NOT NULL PRIMARY KEY,
	itemName	varchar(25) NOT NULL,
	name		varchar(25) NOT NULL,
	street		varchar(25) NOT NULL,
	city		varchar(25) NOT NULL,
	state		char(2) NOT NULL,
	zipcode		varchar(10) NOT NULL,
	cost		DECIMAL(5,2) DEFAULT 0.0,
	retailPrice	DECIMAL(6,2) NOT NULL,
	notes		varchar(255),
	longDescription	MEDIUMTEXT,
	returnable	BOOL,
	perishable	TINYINT,
	shelfQty	SMALLINT UNSIGNED
	
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;