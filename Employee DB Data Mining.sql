-- Data Mining

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
	dept_no INT NOT NULL,
	dept_name VARCHAR NOT NULL,
	CONSTRAINT pk_departments PRIMARY KEY(dept_no));

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_name VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL);

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT pk_employees PRIMARY KEY(emp_no));

CREATE TABLE salaries ( 
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL);

ALTER TABLE dept_emp
	ADD CONSTRAINT fk_employee_stats FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no);
ALTER TABLE dept_emp
	ADD CONSTRAINT fk_dept_stats FOREIGN KEY(dept_no)
	REFERENCES departments(dept_no);
ALTER TABLE dept_manager
	ADD CONSTRAINT fk_manager_stats FOREIGN KEY(dept_no)
	REFERENCES departments(dept_no);
ALTER TABLE dept_manager
	ADD CONSTRAINT fk_man_emp_stats FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no);
ALTER TABLE salaries
	ADD CONSTRAINT fk_emp_salary FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no);
ALTER TABLE titles
	ADD CONSTRAINT fk_worker_title FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no);

-- Run a Query just to make sure everything looks good.
Select * From departments;
Select * From dept_emp;
Select * From dept_manager;
Select * From employees;
Select * From salaries;
Select * From titles;