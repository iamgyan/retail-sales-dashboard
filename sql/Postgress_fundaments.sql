/*
=====================================================================
FILE : 01_SQL_Fundamentals.sql
AUTHOR : Gyan Ranjan Agrawal
DATABASE : PostgreSQL
DATASET : Superstore
=====================================================================

Topics Covered

✔ SELECT
✔ LIMIT
✔ DISTINCT
✔ WHERE
✔ ORDER BY
✔ BETWEEN
✔ IN
✔ NOT IN
✔ LIKE
✔ Aggregate Functions
✔ Aliases

=====================================================================
*/

-------------------------------------------------------------
-- Query 1
-- View complete table
-------------------------------------------------------------

SELECT *
FROM sales;

-------------------------------------------------------------
-- Query 2
-- View first 10 records
-------------------------------------------------------------

SELECT *
FROM sales
LIMIT 10;

-------------------------------------------------------------
-- Query 3
-- View selected columns
-------------------------------------------------------------

SELECT
"Order ID",
"Customer Name",
"Sales"
FROM sales
LIMIT 10;

-------------------------------------------------------------
-- Query 4
-- View Customer and Profit
-------------------------------------------------------------

SELECT
"Customer Name",
"Profit"
FROM sales
LIMIT 20;

-------------------------------------------------------------
-- Query 5
-- Unique Categories
-------------------------------------------------------------

SELECT DISTINCT
"Category"
FROM sales;

-------------------------------------------------------------
-- Query 6
-- Unique Regions
-------------------------------------------------------------

SELECT DISTINCT
"Region"
FROM sales;

-------------------------------------------------------------
-- Query 7
-- Unique Ship Modes
-------------------------------------------------------------

SELECT DISTINCT
"Ship Mode"
FROM sales;

-------------------------------------------------------------
-- Query 8
-- Sales greater than 1000
-------------------------------------------------------------

SELECT *
FROM sales
WHERE "Sales">1000;

-------------------------------------------------------------
-- Query 9
-- Profit greater than 200
-------------------------------------------------------------

SELECT *
FROM sales
WHERE "Profit">200;

-------------------------------------------------------------
-- Query 10
-- Loss making orders
-------------------------------------------------------------

SELECT *
FROM sales
WHERE "Profit"<0;

-------------------------------------------------------------
-- Query 11
-- Furniture Orders
-------------------------------------------------------------

SELECT *
FROM sales
WHERE "Category"='Furniture';

-------------------------------------------------------------
-- Query 12
-- Technology Orders
-------------------------------------------------------------

SELECT *
FROM sales
WHERE "Category"='Technology';

-------------------------------------------------------------
-- Query 13
-- Orders from California
-------------------------------------------------------------

SELECT *
FROM sales
WHERE "State"='California';

-------------------------------------------------------------
-- Query 14
-- Orders from Texas
-------------------------------------------------------------

SELECT *
FROM sales
WHERE "State"='Texas';

-------------------------------------------------------------
-- Query 15
-- AND Condition
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Category"='Furniture'
AND
"Sales">500;

-------------------------------------------------------------
-- Query 16
-- OR Condition
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Category"='Furniture'
OR
"Category"='Technology';

-------------------------------------------------------------
-- Query 17
-- IN
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Region"
IN
('West','East');

-------------------------------------------------------------
-- Query 18
-- NOT IN
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Region"
NOT IN
('West');

-------------------------------------------------------------
-- Query 19
-- BETWEEN
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Sales"
BETWEEN
100
AND
500;

-------------------------------------------------------------
-- Query 20
-- Profit between 50 and 300
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Profit"
BETWEEN
50
AND
300;

-------------------------------------------------------------
-- Query 21
-- Customer starts with A
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Customer Name"
LIKE
'A%';

-------------------------------------------------------------
-- Query 22
-- Customer ends with son
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Customer Name"
LIKE
'%son';

