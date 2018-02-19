CREATE TABLE warehouses(
code integer,
location varchar(255),
capacity integer);

CREATE TABLE boxes(
code char(4),
contents varchar(255),
value real, 
warehouse integer);

SELECT * FROM warehouses;

SELECT ALL * FROM boxes WHERE value > 150;

SELECT DISTINCT ON(contents) * FROM boxes;

SELECT COUNT(*), warehouse FROM boxes GROUP BY warehouse;

SELECT COUNT(*) warehouse FROM boxes GROUP BY warehouse HAVING COUNT(*) > 2;

INSERT INTO warehouses VALUES(default, ‘New York’, 3);

INSERT INTO boxes VALUES(‘H5RT’, ‘papers’, 200, 2);

UPDATE boxes SET value = value * 0,85 WHERE value = (SELECT value FROM boxes ORDER BY DESC LIMIT 1 OFFSET 2);

DELETE FROM boxes WHERE value < 150;

DELETE FROM boxes WHERE warehouse = (SELECT code FROM warehouses WHERE location in ‘New York’) RETURNING *;
