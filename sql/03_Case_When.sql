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
---------------------------------------------------------
-- 17. Discount Status
---------------------------------------------------------

SELECT
    "Order ID",
    "Discount",

    CASE
        WHEN "Discount" = 0 THEN 'No Discount'
        WHEN "Discount" < 0.20 THEN 'Low'
        WHEN "Discount" < 0.50 THEN 'Medium'
        ELSE 'Heavy'
    END AS Discount_Status

FROM sales;

---------------------------------------------------------
-- 18. Quantity Category
---------------------------------------------------------

SELECT
    "Order ID",
    "Quantity",

    CASE
        WHEN "Quantity" = 1 THEN 'Single Item'
        WHEN "Quantity" BETWEEN 2 AND 4 THEN 'Small Order'
        ELSE 'Bulk Order'
    END AS Quantity_Type

FROM sales;

---------------------------------------------------------
-- 19. Shipping Speed Flag
---------------------------------------------------------

SELECT
    "Order ID",
    "Ship Mode",

    CASE
        WHEN "Ship Mode" = 'Same Day' THEN 'Fastest'
        WHEN "Ship Mode" = 'First Class' THEN 'Fast'
        WHEN "Ship Mode" = 'Second Class' THEN 'Normal'
        ELSE 'Economy'
    END AS Shipping_Class

FROM sales;

---------------------------------------------------------
-- 20. Sales Above Average
---------------------------------------------------------

SELECT
    "Order ID",
    "Sales",

    CASE
        WHEN "Sales" >
        (SELECT AVG("Sales") FROM sales)
        THEN 'Above Average'

        ELSE 'Below Average'
    END AS Sales_Level

FROM sales;

---------------------------------------------------------
-- 21. Profit Above Average
---------------------------------------------------------

SELECT
    "Order ID",
    "Profit",

    CASE
        WHEN "Profit" >
        (SELECT AVG("Profit") FROM sales)
        THEN 'Above Average'

        ELSE 'Below Average'
    END AS Profit_Level

FROM sales;

---------------------------------------------------------
-- 22. Loss Percentage by Region
---------------------------------------------------------

SELECT

"Region",

COUNT(*) AS Total_Orders,

SUM(
CASE
WHEN "Profit" <0 THEN 1
ELSE 0
END
) AS Loss_Orders

FROM sales

GROUP BY "Region";

---------------------------------------------------------
-- 23. Profitable Orders
---------------------------------------------------------

SELECT

SUM(

CASE
WHEN "Profit" >0 THEN 1
ELSE 0
END

) AS Profitable_Orders

FROM sales;

---------------------------------------------------------
-- 24. Total Sales from High Value Orders
---------------------------------------------------------

SELECT

SUM(

CASE

WHEN "Sales">1000 THEN "Sales"

ELSE 0

END

) AS High_Value_Sales

FROM sales;

---------------------------------------------------------
-- 25. Average Profit of Loss Making Orders
---------------------------------------------------------

SELECT

AVG(

CASE

WHEN "Profit"<0 THEN "Profit"

END

)

FROM sales;

---------------------------------------------------------
-- 26. Customer Spending Level
---------------------------------------------------------

SELECT

"Customer Name",

SUM("Sales") AS Total_Sales,

CASE

WHEN SUM("Sales")>20000 THEN 'Diamond'

WHEN SUM("Sales")>10000 THEN 'Platinum'

WHEN SUM("Sales")>5000 THEN 'Gold'

ELSE 'Silver'

END AS Customer_Level

FROM sales

GROUP BY "Customer Name";

---------------------------------------------------------
-- 27. Category Performance
---------------------------------------------------------

SELECT

"Category",

SUM("Profit") AS Profit,

CASE

WHEN SUM("Profit")>50000 THEN 'Excellent'

WHEN SUM("Profit")>20000 THEN 'Good'

WHEN SUM("Profit")>0 THEN 'Average'

ELSE 'Poor'

END AS Performance

FROM sales

GROUP BY "Category";

---------------------------------------------------------
-- 28. Office Supplies Profitability
---------------------------------------------------------

SELECT

"Sub-Category",

SUM("Profit"),

CASE

WHEN SUM("Profit")>10000 THEN 'Star'

WHEN SUM("Profit")>0 THEN 'Normal'

ELSE 'Loss'

END

FROM sales

WHERE "Category"='Office Supplies'

GROUP BY "Sub-Category";

---------------------------------------------------------
-- 29. Order Season
---------------------------------------------------------

SELECT

"Order ID",

"Order Month",

CASE

WHEN "Order Month" IN
('December','January','February')
THEN 'Winter'

WHEN "Order Month" IN
('March','April','May')
THEN 'Spring'

WHEN "Order Month" IN
('June','July','August')
THEN 'Summer'

ELSE 'Autumn'

END AS Season

FROM sales;

---------------------------------------------------------
-- 30. Shipping Delay Alert
---------------------------------------------------------

SELECT

"Order ID",

"Shipping Days",

CASE

WHEN "Shipping Days">7 THEN 'Critical'

WHEN "Shipping Days">5 THEN 'Warning'

ELSE 'On Time'

END

FROM sales;

---------------------------------------------------------
-- 31. High Discount High Profit
---------------------------------------------------------

SELECT

"Order ID",

CASE

WHEN "Discount">0.3
AND "Profit">100

THEN 'Successful Discount'

ELSE 'Normal'

END

FROM sales;

---------------------------------------------------------
-- 32. Loss due to Heavy Discount
---------------------------------------------------------

SELECT

COUNT(

CASE

WHEN "Discount">0.3
AND "Profit"<0

THEN 1

END

)

FROM sales;

---------------------------------------------------------
-- 33. Profit Ratio
---------------------------------------------------------

SELECT

"Order ID",

ROUND(
("Profit"/NULLIF("Sales",0))*100,
2
) AS Profit_Ratio,

CASE

WHEN ("Profit"/NULLIF("Sales",0))*100>20
THEN 'Excellent'

WHEN ("Profit"/NULLIF("Sales",0))*100>10
THEN 'Healthy'

ELSE 'Low'

END

FROM sales;

---------------------------------------------------------
-- 34. Regional Risk
---------------------------------------------------------

SELECT

"Region",

SUM("Profit") AS Profit,

CASE

WHEN SUM("Profit")<0 THEN 'High Risk'

WHEN SUM("Profit")<50000 THEN 'Medium Risk'

ELSE 'Low Risk'

END

FROM sales

GROUP BY "Region";

