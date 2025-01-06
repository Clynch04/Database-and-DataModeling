-- Lynch, Connor
-- ISTE230, Fall 2024
-- PE06

DROP DATABASE IF EXISTS PE06;

CREATE DATABASE PE06;
USE PE06;

CREATE TABLE Customer(
	CustID		varchar(20) NOT NULL PRIMARY KEY,
	CustName	varchar(30) NOT NULL,
	CustContact	varchar(50) NOT NULL
	);
	
CREATE TABLE Product(
	ProductID		varchar(20) NOT NULL PRIMARY KEY,
	ProdDescription	varchar(50) NOT NULL,
	UnitPrice	DECIMAL(9,2) NOT NULL
	);

CREATE TABLE PO_Detail(
	PO		varchar(20) NOT NULL PRIMARY KEY,
	CustID		varchar(20) NOT NULL,
	ProductID	varchar(20) NOT NULL,
	Quantity	SMALLINT UNSIGNED NOT NULL,
	CONSTRAINT PODetail_Customer_CustID_FK FOREIGN KEY(CustID) REFERENCES Customer(CustID),
	CONSTRAINT PODetail_Product_ProductID_FK FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
	);
	
CREATE TABLE PO(
	PO		varchar(20) NOT NULL PRIMARY KEY,
	OrderDate	DATE NOT NULL,
	BillToAddress	varchar(75) NOT NULL,
	ShipToAddress	varchar(75) NOT NULL,
	CONSTRAINT PO_PODetail_PO_FK FOREIGN KEY(PO) REFERENCES PO_Detail(PO)
	);
	
CREATE TABLE Paid_PO(
	PO		varchar(20) NOT NULL,
	Date		DATE NOT NULL,
	Amount		DECIMAL(9,2) NOT NULL,
	CONSTRAINT PaidPO_PODetail_PO_FK FOREIGN KEY(PO) REFERENCES PO_Detail(PO),
	CONSTRAINT PO_Date_PK PRIMARY KEY(PO, Date)
	);
	
SHOW TABLES;