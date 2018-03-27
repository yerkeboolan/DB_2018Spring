create table salesman(
salesman_id integer PRIMARY KEY,
name varchar(255),
city varchar(255),
commission real
);

create table customers(
customer_id integer PRIMARY KEY,
cust_name varchar(255),
city varchar(255),
grade integer,
salesman_id integer REFERENCES salesman
);

create table orders(
ord_no integer PRIMARY KEY,
purch_amt real,
ord_date date,
customer_id integer REFERENCES customers,
saleaman_id integer REFERENCES salesman
);

3)create role junior_dev with login password 'qwerty';

4)create view forsalesmen as select salesman_id, name, city from salesman;

5)create view newyorkcase as select * from salesman where city = 'New York' and commission > .13;
	grant all on newyorkcase to junior_dev;
	

6)create view aboutgrade as select * from customers where grade = (select max(grade) from customers);
	grant select on aboutgrade to junior_dev;

7)create view citynumber as select count(distinct salesman_id), city from salesman group by city;

8)create view customernumber as select * from salesman s
	 where 1 < (select count(*) from customers c where s.salesman_id = c.salesman_id);

9) create role intern 
	reassign owned by junior_dev to intern;