/*
=========================================================
02_Filtering_and_Aggregation.sql
Project: Retail Sales Dashboard
=========================================================
Topics Covered:
1. GROUP BY
2. HAVING
3. Multiple Aggregations
4. Business Questions
=========================================================
*/

---------------------------------------------------------
-- 1. Total Sales by Category
---------------------------------------------------------

SELECT
    "Category",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Category";

---------------------------------------------------------
-- 2. Total Profit by Category
---------------------------------------------------------

SELECT
    "Category",
    SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Category";

---------------------------------------------------------
-- 3. Number of Orders by Category
---------------------------------------------------------

SELECT
    "Category",
    COUNT(*) AS Orders
FROM sales
GROUP BY "Category";

---------------------------------------------------------
-- 4. Average Sales by Category
---------------------------------------------------------

SELECT
    "Category",
    AVG("Sales") AS Avg_Sales
FROM sales
GROUP BY "Category";

---------------------------------------------------------
-- 5. Total Sales by Region
---------------------------------------------------------

SELECT
    "Region",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Region";

---------------------------------------------------------
-- 6. Total Profit by Region
---------------------------------------------------------

SELECT
    "Region",
    SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Region";

---------------------------------------------------------
-- 7. Sales by Ship Mode
---------------------------------------------------------

SELECT
    "Ship Mode",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Ship Mode";

---------------------------------------------------------
-- 8. Sales by Segment
---------------------------------------------------------

SELECT
    "Segment",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Segment";

---------------------------------------------------------
-- 9. Average Shipping Days by Ship Mode
---------------------------------------------------------

SELECT
    "Ship Mode",
    AVG("Shipping Days") AS Avg_Days
FROM sales
GROUP BY "Ship Mode";

---------------------------------------------------------
-- 10. Categories with Sales greater than 500000
---------------------------------------------------------

SELECT
    "Category",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Category"
HAVING SUM("Sales") > 500000;

---------------------------------------------------------
-- 11. Regions with Profit greater than 100000
---------------------------------------------------------

SELECT
    "Region",
    SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Region"
HAVING SUM("Profit") > 100000;

---------------------------------------------------------
-- 12. States having more than 200 Orders
---------------------------------------------------------

SELECT
    "State",
    COUNT(*) AS Orders
FROM sales
GROUP BY "State"
HAVING COUNT(*) > 200;

---------------------------------------------------------
-- 13. Ship Modes having average shipping time greater than 4 days
---------------------------------------------------------

SELECT
    "Ship Mode",
    AVG("Shipping Days") AS Avg_Days
FROM sales
GROUP BY "Ship Mode"
HAVING AVG("Shipping Days") > 4;

---------------------------------------------------------
-- 14. Customer Segments with average sales above 250
---------------------------------------------------------

SELECT
    "Segment",
    AVG("Sales") AS Avg_Sales
FROM sales
GROUP BY "Segment"
HAVING AVG("Sales") > 250;

---------------------------------------------------------
-- 15. Top Categories by Sales
---------------------------------------------------------

SELECT
    "Category",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Category"
ORDER BY Total_Sales DESC;

---------------------------------------------------------
-- 16. Top States by Profit
---------------------------------------------------------

SELECT
    "State",
    SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "State"
ORDER BY Total_Profit DESC
LIMIT 10;

---------------------------------------------------------
-- 17. Lowest Profit States
---------------------------------------------------------

SELECT
    "State",
    SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "State"
ORDER BY Total_Profit ASC
LIMIT 10;

---------------------------------------------------------
-- 18. Sales by Year
---------------------------------------------------------

SELECT
    "Order Year",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Order Year"
ORDER BY "Order Year";

---------------------------------------------------------
-- 19. Profit by Year
---------------------------------------------------------

SELECT
    "Order Year",
    SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Order Year"
ORDER BY "Order Year";

---------------------------------------------------------
-- 20. Monthly Sales
---------------------------------------------------------

SELECT
    "Order Month",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Order Month";