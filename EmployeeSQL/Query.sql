DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;


CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  dept_no VARCHAR(30) NOT NULL,
  from_date VARCHAR(30) NOT NULL,
  to_date VARCHAR(30) NOT NULL
);


CREATE TABLE departments (
  dept_no VARCHAR(30) NOT NULL,
  dept_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
  emp_no INTEGER NOT NULL,
  title VARCHAR(30) NOT NULL,
  from_date VARCHAR(30) NOT NULL,
  to_date VARCHAR(30) NOT NULL
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(30) NOT NULL,
  emp_no INTEGER NOT NULL,
  from_date VARCHAR(30) NOT NULL,
  to_date VARCHAR(30) NOT NULL,
  PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  salary INTEGER NOT NULL,
  from_date VARCHAR(30) NOT NULL,
  to_date VARCHAR(30) NOT NULL,
  PRIMARY KEY (emp_no)
);

CREATE TABLE employees (
  emp_no INTEGER NOT NULL,
  birth_date VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  gender VARCHAR(30) NOT NULL,
  hire_date VARCHAR(30) NOT NULL,
  PRIMARY KEY (emp_no)
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");



--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.
select first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986%';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE '%B%'
;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_name IN ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "last_name_count"
from employees
group by last_name
order by "last_name_count" desc;