create database lab6

create table locations (
	location_id serial primary key,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12)
);

create table departments (
	department_id serial primary key,
	department_name varchar(50) unique,
	budget integer,
	location_id integer references locations
);

create table employees (
	employee_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone_number varchar(20),
	salary integer,
	manager_id integer references employees,
	department_id integer references departments
);

create table job_grades (
	grade char(1),
	lowest_salary integer,
	highest_salary integer
);


3) select employees.first_name, employees.last_name, departments.department_name, 
	locations.city, locations.state_province from employees 
	inner join (departments cross join locations) on department_id is not null;


4) select employees.first_name, employees.last_name, employees.salary, job_grades.grade
from employees left join job_grades  

5) select t1.first_name, t1.last_name, t1.salary, t2.employee_id
from employees as t1 inner join employees as t2 using (employee_salary) where employees.employee_id = 120  

6) select employees.first_name, employees.manager_id from employees 
left join employees on employees.manager_id = employees.employee_id


7) select employees.first_name, employees.last_name, departments.department_id, departments.department_name 
inner join departments on department_id is null or department_id is not null