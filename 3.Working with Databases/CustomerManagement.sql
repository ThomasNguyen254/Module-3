CREATE DATABASE SalesManagement;
USE SalesManagement;

CREATE TABLE Customer(
cID INT PRIMARY KEY,
name VARCHAR(50),
cAge INT
);

CREATE TABLE Orderr(
oID INT PRIMARY KEY,
cID INT,
oDate DATE,
oTotalPrice INT,
FOREIGN KEY(cID) REFERENCES Customer(cID)
);

CREATE TABLE Product(
pID INT PRIMARY KEY,
pName VARCHAR(50),
pPrice INT
);

DROP TABLE OrderDetail;

CREATE TABLE OrderDetail(
oID INT,
pID INT,
odQuantity INT,
FOREIGN KEY(oID) REFERENCES Orderr(oID),
FOREIGN KEY(pID) REFERENCES Product(pID)
);

INSERT INTO Customer(cID,name,cAge)
VALUES(1, "Minh Quan", 10),
       (2, "Ngoc Oanh", 20),
       (3, "Hong Ha", 50);
       
INSERT INTO Orderr(oID,cID,oDate,oTotalPrice)
VALUES(1, 1, '2006-3-21', 100),
      (2, 2, '2006-3-23', 110),
      (3, 1, '2006-3-16', 120);

INSERT INTO Product(pID,pName,pPrice)
VALUES(1, "May Giat", 3),
      (2, "Tu Lanh", 5),
	  (3, "Dieu Hoa", 7),
	  (4, "Quat", 1),
	  (5, "Bep Dien", 2);
      
INSERT INTO OrderDetail(oID,pID,odQuantity)
VALUES(1, 1, 3),
	  (1, 3, 7),
	  (1, 4, 2),
	  (2, 1, 1),
      (3, 1, 8),
      (2, 5, 4),
      (2, 3, 3);
      
SELECT oID,oDate,oTotalPrice
FROM Orderr;

SELECT c.name AS CustomerName, p.pName AS ProductName
FROM Customer c
INNER JOIN Orderr o ON c.cID = o.cID
INNER JOIN OrderDetail od ON o.oID = od.oID
INNER JOIN Product p ON od.pID = p.pID;

SELECT c.name AS Customer
FROM Customer c
LEFT JOIN Orderr o ON c.cID = o.cID
WHERE o.oID IS NULL;

SELECT o.oID, o.oDate, SUM(p.pPrice*od.odQuantity) AS TotalPrice
FROM Orderr o
INNER JOIN OrderDetail od ON o.oID = od.oID
INNER JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;
