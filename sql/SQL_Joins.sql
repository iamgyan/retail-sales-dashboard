-- =====================================================
-- CREATE ORDERS TABLE
-- =====================================================

DROP TABLE IF EXISTS orders;

CREATE TABLE orders AS

SELECT DISTINCT

"Order ID",
"Order Date",
"Ship Date",
"Ship Mode",
"Customer ID"

FROM sales;

-- =====================================================
-- CREATE CUSTOMERS TABLE
-- =====================================================

DROP TABLE IF EXISTS customers;

CREATE TABLE customers AS

SELECT DISTINCT

"Customer ID",
"Customer Name",
"Segment"

FROM sales;

-- =====================================================
-- CREATE PRODUCTS TABLE
-- =====================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products AS

SELECT DISTINCT

"Product ID",
"Product Name",
"Category",
"Sub-Category"

FROM sales;

-- =====================================================
-- CREATE LOCATION TABLE
-- =====================================================

DROP TABLE IF EXISTS locations;

CREATE TABLE locations AS

SELECT DISTINCT

"Postal Code",
"City",
"State",
"Region",
"Country"

FROM sales;

-- =====================================================
-- CREATE SALES FACT TABLE
-- =====================================================

DROP TABLE IF EXISTS sales_fact;

CREATE TABLE sales_fact AS

SELECT

"Order ID",
"Product ID",
"Postal Code",
"Sales",
"Quantity",
"Discount",
"Profit"

FROM sales;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM locations;

SELECT COUNT(*) FROM sales_fact;


SELECT

o."Order ID",
c."Customer Name",
p."Product Name",
sf."Sales"

FROM orders o

INNER JOIN customers c
ON o."Customer ID" = c."Customer ID"

INNER JOIN sales_fact sf
ON o."Order ID" = sf."Order ID"

INNER JOIN products p
ON sf."Product ID" = p."Product ID";

/*
=========================================================
02_SQL_Joins.sql

PART 1 : INNER JOIN

=========================================================
*/

---------------------------------------------------------
-- Query 1
-- View Orders
---------------------------------------------------------

SELECT *
FROM orders
LIMIT 10;

---------------------------------------------------------
-- Query 2
-- View Customers
---------------------------------------------------------

SELECT *
FROM customers
LIMIT 10;

---------------------------------------------------------
-- Query 3
-- View Products
---------------------------------------------------------

SELECT *
FROM products
LIMIT 10;

---------------------------------------------------------
-- Query 4
-- View Sales Fact
---------------------------------------------------------

SELECT *
FROM sales_fact
LIMIT 10;

---------------------------------------------------------
-- Query 5
-- Basic INNER JOIN
---------------------------------------------------------

SELECT

o."Order ID",

c."Customer Name"

FROM orders o

INNER JOIN customers c

ON o."Customer ID"=c."Customer ID"

LIMIT 20;

---------------------------------------------------------
-- Query 6
-- Orders with Customer Segment
---------------------------------------------------------

SELECT

o."Order ID",

c."Customer Name",

c."Segment"

FROM orders o

INNER JOIN customers c

ON o."Customer ID"=c."Customer ID";

---------------------------------------------------------
-- Query 7
-- Sales with Product Name
---------------------------------------------------------

SELECT

sf."Order ID",

p."Product Name",

sf."Sales"

FROM sales_fact sf

INNER JOIN products p

ON sf."Product ID"=p."Product ID"

LIMIT 20;

---------------------------------------------------------
-- Query 8
-- Sales with Category
---------------------------------------------------------

SELECT

sf."Sales",

p."Category"

FROM sales_fact sf

INNER JOIN products p

ON sf."Product ID"=p."Product ID";

---------------------------------------------------------
-- Query 9
-- Customer + Sales
---------------------------------------------------------

SELECT

c."Customer Name",

sf."Sales"

FROM customers c

INNER JOIN orders o

ON c."Customer ID"=o."Customer ID"

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID";

---------------------------------------------------------
-- Query 10
-- Complete Order Details
---------------------------------------------------------

SELECT

o."Order ID",

c."Customer Name",

p."Product Name",

sf."Sales"

FROM orders o

INNER JOIN customers c

ON o."Customer ID"=c."Customer ID"

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

INNER JOIN products p

ON sf."Product ID"=p."Product ID"

LIMIT 20;

---------------------------------------------------------
-- Query 11
-- Customer + Product
---------------------------------------------------------

SELECT

c."Customer Name",

p."Product Name"

FROM customers c

INNER JOIN orders o

