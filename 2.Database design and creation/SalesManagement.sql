CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customer (
cID INT PRIMARY KEY,
cName VARCHAR(50),
cAge INT
);

CREATE TABLE Oder(
oID INT PRIMARY KEY,
cID INT,
oDate DATE,
oTotalPrice DECIMAL(10,2),
FOREIGN KEY (cID) REFERENCES Customer(cID)	
);

CREATE TABLE Product(
pID INT PRIMARY KEY,
pName VARCHAR(50),
pPrice DECIMAL(10,2)
);

CREATE TABLE OrderDetail(
odID INT PRIMARY KEY,
oID INT,
pID INT,
odQuantity INT,
odPrice DECIMAL(10,2),
FOREIGN KEY (oID) REFERENCES Oder(oID),
FOREIGN KEY (pID) REFERENCES Product(pID)
);

INSERT INTO Customer(cID,cName,cAge)
VALUES(1, "Thomas", 20);

INSERT INTO Oder(oID,cID,oDate,oTotalPrice)
VALUES(1001, 1, "2022-01-10", 500);

INSERT INTO Product(pID,pName,pPrice)
VALUES(101, "iphone13", 999.99);

INSERT INTO OrderDetail(odId,oID,pID,odQuantity,odPrice)
VALUES(1, 1001, 101, 2, 198.9);

SELECT * FROM Customer;

SELECT * FROM Oder;

SELECT * FROM Product;

SELECT * FROM OrderDetail;
