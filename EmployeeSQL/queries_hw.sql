--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name,  e.hire_date
FROM employees e
WHERE hire_date LIKE '%/1986';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees, dept_manager, departments
WHERE employees.emp_no = dept_manager.emp_no 
AND dept_manager.dept_no = departments.dept_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees, dept_emp, departments
WHERE employees.emp_no = dept_emp.emp_no 
AND dept_emp.dept_no  = departments.dept_no
ORDER BY emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%' 
ORDER BY last_name;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees, dept_emp, departments
WHERE employees.emp_no = dept_emp.emp_no 
AND dept_emp.dept_no  = departments.dept_no
AND departments.dept_name = 'Sales'
ORDER BY emp_no;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees, dept_emp, departments
WHERE employees.emp_no = dept_emp.emp_no 
AND dept_emp.dept_no = departments.dept_no
AND departments.dept_name IN ('Sales','Development')
ORDER BY emp_no;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count (emp_no)
FROM employees
GROUP BY last_name
ORDER BY UPPER(last_name) DESC;

--Epilogue update. It is Mr. April Foolsday...not MS...
UPDATE employees
SET sex = 'M'
WHERE emp_no = 499942;
