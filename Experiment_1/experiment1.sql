-- 1
CREATE TABLE Department (
    dpt_id INT PRIMARY KEY,
    dpt_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    salary INT CHECK (salary > 0),
    dpt_id INT,
    CONSTRAINT fk_dpt FOREIGN KEY (dpt_id) REFERENCES Department(dpt_id)
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(30) NOT NULL,
    dpt_id INT,
    CONSTRAINT fk_project_dpt FOREIGN KEY (dpt_id) REFERENCES Department(dpt_id)
);

-- 2
INSERT INTO Department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance');

INSERT INTO Employee VALUES
(101, 'Roshan', 50000, 2),
(102, 'Sanchit', 45000, 1),
(103, 'Riya', 55000, 3),
(104, 'Swayam', 60000, 4);

INSERT INTO Project VALUES
(201, 'Payroll System', 2),
(202, 'Web Application', 2);

UPDATE Employee SET salary = 55000 WHERE emp_id = 101;

DELETE FROM Project WHERE project_id = 202;

--3
SELECT CURRENT_USER;

CREATE ROLE report_staff WITH LOGIN PASSWORD 'staff1';

SELECT CURRENT_USER;

GRANT SELECT ON Department TO report_staff;
GRANT SELECT ON Employee TO report_staff;
GRANT SELECT ON Project TO report_staff;

REVOKE CREATE ON SCHEMA public FROM report_staff;

REVOKE INSERT, UPDATE, DELETE ON Department FROM report_staff;
REVOKE INSERT, UPDATE, DELETE ON Employee FROM report_staff;
REVOKE INSERT, UPDATE, DELETE ON Project FROM report_staff;

--4
ALTER TABLE Employee
ALTER COLUMN emp_name TYPE VARCHAR(50);

DROP TABLE Project;
