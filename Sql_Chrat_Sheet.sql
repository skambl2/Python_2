--Basic Select
SELECT * FROM table;
SELECT col1,col2,col3 
FROM table;

--Distinct
SELECT DISTINCT col1,col2,col3
FROM table;

--Count
SELECT COUNT(col1) 
FROM table;
SELECT COUNT(DISTINCT col1)
FROM table;

--Where
SELECT * FROM table
where condition;

SELECT col1,col2,col3 FROM table
where condition;

--Operators in Where clause
-- =  Equal
SELECT * FROM table WHERE col1 = 20;
-- >  Greater than
SELECT * FROM table WHERE col1 >20;
-- <  Less than
SELECT * FROM table WHERE col1 < 20;
-- >= Greater than or equal
SELECT * FROM table WHERE col1 >= 20;
-- <= Less than or equal
SELECT * FROM table WHERE col1 <= 20;
-- <> Not Equal
SELECT * FROM table WHERE col1 <> 20;
-- BETWEEN Between a certain range
SELECT * FROM table WHERE col1 BETWEEN 10 AND 20;
-- LIKE    Search for a pattern
SELECT * FROM price WHERE model LIKE 'iP%';
-- IN      Specify multiple possible values for a column
SELECT * FROM price WHERE model IN ('6T','Pixel 4');

--CREATE TABLE
CREATE TABLE ntwk_pd (
carrier varchar(255),
model varchar(255),
oem varchar(varchar(255),
price varchar(255)
);

-- AND, OR ,NOT
SELECT * FROM table
WHERE col1 = 20 and col1 = 30;

SELECT * FROM table
WHERE col1 = 20 OR col1 = 30;

SELECT * FROM table
WHERE NOT col1 = 20;

--ORDER 
SELECT * FROM table
WHERE column2 =30
ORDER column2 ;

SELECT * FROM table
WHERE column2 =30
ORDER column2 DESC;

SELECT * FROM table
WHERE column2 =30
ORDER column1,column2,column3;

SELECT * FROM table
WHERE column2 =30
ORDER column1 ASC ,column2 ASC,column3 DESC;

--INSERT
INSERT INTO table(id,oem,make,price,carrier)
VALUES(1,'Apple','iPhoneX',599.99,'Verizon')

INSERT INTO table
VALUES(1,'Apple','iPhoneX',599.99,'Verizon')

--INSERT Data Only in Specified Columns
INSERT INTO table(make,price,carrier)
VALUES('iPhoneX',599.99,'Verizon')

--NULL CHECK
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

--UPDATE
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;

--DELETE
DELETE FROM table_name 
WHERE condition;

DELETE FROM table_name;

--TOP
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;

SELECT TOP 10 * FROM Customers;

SELECT TOP 50 PERCENT * FROM Customers;

--MAX and MIN
SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;

SELECT MAX(column_name)
FROM table_name
WHERE condition;

SELECT MAX(Price) AS LargestPrice
FROM Products;

--COUNT,AVG,SUM
SELECT COUNT(oem_m) as Number
FROM phone
WHERE oem_m = 'Apple';

SELECT AVG(price) as Average
FROM price;

SELECT SUM(price) as Sum
FROM price;

--LIKE
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';
/*
WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%_%'	Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"
*/

/*
Wildcard Characters in SQL Server
%	
Represents zero or more characters	
bl% finds bl, black, blue, and blob

_	
Represents a single character	
h_t finds hot, hat, and hit

[]	
Represents any single character within the brackets	
h[oa]t finds hot and hat, but not hit

^	
Represents any character not in the brackets	
h[^oa]t finds hit, but not hot and hat

-	
Represents a range of characters	
c[a-b]t finds cat and cbt
*/

--BETWEEN
SELECT * FROM Orders
WHERE OrderDate BETWEEN #01/07/1996# AND #31/07/1996#;

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

SELECT * FROM table
where column1 BETWEEN 10 AND 20;

--Aliases are often used to make column names more readable.
SELECT column_name AS alias_name
FROM table_name;

--Alias for Tables 
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName="Around the Horn" AND c.CustomerID=o.CustomerID;

--Joins
/*
Different Types of SQL JOINs
Here are the different types of the JOINs in SQL:

(INNER) JOIN: Returns records that have matching values in both tables
LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: Return all records when there is a match in either left or right table
*/

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

--JOIN 2 tables
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--JOIN 3 tables
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);


--LEFT JOIN
--The LEFT JOIN keyword returns all records from the left table (table1), and the matched records from the right table (table2). 
--The result is NULL from the right side, if there is no match.
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

--REFT JOIN
--The RIGHT JOIN keyword returns all records from the right table (table2), and the matched records from the left table (table1). 
--The result is NULL from the left side, when there is no match
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

--FULL JOIN
--The FULL OUTER JOIN keyword return all records when there is a match in either left (table1) or right (table2) table records.
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

--SELF JOIN
--A self JOIN is a regular join, but the table is joined with itself.
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;


--UNION
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

--GROUP BY
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

--HAVING
--The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);


--EXISTS
--The EXISTS operator is used to test for the existence of any record in a subquery.
--The EXISTS operator returns true if the subquery returns one or more records.

SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);

--ANY
--The ANY operator returns true if any of the subquery values meet the condition.
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
(SELECT column_name FROM table_name WHERE condition);

--ALL
--The ALL operator returns true if all of the subquery values meet the condition
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
(SELECT column_name FROM table_name WHERE condition);

--The SELECT INTO statement copies data from one table into a new table.
SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

--The INSERT INTO SELECT statement copies data from one table and inserts it into another table.
--INSERT INTO SELECT requires that data types in source and target tables match
--The existing records in the target table are unaffected

INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;

--The CASE statement goes through conditions and returns a value when the first condition is met (like an IF-THEN-ELSE statement). 
--So, once a condition is true, it will stop reading and return the result. 
--If no conditions are true, it returns the value in the ELSE clause.

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;


--SQL IFNULL(), ISNULL(), COALESCE(), and NVL() Functions
--The MySQL IFNULL() function lets you return an alternative value if an expression is NULL:
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products;

--The COALESCE() function returns the first non-null value in a list.
SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products;

--The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL:
SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
FROM Products;

--STORED PROCEDURE
--A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.
--So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

CREATE PROCEDURE procedure_name
AS
sql_statement
GO;

--EXECUTE STORED PROCEDURE
EXEC procedure_name;


--ONE param. stored procedure
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

EXEC SelectAllCustomers City = "London";

--Multiple param. stored procedure
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;

EXEC SelectAllCustomers City = "London", PostalCode = "WA1 1DP";

-- --Single Line Comment
--Multi-line comments start with /* and end with */.

--CREATE DB
CREATE DATABASE databasename;
DROP DATABASE databasename;

BACKUP DATABASE databasename
TO DISK = 'filepath';


--A differential back up only backs up the parts of the database that have changed since the last full database backup.
BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL;

--CREATE TABLE
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

--CREATE TABLE FROM ANOTHER
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;
	
	
--DROP TABLE	
DROP TABLE table_name;

--TRUNCATE
--The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.
TRUNCATE TABLE table_name;

--ALTER TABLE
--ALTER TABLE - ADD Column
ALTER TABLE table_name
ADD column_name datatype;

--ALTER TABLE - DROP COLUMN
ALTER TABLE table_name
DROP COLUMN column_name;

--ALTER TABLE - ALTER/MODIFY COLUMN
ALTER TABLE table_name
ALTER COLUMN column_name datatype;

--CONSTRAINTS
--Constraints can be specified when the table is created with the CREATE TABLE statement, 
--or after the table is created with the ALTER TABLE statement.

CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);

/*
SQL constraints are used to specify rules for the data in a table.
Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table. 
If there is any violation between the constraint and the data action, the action is aborted.
Constraints can be column level or table level. 
Column level constraints apply to a column, and table level constraints apply to the whole table.
The following constraints are commonly used in SQL:
NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Uniquely identifies a row/record in another table
CHECK - Ensures that all values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column when no value is specified
INDEX - Used to create and retrieve data from the database very quickly8
*/


--NOT NULL DURING TABLE CREATION
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

--UNIQUE DURING TABLE CREATION
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

--DROP a UNIQUE Constraint
ALTER TABLE Persons
DROP INDEX UC_Person;

/*
SQL PRIMARY KEY Constraint
The PRIMARY KEY constraint uniquely identifies each record in a table.
Primary keys must contain UNIQUE values, and cannot contain NULL values.
A table can have only ONE primary key; and in the table, 
this primary key can consist of single or multiple columns (fields).
*/

CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

--SQL PRIMARY KEY on ALTER TABLE
ALTER TABLE Persons
ADD PRIMARY KEY (ID);

--DROP a PRIMARY KEY Constraint 
ALTER TABLE Persons
DROP PRIMARY KEY;


/*
SQL FOREIGN KEY Constraint
A FOREIGN KEY is a key used to link two tables together.
A FOREIGN KEY is a field (or collection of fields) in one 
table that refers to the PRIMARY KEY in another table.
The table containing the foreign key is called the child table, 
and the table containing the candidate key is called the referenced or parent table.
*/

CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

/*
SQL CHECK Constraint
The CHECK constraint is used to limit the value range that can be placed in a column.
If you define a CHECK constraint on a single column it allows only certain values for this column.
If you define a CHECK constraint on a table it can limit the 
values in certain columns based on values in other columns in the row.
*/

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);

ALTER TABLE Persons
ADD CHECK (Age>=18);

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

/*
SQL DEFAULT Constraint
The DEFAULT constraint is used to provide a default value for a column.
The default value will be added to all new records IF no other value is specified.
*/

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

ALTER TABLE Persons
ADD CONSTRAINT df_City 
DEFAULT 'Sandnes' FOR City;

ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

/*
The CREATE INDEX statement is used to create indexes in tables.

Indexes are used to retrieve data from the database very fast. 
The users cannot see the indexes, they are just used to speed up searches/queries.
*/

--Creates an index on a table. Duplicate values are allowed
CREATE INDEX index_name
ON table_name (column1, column2, ...);

--Creates a unique index on a table. Duplicate values are not allowed
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);

DROP INDEX table_name.index_name;


/*
AUTO INCREMENT Field
Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
Often this is the primary key field that we would like to be created automatically every time a new record is inserted.
*/

CREATE TABLE Persons (
    Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

/*
SQL Server comes with the following data types for storing a date or a date/time value in the database:

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: a unique number
*/

SELECT * FROM Orders WHERE OrderDate='2008-11-11'

/* VIEWS
In SQL, a view is a virtual table based on the result-set of an SQL statement.
A view contains rows and columns, just like a real table. 
The fields in a view are fields from one or more real tables in the database.
You can add SQL functions, WHERE, and JOIN statements to a view 
and present the data as if the data were coming from one single table.
*/

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

--A view can be updated with the CREATE OR REPLACE VIEW command.
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

--A view is deleted with the DROP VIEW command.
DROP VIEW view_name;

/*
SQL Injection
SQL injection is a code injection technique that might destroy your database.
SQL injection is one of the most common web hacking techniques.
SQL injection is the placement of malicious code in SQL statements, via web page input.
*/