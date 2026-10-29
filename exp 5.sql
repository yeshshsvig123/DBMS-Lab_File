CREATE TABLE DEPARTMENT (
      DeptID INT PRIMARY KEY,
          DeptName VARCHAR(50) NOT NULL,
              Location VARCHAR(50)
              );

              CREATE TABLE PROJECT (
                  ProjectID INT PRIMARY KEY,
                      ProjectName VARCHAR(100) NOT NULL,
                          Budget DECIMAL(12,2),
                              DeptID INT,
                                  FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(DeptID)
                                  );

                                  CREATE TABLE EMPLOYEE (
                                      EmpID INT PRIMARY KEY,
                                          EmpName VARCHAR(50) NOT NULL,
                                              Salary DECIMAL(10,2) NOT NULL,
                                                  JobTitle VARCHAR(50),
                                                      DeptID INT,
                                                          ProjectID INT,
                                                              FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(DeptID),
                                                                  FOREIGN KEY (ProjectID) REFERENCES PROJECT(ProjectID)
                                                                  );

                                                                  INSERT INTO DEPARTMENT VALUES
                                                                  (1, 'HR', 'Delhi'),
                                                                  (2, 'IT', 'Noida'),
                                                                  (3, 'Finance', 'Lucknow'),
                                                                  (4, 'Marketing', 'Kanpur'),
                                                                  (5, 'Operations', 'Agra');

                                                                  INSERT INTO PROJECT VALUES
                                                                  (101, 'Employee Portal', 500000, 2),
                                                                  (102, 'AI Analytics', 800000, 2),
                                                                  (103, 'Payroll System', 450000, 3),
                                                                  (104, 'Digital Marketing', 350000, 4),
                                                                  (105, 'Recruitment Drive', 250000, 1),
                                                                  (106, 'Inventory System', 600000, 5),
                                                                  (107, 'Cloud Migration', 900000, 2),
                                                                  (108, 'Financial Dashboard', 700000, 3);

                                                                  INSERT INTO EMPLOYEE VALUES
                                                                  (1, 'Aarav Sharma', 45000, 'HR Executive', 1, 105),
                                                                  (2, 'Ananya Verma', 52000, 'HR Manager', 1, 105),
                                                                  (3, 'Rohan Gupta', 48000, 'Recruiter', 1, 105),
                                                                  (4, 'Priya Singh', 55000, 'HR Analyst', 1, 105),
                                                                  (5, 'Kunal Mehta', 60000, 'HR Manager', 1, 105),
                                                                  (6, 'Rahul Kapoor', 75000, 'Software Engineer', 2, 101),
                                                                  (7, 'Sneha Joshi', 82000, 'Data Analyst', 2, 102),
                                                                  (8, 'Aditya Jain', 95000, 'Senior Developer', 2, 107),
                                                                  (9, 'Neha Agarwal', 88000, 'Cloud Engineer', 2, 107),
                                                                  (10, 'Vivek Mishra', 70000, 'Software Engineer', 2, 101),
                                                                  (11, 'Ishita Rao', 92000, 'Data Scientist', 2, 102),
                                                                  (12, 'Arjun Malhotra', 68000, 'System Analyst', 2, 101),
                                                                  (13, 'Simran Kaur', 78000, 'Software Engineer', 2, 107),
                                                                  (14, 'Mohit Yadav', 65000, 'Developer', 2, 101),
                                                                  (15, 'Tanya Sinha', 72000, 'Data Analyst', 2, 102),
                                                                  (16, 'Riya Sharma', 58000, 'Accountant', 3, 103),
                                                                  (17, 'Aman Srivastava', 67000, 'Financial Analyst', 3, 108),
                                                                  (18, 'Pooja Tiwari', 72000, 'Accountant', 3, 103),
                                                                  (19, 'Nikhil Bansal', 85000, 'Finance Manager', 3, 108),
                                                                  (20, 'Kriti Saxena', 62000, 'Financial Analyst', 3, 108),
                                                                  (21, 'Yash Verma', 50000, 'Marketing Executive', 4, 104),
                                                                  (22, 'Muskan Khan', 56000, 'Marketing Analyst', 4, 104),
                                                                  (23, 'Harsh Vardhan', 75000, 'Marketing Manager', 4, 104),
                                                                  (24, 'Divya Pandey', 60000, 'Content Strategist', 4, 104),
                                                                  (25, 'Ritesh Kumar', 54000, 'Marketing Executive', 4, 104),
                                                                  (26, 'Sakshi Gupta', 48000, 'Operations Executive', 5, 106),
                                                                  (27, 'Deepak Chauhan', 65000, 'Operations Manager', 5, 106),
                                                                  (28, 'Nisha Patel', 58000, 'Operations Analyst', 5, 106),
                                                                  (29, 'Varun Singh', 62000, 'Inventory Executive', 5, 106),
                                                                  (30, 'Megha Arora', 70000, 'Operations Analyst', 5, 106);

                                                                  -- 1. Selection

                                                                  SELECT *
                                                                  FROM EMPLOYEE
                                                                  WHERE Salary > 80000;

                                                                  -- 2. Projection

                                                                  SELECT EmpName, JobTitle, Salary
                                                                  FROM EMPLOYEE;

                                                                  -- 3. Aggregate Functions

                                                                  SELECT COUNT(*) AS TotalEmployees
                                                                  FROM EMPLOYEE;

                                                                  SELECT SUM(Salary) AS TotalSalary
                                                                  FROM EMPLOYEE;

                                                                  SELECT AVG(Salary) AS AverageSalary
                                                                  FROM EMPLOYEE;

                                                                  SELECT MAX(Salary) AS HighestSalary
                                                                  FROM EMPLOYEE;

                                                                  SELECT MIN(Salary) AS LowestSalary
                                                                  FROM EMPLOYEE;

                                                                  -- 4. GROUP BY

                                                                  SELECT DeptID, COUNT(*) AS EmployeeCount
                                                                  FROM EMPLOYEE
                                                                  GROUP BY DeptID;

                                                                  -- 5. HAVING

                                                                  SELECT DeptID, COUNT(*) AS EmployeeCount
                                                                  FROM EMPLOYEE
                                                                  GROUP BY DeptID
                                                                  HAVING COUNT(*) > 5;

                                                                  -- 6. CASE Expression

                                                                  SELECT
                                                                      EmpName,
                                                                          Salary,
                                                                              CASE
                                                                                      WHEN Salary >= 80000 THEN 'High Salary'
                                                                                              WHEN Salary >= 60000 THEN 'Medium Salary'
                                                                                                      ELSE 'Low Salary'
                                                                                                          END AS SalaryCategory
                                                                                                          FROM EMPLOYEE;

                                                                                                          -- 7. ORDER BY

                                                                                                          SELECT EmpName, Salary
                                                                                                          FROM EMPLOYEE
                                                                                                          ORDER BY Salary DESC;
