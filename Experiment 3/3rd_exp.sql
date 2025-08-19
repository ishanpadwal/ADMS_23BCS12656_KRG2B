-- Easy
CREATE TABLE EmpData (
    EmpCode INT
);

INSERT INTO EmpData (EmpCode) VALUES
(2),
(4),
(4),
(6),
(6),
(7),
(8),
(8);

SELECT MAX(EmpCode) AS `Maximum_Code`
FROM (
    SELECT EmpCode
    FROM EmpData
    GROUP BY EmpCode
    HAVING COUNT(*) = 1
) AS T1;


-- Medium
CREATE TABLE DeptInfo (
    DeptID INT PRIMARY KEY,
    DeptTitle VARCHAR(50)
);

CREATE TABLE StaffInfo (
    StaffID INT,
    FullName VARCHAR(50),
    Pay INT,
    DeptRef INT,
    FOREIGN KEY (DeptRef) REFERENCES DeptInfo(DeptID)
);

INSERT INTO DeptInfo (DeptID, DeptTitle) VALUES
(1, 'IT'),
(2, 'SALES');

INSERT INTO StaffInfo (StaffID, FullName, Pay, DeptRef) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

SELECT d.DeptTitle, s.FullName, s.Pay
FROM DeptInfo d
JOIN StaffInfo s 
    ON d.DeptID = s.DeptRef
WHERE s.Pay IN (
    SELECT MAX(x.Pay)
    FROM StaffInfo x
    WHERE x.DeptRef = s.DeptRef
);

-- Hard
CREATE TABLE TableOne (
    PID INT, 
    PersonName VARCHAR(50), 
    Income INT
);

CREATE TABLE TableTwo (
    PID INT, 
    PersonName VARCHAR(50), 
    Income INT
);
INSERT INTO TableOne VALUES (1, 'AA', 1000);
INSERT INTO TableOne VALUES (2, 'BB', 300);
INSERT INTO TableTwo VALUES (2, 'BB', 400);
INSERT INTO TableTwo VALUES (3, 'CC', 100);

WITH AllData AS (
    SELECT PID, PersonName, Income FROM TableOne
    UNION ALL
    SELECT PID, PersonName, Income FROM TableTwo
)
SELECT 
    PID, 
    PersonName, 
    MIN(Income) AS LowestIncome
FROM AllData
GROUP BY PID, PersonName;
