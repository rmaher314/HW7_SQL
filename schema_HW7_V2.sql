-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Titles" (
    "title_id" VARCHAR(5)  NOT NULL ,
    "title" VARCHAR(20)  NOT NULL ,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
    )
);

SELECT * FROM "Titles";

CREATE TABLE "Employees" (
    "emp_no" INT  NOT NULL ,
    "emp_title_id" VARCHAR(5)  NOT NULL ,
    "birth_date" DATE  NOT NULL ,
    "first_name" VARCHAR(40)  NOT NULL ,
    "last_name" VARCHAR(40)  NOT NULL ,
    "sex" CHAR(1)  NOT NULL ,
    "hire_date" DATE  NOT NULL ,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
    )
);

SELECT * FROM "Employees";


CREATE TABLE "Saleries" (
    "emp_no" INT  NOT NULL ,
    "salary" INT  NOT NULL ,
    CONSTRAINT "pk_Saleries" PRIMARY KEY (
        "emp_no"
    )
);

SELECT * FROM "Saleries";


CREATE TABLE "Department_Managers" (
    "dept_no" VARCHAR(5)  NOT NULL ,
    "emp_no" INT  NOT NULL ,
    CONSTRAINT "pk_Department_Managers" PRIMARY KEY (
        "emp_no"
    )
);

SELECT * FROM "Department_Managers";



CREATE TABLE "Department_Emp" (
    "emp_no" INT  NOT NULL ,
    "dept_no" VARCHAR(5)  NOT NULL ,
    CONSTRAINT "pk_Department_Emp" PRIMARY KEY (
        "emp_no", "dept_no"
    )
);

SELECT * FROM "Department_Emp";


CREATE TABLE "Departments" (
    "dept_no" VARCHAR(5)  NOT NULL ,
    "dept_name" VARCHAR(25)  NOT NULL ,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
    )
);

SELECT * FROM "Departments";


ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");


ALTER TABLE "Saleries" ADD CONSTRAINT "fk_Saleries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");


ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");


ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");


ALTER TABLE "Department_Emp" ADD CONSTRAINT "fk_Department_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");


ALTER TABLE "Department_Emp" ADD CONSTRAINT "fk_Department_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");


SELECT * FROM Deptartment_Emp;