ON c."Customer ID"=o."Customer ID"

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

INNER JOIN products p

ON sf."Product ID"=p."Product ID";

---------------------------------------------------------
-- Query 12
-- Product + Sales + Profit
---------------------------------------------------------

SELECT

p."Product Name",

sf."Sales",

sf."Profit"

FROM products p

INNER JOIN sales_fact sf

ON p."Product ID"=sf."Product ID";

---------------------------------------------------------
-- Query 13
-- Orders with Location
---------------------------------------------------------

SELECT

o."Order ID",

l."City",

l."State"

FROM orders o

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

INNER JOIN locations l

ON sf."Postal Code"=l."Postal Code";

---------------------------------------------------------
-- Query 14
-- Customer with State
---------------------------------------------------------

SELECT

c."Customer Name",

l."State"

FROM customers c

INNER JOIN orders o

ON c."Customer ID"=o."Customer ID"

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

INNER JOIN locations l

ON sf."Postal Code"=l."Postal Code";

---------------------------------------------------------
-- Query 15
-- Product Sales in California
---------------------------------------------------------

SELECT

p."Product Name",

sf."Sales"

FROM sales_fact sf

INNER JOIN products p

ON sf."Product ID"=p."Product ID"

INNER JOIN locations l

ON sf."Postal Code"=l."Postal Code"

WHERE l."State"='California';

---------------------------------------------------------
-- Query 16
-- Technology Products
---------------------------------------------------------

SELECT

p."Product Name",

sf."Sales"

FROM products p

INNER JOIN sales_fact sf

ON p."Product ID"=sf."Product ID"

WHERE p."Category"='Technology';

---------------------------------------------------------
-- Query 17
-- Furniture Orders
---------------------------------------------------------

SELECT

c."Customer Name",

p."Product Name",

sf."Sales"

FROM customers c

INNER JOIN orders o

ON c."Customer ID"=o."Customer ID"

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

INNER JOIN products p

ON sf."Product ID"=p."Product ID"

WHERE p."Category"='Furniture';

---------------------------------------------------------
-- Query 18
-- Top 20 Sales
---------------------------------------------------------

SELECT

c."Customer Name",

p."Product Name",

sf."Sales"

FROM customers c

INNER JOIN orders o

ON c."Customer ID"=o."Customer ID"

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

INNER JOIN products p

ON sf."Product ID"=p."Product ID"

ORDER BY sf."Sales" DESC

LIMIT 20;

---------------------------------------------------------
-- Query 19
-- Biggest Loss Orders
---------------------------------------------------------

SELECT

c."Customer Name",

p."Product Name",

sf."Profit"

FROM customers c

INNER JOIN orders o

ON c."Customer ID"=o."Customer ID"

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

INNER JOIN products p

ON sf."Product ID"=p."Product ID"

ORDER BY sf."Profit"

LIMIT 20;

---------------------------------------------------------
-- Query 20
-- Executive View
---------------------------------------------------------

SELECT

o."Order ID",

c."Customer Name",

c."Segment",

p."Category",

p."Sub-Category",

l."State",

sf."Sales",

sf."Profit"

FROM orders o

INNER JOIN customers c

ON o."Customer ID"=c."Customer ID"

INNER JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

INNER JOIN products p

ON sf."Product ID"=p."Product ID"

INNER JOIN locations l

ON sf."Postal Code"=l."Postal Code"

LIMIT 50;

SELECT

o."Order ID",

c."Customer Name",

p."Product Name",

sf."Sales"

FROM orders o

INNER JOIN customers c
ON o."Customer ID"=c."Customer ID"

INNER JOIN sales_fact sf
ON o."Order ID"=sf."Order ID"

INNER JOIN products p
ON sf."Product ID"=p."Product ID";

/*
=========================================================
PART 2 : LEFT JOIN
Queries : 21 - 40
=========================================================
*/

---------------------------------------------------------
-- Query 21
-- All Customers with their Orders
---------------------------------------------------------

SELECT

c."Customer Name",

o."Order ID"

FROM customers c

LEFT JOIN orders o

ON c."Customer ID" = o."Customer ID";

---------------------------------------------------------
-- Query 22
-- All Products with Sales
---------------------------------------------------------

SELECT

p."Product Name",

sf."Sales"

FROM products p

LEFT JOIN sales_fact sf

ON p."Product ID" = sf."Product ID";

---------------------------------------------------------
-- Query 23
-- All Locations with Sales
---------------------------------------------------------

SELECT

l."City",

l."State",

sf."Sales"

