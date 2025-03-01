CREATE DATABASE Company;
GO;

USE Company;
GO;

-- Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE Employees (
    ID INT NOT NULL,
    Name VARCHAR(50),
    Salary DECIMAL
);

-- Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- Remove the "Salary" column from the "Employees" table.
ALTER TABLE Employees
DROP COLUMN Salary;

-- Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'Employees.Department', 'DeptName', 'COLUMN';

-- Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Projects(
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100)
);

-- Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE Employees
ADD CONSTRAINT PK_Employees PRIMARY KEY (ID);

-- Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
CREATE TABLE EmployeesProjects (
    EmployeeID INT REFERENCES Employees(ID),
    ProjectID INT REFERENCES Projects(ProjectID)
);

-- Remove the foreign key relationship between "Employees" and "Projects."
DROP TABLE EmployeesProjects;

-- Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE Employees
ADD CONSTRAINT UNIQUE_NAME_Employees UNIQUE (Name);

-- Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Status VARCHAR(20)
);

-- Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE Customers
ADD CONSTRAINT UNIQUE_FULLNAME_Customers UNIQUE (FirstName, LastName);

-- Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
ALTER TABLE Customers
ADD CONSTRAINT DEFAULT_STATUS_Customers DEFAULT 'Active' FOR Status;

-- Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    OrderDate datetime,
    TotalAmount DECIMAL
);

-- Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE Orders
ADD CONSTRAINT CHK_TOTALAMOUNT_Orders CHECK (TotalAmount > 0);
GO;

-- Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA Sales;
GO;
ALTER SCHEMA Sales TRANSFER Orders;

-- Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Sales.Orders', 'SalesOrders';
