--create table
CREATE TABLE customers (
  customer_id int primary key,
  firstname TEXT,
  country TEXT
);

CREATE TABLE order_detail (
  order_id int primary key,
  order_date date,
  orders int,
  customer_id int
);

CREATE TABLE menus (
  menu_id int primary key,
  menu_name TEXT,
  price int
);

--insert data
INSERT INTO customers VALUES
  (1, 'Yo', 'China'),
  (2, 'James', 'USA'),
  (3, 'Mary', 'USA'),
  (4, 'Jane', 'USA'),
  (5, 'Shinsuke', 'Japan'),
  (6, 'Gun', 'Thailand'),
  (7, 'Toy', 'Thailand'),
  (8, 'Anna', 'Canada'),
  (9, 'Ryu', 'Japan'),
  (10, 'Posh', 'Australia');

INSERT INTO order_detail VALUES
  (1, '2022-01-05', 1, 1),
  (2, '2022-01-06', 3, 2),
  (3, '2022-01-07', 5, 3),
  (4, '2022-01-08', 7, 4),
  (5, '2022-01-09', 1, 5),
  (6, '2022-01-10', 5, 6),
  (7, '2022-01-11', 2, 7),
  (8, '2022-01-12', 4, 8),
  (9, '2022-01-13', 6, 9),
  (10, '2022-01-14', 7, 10);

INSERT INTO menus VALUES
  (1, 'Pizza', 100),
  (2, 'Hamburger', 50),
  (3, 'French fries', 40),
  (4, 'Coke', 20),
  (5, 'Water', 10),
  (6, 'Sandwich', 30),
  (7, 'Fried chicken', 60);

.mode column
SELECT * FROM customers;
SELECT * FROM order_detail;
SELECT * FROM menus;

--SQL Queries
--JOIN
--Subquery or WITH
--Aggregate functions

--JOIN 3 table together
CREATE TABLE total_detail AS
SELECT 
  c.firstname,
  c.country,
  o.order_date,
  m.menu_name,
  m.price
FROM  customers c
JOIN order_detail o ON o.customer_id = c.customer_id
JOIN menus m ON o.orders = m.menu_id;

.mode box
SELECT * FROM total_detail;

--Aggregate functions
SELECT 
  country,
  count(*) AS total_customer,
  sum(price) AS total_price,
  avg(price) AS avg_price,
  max(price) AS max_price,
  min(price) AS min_price
FROM total_detail
GROUP BY country;

--Subquery or WITH
WITH sub AS (
  SELECT * FROM total_detail
  WHERE country = 'Thailand'
)

SELECT * FROM sub;


