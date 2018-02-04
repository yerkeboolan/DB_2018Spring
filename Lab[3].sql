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

SELECT departments.code FROM departments 
	INNER JOIN employees
		ON department = code
			GROUP BY departments.code
				HAVING COUNT(*) > 2;





SELECT name FROM employees
	UNION SELECT name FROM customers
		WHERE city = 'Almaty'

SELECT budget, code FROM departments 
	WHERE budget > 60000
		ORDER BY budget ASC, code DESC



UPDATE employees SET department = 14 WHERE department = 77;

DELETE FROM employees
	WHERE department = 14;

DELETE FROM employees

