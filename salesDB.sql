-- Step 1: Create Database
CREATE DATABASE OnlineStore;
USE OnlineStore;

-- Step 2: Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Address TEXT,
    Phone VARCHAR(15) UNIQUE
);

-- Step 3: Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2),
    Stock INT
);

-- Step 4: Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 5: Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    PaymentStatus ENUM('Pending', 'Completed', 'Failed'),
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 6: Insert Sample Data into Customers Table
INSERT INTO Customers (Name, Email, Address, Phone) 
VALUES 
('John Doe', 'john@example.com', '123 Street, NY', '9876543210'),
('Jane Smith', 'jane@example.com', '456 Avenue, LA', '8765432109'),
('Michael Scott', 'michael@dundermifflin.com', 'Scranton, PA', '7654321890'),
('Alice Johnson', 'alice@example.com', '789 Boulevard, TX', '6543210987'),
('Bob Williams', 'bob@example.com', '321 Road, CA', '5432109876');

-- Step 7: Insert Sample Data into Products Table
INSERT INTO Products (Name, Description, Price, Stock) 
VALUES 
('Laptop', '15-inch gaming laptop', 75000.00, 10),
('Smartphone', '5G Android phone', 25000.00, 20),
('Headphones', 'Wireless noise-canceling headphones', 5000.00, 15),
('Smartwatch', 'Fitness tracking smartwatch', 15000.00, 12),
('Tablet', '10-inch Android tablet', 30000.00, 8);

-- Step 8: Insert Sample Data into Orders Table
INSERT INTO Orders (CustomerID, TotalAmount) 
VALUES 
(1, 75000.00),  -- John buys a Laptop
(2, 25000.00),  -- Jane buys a Smartphone
(3, 5000.00),   -- Michael buys Headphones
(4, 15000.00),  -- Alice buys a Smartwatch
(5, 30000.00);  -- Bob buys a Tablet

-- Step 9: Insert Sample Data into Payments Table
INSERT INTO Payments (OrderID, PaymentMethod, PaymentStatus) 
VALUES 
(1, 'Credit Card', 'Completed'),
(2, 'Debit Card', 'Completed'),
(3, 'UPI', 'Completed'),
(4, 'Net Banking', 'Pending'),
(5, 'Cash on Delivery', 'Pending');

-- Step 10: Update Stock After Orders
UPDATE Products 
SET Stock = Stock - 1 
WHERE ProductID IN (1, 2, 3, 4, 5);

-- Step 11: Retrieve Order Summary with Customer Details
SELECT 
    o.OrderID, 
    c.Name AS CustomerName, 
    c.Email, 
    o.OrderDate, 
    o.TotalAmount, 
    p.PaymentMethod, 
    p.PaymentStatus
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID;

select * from Customers;
select * from Payments;
select * from Orders;
select * from Products;