-------------------------------------------------------------
-- Query 23
-- Product contains Chair
-------------------------------------------------------------

SELECT *
FROM sales
WHERE
"Product Name"
LIKE
'%Chair%';

-------------------------------------------------------------
-- Query 24
-- Highest Sales
-------------------------------------------------------------

SELECT *
FROM sales
ORDER BY
"Sales"
DESC
LIMIT 10;

-------------------------------------------------------------
-- Query 25
-- Lowest Profit
-------------------------------------------------------------

SELECT *
FROM sales
ORDER BY
"Profit"
ASC
LIMIT 10;

-------------------------------------------------------------
-- Query 26
-- Highest Discount
-------------------------------------------------------------

SELECT *
FROM sales
ORDER BY
"Discount"
DESC;

-------------------------------------------------------------
-- Query 27
-- Sort by Category then Sales
-------------------------------------------------------------

SELECT *
FROM sales
ORDER BY
"Category",
"Sales"
DESC;

-------------------------------------------------------------
-- Query 28
-- Alias Example
-------------------------------------------------------------

SELECT
"Customer Name" AS Customer,
"Sales" AS Revenue,
"Profit" AS Earnings
FROM sales
LIMIT 20;

-------------------------------------------------------------
-- Query 29
-- Multiple Conditions
-------------------------------------------------------------

SELECT *

FROM sales

WHERE

"Category"='Technology'

AND

"Profit">100

AND

"Sales">500;

-------------------------------------------------------------
-- Query 30
-- Business Question
-- Top 20 Highest Value Orders
-------------------------------------------------------------

SELECT

"Order ID",
"Customer Name",
"Sales",
"Profit"

FROM sales

ORDER BY

"Sales" DESC

LIMIT 20;


/*
=========================================================
PART 2 : Aggregate Functions & GROUP BY
Queries : 31 - 60
=========================================================
*/

-------------------------------------------------------------
-- Query 31
-- Total Orders
-------------------------------------------------------------

SELECT COUNT(*) AS Total_Orders
FROM sales;

-------------------------------------------------------------
-- Query 32
-- Total Sales
-------------------------------------------------------------

SELECT SUM("Sales") AS Total_Sales
FROM sales;

-------------------------------------------------------------
-- Query 33
-- Total Profit
-------------------------------------------------------------

SELECT SUM("Profit") AS Total_Profit
FROM sales;

-------------------------------------------------------------
-- Query 34
-- Average Sales
-------------------------------------------------------------

SELECT AVG("Sales") AS Average_Sales
FROM sales;

-------------------------------------------------------------
-- Query 35
-- Average Profit
-------------------------------------------------------------

SELECT AVG("Profit") AS Average_Profit
FROM sales;

-------------------------------------------------------------
-- Query 36
-- Highest Sale
-------------------------------------------------------------

SELECT MAX("Sales") AS Highest_Sale
FROM sales;

-------------------------------------------------------------
-- Query 37
-- Lowest Sale
-------------------------------------------------------------

SELECT MIN("Sales") AS Lowest_Sale
FROM sales;

-------------------------------------------------------------
-- Query 38
-- Highest Profit
-------------------------------------------------------------

SELECT MAX("Profit") AS Highest_Profit
FROM sales;

-------------------------------------------------------------
-- Query 39
-- Biggest Loss
-------------------------------------------------------------

SELECT MIN("Profit") AS Biggest_Loss
FROM sales;

-------------------------------------------------------------
-- Query 40
-- Average Discount
-------------------------------------------------------------

SELECT AVG("Discount") AS Average_Discount
FROM sales;

-------------------------------------------------------------
-- Query 41
-- Orders by Category
-------------------------------------------------------------

SELECT
"Category",
COUNT(*) AS Orders
FROM sales
GROUP BY "Category";

-------------------------------------------------------------
-- Query 42
-- Sales by Category
-------------------------------------------------------------

SELECT
"Category",
SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Category";

