-- sales and profit analysis
use sales;
-- Calculate total sales and total profit & profit margin percentage
SELECT
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin_pct
FROM superstore;


-- Total Orders & Unique Customers
SELECT
    COUNT(DISTINCT Order_ID)    AS total_orders,
    COUNT(DISTINCT Customer_ID) AS total_customers
FROM superstore;

--  sales and profit by category
SELECT
    Category,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;

-- sales and profit by region
SELECT
    Region,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;

-- Top selling products (by sales)  
SELECT
    Product_Name,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY Product_Name
ORDER BY total_sales DESC
LIMIT 10;

-- sub-categories with high losses
SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Sub_Category
ORDER BY total_profit ASC limit 10;

-- insight
-- Sub-category analysis reveals that high sales do not always translate into profitability. Despite strong revenue, Tables and Bookcases are major loss-making sub-categories, indicating issues such as heavy discounting, high costs, or inefficient pricing. On the other hand, Appliances and Furnishings demonstrate healthy profitability, suggesting better margin control. These findings highlight the need to reassess pricing and discount strategies for underperforming sub-categories.

-- Top 10 sub-categories with profit
SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Sub_Category
ORDER BY total_profit Desc limit 10;

--  products with high sales but low or negative profit
SELECT
    Product_Name,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Product_Name
HAVING SUM(Sales) > 10000   
   AND SUM(Profit) <= 0
ORDER BY total_sales DESC;
