-- Changing Table Names
ALTER TABLE "Titles" RENAME TO titles;
ALTER TABLE "Employees" RENAME TO employees;
ALTER TABLE "Saleries" RENAME TO salaries;
ALTER TABLE "Department_Managers" RENAME TO department_managers;
ALTER TABLE "Department_Emp" RENAME TO department_emp;
ALTER TABLE "Departments" RENAME TO departments;

--Tables to reference.  

SELECT * FROM salaries;
SELECT * FROM employees;
SELECT * FROM department_managers;
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM department_emp;


--1. Listing the following details on each employee; employee number, last name, first name, sex and salary.


SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT "first_name","last_name","hire_date"
FROM employees
WHERE (hire_date) >= '1986-01-01'
and (hire_date) <= '1986-12-31';

--3. List the manager of each department with the following information:  department number, deparment name, manager's employee nubmer, last name, first name.
SELECT departments.dept_no,departments.dept_name,department_managers.emp_no,employees.last_name, employees.first_name
FROM ((departments
INNER JOIN department_managers ON departments.dept_no=department_managers.dept_no)
INNER JOIN employees ON department_managers.emp_no=employees.emp_no);	  


--4. List the department of each employee with the following inforamtion, employee_no, first name, last name, and department_name 
SELECT department_emp.emp_no, employees.last_name, employees.first_name,  departments.dept_name
FROM ((employees
INNER JOIN department_emp ON employees.emp_no=department_emp.emp_no)
INNER JOIN departments ON department_emp.dept_no=departments.dept_no);	

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last name begins with "B"
SELECT "first_name","last_name","sex"
FROM employees
WHERE 
	first_name = 'Hercules'
	and last_name like 'B%'
	
--6. List all employees in the Sales Department, including their employee number, last name, first name and department.
SELECT department_emp.emp_no, employees.last_name, employees.first_name,  departments.dept_name
FROM ((employees
INNER JOIN department_emp ON employees.emp_no=department_emp.emp_no)
INNER JOIN departments ON department_emp.dept_no=departments.dept_no)
WHERE 
	departments.dept_name = 'Sales'

--7. List all employees in the Sales and Development Departments, incling their employee nubmer, last name, first name and department name.
SELECT department_emp.emp_no, employees.last_name, employees.first_name,  departments.dept_name
FROM ((employees
INNER JOIN department_emp ON employees.emp_no=department_emp.emp_no)
INNER JOIN departments ON department_emp.dept_no=departments.dept_no)
WHERE 	departments.dept_name = 'Sales' 
or departments.dept_name = 'Development';
	
--8. In decending order, list the frequency count of employee last names.  I.e. how many employees share each last name.
Select last_name, count (emp_no) AS "Total Last Names"
From employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