-------------------------------------------------------------
-- Query 43
-- Profit by Category
-------------------------------------------------------------

SELECT
"Category",
SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Category";

-------------------------------------------------------------
-- Query 44
-- Average Sales by Category
-------------------------------------------------------------

SELECT
"Category",
AVG("Sales") AS Average_Sales
FROM sales
GROUP BY "Category";

-------------------------------------------------------------
-- Query 45
-- Orders by Region
-------------------------------------------------------------

SELECT
"Region",
COUNT(*) AS Orders
FROM sales
GROUP BY "Region";

-------------------------------------------------------------
-- Query 46
-- Sales by Region
-------------------------------------------------------------

SELECT
"Region",
SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Region";

-------------------------------------------------------------
-- Query 47
-- Profit by Region
-------------------------------------------------------------

SELECT
"Region",
SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Region";

-------------------------------------------------------------
-- Query 48
-- Sales by Segment
-------------------------------------------------------------

SELECT
"Segment",
SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Segment";

-------------------------------------------------------------
-- Query 49
-- Profit by Segment
-------------------------------------------------------------

SELECT
"Segment",
SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Segment";

-------------------------------------------------------------
-- Query 50
-- Sales by Ship Mode
-------------------------------------------------------------

SELECT
"Ship Mode",
SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Ship Mode";

-------------------------------------------------------------
-- Query 51
-- Orders by State
-------------------------------------------------------------

SELECT
"State",
COUNT(*) AS Orders
FROM sales
GROUP BY "State"
ORDER BY Orders DESC;

-------------------------------------------------------------
-- Query 52
-- Top 10 States by Sales
-------------------------------------------------------------

SELECT
"State",
SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "State"
ORDER BY Total_Sales DESC
LIMIT 10;

-------------------------------------------------------------
-- Query 53
-- Top 10 States by Profit
-------------------------------------------------------------

SELECT
"State",
SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "State"
ORDER BY Total_Profit DESC
LIMIT 10;

-------------------------------------------------------------
-- Query 54
-- Bottom 10 States by Profit
-------------------------------------------------------------

SELECT
"State",
SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "State"
ORDER BY Total_Profit ASC
LIMIT 10;

-------------------------------------------------------------
-- Query 55
-- Categories with Sales > 500000
-------------------------------------------------------------

SELECT
"Category",
SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Category"
HAVING SUM("Sales") > 500000;

-------------------------------------------------------------
-- Query 56
-- Regions with Profit > 100000
-------------------------------------------------------------

SELECT
"Region",
SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Region"
HAVING SUM("Profit") > 100000;

-------------------------------------------------------------
-- Query 57
-- States having more than 200 Orders
-------------------------------------------------------------

SELECT
"State",
COUNT(*) AS Orders
FROM sales
GROUP BY "State"
HAVING COUNT(*) > 200;

-------------------------------------------------------------
-- Query 58
-- Ship Modes with Avg Shipping Days > 4
-------------------------------------------------------------

SELECT
"Ship Mode",
AVG("Shipping Days") AS Avg_Days
FROM sales
GROUP BY "Ship Mode"
HAVING AVG("Shipping Days") > 4;

-------------------------------------------------------------
-- Query 59
-- Customer Segments having Avg Sales > 250
-------------------------------------------------------------

SELECT
"Segment",
AVG("Sales") AS Avg_Sales
FROM sales
GROUP BY "Segment"
HAVING AVG("Sales") > 250;

-------------------------------------------------------------
-- Query 60
-- Business KPI Dashboard
-------------------------------------------------------------

SELECT

COUNT(*) AS Total_Orders,

SUM("Sales") AS Total_Sales,

SUM("Profit") AS Total_Profit,

ROUND(AVG("Sales"),2) AS Average_Order_Value,

ROUND(AVG("Profit"),2) AS Average_Profit

FROM sales;


/*
=========================================================
PART 3 : CASE WHEN & BUSINESS LOGIC
Queries : 61 - 90
=========================================================
*/

