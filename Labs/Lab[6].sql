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


3) SELECT E.first_name,E.last_name, 
   D.department_name, L.city, L.state_province
     FROM employees E 
      JOIN departments D  
        ON E.department_id = D.department_id  
          JOIN locations L
           ON D.location_id = L.location_id;


4) SELECT E.first_name, E.last_name, E.salary, J.grade_level
 FROM employees E 
   JOIN job_grades J
     ON E.salary BETWEEN J.lowest_sal AND J.highest_sal;

5) select t1.first_name, t1.last_name, t1.salary, t2.employee_id
from employees as t1 inner join employees as t2 using (employee_salary) where employees.employee_id = 120  

6) SELECT E.first_name AS "Employee Name", 
   M.first_name AS "Manager"
     FROM employees E 
       JOIN employees M
         ON E.manager_id = M.employee_id;


7) select employees.first_name, employees.last_name, departments.department_id, departments.department_name 
inner join departments on department_id is null or department_id is not null