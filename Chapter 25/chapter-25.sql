/* =========================================================
   Chapter 25: SQL Aggregate Functions
   ========================================================= */


/* SUM() */

SELECT SUM(salary) AS TotalSalary
FROM employees;

SELECT DepartmentId, SUM(salary) AS TotalSalary
FROM employees
GROUP BY DepartmentId;

SELECT customer,
       SUM(CASE WHEN payment_type='credit' THEN amount ELSE 0 END) AS credit,
       SUM(CASE WHEN payment_type='debit' THEN amount ELSE 0 END) AS debit
FROM payments
GROUP BY customer;


/* AVG() */

SELECT city_name,
       AVG(population) AS avg_population
FROM city_population
WHERE city_name = 'New York City';


/* COUNT() */

SELECT COUNT(*) AS TotalRows
FROM employees;

SELECT COUNT(ManagerId) AS mgr
FROM employees;

SELECT COUNT(ContinentCode) AS AllCount,
       COUNT(DISTINCT ContinentCode) AS SingleCount
FROM Countries;


/* MAX() / MIN() */

SELECT MAX(age) FROM employee;
SELECT MIN(age) FROM employee;


/* List Concatenation */

/* MySQL */
SELECT ColumnA,
       GROUP_CONCAT(ColumnB ORDER BY ColumnB SEPARATOR ',') AS ColumnBs
FROM TableName
GROUP BY ColumnA;

/* PostgreSQL */
SELECT ColumnA,
       STRING_AGG(ColumnB, ',' ORDER BY ColumnB) AS ColumnBs
FROM TableName
GROUP BY ColumnA;

/* SQL Server 2017+ */
SELECT ColumnA,
       STRING_AGG(ColumnB, ',') WITHIN GROUP (ORDER BY ColumnB) AS ColumnBs
FROM TableName
GROUP BY ColumnA;