FROM locations l

LEFT JOIN sales_fact sf

ON l."Postal Code" = sf."Postal Code";

---------------------------------------------------------
-- Query 24
-- Customers and Segments
---------------------------------------------------------

SELECT

c."Customer Name",

c."Segment",

o."Order Date"

FROM customers c

LEFT JOIN orders o

ON c."Customer ID" = o."Customer ID";

---------------------------------------------------------
-- Query 25
-- Product Category with Sales
---------------------------------------------------------

SELECT

p."Category",

p."Product Name",

sf."Sales"

FROM products p

LEFT JOIN sales_fact sf

ON p."Product ID" = sf."Product ID";

---------------------------------------------------------
-- Query 26
-- Customer Sales Report
---------------------------------------------------------

SELECT

c."Customer Name",

SUM(sf."Sales") AS Total_Sales

FROM customers c

LEFT JOIN orders o

ON c."Customer ID" = o."Customer ID"

LEFT JOIN sales_fact sf

ON o."Order ID" = sf."Order ID"

GROUP BY c."Customer Name"

ORDER BY Total_Sales DESC;

---------------------------------------------------------
-- Query 27
-- Customer Profit Report
---------------------------------------------------------

SELECT

c."Customer Name",

SUM(sf."Profit") AS Total_Profit

FROM customers c

LEFT JOIN orders o

ON c."Customer ID" = o."Customer ID"

LEFT JOIN sales_fact sf

ON o."Order ID" = sf."Order ID"

GROUP BY c."Customer Name"

ORDER BY Total_Profit DESC;

---------------------------------------------------------
-- Query 28
-- Product Sales Report
---------------------------------------------------------

SELECT

p."Product Name",

SUM(sf."Sales") AS Sales

FROM products p

LEFT JOIN sales_fact sf

ON p."Product ID" = sf."Product ID"

GROUP BY p."Product Name"

ORDER BY Sales DESC;

---------------------------------------------------------
-- Query 29
-- State Sales
---------------------------------------------------------

SELECT

l."State",

SUM(sf."Sales") AS Sales

FROM locations l

LEFT JOIN sales_fact sf

ON l."Postal Code" = sf."Postal Code"

GROUP BY l."State"

ORDER BY Sales DESC;

---------------------------------------------------------
-- Query 30
-- Region Profit
---------------------------------------------------------

SELECT

l."Region",

SUM(sf."Profit") AS Profit

FROM locations l

LEFT JOIN sales_fact sf

ON l."Postal Code" = sf."Postal Code"

GROUP BY l."Region"

ORDER BY Profit DESC;

---------------------------------------------------------
-- Query 31
-- Average Sales by Customer
---------------------------------------------------------

SELECT

c."Customer Name",

AVG(sf."Sales") AS Avg_Sales

FROM customers c

LEFT JOIN orders o

ON c."Customer ID" = o."Customer ID"

LEFT JOIN sales_fact sf

ON o."Order ID" = sf."Order ID"

GROUP BY c."Customer Name";

---------------------------------------------------------
-- Query 32
-- Average Profit by Product
---------------------------------------------------------

SELECT

p."Product Name",

AVG(sf."Profit") AS Avg_Profit

FROM products p

LEFT JOIN sales_fact sf

ON p."Product ID" = sf."Product ID"

GROUP BY p."Product Name";

---------------------------------------------------------
-- Query 33
-- Top Technology Products
---------------------------------------------------------

SELECT

p."Product Name",

SUM(sf."Sales") AS Sales

FROM products p

LEFT JOIN sales_fact sf

ON p."Product ID" = sf."Product ID"

WHERE p."Category"='Technology'

GROUP BY p."Product Name"

ORDER BY Sales DESC;

---------------------------------------------------------
-- Query 34
-- Furniture Profit
---------------------------------------------------------

SELECT

p."Product Name",

SUM(sf."Profit") AS Profit

FROM products p

LEFT JOIN sales_fact sf

ON p."Product ID" = sf."Product ID"

WHERE p."Category"='Furniture'

GROUP BY p."Product Name"

ORDER BY Profit DESC;

---------------------------------------------------------
-- Query 35
-- Orders by Ship Mode
---------------------------------------------------------

SELECT

o."Ship Mode",

COUNT(*) AS Orders

FROM orders o

GROUP BY o."Ship Mode";

---------------------------------------------------------
-- Query 36
-- Sales by Ship Mode
---------------------------------------------------------

SELECT

o."Ship Mode",

SUM(sf."Sales") AS Sales

FROM orders o

