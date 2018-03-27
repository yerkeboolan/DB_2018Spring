1) create index ind_name on countries(name);

2) create index ind_name_and_surname on employess(employess.name, employees.surname);

3) create unique index ind_salary on employess(salary);

4) create index ind_substring on employess(substring(employess.name from 1 for 4);

5) create index ind_join_employees on employess (salary)
   create index ind_join_departments on departments (budget)