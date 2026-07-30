/*
=========================================================
03_Case_When.sql
Project: Retail Sales Dashboard
=========================================================
Topics Covered:
1. CASE WHEN
2. Conditional Columns
3. Business Classification
4. Nested CASE Statements
5. CASE with Aggregation
=========================================================
*/

---------------------------------------------------------
-- 1. Classify Orders based on Sales
---------------------------------------------------------

SELECT
    "Order ID",
    "Sales",
    CASE
        WHEN "Sales" < 100 THEN 'Low Sales'
        WHEN "Sales" BETWEEN 100 AND 500 THEN 'Medium Sales'
        ELSE 'High Sales'
    END AS Sales_Category
FROM sales;

---------------------------------------------------------
-- 2. Classify Profit
---------------------------------------------------------

SELECT
    "Order ID",
    "Profit",
    CASE
        WHEN "Profit" < 0 THEN 'Loss'
        WHEN "Profit" = 0 THEN 'No Profit'
        ELSE 'Profit'
    END AS Profit_Status
FROM sales;

---------------------------------------------------------
-- 3. Shipping Performance
---------------------------------------------------------

SELECT
    "Order ID",
    "Shipping Days",
    CASE
        WHEN "Shipping Days" <= 2 THEN 'Fast Delivery'
        WHEN "Shipping Days" <= 5 THEN 'Normal Delivery'
        ELSE 'Delayed Delivery'
    END AS Delivery_Status
FROM sales;

---------------------------------------------------------
-- 4. Customer Type based on Sales
---------------------------------------------------------

SELECT
    "Customer Name",
    SUM("Sales") AS Total_Sales,
    CASE
        WHEN SUM("Sales") > 10000 THEN 'Premium Customer'
        WHEN SUM("Sales") BETWEEN 5000 AND 10000 THEN 'Gold Customer'
        ELSE 'Regular Customer'
    END AS Customer_Type
FROM sales
GROUP BY "Customer Name";

---------------------------------------------------------
-- 5. Discount Category
---------------------------------------------------------

SELECT
    "Discount",
    CASE
        WHEN "Discount" = 0 THEN 'No Discount'
        WHEN "Discount" <= 0.2 THEN 'Low Discount'
        WHEN "Discount" <= 0.5 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS Discount_Category
FROM sales;

---------------------------------------------------------
-- 6. Profit Margin Classification
---------------------------------------------------------

SELECT
    "Sales",
    "Profit",
    ROUND(("Profit"/"Sales")*100,2) AS Profit_Percentage,

    CASE
        WHEN ("Profit"/"Sales")*100 < 0 THEN 'Negative'
        WHEN ("Profit"/"Sales")*100 < 10 THEN 'Low Margin'
        WHEN ("Profit"/"Sales")*100 < 25 THEN 'Healthy Margin'
        ELSE 'Excellent Margin'
    END AS Margin_Status

FROM sales
WHERE "Sales" > 0;

---------------------------------------------------------
-- 7. State Performance
---------------------------------------------------------

SELECT
    "State",
    SUM("Profit") AS Total_Profit,

    CASE
        WHEN SUM("Profit") > 50000 THEN 'Excellent'
        WHEN SUM("Profit") > 20000 THEN 'Good'
        WHEN SUM("Profit") > 0 THEN 'Average'
        ELSE 'Loss Making'
    END AS State_Performance

FROM sales
GROUP BY "State";

---------------------------------------------------------
-- 8. Regional Sales Performance
---------------------------------------------------------

SELECT
    "Region",
    SUM("Sales") AS Total_Sales,

    CASE
        WHEN SUM("Sales") > 700000 THEN 'Top Region'
        WHEN SUM("Sales") > 400000 THEN 'Growing Region'
        ELSE 'Needs Attention'
    END AS Region_Status

FROM sales
GROUP BY "Region";

---------------------------------------------------------
-- 9. Segment Classification
---------------------------------------------------------

SELECT
    "Segment",
    SUM("Sales") AS Total_Sales,

    CASE
        WHEN SUM("Sales") > 1000000 THEN 'Tier 1'
        WHEN SUM("Sales") > 500000 THEN 'Tier 2'
        ELSE 'Tier 3'
    END AS Segment_Level

FROM sales
GROUP BY "Segment";

---------------------------------------------------------
-- 10. Product Profitability
---------------------------------------------------------

SELECT
    "Product Name",
    SUM("Profit") AS Total_Profit,

    CASE
        WHEN SUM("Profit") > 1000 THEN 'Highly Profitable'
        WHEN SUM("Profit") > 0 THEN 'Profitable'
        ELSE 'Loss Product'
    END AS Product_Status

FROM sales
GROUP BY "Product Name";

---------------------------------------------------------
-- 11. Orders Placed on Weekends
---------------------------------------------------------

SELECT
    "Order ID",
    "Order Day",

    CASE
        WHEN "Order Day" IN ('Saturday','Sunday')
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS Order_Type

FROM sales;

---------------------------------------------------------
-- 12. High Discount but Loss
---------------------------------------------------------

SELECT
    "Order ID",
    "Discount",
    "Profit",

    CASE
        WHEN "Discount" >= 0.5
             AND "Profit" < 0
        THEN 'Heavy Discount Loss'

        WHEN "Discount" >= 0.5
        THEN 'Heavy Discount'

        ELSE 'Normal'
    END AS Business_Flag

FROM sales;

---------------------------------------------------------
-- 13. Nested CASE
---------------------------------------------------------

SELECT
    "Order ID",
    "Sales",
    "Profit",

    CASE

        WHEN "Sales" > 1000 THEN

            CASE
                WHEN "Profit" > 100 THEN 'Excellent Order'
                ELSE 'High Sales Low Profit'
            END

        ELSE 'Regular Order'

    END AS Order_Quality

FROM sales;

---------------------------------------------------------
-- 14. Count Loss Orders
---------------------------------------------------------

SELECT

    SUM(

        CASE

            WHEN "Profit" < 0 THEN 1

            ELSE 0

        END

    ) AS Total_Loss_Orders

FROM sales;

---------------------------------------------------------
-- 15. Count High Value Orders
---------------------------------------------------------

SELECT

    SUM(

        CASE

            WHEN "Sales" > 1000 THEN 1

            ELSE 0

        END

    ) AS High_Value_Orders

FROM sales;

---------------------------------------------------------
-- 16. Sales Category Summary
---------------------------------------------------------

SELECT

CASE

WHEN "Sales" <100 THEN 'Low'

WHEN "Sales"<=500 THEN 'Medium'

ELSE 'High'

END AS Sales_Category,

COUNT(*) AS Orders,

SUM("Sales") AS Total_Sales,

AVG("Profit") AS Avg_Profit

FROM sales

GROUP BY Sales_Category

ORDER BY Total_Sales DESC;