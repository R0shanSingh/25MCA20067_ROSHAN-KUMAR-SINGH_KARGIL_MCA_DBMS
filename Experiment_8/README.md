#  Experiment No. 8 

##  Student Details

* **Name:** Roshan Kumar Singh
* **UID:** 25MCA20067
* **Course:** MCA (GEN)
* **Semester:** 2nd
* **Subject:** Technical Training-1 (25CAP-652)
* **Date:** 31/03/2026

---

##  Aim

To apply stored procedure concepts for performing database operations in PostgreSQL.

---

##  Objective

* Understand stored procedures in PostgreSQL
* Learn IN, OUT, INOUT parameters
* Perform update operations using procedures
* Handle errors using EXCEPTION block

---

##  Tools Used

* PostgreSQL

---

##  Procedure (Steps)

1. Create table and insert data
2. Create stored procedure
3. Fetch and validate employee
4. Update salary
5. Handle exceptions
6. Execute procedure and verify

---

##  Complete Code

```sql
-- Create Table
CREATE TABLE employees4 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    department VARCHAR(50),
    salary INT
);

-- Insert Data
INSERT INTO employees4 VALUES
(1, 'Amit', NULL, 'Management', 120000),
(2, 'Ravi', 1, 'Engineering', 80000),
(3, 'Neha', 1, 'Engineering', 82000),
(4, 'Karan', 2, 'Engineering', 60000),
(5, 'Simran', 2, 'Engineering', 62000),
(6, 'Pooja', 3, 'Engineering', 61000),
(7, 'Rahul', 3, 'Engineering', 64000),
(8, 'Arjun', 1, 'HR', 70000);

-- Create Procedure
CREATE OR REPLACE PROCEDURE update_salary(
    IN p_emp_id INT,
    INOUT p_salary NUMERIC(20,3),
    OUT status VARCHAR(30)
)
LANGUAGE plpgsql
AS
$$
DECLARE
    curr_sal NUMERIC(20,3);
BEGIN

    SELECT salary INTO curr_sal
    FROM employees4
    WHERE emp_id = p_emp_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'EMPLOYEE NOT FOUND';
    END IF;

    curr_sal := curr_sal + p_salary;

    UPDATE employees4
    SET salary = curr_sal
    WHERE emp_id = p_emp_id;

    p_salary := curr_sal;
    status := 'SUCCESS';

EXCEPTION
    WHEN OTHERS THEN
        status := 'FAILED';
END;
$$;

-- Call Procedure
CALL update_salary(2, 5000, NULL);

-- View Result
SELECT * FROM employees4;
```

---

##  Output

* Table created successfully
* Data inserted
* Procedure created
* Salary updated (e.g., Ravi → 80000 + 5000 = 85000)
* Status returned: SUCCESS
  <img width="1920" height="1020" alt="exp8_select_query" src="https://github.com/user-attachments/assets/69009526-3421-473d-b925-e9439e603990" />
---

##  Learning Outcomes

* Created and used stored procedures
* Understood parameter types (IN, OUT, INOUT)
* Performed update operations via procedure
* Implemented exception handling
* Learned dynamic data manipulation

---

