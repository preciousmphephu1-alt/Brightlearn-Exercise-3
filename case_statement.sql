--step 1 Create a catalog
CREATE CATALOG IF NOT EXISTS exercise3;

--step2 create a schema
CREATE SCHEMA IF NOT EXISTS exercise3.classact;

--step3 create a table
CREATE TABLE IF NOT EXISTS exercise3.classact.attendance(student_id INT,
days_present INT,
total_days INT);

--step4 insert into the table
INSERT INTO TABLE exercise3.classact.attendance
VALUES (1,45,50),
(2,30,50),
(3,48,50),
(4,25,50),
(5,50,50);

--step5 check table
SELECT*
FROM exercise3.classact.attendance;
--1 THE PRODUCT TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.product_table;

CREATE TABLE IF NOT EXISTS exercise3.product_table.product(product_id INT,
product_name STRING,
price INT);

INSERT INTO exercise3.product_table.product
VALUES(1,'Laptop',1200),
(2,'Phone',800),
(3,'Keyboard',45),
(4,'Monitor',300),
(5,'Mouse',25);
--Check table 
SELECT * 
FROM exercise3.product_table.product;

--QUESTION1: 
SELECT product_name,
       price,
CASE 
    WHEN price> 1000 THEN 'Expensive'
    WHEN price BETWEEN 100 AND 1000 THEN 'Mid-range'
    WHEN price< 100 THEN 'Budget'
END AS price_category
FROM exercise3.product_table.product;
--2 THE ORDERS TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.orders_table;

CREATE TABLE IF NOT EXISTS exercise3.orders_table.orders(order_id INT,
customer_name STRING,
amount DECIMAL);

INSERT INTO TABLE exercise3.orders_table.orders                
VALUES (1,'Alice',150.00),
(2,'Bob',560.00),
(3,'Charlie',999.99),
(4,'Diana',45.50),
(5,'Ethan',1200.00);

SELECT*
FROM exercise3.orders_table.orders;
-- Question 2: 
SELECT customer_name,
       amount,
CASE
    WHEN amount>= 1000 THEN 'High value'
    WHEN amount BETWEEN 500 AND 999.99 THEN 'Medium value'
    WHEN amount< 500 THEN 'Low value'
END AS order_value_category
FROM exercise3.orders_table.orders;
--3 THE EMPLOYEES TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.employees_table2;

CREATE TABLE IF NOT EXISTS exercise3.employees_table2.employees(emp_id INT,
emp_name STRING,
department STRING,
salary INT);

INSERT INTO TABLE exercise3.employees_table2.employees                
VALUES (1,'John','IT',85000),
(2,'Sarah','HR',60000),
(3,'Mark','IT',75000),
(4,'Lucy','Finance',95000),
(5,'Tom','HR',55000);

SELECT*
FROM exercise3.employees_table2.employees;
--Question3: categories each employee 
SELECT emp_name,
       department,
       salary,
CASE
    WHEN department= 'IT' AND salary>80000 THEN 'Senior IT'
    WHEN department= 'HR' AND salary>55000 THEN 'Experienced HR'
    ELSE 'Staff'
END AS position_level
FROM exercise3.employees_table2.employees;

--4 THE STUDENT TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.student_table2;

CREATE TABLE IF NOT EXISTS exercise3.student_table2.student(student_id INT,
student_name STRING,
score INT);

INSERT INTO TABLE exercise3.student_table2.student                 
VALUES (1,'Anna',92),
(2,'Ben',76),
(3,'Cara',59),
(4,'David',83),
(5,'Ella',68);

SELECT*
FROM exercise3.student_table2.student;
--Question4:
SELECT student_name,
       score,
CASE
    WHEN score>= 90 THEN 'A'
    WHEN score  BETWEEN 80 AND 89 THEN 'B'
    WHEN score BETWEEN 70 AND 79 THEN 'C'
    WHEN score BETWEEN 60 AND 69 THEN 'D'
    WHEN score< 60 THEN 'F'
END AS grade
FROM exercise3.student_table2.student;
--5 THE DELIVERIES TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.deliveries_table;

CREATE TABLE IF NOT EXISTS exercise3.deliveries_table.deliveries(delivery_id INT,
delivery_time_minutes INT);

INSERT INTO TABLE exercise3.deliveries_table.deliveries
VALUES (1,45),
(2,80),
(3,30),
(4,65),
(5,100);

