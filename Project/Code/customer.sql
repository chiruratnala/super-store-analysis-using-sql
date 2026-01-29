-- Customer analysis
-- top customers by sales and profit
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Customer_ID, Customer_Name
ORDER BY total_sales DESC
LIMIT 10;

-- order frequency per customer
SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore
GROUP BY Customer_ID, Customer_Name
ORDER BY total_orders DESC
limit 10;

-- Segmented customers into one-time and repeat buyers
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS order_count
    FROM superstore
    GROUP BY Customer_ID
) t
GROUP BY customer_type;

-- Evaluated customer segments (Consumer, Corporate, Home Office)
SELECT
    Segment,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT Customer_ID) AS total_customers
FROM superstore
GROUP BY Segment
ORDER BY total_sales DESC;

-- Calculated customer lifetime value (CLV)
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2)  AS lifetime_sales,
    ROUND(SUM(Profit), 2) AS lifetime_profit,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore
GROUP BY Customer_ID, Customer_Name
ORDER BY lifetime_sales DESC
LIMIT 10;