---------------------------------------------------------
-- Query 61
-- Sales Category
---------------------------------------------------------

SELECT
"Order ID",
"Sales",

CASE
WHEN "Sales"<100 THEN 'Low'
WHEN "Sales"<=500 THEN 'Medium'
ELSE 'High'
END AS Sales_Category

FROM sales;

---------------------------------------------------------
-- Query 62
-- Profit Status
---------------------------------------------------------

SELECT

"Order ID",
"Profit",

CASE

WHEN "Profit"<0 THEN 'Loss'
WHEN "Profit"=0 THEN 'Break Even'
ELSE 'Profit'

END AS Profit_Status

FROM sales;

---------------------------------------------------------
-- Query 63
-- Shipping Performance
---------------------------------------------------------

SELECT

"Order ID",
"Shipping Days",

CASE

WHEN "Shipping Days"<=2 THEN 'Fast'

WHEN "Shipping Days"<=5 THEN 'Normal'

ELSE 'Delayed'

END AS Delivery_Status

FROM sales;

---------------------------------------------------------
-- Query 64
-- Discount Category
---------------------------------------------------------

SELECT

"Discount",

CASE

WHEN "Discount"=0 THEN 'No Discount'

WHEN "Discount"<=0.20 THEN 'Low'

WHEN "Discount"<=0.50 THEN 'Medium'

ELSE 'Heavy'

END AS Discount_Type

FROM sales;

---------------------------------------------------------
-- Query 65
-- Quantity Category
---------------------------------------------------------

SELECT

"Quantity",

CASE

WHEN "Quantity"=1 THEN 'Single'

WHEN "Quantity"<=4 THEN 'Small'

ELSE 'Bulk'

END

FROM sales;

---------------------------------------------------------
-- Query 66
-- Customer Classification
---------------------------------------------------------

SELECT

"Customer Name",

SUM("Sales") AS Total_Sales,

CASE

WHEN SUM("Sales")>10000 THEN 'Premium'

WHEN SUM("Sales")>5000 THEN 'Gold'

ELSE 'Regular'

END AS Customer_Level

FROM sales

GROUP BY "Customer Name";

---------------------------------------------------------
-- Query 67
-- Product Performance
---------------------------------------------------------

SELECT

"Product Name",

SUM("Profit") AS Profit,

CASE

WHEN SUM("Profit")>1000 THEN 'Excellent'

WHEN SUM("Profit")>0 THEN 'Profitable'

ELSE 'Loss Product'

END

FROM sales

GROUP BY "Product Name";

---------------------------------------------------------
-- Query 68
-- Region Performance
---------------------------------------------------------

SELECT

"Region",

SUM("Sales") AS Sales,

CASE

WHEN SUM("Sales")>700000 THEN 'Top'

WHEN SUM("Sales")>400000 THEN 'Growing'

ELSE 'Average'

END

FROM sales

GROUP BY "Region";

---------------------------------------------------------
-- Query 69
-- Weekend Orders
---------------------------------------------------------

SELECT

"Order ID",

"Order Day",

CASE

WHEN "Order Day" IN ('Saturday','Sunday')

THEN 'Weekend'

ELSE 'Weekday'

END

FROM sales;

---------------------------------------------------------
-- Query 70
-- High Discount Alert
---------------------------------------------------------

SELECT

"Order ID",

"Discount",

"Profit",

CASE

WHEN "Discount">0.3
AND "Profit"<0

THEN 'Loss due to Discount'

ELSE 'Normal'

END

FROM sales;

---------------------------------------------------------
-- Query 71
-- Count Loss Orders
---------------------------------------------------------

SELECT

SUM(

CASE

WHEN "Profit"<0 THEN 1

ELSE 0

END

) AS Loss_Orders

FROM sales;

---------------------------------------------------------
-- Query 72
-- Count Profitable Orders
---------------------------------------------------------

SELECT