-- Uses the database and tables created in Experiment 3.

-- 1. Add ManagerID to EMPLOYEE

ALTER TABLE EMPLOYEE
ADD ManagerID INT NULL;

-- 2. Add Self-Referencing Foreign Key

ALTER TABLE EMPLOYEE
ADD CONSTRAINT fk_manager
FOREIGN KEY (ManagerID)
REFERENCES EMPLOYEE(EmpID);

-- 3. Assign Managers

UPDATE EMPLOYEE
SET ManagerID = NULL
WHERE EmpID IN (2, 8, 19, 23, 27);

UPDATE EMPLOYEE
SET ManagerID = 2
WHERE EmpID IN (1, 3, 4, 5);

UPDATE EMPLOYEE
SET ManagerID = 8
WHERE EmpID IN (6, 7, 9, 10, 11, 12, 13, 14, 15);

UPDATE EMPLOYEE
SET ManagerID = 19
WHERE EmpID IN (16, 17, 18, 20);

UPDATE EMPLOYEE
SET ManagerID = 23
WHERE EmpID IN (21, 22, 24, 25);

UPDATE EMPLOYEE
SET ManagerID = 27
WHERE EmpID IN (26, 28, 29, 30);

-- 4. Department Salary Summary View

CREATE VIEW DepartmentSalarySummary AS
SELECT
    D.DeptID,
        D.DeptName,
            COUNT(E.EmpID) AS EmployeeCount,
                SUM(E.Salary) AS TotalSalary,
                    AVG(E.Salary) AS AverageSalary
                    FROM DEPARTMENT D
                    LEFT JOIN EMPLOYEE E
                        ON D.DeptID = E.DeptID
                        GROUP BY D.DeptID, D.DeptName;

                        SELECT *
                        FROM DepartmentSalarySummary;

                        -- 5. Employee Hierarchy View

                        CREATE VIEW EmployeeHierarchy AS
                        SELECT
                            E.EmpID,
                                E.EmpName,
                                    E.JobTitle,
                                        E.DeptID,
                                            E.ManagerID,
                                                M.EmpName AS ManagerName
                                                FROM EMPLOYEE E
                                                LEFT JOIN EMPLOYEE M
                                                    ON E.ManagerID = M.EmpID;

                                                    SELECT *
                                                    FROM EmployeeHierarchy;

                                                    -- 6. Create an Updatable View

                                                    CREATE VIEW EmployeeBasicView AS
                                                    SELECT
                                                        EmpID,
                                                            EmpName,
                                                                Salary,
                                                                    JobTitle
                                                                    FROM EMPLOYEE;

                                                                    SELECT *
                                                                    FROM EmployeeBasicView;

                                                                    -- 7. Update Through View

                                                                    UPDATE EmployeeBasicView
                                                                    SET Salary = Salary + 1000
                                                                    WHERE EmpID = 1;

                                                                    SELECT *
                                                                    FROM EmployeeBasicView
                                                                    WHERE EmpID = 1;

                                                                    -- 8. Test Non-Updatable View
                                                                    -- This update is expected to fail because the view contains aggregates.

                                                                UPDATE DepartmentSalarySummary
                                                                    SET AverageSalary = 70000
                                                                    WHERE DeptID = 1;

                                                                    -- 9. Recursive CTE: Reporting Chains

                                                                    WITH RECURSIVE EmployeeHierarchyCTE AS (
                                                                        SELECT
                                                                                EmpID,
                                                                                        EmpName,
                                                                                                ManagerID,
                                                                                                        0 AS Level,
                                                                                                                CAST(EmpName AS CHAR(500)) AS ReportingChain
                                                                                                                    FROM EMPLOYEE
                                                                                                                        WHERE ManagerID IS NULL

                                                                                                                            UNION ALL

                                                                                                                                SELECT
                                                                                                                                        E.EmpID,
                                                                                                                                                E.EmpName,
                                                                                                                                                        E.ManagerID,
                                                                                                                                                                H.Level + 1,
                                                                                                                                                                        CONCAT(H.ReportingChain, ' -> ', E.EmpName)
                                                                                                                                                                            FROM EMPLOYEE E
                                                                                                                                                                                INNER JOIN EmployeeHierarchyCTE H
                                                                                                                                                                                        ON E.ManagerID = H.EmpID
                                                                                                                                                                                        )
                                                                                                                                                                                        SELECT
                                                                                                                                                                                            EmpID,
                                                                                                                                                                                                EmpName,
                                                                                                                                                                                                    ManagerID,
                                                                                                                                                                                                        Level,
                                                                                                                                                                                                            ReportingChain
                                                                                                                                                                                                            FROM EmployeeHierarchyCTE
                                                                                                                                                                                                            ORDER BY ReportingChain;