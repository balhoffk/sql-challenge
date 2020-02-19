dept_emp
-
emp_no INTEGER
dept_no VARCHAR FK >- departments.dept_no
from_date VARCHAR
to_date VARCHAR

departments
-
dept_no PK FK >- dept_manager.dept_no
dept_name VARCHAR

titles
-
emp_no INTEGER FK >- employees.emp_no
title VARCHAR
from_date VARCHAR
to_date VARCHAR

dept_manager
-
dept_no VARCHAR
emp_no PK
from_date VARCHAR
to_date VARCHAR

salaries
-
emp_no PK FK >- employees.emp_no
salary INTEGER
from_date VARCHAR
to_date VARCHAR


employees
-
emp_no PK FK >- dept_emp.emp_no
birth_date VARCHAR
last_name VARCHAR
gender VARCHAR
hire_date VARCHAR