CREATE DATABASE Company2;
USE Company2;

-- Create Department table
CREATE TABLE Department (
    dep_id INTEGER PRIMARY KEY,
    dep_name VARCHAR(20),
    dep_location VARCHAR(15)
);

-- Insert data into Department table
INSERT INTO Department (dep_id, dep_name, dep_location)
VALUES (1, 'Sales', 'New York'),
       (2, 'Finance', 'Chicago');

-- Create Employee table with foreign key constraint
CREATE TABLE Employee (
    emp_id INTEGER PRIMARY KEY,
    emp_name VARCHAR(15),
    job_name VARCHAR(10),
    manager_id INTEGER,
    hire_date DATE,
    salary DECIMAL(10,2),
    commission DECIMAL(7,2),
    dep_id INTEGER,
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id)
);

-- 1. Insert data into Employee table
INSERT INTO Employee (emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id)
VALUES (1, 'John Doe', 'Manager', NULL, '1991-02-22', 50000.00, NULL, 1),
       (2, 'Jane Smith', 'Analyst', 1, '1992-05-15', 45000.00, 500.00, 2);
       
-- 2. Find the salaries of all the employees       
SELECT emp_id, emp_name, salary FROM Employee;

-- 3. Find those employees with hire date in the format like February 22, 1991.
SELECT emp_id, emp_name FROM Employee 
WHERE DATE_FORMAT(hire_date, '%M %d, %Y') = 'February 22, 1991';

-- 4. Calculate the average salary of employees who work as analysts
SELECT AVG(salary) AS avg_salary FROM Employee WHERE job_name = 'Analyst';

-- 5. Find those employees who are either CLERK or MANAGER
SELECT emp_id, emp_name FROM Employee WHERE job_name IN ('CLERK', 'MANAGER');

-- 6. Search for all the employees with an annual salary between 24000 and 50000
SELECT emp_id, emp_name, salary FROM Employee WHERE salary * 12 BETWEEN 24000 AND 50000;