SUM(

CASE

WHEN "Profit">0 THEN 1

ELSE 0

END

) AS Profit_Orders

FROM sales;

---------------------------------------------------------
-- Query 73
-- Count High Value Orders
---------------------------------------------------------

SELECT

SUM(

CASE

WHEN "Sales">1000 THEN 1

ELSE 0

END

)

AS High_Value_Orders

FROM sales;

---------------------------------------------------------
-- Query 74
-- Total High Value Sales
---------------------------------------------------------

SELECT

SUM(

CASE

WHEN "Sales">1000

THEN "Sales"

ELSE 0

END

)

FROM sales;

---------------------------------------------------------
-- Query 75
-- Profit Percentage
---------------------------------------------------------

SELECT

"Order ID",

ROUND(

("Profit"/NULLIF("Sales",0))*100

,2)

AS Profit_Percentage

FROM sales;

---------------------------------------------------------
-- Query 76
-- COALESCE Example
---------------------------------------------------------

SELECT

COALESCE(

NULL,

'Retail Dashboard'

);

---------------------------------------------------------
-- Query 77
-- CAST Example
---------------------------------------------------------

SELECT

CAST("Sales" AS INTEGER)

FROM sales

LIMIT 20;

---------------------------------------------------------
-- Query 78
-- ROUND Example
---------------------------------------------------------

SELECT

ROUND(

AVG("Sales"),

2

)

FROM sales;

---------------------------------------------------------
-- Query 79
-- Dashboard KPI
---------------------------------------------------------

SELECT

COUNT(*) AS Orders,

SUM("Sales") AS Sales,

SUM("Profit") AS Profit,

ROUND(

SUM("Profit")/
SUM("Sales")*100

,2)

AS Profit_Margin

FROM sales;

---------------------------------------------------------
-- Query 80
-- Business Recommendation
---------------------------------------------------------

SELECT

"Sub-Category",

SUM("Sales") AS Sales,

SUM("Profit") AS Profit,

CASE

WHEN SUM("Sales")>50000
AND SUM("Profit")<0

THEN 'Improve Margin'

WHEN SUM("Sales")<10000

THEN 'Increase Marketing'

ELSE 'Maintain'

END

AS Recommendation

FROM sales

GROUP BY "Sub-Category";

---------------------------------------------------------
-- Query 81
-- Orders per Year
---------------------------------------------------------

SELECT

"Order Year",

COUNT(*)

FROM sales

GROUP BY "Order Year";

---------------------------------------------------------
-- Query 82
-- Sales per Quarter
---------------------------------------------------------

SELECT

"Order Quarter",

SUM("Sales")

FROM sales

GROUP BY "Order Quarter";

---------------------------------------------------------
-- Query 83
-- Average Shipping Days
---------------------------------------------------------

SELECT

AVG("Shipping Days")

FROM sales;

---------------------------------------------------------
-- Query 84
-- Most Expensive Order
---------------------------------------------------------

SELECT *

FROM sales

ORDER BY "Sales" DESC

LIMIT 1;

---------------------------------------------------------
-- Query 85
-- Biggest Loss Order
---------------------------------------------------------

SELECT *

FROM sales

ORDER BY "Profit"

LIMIT 1;

---------------------------------------------------------
-- Query 86
-- Top 10 Customers
---------------------------------------------------------

SELECT

"Customer Name",

SUM("Sales") AS Sales

FROM sales

GROUP BY "Customer Name"

ORDER BY Sales DESC

LIMIT 10;

---------------------------------------------------------
-- Query 87
-- Top 10 Products
---------------------------------------------------------

SELECT

"Product Name",

SUM("Sales") AS Sales

FROM sales

GROUP BY "Product Name"

ORDER BY Sales DESC

LIMIT 10;

---------------------------------------------------------
-- Query 88
-- Top Cities
---------------------------------------------------------

SELECT

"City",

SUM("Sales") AS Sales

FROM sales

