CREATE TABLE warehouses(
code integer,
location varchar(255),
capacity integer);

CREATE TABLE boxes(
code char(4),
contents varchar(255),
value real, 
warehouse integer);


SELECT * FROM boxes 
	WHERE value >= 50 and value <= 150;



SELECT COUNT(*), contents FROM boxes GROUP BY contents;


INSERT INTO warehouses VALUES(default, 'New York', 3);







UPDATE boxes SET value = value * 0,80 WHERE value = SELECT value FROM boxes ORDER BY DESC LIMIT 1 OFFSET 3);


DELETE FROM boxes WHERE value < 150;

DELETE FROM boxes WHERE warehouse = (SELECT code FROM warehouses WHERE location in ‘New York’) RETURNING *;

