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