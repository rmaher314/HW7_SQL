--1.  DONE! Listing the following details on each employee; employee number, last name, first name, sex and salary.
SELECT * FROM salaries;
SELECT * FROM employees;

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;


--2. DONE! List first name, last name, and hire date for employees who were hired in 1986.
SELECT "first_name","last_name","hire_date"
FROM employees
WHERE (hire_date) >= '1986-01-01'
and (hire_date) <= '1986-12-31';

--3. DONE! List the manager of each department with the following information:  department number, deparment name, manager's employee nubmer, last name, first name.
SELECT * FROM department_managers;
SELECT * FROM departments;

SELECT departments.dept_no,departments.dept_name,department_managers.emp_no,employees.last_name, employees.first_name
FROM ((departments
INNER JOIN department_managers ON departments.dept_no=department_managers.dept_no)
INNER JOIN employees ON department_managers.emp_no=employees.emp_no);	  


-- 4. DONE! List the department of each employee with the following inforamtion, employee_no, first name, last name, and department_name 
SELECT department_emp.emp_no, employees.last_name, employees.first_name,  departments.dept_name
FROM ((employees
INNER JOIN department_emp ON employees.emp_no=department_emp.emp_no)
INNER JOIN departments ON department_emp.dept_no=departments.dept_no);	

-- 5. DONE! List first name, last name, and sex for employees whose first name is "Hercules" and last name begins with "B"
SELECT "first_name","last_name","sex"
FROM employees
WHERE 
	first_name = 'Hercules'
	and last_name like 'B%'
	
-- List all employees in the Sales Department, including their employee number, last name, first name and department.


--List all employees in the Sales and Development Departments, incling their employee nubmer, last name, first name and department name.

--8. Done! In decending order, list the frequency count of employee last names.  I.e. how many employees share each last name.
Select last_name, count (emp_no) AS "Total Last Names"
From employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