LEFT JOIN sales_fact sf

ON o."Order ID" = sf."Order ID"

GROUP BY o."Ship Mode";

---------------------------------------------------------
-- Query 37
-- Profit by Ship Mode
---------------------------------------------------------

SELECT

o."Ship Mode",

SUM(sf."Profit") AS Profit

FROM orders o

LEFT JOIN sales_fact sf

ON o."Order ID" = sf."Order ID"

GROUP BY o."Ship Mode";

---------------------------------------------------------
-- Query 38
-- Customer-State Report
---------------------------------------------------------

SELECT

c."Customer Name",

l."State",

SUM(sf."Sales") AS Sales

FROM customers c

LEFT JOIN orders o

ON c."Customer ID" = o."Customer ID"

LEFT JOIN sales_fact sf

ON o."Order ID" = sf."Order ID"

LEFT JOIN locations l

ON sf."Postal Code" = l."Postal Code"

GROUP BY

c."Customer Name",

l."State";

---------------------------------------------------------
-- Query 39
-- Product-State Report
---------------------------------------------------------

SELECT

p."Product Name",

l."State",

SUM(sf."Sales") AS Sales

FROM products p

LEFT JOIN sales_fact sf

ON p."Product ID" = sf."Product ID"

LEFT JOIN locations l

ON sf."Postal Code" = l."Postal Code"

GROUP BY

p."Product Name",

l."State";

---------------------------------------------------------
-- Query 40
-- Executive Dashboard
---------------------------------------------------------

SELECT

c."Segment",

p."Category",

l."Region",

SUM(sf."Sales") AS Sales,

SUM(sf."Profit") AS Profit

FROM customers c

LEFT JOIN orders o

ON c."Customer ID" = o."Customer ID"

LEFT JOIN sales_fact sf

ON o."Order ID" = sf."Order ID"

LEFT JOIN products p

ON sf."Product ID" = p."Product ID"

LEFT JOIN locations l

ON sf."Postal Code" = l."Postal Code"

GROUP BY

c."Segment",

p."Category",

l."Region"

ORDER BY Sales DESC;

/*
=========================================================
PART 3 : RIGHT JOIN, FULL JOIN, CROSS JOIN & SELF JOIN
Queries : 41 - 60
=========================================================
*/

---------------------------------------------------------
-- Query 41
-- RIGHT JOIN Customers & Orders
---------------------------------------------------------

SELECT

c."Customer Name",

o."Order ID"

FROM orders o

RIGHT JOIN customers c

ON o."Customer ID"=c."Customer ID";

---------------------------------------------------------
-- Query 42
-- RIGHT JOIN Products & Sales
---------------------------------------------------------

SELECT

p."Product Name",

sf."Sales"

FROM sales_fact sf

RIGHT JOIN products p

ON sf."Product ID"=p."Product ID";

---------------------------------------------------------
-- Query 43
-- RIGHT JOIN Locations
---------------------------------------------------------

SELECT

l."State",

sf."Sales"

FROM sales_fact sf

RIGHT JOIN locations l

ON sf."Postal Code"=l."Postal Code";

---------------------------------------------------------
-- Query 44
-- FULL OUTER JOIN Orders & Customers
---------------------------------------------------------

SELECT

o."Order ID",

c."Customer Name"

FROM orders o

FULL OUTER JOIN customers c

ON o."Customer ID"=c."Customer ID";

---------------------------------------------------------
-- Query 45
-- FULL OUTER JOIN Products
---------------------------------------------------------

SELECT

p."Product Name",

sf."Sales"

FROM products p

FULL OUTER JOIN sales_fact sf

ON p."Product ID"=sf."Product ID";

---------------------------------------------------------
-- Query 46
-- FULL OUTER JOIN Locations
---------------------------------------------------------

SELECT

l."State",

sf."Sales"

FROM locations l

FULL OUTER JOIN sales_fact sf

ON l."Postal Code"=sf."Postal Code";

---------------------------------------------------------
-- Query 47
-- CROSS JOIN Example
---------------------------------------------------------

SELECT

c."Customer Name",

p."Category"

FROM customers c

CROSS JOIN products p

LIMIT 50;

---------------------------------------------------------
-- Query 48
-- CROSS JOIN Ship Mode
---------------------------------------------------------

SELECT

o."Ship Mode",

p."Category"

FROM orders o

CROSS JOIN products p

LIMIT 50;

---------------------------------------------------------
-- Query 49
-- SELF JOIN Example
---------------------------------------------------------

SELECT

