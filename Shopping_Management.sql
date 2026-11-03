drop database if exists Shopping_Management;
Create database Shopping_Management;
Use Shopping_Management;
Create Table customer(
    Customer_Id Int Primary key Auto_increment,
    Customer_Name Varchar(100) NOT NULL,
    Email Varchar(100) Unique,
    Phone_Number Char(10) Unique NOT NULL,
    Age tinyint UNSIGNED check (Age>0),
    Gender ENUM('Male','Female','Other'),
    Country Varchar(50) Default 'India',
    City Varchar(50) NOT NULL,
    Pincode Char(6) Default 201301,
    Registration_Date DATE DEFAULT (CURRENT_DATE),
    Registration_Time Time DEFAULT (CURRENT_TIME),
    Created_At TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
	Address Varchar(250),
    Customer_Status Enum('Active','Inactive','Blocked') DEFAULT 'Active',
    Customer_Notes Varchar(1023)); 
Select * from customer;
Create table orders(
    Order_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT NOT NULL,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,
    Order_Status ENUM('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
    Payment_Method ENUM('Cash','Card','UPI','Net banking'),
    Payment_Status Enum('Pending','Paid','Failed') DEFAULT 'Pending',
    Shipping_Address Varchar(250) NOT NULL,
    Delivery_Pincode Char(6),
    Quantity INT UNSIGNED NOT NULL CHECK (Quantity>0),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATE  DEFAULT NULL,
    Created_At TIMESTAMP DEFAULT(CURRENT_TIMESTAMP),
    Tracking_Number Varchar(30) UNIQUE,
    Delivery_Status ENUM('Not Dispatched','In Transit','Delivered','Returned') DEFAULT 'Not Dispatched',
    Order_Notes VARCHAR(1023),
    FOREIGN KEY (Customer_Id) REFERENCES customer (Customer_Id) ON DELETE CASCADE ON UPDATE CASCADE
    );

SHOW TABLES;



