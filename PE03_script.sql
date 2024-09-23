-- Lynch, Connor
-- PE03
-- ISTE230, Fall 2024

DROP DATABASE IF EXISTS PE03;

CREATE DATABASE PE03;
USE PE03;

CREATE TABLE automobile(
	make	varchar(15) NOT NULL,
	model	varchar(15) NOT NULL,
	year	char(4) NOT NULL,
	color	varchar(15) NOT NULL,
	style	varchar(15) NOT NULL,
	MSRP	DECIMAL(7,2) NOT NULL,
	VIN	INT(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO automobile
	VALUES('Chevy', 'Volt', '2017', 'White', 'Hybrid', 39290.99, 0001);
INSERT INTO automobile
	VALUES('Ford', 'Mustang', '2019', 'Blue', 'Convertible', 47900.99, 0002);
INSERT INTO automobile
	VALUES('Toyota', 'Prius', '2018', 'Silver', 'Hybrid', 25000.99, 0003);
INSERT INTO automobile
	VALUES('Toyota', 'Camry', '2008', 'Blue', 'Sedan', 2000.50, 0004);
INSERT INTO automobile
	VALUES('Dodge', '1500', '2007', 'Green', 'Pickup', 1799.99, 0005);

SELECT * FROM automobile;
SELECT * FROM automobile\G;

DESCRIBE automobile;