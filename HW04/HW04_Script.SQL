-- Lynch, Connor
-- ISTE230, Fall 2024

DROP DATABASE IF EXISTS MUSIC;

CREATE DATABASE MUSIC;
USE MUSIC;

CREATE TABLE Producers(
	Producer	varchar(30) PRIMARY KEY,
	ProducerURL	varchar(30)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
INSERT INTO Producers
	VALUES('GOOD', 'good-music.com'); 
INSERT INTO Producers
	VALUES('Fueled by Ramen', 'fueledbyramen.com');
INSERT INTO Producers
	VALUES('Elektra', 'elektra.com');
	
CREATE TABLE Categories(
	Category	varchar(25) PRIMARY KEY,
	CategorySales	DECIMAL(9,2)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
INSERT INTO Categories
	VALUES('Hip Hop', 5000000.00);
INSERT INTO Categories
	VALUES('Pop rock', 4000000.00);
INSERT INTO Categories
	VALUES('Alternative rock', 4500000.00);
	
CREATE TABLE Price(
	Media		varchar(15) PRIMARY KEY,
	MediaPrice	DECIMAL(5,2)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
INSERT INTO Price
	VALUES('CD', 16.99);
INSERT INTO Price
	VALUES('cassette', 9.99);
	
CREATE TABLE Artists(
	Artist		varchar(20) PRIMARY KEY,
	NumGrpMembers	TINYINT UNSIGNED
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
INSERT INTO Artists
	VALUES('Kid Cudi', 1);
INSERT INTO Artists
	VALUES('fun.', 3);
INSERT INTO Artists
	VALUES('Third Eye Blind', 5);
	
CREATE TABLE Album(
	Title		varchar(20) PRIMARY KEY,
	Artist		varchar(20),
	Year		SMALLINT UNSIGNED,
	Producer	varchar(30),
	Category	varchar(25),
	CONSTRAINT Artist_FK FOREIGN KEY(Artist) REFERENCES Artists(Artist),
	CONSTRAINT Producer_FK FOREIGN KEY(Producer) REFERENCES Producers(Producer),
	CONSTRAINT Category_FK FOREIGN KEY(Category) REFERENCES Categories(Category)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
INSERT INTO Album
	VALUES('Man on the Moon', 'Kid Cudi', 2008, 'GOOD', 'Hip Hop');
INSERT INTO Album
	VALUES('Some Nights', 'fun.', 2012, 'Fueled by Ramen', 'Pop rock');
INSERT INTO Album
	VALUES('Third Eye Blind', 'Third Eye Blind', 1997, 'Elektra', 'Alternative rock');
	
CREATE TABLE Product(
	Title		varchar(20),
	Media		varchar(15),
	CONSTRAINT Title_FK FOREIGN KEY(Title) REFERENCES Album(Title),
	CONSTRAINT Media_FK FOREIGN KEY(Media) REFERENCES Price(Media),
	CONSTRAINT Title_Media_PK PRIMARY KEY(Title, Media)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
INSERT INTO Product
	VALUES('Man on the Moon', 'CD');
INSERT INTO Product
	VALUES('Some Nights', 'cassette');
INSERT INTO Product
	VALUES('Third Eye Blind', 'CD');
	
SHOW TABLES;

SELECT * FROM Producers;
SELECT * FROM Categories;
SELECT * FROM Price;
SELECT * FROM Artists;
SELECT * FROM Album;
SELECT * FROM Product;