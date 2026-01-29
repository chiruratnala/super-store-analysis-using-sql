use sales;
-- Analyzed total sales and profit by discount level
SELECT
    Discount,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore
GROUP BY Discount
ORDER BY Discount;

SELECT
    Discount,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
WHERE Discount >= 0.3
GROUP BY Discount
ORDER BY Discount;

-- Measured average profit per order across discount levels
SELECT
    Discount,
    ROUND(SUM(Profit) / COUNT(DISTINCT Order_ID), 2) AS avg_profit_per_order,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- Identified loss-making discount thresholds
SELECT
    Discount,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore
GROUP BY Discount
HAVING SUM(Profit) < 0
ORDER BY Discount;

SELECT
    Discount,
    ROUND(SUM(Profit) / COUNT(DISTINCT Order_ID), 2) AS avg_profit_per_order
FROM superstore
GROUP BY Discount
HAVING SUM(Profit) < 0
ORDER BY Discount;

-- Evaluated discount impact by product category
SELECT
    Category,
    Discount,
    ROUND(SUM(Profit) / COUNT(DISTINCT Order_ID), 2) AS avg_profit_per_order
FROM superstore
GROUP BY Category, Discount
ORDER BY Category, Discount;

-- Calculated percentage of loss-making orders at each discount
SELECT
    Discount,
    ROUND(
        SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
        2
    ) AS loss_order_percentage
FROM superstore
GROUP BY Discount
ORDER BY Discount;
