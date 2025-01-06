mysql> SOURCE C:\ISTE230\HW\HW04\HW04_Script.sql
--------------
-- Lynch, Connor
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
-- ISTE230, Fall 2024
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
DROP DATABASE IF EXISTS MUSIC
--------------

Query OK, 6 rows affected (0.08 sec)

--------------
CREATE DATABASE MUSIC
--------------

Query OK, 1 row affected (0.01 sec)

Database changed
--------------
CREATE TABLE Producers(
	Producer	varchar(30) PRIMARY KEY,
	ProducerURL	varchar(30)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8
--------------

Query OK, 0 rows affected, 1 warning (0.02 sec)

--------------
	
INSERT INTO Producers
	VALUES('GOOD', 'good-music.com')
--------------

Query OK, 1 row affected (0.01 sec)

--------------
INSERT INTO Producers
	VALUES('Fueled by Ramen', 'fueledbyramen.com')
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Producers
	VALUES('Elektra', 'elektra.com')
--------------

Query OK, 1 row affected (0.00 sec)

--------------
	
CREATE TABLE Categories(
	Category	varchar(25) PRIMARY KEY,
	CategorySales	DECIMAL(9,2)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8
--------------

Query OK, 0 rows affected, 1 warning (0.02 sec)

--------------
	
INSERT INTO Categories
	VALUES('Hip Hop', 5000000.00)
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Categories
	VALUES('Pop rock', 4000000.00)
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Categories
	VALUES('Alternative rock', 4500000.00)
--------------

Query OK, 1 row affected (0.00 sec)

--------------
	
CREATE TABLE Price(
	Media		varchar(15) PRIMARY KEY,
	MediaPrice	DECIMAL(5,2)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8
--------------

Query OK, 0 rows affected, 1 warning (0.01 sec)

--------------
	
INSERT INTO Price
	VALUES('CD', 16.99)
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Price
	VALUES('cassette', 9.99)
--------------

Query OK, 1 row affected (0.00 sec)

--------------
	
CREATE TABLE Artists(
	Artist		varchar(20) PRIMARY KEY,
	NumGrpMembers	TINYINT UNSIGNED
	) ENGINE=InnoDB DEFAULT CHARSET=utf8
--------------

Query OK, 0 rows affected, 1 warning (0.01 sec)

--------------
	
INSERT INTO Artists
	VALUES('Kid Cudi', 1)
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Artists
	VALUES('fun.', 3)
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Artists
	VALUES('Third Eye Blind', 5)
--------------

Query OK, 1 row affected (0.00 sec)

--------------
	
CREATE TABLE Album(
	Title		varchar(20) PRIMARY KEY,
	Artist		varchar(20),
	Year		SMALLINT UNSIGNED,
	Producer	varchar(30),
	Category	varchar(25),
	CONSTRAINT Artist_FK FOREIGN KEY(Artist) REFERENCES Artists(Artist),
	CONSTRAINT Producer_FK FOREIGN KEY(Producer) REFERENCES Producers(Producer),
	CONSTRAINT Category_FK FOREIGN KEY(Category) REFERENCES Categories(Category)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8
--------------

Query OK, 0 rows affected, 1 warning (0.02 sec)

--------------
	
INSERT INTO Album
	VALUES('Man on the Moon', 'Kid Cudi', 2008, 'GOOD', 'Hip Hop')
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Album
	VALUES('Some Nights', 'fun.', 2012, 'Fueled by Ramen', 'Pop rock')
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Album
	VALUES('Third Eye Blind', 'Third Eye Blind', 1997, 'Elektra', 'Alternative rock')
--------------

Query OK, 1 row affected (0.00 sec)

--------------
	
CREATE TABLE Product(
	Title		varchar(20),
	Media		varchar(15),
	CONSTRAINT Title_FK FOREIGN KEY(Title) REFERENCES Album(Title),
	CONSTRAINT Media_FK FOREIGN KEY(Media) REFERENCES Price(Media),
	CONSTRAINT Title_Media_PK PRIMARY KEY(Title, Media)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8
--------------

Query OK, 0 rows affected, 1 warning (0.02 sec)

--------------
	
INSERT INTO Product
	VALUES('Man on the Moon', 'CD')
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Product
	VALUES('Some Nights', 'cassette')
--------------

Query OK, 1 row affected (0.00 sec)

--------------
INSERT INTO Product
	VALUES('Third Eye Blind', 'CD')
--------------

Query OK, 1 row affected (0.00 sec)

--------------
	
SHOW TABLES
--------------

+-----------------+
| Tables_in_music |
+-----------------+
| album           |
| artists         |
| categories      |
| price           |
| producers       |
| product         |
+-----------------+
6 rows in set (0.00 sec)

--------------
SELECT * FROM Producers
--------------

+-----------------+-------------------+
| Producer        | ProducerURL       |
+-----------------+-------------------+
| Elektra         | elektra.com       |
| Fueled by Ramen | fueledbyramen.com |
| GOOD            | good-music.com    |
+-----------------+-------------------+
3 rows in set (0.00 sec)

--------------
SELECT * FROM Categories
--------------

+------------------+---------------+
| Category         | CategorySales |
+------------------+---------------+
| Alternative rock |    4500000.00 |
| Hip Hop          |    5000000.00 |
| Pop rock         |    4000000.00 |
+------------------+---------------+
3 rows in set (0.00 sec)

--------------
SELECT * FROM Price
--------------

+----------+------------+
| Media    | MediaPrice |
+----------+------------+
| cassette |       9.99 |
| CD       |      16.99 |
+----------+------------+
2 rows in set (0.00 sec)

--------------
SELECT * FROM Artists
--------------

+-----------------+---------------+
| Artist          | NumGrpMembers |
+-----------------+---------------+
| fun.            |             3 |
| Kid Cudi        |             1 |
| Third Eye Blind |             5 |
+-----------------+---------------+
3 rows in set (0.00 sec)

--------------
SELECT * FROM Album
--------------

+-----------------+-----------------+------+-----------------+------------------+
| Title           | Artist          | Year | Producer        | Category         |
+-----------------+-----------------+------+-----------------+------------------+
| Man on the Moon | Kid Cudi        | 2008 | GOOD            | Hip Hop          |
| Some Nights     | fun.            | 2012 | Fueled by Ramen | Pop rock         |
| Third Eye Blind | Third Eye Blind | 1997 | Elektra         | Alternative rock |
+-----------------+-----------------+------+-----------------+------------------+
3 rows in set (0.00 sec)

--------------
SELECT * FROM Product
--------------

+-----------------+----------+
| Title           | Media    |
+-----------------+----------+
| Some Nights     | cassette |
| Man on the Moon | CD       |
| Third Eye Blind | CD       |
+-----------------+----------+
3 rows in set (0.00 sec)

mysql> NOTEE
