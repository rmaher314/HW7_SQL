--Listing the following details on each employee; employee number, last name, first name, sex and salary.
SELECT * FROM "Saleries";
SELECT * FROM "Employees";

SELECT Employees.emp_no,Employees.first_name, Employees.last_name, Employees.sex, Saleries.salary
FROM "Saleries" as s1
INNER JOIN "Employees" ON
Employees.emp_no=s1.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT "first_name","last_name","hire_date"
FROM "Employees"
WHERE (hire_date) >= '1986-01-01'
and (hire_date) <= '1986-12-31';
