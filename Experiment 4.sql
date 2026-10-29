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

SELECT
    e.EmpID,
        e.EmpName,
            d.DeptName
            FROM EMPLOYEE e
            INNER JOIN DEPARTMENT d
                ON e.DeptID = d.DeptID;

                -- 2. LEFT JOIN

                SELECT
                    d.DeptID,
                        d.DeptName,
                            e.EmpName
                            FROM DEPARTMENT d
                            LEFT JOIN EMPLOYEE e
                                ON d.DeptID = e.DeptID;

                                -- 3. SELF JOIN

                                SELECT
                                    e1.EmpName AS Employee1,
                                        e2.EmpName AS Employee2,
                                            e1.DeptID
                                            FROM EMPLOYEE e1
                                            JOIN EMPLOYEE e2
                                                ON e1.DeptID = e2.DeptID
                                                    AND e1.EmpID < e2.EmpID;

                                                    -- 4. THREE-WAY JOIN

                                                    SELECT
                                                        e.EmpName,
                                                            d.DeptName,
                                                                p.ProjectName
                                                                FROM EMPLOYEE e
                                                                JOIN DEPARTMENT d
                                                                    ON e.DeptID = d.DeptID
                                                                    JOIN PROJECT p
                                                                        ON e.ProjectID = p.ProjectID;

                                                                        -- 5. CORRELATED SUBQUERY

                                                                        SELECT
                                                                            e.EmpID,
                                                                                e.EmpName,
                                                                                    e.Salary,
                                                                                        e.DeptID
                                                                                        FROM EMPLOYEE e
                                                                                        WHERE e.Salary > (
                                                                                            SELECT AVG(e2.Salary)
                                                                                                FROM EMPLOYEE e2
                                                                                                    WHERE e2.DeptID = e.DeptID
                                                                                                    );

                                                                                                    -- 6. EXISTS

                                                                                                    SELECT
                                                                                                        d.DeptID,
                                                                                                            d.DeptName
                                                                                                            FROM DEPARTMENT d
                                                                                                            WHERE EXISTS (
                                                                                                                SELECT 1
                                                                                                                    FROM EMPLOYEE e
                                                                                                                        WHERE e.DeptID = d.DeptID
                                                                                                                        );

                                                                                                                        -- 7. SIMULATED INTERSECT

                                                                                                                        SELECT
                                                                                                                            e.EmpID,
                                                                                                                                e.EmpName
                                                                                                                                FROM EMPLOYEE e
                                                                                                                                WHERE e.DeptID = 2
                                                                                                                                AND EXISTS (
                                                                                                                                    SELECT 1
                                                                                                                                        FROM EMPLOYEE e2
                                                                                                                                            WHERE e2.EmpID = e.EmpID
                                                                                                                                                AND e2.Salary > 80000
                                                                                                                                                );

                                                                                                                                                -- 8. SIMULATED EXCEPT

                                                                                                                                                SELECT
                                                                                                                                                    e.EmpID,
                                                                                                                                                        e.EmpName
                                                                                                                                                        FROM EMPLOYEE e
                                                                                                                                                        WHERE e.DeptID = 2
                                                                                                                                                        AND NOT EXISTS (
                                                                                                                                                            SELECT 1
                                                                                                                                                                FROM EMPLOYEE e2
                                                                                                                                                                    WHERE e2.EmpID = e.EmpID
                                                                                                                                                                        AND e2.Salary > 80000
                                                                                                                                                                        );

                                                                                                                                                                        -- 9. EXPLAIN: INNER JOIN

                                                                                                                                                                        EXPLAIN
                                                                                                                                                                        SELECT
                                                                                                                                                                            e.EmpID,
                                                                                                                                                                                e.EmpName,
                                                                                                                                                                                    d.DeptName
                                                                                                                                                                                    FROM EMPLOYEE e
                                                                                                                                                                                    INNER JOIN DEPARTMENT d
                                                                                                                                                                                        ON e.DeptID = d.DeptID;

                                                                                                                                                                                        -- 10. EXPLAIN: LEFT JOIN

                                                                                                                                                                                        EXPLAIN
                                                                                                                                                                                        SELECT
                                                                                                                                                                                            d.DeptName,
                                                                                                                                                                                                e.EmpName
                                                                                                                                                                                                FROM DEPARTMENT d
                                                                                                                                                                                                LEFT JOIN EMPLOYEE e
                                                                                                                                                                                                    ON d.DeptID = e.DeptID;

                                                                                                                                                                                                    -- 11. EXPLAIN: CORRELATED SUBQUERY

                                                                                                                                                                                                    EXPLAIN
                                                                                                                                                                                                    SELECT
                                                                                                                                                                                                        e.EmpName,
                                                                                                                                                                                                            e.Salary
                                                                                                                                                                                                            FROM EMPLOYEE e
                                                                                                                                                                                                            WHERE e.Salary > (
                                                                                                                                                                                                                SELECT AVG(e2.Salary)
                                                                                                                                                                                                                    FROM EMPLOYEE e2
                                                                                                                                                                                                                        WHERE e2.DeptID = e.DeptID
                                                                                                                                                                                                                        );

                                                                                                                                                                                                                        -- 12. EXPLAIN: EXISTS

                                                                                                                                                                                                                        EXPLAIN
                                                                                                                                                                                                                        SELECT
                                                                                                                                                                                                                            d.DeptID,
                                                                                                                                                                                                                                d.DeptName
                                                                                                                                                                                                                                FROM DEPARTMENT d
                                                                                                                                                                                                                                WHERE EXISTS (
                                                                                                                                                                                                                                    SELECT 1
                                                                                                                                                                                                                                        FROM EMPLOYEE e
                                                                                                                                                                                                                                            WHERE e.DeptID = d.DeptID
                                                                                                                                                                                                                                            );