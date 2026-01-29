-- Tiime Series analysis 

-- Analyzed monthly sales trends
SELECT
    YEAR(Order_Date) AS year,
    MONTH(Order_Date) AS month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY year, month;

-- Analyzed yearly sales growth
SELECT
    YEAR(Order_Date) AS year,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY YEAR(Order_Date)
ORDER BY year;

-- year over year growth 
SELECT
    year,
    total_sales,
    ROUND(
        (total_sales - LAG(total_sales) OVER (ORDER BY year)) 
        / LAG(total_sales) OVER (ORDER BY year) * 100,
        2
    ) AS yoy_growth_pct
FROM (
    SELECT
        YEAR(Order_Date) AS year,
        SUM(Sales) AS total_sales
    FROM superstore
    GROUP BY YEAR(Order_Date)
) t;

-- seasonal analysis
SELECT
    MONTHNAME(Order_Date) AS month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY MONTH(Order_Date);