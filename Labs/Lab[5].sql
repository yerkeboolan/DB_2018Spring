create table customers (
	customer_id integer primary key, 
	cust_name varchar(255), 
	city varchar(255), 
	grade varchar(255), 	
	salesman_id integer
);
create table orders (
	order_no integer, 
	purch_amt float(24), 
	order_date varchar(255), 
	customer_id integer, 
	salesman_id integer);
create table salesmans (
	salesman_id integer, 
	name varchar(255), 
	city varchar(255), 	
	commission float(24)
);

select sum(purch_amt) from orders;

select avg(purch_amt) from orders;

select count(*) from customers where customers.cust_name IS NOT NULL;

select min(purch_amt) from orders;

select all * from customers where cust_name like '%b';

select all * from orders where customer_id IN (Select customer_id from customers where city = 'New York');

select all * from customers where customer_id IN (select customer_id from orders where purch_amt > 10);

select sum(grade) from customers;

select all * from customers where customers.cust_name IS NOT NULL;

select max(grade) from customers;