GROUP BY "City"

ORDER BY Sales DESC

LIMIT 10;

---------------------------------------------------------
-- Query 89
-- Bottom Cities
---------------------------------------------------------

SELECT

"City",

SUM("Profit") AS Profit

FROM sales

GROUP BY "City"

ORDER BY Profit ASC

LIMIT 10;

---------------------------------------------------------
-- Query 90
-- Executive Dashboard
---------------------------------------------------------

SELECT

COUNT(*) AS Orders,

COUNT(DISTINCT "Customer ID") AS Customers,

SUM("Sales") AS Revenue,

SUM("Profit") AS Profit,

ROUND(AVG("Sales"),2) AS Avg_Order,

MAX("Sales") AS Max_Order,

MIN("Sales") AS Min_Order

FROM sales;


/*
=========================================================
PART 4 : STRING, DATE & NUMERIC FUNCTIONS
Queries : 91 - 130
=========================================================
*/

---------------------------------------------------------
-- Query 91
-- Convert Customer Name to Uppercase
---------------------------------------------------------

SELECT
"Customer Name",
UPPER("Customer Name") AS Customer_Upper
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 92
-- Convert Customer Name to Lowercase
---------------------------------------------------------

SELECT
"Customer Name",
LOWER("Customer Name") AS Customer_Lower
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 93
-- Length of Customer Name
---------------------------------------------------------

SELECT
"Customer Name",
LENGTH("Customer Name") AS Name_Length
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 94
-- First 5 Characters of Product Name
---------------------------------------------------------

SELECT
"Product Name",
LEFT("Product Name",5) AS Prefix
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 95
-- Last 8 Characters of Product Name
---------------------------------------------------------

SELECT
"Product Name",
RIGHT("Product Name",8) AS Suffix
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 96
-- First 10 Characters
---------------------------------------------------------

SELECT
"Product Name",
SUBSTRING("Product Name",1,10)
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 97
-- Replace Word
---------------------------------------------------------

SELECT
"Product Name",
REPLACE("Product Name",'Chair','Seat')
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 98
-- Trim Example
---------------------------------------------------------

SELECT
TRIM('     PostgreSQL     ') AS Clean_Text;

---------------------------------------------------------
-- Query 99
-- Concatenate Customer & State
---------------------------------------------------------

SELECT
CONCAT("Customer Name",' - ',"State") AS Customer_State
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 100
-- Current Date
---------------------------------------------------------

SELECT CURRENT_DATE;

---------------------------------------------------------
-- Query 101
-- Current Time
---------------------------------------------------------

SELECT CURRENT_TIME;

---------------------------------------------------------
-- Query 102
-- Current Timestamp
---------------------------------------------------------

SELECT CURRENT_TIMESTAMP;

---------------------------------------------------------
-- Query 103
-- Extract Year
---------------------------------------------------------

SELECT
"Order Date",
EXTRACT(YEAR FROM "Order Date") AS Order_Year
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 104
-- Extract Month
---------------------------------------------------------

SELECT
"Order Date",
EXTRACT(MONTH FROM "Order Date") AS Month
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 105
-- Extract Day
---------------------------------------------------------

SELECT
"Order Date",
EXTRACT(DAY FROM "Order Date") AS Day
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 106
-- Extract Quarter
---------------------------------------------------------

SELECT
"Order Date",
EXTRACT(QUARTER FROM "Order Date") AS Quarter
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 107
-- Extract Week
---------------------------------------------------------

SELECT
"Order Date",
EXTRACT(WEEK FROM "Order Date") AS Week_Number
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 108
-- Date Trunc Month
---------------------------------------------------------

SELECT
DATE_TRUNC('month',"Order Date")
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 109
-- Shipping Difference
---------------------------------------------------------

SELECT
"Order Date",
"Ship Date",
AGE("Ship Date","Order Date") AS Shipping_Time
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 110
-- Round Sales
---------------------------------------------------------

