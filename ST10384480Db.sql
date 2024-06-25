USE master;

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ST10384480Db')
BEGIN
    CREATE DATABASE ST10384480Db;
END

USE ST10367503_KhumaloCraft1;

CREATE TABLE user (
    UserID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    UserName VARCHAR(250),
    UserEmail VARCHAR(250)
);

CREATE TABLE product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ProdName VARCHAR(250),
    Description VARCHAR(250),
    ProdPrice DECIMAL(10, 2), 
    Stock INT
);

CREATE TABLE Orders (
    OrderNum INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ProductID INT,
    CustomerID INT,
    Quantity INT,
    Date DATE,
    Total FLOAT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Users(UserID)
);

CREATE TABLE Orderdetail (
    OrderDetailsID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    OrderNum INT,
    ProductID INT,
    Quantity INT, 
    SubTotal FLOAT,
    FOREIGN KEY (OrderNum) REFERENCES Orders(OrderNum),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Users (UserName, UserEmail)
VALUES ('ole dibodu', 'oled@gmail.com'),
       ('gustavo jiminez', 'stavo@gmail.com');

INSERT INTO Products (ProdName, ProdPrice, Description, Stock)
VALUES ('Blanket', 100, 'Knitting', 30),
       ('Bench', 600, 'Wood', 46),
       ('Ceramic', 200, 'Clay', 67);
	   
INSERT INTO Orders (CustomerID, Date, Total)
VALUES (1,'2024-04-24',80),
       (2,'2024-04-25',10);

SELECT * FROM Users;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;