SELECT*
FROM exercise3.deliveries_table.deliveries;
--QUESTION5:
SELECT delivery_id,
       delivery_time_minutes,
CASE 
    WHEN delivery_time_minutes<= 30 THEN 'Fast'
    WHEN delivery_time_minutes BETWEEN 31 AND 60 THEN 'On time'
    WHEN delivery_time_minutes> 60 THEN 'Late'
END AS performance
FROM exercise3.deliveries_table.deliveries;

--6 THE TICKETS TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.tickets_table2;

CREATE TABLE IF NOT EXISTS exercise3.tickets_table2.tickets(ticket_id INT,
issue_type STRING,
priority INT);

INSERT INTO TABLE exercise3.tickets_table2.tickets
VALUES (1,'login issue',1),
(2,'server down',3),
(3,'slow system',2),
(4,'email error',2),
(5,'password reset',1);

SELECT*
FROM exercise3.tickets_table2.tickets;
--Question 6 
SELECT issue_type,
       priority,
CASE
    WHEN priority= 3 THEN 'High'
    WHEN priority= 2 THEN 'Medium'
    WHEN priority= 1 THEN 'Low'
END AS Priority_label
FROM exercise3.tickets_table2.tickets;

--7 THE ATTENDANCE TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.deliveries_table;

CREATE TABLE IF NOT EXISTS exercise3.deliveries_table.deliveries(delivery_id INT,
delivery_time_minutes INT);

INSERT INTO TABLE exercise3.deliveries_table.deliveries
VALUES (1,45),
(2,80),
(3,30),
(4,65),
(5,100); 

--Question 7 calculate each student's attendance and classify the results
SELECT student_id,
       (days_present/total_days)*100 AS attendance_percentage,
CASE 
    WHEN attendance_percentage>=90 THEN 'Excellent'
    WHEN attendance_percentage BETWEEN 75 AND 89 THEN 'Good'
    WHEN attendance_percentage <75 THEN 'Need Improvement'
END AS attendance_status
FROM exercise3.classact.attendance;

--Question 8 THE PRODUCT_INVENTORY_TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.product_inventory_table;

CREATE TABLE IF NOT EXISTS exercise3.product_inventory_table.product_inventory(product_id INT,
stock_qty INT);

INSERT INTO TABLE exercise3.product_inventory_table.product_inventory
VALUES (1,5),
(2,0),
(3,25),
(4,10),
(5,3); 

SELECT*
FROM exercise3.product_inventory_table.product_inventory;

SELECT product_id,
    stock_qty,
CASE 
    WHEN stock_qty= 0 THEN 'Out_of_stock'
    WHEN stock_qty BETWEEN 1 AND 5 THEN 'Low stock'
    WHEN stock_qty> 5 THEN 'In stock'
END AS stock_status
FROM exercise3.product_inventory_table.product_inventory;

--THE CLASSES TABLE
CREATE SCHEMA IF NOT EXISTS exercise3.classes_table;

CREATE TABLE IF NOT EXISTS exercise3.classes_table.classes(class_id INT,
subject STRING,
enrolled_students INT);

INSERT INTO TABLE exercise3.classes_table.classes
VALUES (1,'Math',30),
(2,'English',25),
(3,'Science',15),
(4,'Art',5),
(5,'History',20);

SELECT*
FROM exercise3.classes_table.classes;

SELECT subject,
       enrolled_students,
CASE
    WHEN enrolled_students>= 25 THEN 'Large'
    WHEN enrolled_students BETWEEN 10 AND 24 THEN 'Medium'
    WHEN enrolled_students< 10 THEN 'Small'
END AS class_size_category
FROM exercise3.classes_table.classes;

--Question 10 
CREATE SCHEMA IF NOT EXISTS exercise3.payments_table;

CREATE TABLE IF NOT EXISTS exercise3.payments_table.payments(payment_id INT,
amount DECIMAL(10,2),
payment_method STRING);

INSERT INTO TABLE exercise3.payments_table.payments
VALUES (1,50,'card'),
(2,200,'cash'),
(3,150,'card'),
(4,75,'Paypal'),
(5,300,'cash');

SELECT*
FROM exercise3.payments_table.payments;

SELECT payment_id,
       payment_method,
       amount,
CASE
    WHEN payment_method ='cash' AND amount>=200 THEN 'Eligible for discount'
     ELSE 'Not eligible for discount'
END AS discount_eligibility
FROM exercise3.payments_table.payments;