A."Customer Name" AS Customer1,

B."Customer Name" AS Customer2,

A."Segment"

FROM customers A

JOIN customers B

ON A."Segment"=B."Segment"

AND A."Customer ID"<>B."Customer ID"

LIMIT 50;

---------------------------------------------------------
-- Query 50
-- SELF JOIN Products
---------------------------------------------------------

SELECT

A."Product Name",

B."Product Name",

A."Category"

FROM products A

JOIN products B

ON A."Category"=B."Category"

AND A."Product ID"<>B."Product ID"

LIMIT 50;

---------------------------------------------------------
-- Query 51
-- Sales by Category
---------------------------------------------------------

SELECT

p."Category",

SUM(sf."Sales") AS Sales

FROM sales_fact sf

JOIN products p

ON sf."Product ID"=p."Product ID"

GROUP BY p."Category";

---------------------------------------------------------
-- Query 52
-- Profit by Category
---------------------------------------------------------

SELECT

p."Category",

SUM(sf."Profit") AS Profit

FROM sales_fact sf

JOIN products p

ON sf."Product ID"=p."Product ID"

GROUP BY p."Category";

---------------------------------------------------------
-- Query 53
-- Sales by Region
---------------------------------------------------------

SELECT

l."Region",

SUM(sf."Sales") AS Sales

FROM sales_fact sf

JOIN locations l

ON sf."Postal Code"=l."Postal Code"

GROUP BY l."Region";

---------------------------------------------------------
-- Query 54
-- Profit by Region
---------------------------------------------------------

SELECT

l."Region",

SUM(sf."Profit") AS Profit

FROM sales_fact sf

JOIN locations l

ON sf."Postal Code"=l."Postal Code"

GROUP BY l."Region";

---------------------------------------------------------
-- Query 55
-- Customer Purchase Summary
---------------------------------------------------------

SELECT

c."Customer Name",

COUNT(sf."Order ID") AS Orders,

SUM(sf."Sales") AS Revenue

FROM customers c

JOIN orders o

ON c."Customer ID"=o."Customer ID"

JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

GROUP BY c."Customer Name"

ORDER BY Revenue DESC;

---------------------------------------------------------
-- Query 56
-- Top Product Categories
---------------------------------------------------------

SELECT

p."Category",

COUNT(*) AS Orders,

SUM(sf."Sales") AS Revenue

FROM products p

JOIN sales_fact sf

ON p."Product ID"=sf."Product ID"

GROUP BY p."Category";

---------------------------------------------------------
-- Query 57
-- Average Profit by Region
---------------------------------------------------------

SELECT

l."Region",

AVG(sf."Profit") AS Avg_Profit

FROM sales_fact sf

JOIN locations l

ON sf."Postal Code"=l."Postal Code"

GROUP BY l."Region";

---------------------------------------------------------
-- Query 58
-- Sales by Customer Segment
---------------------------------------------------------

SELECT

c."Segment",

SUM(sf."Sales") AS Sales

FROM customers c

JOIN orders o

ON c."Customer ID"=o."Customer ID"

JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

GROUP BY c."Segment";

---------------------------------------------------------
-- Query 59
-- Complete Business Report
---------------------------------------------------------

SELECT

c."Customer Name",

p."Category",

l."Region",

SUM(sf."Sales") AS Revenue,

SUM(sf."Profit") AS Profit

FROM customers c

JOIN orders o

ON c."Customer ID"=o."Customer ID"

JOIN sales_fact sf

ON o."Order ID"=sf."Order ID"

JOIN products p

ON sf."Product ID"=p."Product ID"

JOIN locations l

ON sf."Postal Code"=l."Postal Code"

GROUP BY

c."Customer Name",

p."Category",

l."Region"

ORDER BY Revenue DESC;

---------------------------------------------------------
-- Query 60
-- Executive Dashboard
---------------------------------------------------------

SELECT

p."Category",

l."Region",

c."Segment",

COUNT(*) AS Orders,

SUM(sf."Sales") AS Revenue,

SUM(sf."Profit") AS Profit,

ROUND(AVG(sf."Sales"),2) AS Avg_Order_Value

FROM sales_fact sf

JOIN products p

ON sf."Product ID"=p."Product ID"

JOIN locations l

ON sf."Postal Code"=l."Postal Code"

JOIN orders o

ON sf."Order ID"=o."Order ID"

JOIN customers c

ON o."Customer ID"=c."Customer ID"

GROUP BY

p."Category",

l."Region",

c."Segment"

ORDER BY Revenue DESC;