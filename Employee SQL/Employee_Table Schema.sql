
create table departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

create table dept_emp (
	emp_no INTEGER NOT NULL, 
	dept_no	VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

create table manager (
	dept_no VARCHAR NOT NULL,
	emp_no	INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

create table employees (
	emp_no INTEGER NOT NULL,
	birth_date DATE NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	gender TEXT NOT NULL,
	hire_date DATE NOT NULL
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

create table titles (
	emp_no INTEGER NOT NULL,
	title TEXT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

create table salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);