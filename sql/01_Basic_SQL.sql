-- =====================================================
-- SQL PRACTICE - SUPERSTORE DATASET
-- =====================================================

-- 1. View first 5 rows
SELECT * FROM sales LIMIT 5;

-- 2. View selected columns
SELECT "Customer Name", "Sales", "Profit"
FROM sales
LIMIT 10;

-- 3. Unique Categories
SELECT DISTINCT "Category"
FROM sales;

-- 4. Unique States
SELECT DISTINCT "State"
FROM sales;

-- 5. Furniture Orders
SELECT *
FROM sales
WHERE "Category" = 'Furniture';

-- 6. Sales > 500
SELECT *
FROM sales
WHERE "Sales" > 500;

-- 7. Profit > 100
SELECT *
FROM sales
WHERE "Profit" > 100;

-- 8. California Orders
SELECT *
FROM sales
WHERE "State" = 'California';

-- 9. AND Condition
SELECT *
FROM sales
WHERE "Category" = 'Furniture'
AND "Sales" > 500;

-- 10. OR Condition
SELECT *
FROM sales
WHERE "Category" = 'Furniture'
OR "Category" = 'Technology';

-- 11. IN
SELECT *
FROM sales
WHERE "Category" IN ('Furniture','Technology');

-- 12. NOT IN
SELECT *
FROM sales
WHERE "Region" NOT IN ('West');

-- 13. BETWEEN
SELECT *
FROM sales
WHERE "Sales" BETWEEN 100 AND 500;

-- 14. LIKE Starts with A
SELECT *
FROM sales
WHERE "Customer Name" LIKE 'A%';

-- 15. LIKE Ends with son
SELECT *
FROM sales
WHERE "Customer Name" LIKE '%son';

-- 16. LIKE Contains John
SELECT *
FROM sales
WHERE "Customer Name" LIKE '%John%';

-- 17. ORDER BY Sales DESC
SELECT *
FROM sales
ORDER BY "Sales" DESC
LIMIT 10;

-- 18. ORDER BY Profit ASC
SELECT *
FROM sales
ORDER BY "Profit" ASC
LIMIT 10;

-- 19. Multiple ORDER BY
SELECT *
FROM sales
ORDER BY "Category", "Sales" DESC
LIMIT 20;

-- 20. Total Rows
SELECT COUNT(*) AS Total_Rows
FROM sales;

-- 21. Total Sales
SELECT SUM("Sales") AS Total_Sales
FROM sales;

-- 22. Average Sales
SELECT AVG("Sales") AS Average_Sales
FROM sales;

-- 23. Maximum Sale
SELECT MAX("Sales") AS Highest_Sale
FROM sales;

-- 24. Minimum Sale
SELECT MIN("Sales") AS Lowest_Sale
FROM sales;

-- 25. Total Profit
SELECT SUM("Profit") AS Total_Profit
FROM sales;

-- 26. Orders per Category
SELECT
    "Category",
    COUNT(*) AS Total_Orders
FROM sales
GROUP BY "Category";

-- 27. Sales by Category
SELECT
    "Category",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "Category"
ORDER BY Total_Sales DESC;

-- 28. Profit by Region
SELECT
    "Region",
    SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Region"
ORDER BY Total_Profit DESC;

-- 29. Average Sales by Ship Mode
SELECT
    "Ship Mode",
    AVG("Sales") AS Avg_Sales
FROM sales
GROUP BY "Ship Mode";

-- 30. Top 10 Customers by Profit
SELECT
    "Customer Name",
    SUM("Profit") AS Total_Profit
FROM sales
GROUP BY "Customer Name"
ORDER BY Total_Profit DESC
LIMIT 10;

-- 31. Top 10 Cities by Sales
SELECT
    "City",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "City"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 32. Top States by Sales
SELECT
    "State",
    SUM("Sales") AS Total_Sales
FROM sales
GROUP BY "State"
ORDER BY Total_Sales DESC;

-- 33. Average Profit by Category
SELECT
    "Category",
    AVG("Profit") AS Avg_Profit
FROM sales
GROUP BY "Category";

-- 34. Biggest Losses
SELECT *
FROM sales
ORDER BY "Profit" ASC
LIMIT 20;

-- 35. Highest Discounts
SELECT *
FROM sales
ORDER BY "Discount" DESC
LIMIT 20;