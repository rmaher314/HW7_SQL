--Listing the following details on each employee; employee number, last name, first name, sex and salary.
alter table "Departments" rename to departments

SELECT * FROM salaries;
SELECT * FROM employees;

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT "first_name","last_name","hire_date"
FROM employees
WHERE (hire_date) >= '1986-01-01'
and (hire_date) <= '1986-12-31';

--List the manager of each department with the following information:  department number, deparment name, manager's employee nubmer, last name, first name.
SELECT * FROM department_managers;
SELECT * FROM departments;

SELECT departments.dept_no,departments.dept_name,department_managers.emp_no --employees.last_name, employees.sex
FROM departments
INNER JOIN department_managers ON
departments.dept_no=department_managers.dept_no

FROM "Departments_Managers";
INNER JOIN "Employees" ON
Department_Managers.emp_no=Employees.emp_no


-- List first name, last name, and sex for employees whose first name is "Hercules" and last name begins with "B"
SELECT "first_name","last_name","sex"
FROM employees
WHERE 
	first_name = 'Hercules'
	and last_name like 'B%'