SELECT
ROUND("Sales",2)
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 111
-- Ceiling
---------------------------------------------------------

SELECT
CEIL("Sales")
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 112
-- Floor
---------------------------------------------------------

SELECT
FLOOR("Sales")
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 113
-- Absolute Profit
---------------------------------------------------------

SELECT
ABS("Profit")
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 114
-- Square Root
---------------------------------------------------------

SELECT
SQRT("Sales")
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 115
-- Power Function
---------------------------------------------------------

SELECT
POWER("Quantity",2)
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 116
-- Modulus
---------------------------------------------------------

SELECT
MOD("Quantity",2)
FROM sales
LIMIT 20;

---------------------------------------------------------
-- Query 117
-- Random Number
---------------------------------------------------------

SELECT RANDOM();

---------------------------------------------------------
-- Query 118
-- Highest Rounded Sales
---------------------------------------------------------

SELECT
ROUND(MAX("Sales"),2)
FROM sales;

---------------------------------------------------------
-- Query 119
-- Average Rounded Profit
---------------------------------------------------------

SELECT
ROUND(AVG("Profit"),2)
FROM sales;

---------------------------------------------------------
-- Query 120
-- Profit Percentage
---------------------------------------------------------

SELECT

"Order ID",

ROUND(

("Profit"/NULLIF("Sales",0))*100

,2)

AS Profit_Percentage

FROM sales

LIMIT 20;

---------------------------------------------------------
-- Query 121
-- Product Name Length
---------------------------------------------------------

SELECT

"Product Name",

LENGTH("Product Name")

FROM sales

ORDER BY 2 DESC

LIMIT 10;

---------------------------------------------------------
-- Query 122
-- Customer Name Length
---------------------------------------------------------

SELECT

"Customer Name",

LENGTH("Customer Name")

FROM sales

ORDER BY 2 DESC

LIMIT 10;

---------------------------------------------------------
-- Query 123
-- Upper State
---------------------------------------------------------

SELECT

UPPER("State")

FROM sales

LIMIT 20;

---------------------------------------------------------
-- Query 124
-- Lower City
---------------------------------------------------------

SELECT

LOWER("City")

FROM sales

LIMIT 20;

---------------------------------------------------------
-- Query 125
-- Rounded Average Sales by Category
---------------------------------------------------------

SELECT

"Category",

ROUND(AVG("Sales"),2)

FROM sales

GROUP BY "Category";

---------------------------------------------------------
-- Query 126
-- Rounded Profit by Region
---------------------------------------------------------

SELECT

"Region",

ROUND(SUM("Profit"),2)

FROM sales

GROUP BY "Region";

---------------------------------------------------------
-- Query 127
-- Quarter-wise Sales
---------------------------------------------------------

SELECT

EXTRACT(QUARTER FROM "Order Date") AS Quarter,

SUM("Sales")

FROM sales

GROUP BY Quarter

ORDER BY Quarter;

---------------------------------------------------------
-- Query 128
-- Month-wise Orders
---------------------------------------------------------

SELECT

EXTRACT(MONTH FROM "Order Date") AS Month,

COUNT(*)

FROM sales

GROUP BY Month

ORDER BY Month;

---------------------------------------------------------
-- Query 129
-- Year-wise Sales
---------------------------------------------------------

SELECT

EXTRACT(YEAR FROM "Order Date") AS Year,

SUM("Sales")

FROM sales

GROUP BY Year

ORDER BY Year;

---------------------------------------------------------
-- Query 130
-- Executive Summary
---------------------------------------------------------

SELECT

COUNT(*) AS Orders,

COUNT(DISTINCT "Customer ID") AS Customers,

COUNT(DISTINCT "Product ID") AS Products,

ROUND(SUM("Sales"),2) AS Revenue,

ROUND(SUM("Profit"),2) AS Profit,

ROUND(AVG("Shipping Days"),2) AS Avg_Shipping_Days

FROM sales;