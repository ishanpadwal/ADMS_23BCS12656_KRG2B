-- Create the Employee table
CREATE TABLE Employee (
EmpID INT,
Ename VARCHAR(100),
Department VARCHAR(100),
ManagerID INT
);
-- Insert data into the Employee table with updated names
INSERT INTO Employee (EmpID, Ename, Department, ManagerID) VALUES
(1, 'Ishan', 'Admin', NULL),
(2, 'Priyanshu', 'Accounts', 1),
(3, 'Rohit', 'Tech', 1),
(4, 'Kaif', 'Accounts', 2),
(5, 'Lakshay', 'Tech', 3),
(6, 'Ram', 'Admin', 1);
-- Retrieve employee and their manager details
SELECT
E1.Ename AS "Employee Name",
E2.Ename AS "Manager Name",
E1.Department AS "Employee Department",
E2.Department AS "Manager Department"
FROM
Employee AS E1
LEFT JOIN
Employee AS E2
ON E1.ManagerID = E2.EmpID;


--Question 2
-- Use the selected database
USE assessment;

-- Create table to store yearly NPV data
CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

-- Create table to store query data
CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

-- Insert values into Year_tbl
INSERT INTO Year_tbl (ID, YEAR, NPV) VALUES
    (2, 2017, 95),
    (4, 2020, 55),
    (6, 2018, 120),
    (2, 2018, 88),
    (3, 2016, 110),
    (5, 2015, 15),
    (4, 2019, 42),
    (6, 2017, 60);

-- Insert values into Queries
INSERT INTO Queries (ID, YEAR) VALUES
    (2, 2018),
    (3, 2016),
    (4, 2020),
    (4, 2019),
    (6, 2017),
    (6, 2019),   -- No match in Year_tbl
    (1, 2021);   -- No match in Year_tbl

-- Retrieve NPV for each query; if no match, return 0
SELECT 
    Q.ID,
    Q.YEAR,
    IFNULL(Y.NPV, 0) AS "NPV"
FROM 
    Queries AS Q
LEFT JOIN 
    Year_tbl AS Y
    ON Q.ID = Y.ID AND Q.YEAR = Y.YEAR;
