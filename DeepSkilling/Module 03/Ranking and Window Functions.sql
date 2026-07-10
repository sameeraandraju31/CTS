USE EmployeeDB;
GO

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO Products VALUES
(1,'Laptop','Electronics',80000),
(2,'Mobile','Electronics',50000),
(3,'Headphones','Electronics',50000),
(4,'TV','Electronics',70000),
(5,'Chair','Furniture',5000),
(6,'Table','Furniture',8000),
(7,'Sofa','Furniture',25000),
(8,'Bed','Furniture',25000),
(9,'Notebook','Stationery',50),
(10,'Pen','Stationery',20),
(11,'Marker','Stationery',50),
(12,'Eraser','Stationery',10);

-- ROW_NUMBER()
SELECT *
FROM (
    SELECT ProductID,
           ProductName,
           Category,
           Price,
           ROW_NUMBER() OVER(PARTITION BY Category ORDER BY Price DESC) AS Row_Num
    FROM Products
) AS T
WHERE Row_Num <= 3;

-- RANK()
SELECT *
FROM (
    SELECT ProductID,
           ProductName,
           Category,
           Price,
           RANK() OVER(PARTITION BY Category ORDER BY Price DESC) AS Rank_Num
    FROM Products
) AS T
WHERE Rank_Num <= 3;

-- DENSE_RANK()
SELECT *
FROM (
    SELECT ProductID,
           ProductName,
           Category,
           Price,
           DENSE_RANK() OVER(PARTITION BY Category ORDER BY Price DESC) AS Dense_Rank
    FROM Products
) AS T
WHERE Dense_Rank <= 3;