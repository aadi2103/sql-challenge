
-- Create tables for departments, dept_emp, manager, employee, salary, and titles
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


-- Import data from csv

-- 1. List Emp and Salary info: Inner Join Employee and Salaries table
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

-- 2. List employees hired in 1986
select *
from employees
where hire_date >= '1986-01-01'
	and hire_date < '1987-01-01'

--3. List the manager of each department 
--department number, department name, the manager's employee number, last name, first name, 
--start and end employment dates.
select e.emp_no, e.first_name, e.last_name, m.from_date, m.to_date, m.dept_no, d.dept_name
from departments as d
inner join manager as m
on m.dept_no = d.dept_no
inner join employees as e
on e.emp_no = m.emp_no

-- 4. List employee number, last name, first name, and department name.
select e.emp_no, e.first_name, e.last_name, de.dept_name
from employees as e
inner join dept_emp as d on
e.emp_no = d.emp_no
inner join departments as de on 
d.dept_no = de.dept_no

-- 5. List Employees with first name "Hercules" and last names beginning with "B."
select *
from employees
where first_name = 'Hercules'
and last_name like 'B%'

-- 6. Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e on
de.emp_no = e.emp_no
join departments as d on
de.dept_no = d.dept_no
where dept_name = 'Sales'

-- 7. List Sales & Development department employees with their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e on
de.emp_no = e.emp_no
join departments as d on
de.dept_no = d.dept_no
where dept_name = 'Sales'
or dept_name = 'Development'

-- 8. List the frequency/count of employee last names  
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;