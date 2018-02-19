SELECT lastname FROM employees

SELECT DISTINCT lastname FROM employees

SELECT * FROM employees WHERE lastname = 'Smith'

SELECT * FROM employees WHERE lastname = 'Smith' or lastname = 'Doe'

SELECT * FROM employees WHERE department = 14

SELECT * FROM employees WHERE department = 37 or department = 77

SELECT sum(budget) FROM departments

 SELECT department, COUNT(*) 
	FROM employees
		GROUP BY department;

SELECT department, COUNT(*) FROM employees
	GROUP BY department
		HAVING COUNT(*) > 2;


SELECT name, budget FROM departments 
	ORDER BY budget DESC OFFSET 1 LIMIT 1;


SELECT employees.name, employees.lastname FROM employees
	WHERE employees.department = (
		SELECT code FROM departments 
			ORDER BY budget ASC LIMIT 1
	);

SELECT name FROM employees
	UNION SELECT name FROM customers
		WHERE city = 'Almaty'

SELECT budget, code FROM departments 
	WHERE budget > 60000
		ORDER BY budget ASC, code DESC

UPDATE departments SET budget = budget * 0.9
	WHERE budget = (SELECT FROM departments ORDER BY budget ASC LIMIT 1) 
		returning *;

UPDATE employees SET department = 14 WHERE department = 77;

DELETE FROM employees
	WHERE department = 14;

DELETE FROM employees


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UPDATE employees.department FROM employees SET department = (SELECT code FROM departments ORDER BY budget DESC LIMIT 1)
	WHERE department = (SELECT code FROM departments ORDER BY budget ASC LIMIT 1);