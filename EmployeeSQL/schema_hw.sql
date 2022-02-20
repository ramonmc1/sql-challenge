--DROP TABLE titles
CREATE TABLE titles(
title_id VARCHAR(30) PRIMARY KEY,
title VARCHAR(30)
);


--DROP TABLE employees CASCADE
CREATE TABLE employees(
emp_no INT PRIMARY KEY,
emp_title_id VARCHAR (30),
birth_date VARCHAR (30),
first_name VARCHAR (30),
last_name VARCHAR (30),
sex VARCHAR (30), 
hire_date VARCHAR (30),
FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

SELECT * FROM employees
ORDER BY emp_no;

--DROP TABLE salaries CASCADE
CREATE TABLE salaries(
emp_no INT PRIMARY KEY,
salary INT,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


CREATE TABLE departments(
dept_no VARCHAR(30) PRIMARY KEY,
dept_name VARCHAR(30),
FOREIGN KEY (dept_no) REFERENCES dept_manager (dept_no)
);


--DROP TABLE dept_manager CASCADE
CREATE TABLE dept_manager(
dept_no VARCHAR(30),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (dept_no, emp_no)
);


--DROP TABLE dept_emp CASCADE
CREATE TABLE dept_emp(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
dept_no VARCHAR(30),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
PRIMARY KEY (emp_no, dept_no)
);
