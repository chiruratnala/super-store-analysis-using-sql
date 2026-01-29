-- data cleaning 
select count(*) from superstore;
-- finding missing values (Null values)
SELECT COUNT(*) AS rows_with_missing_values
 FROM superstore
 WHERE
 Row_ID IS NULL OR
 Order_ID IS NULL OR
 Order_Date IS NULL OR
 Ship_Date IS NULL OR
 Ship_Mode IS NULL OR
 Customer_ID IS NULL OR
 Customer_Name IS NULL OR
 Segment IS NULL OR
 Country IS NULL OR
 City IS NULL OR
 State IS NULL OR
 Postal_Code IS NULL OR
 Region IS NULL OR
 Product_ID IS NULL OR
 Category IS NULL OR
 Sub_Category IS NULL OR
 Product_Name IS NULL OR
 Sales IS NULL OR
 Quantity IS NULL OR
 Discount IS NULL OR
 Profit IS NULL;

-- Converting Date formats  
ALTER TABLE superstore
ADD Order_Date_new DATE,
ADD Ship_Date_new DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE superstore
SET 
    Order_Date_new = STR_TO_DATE(Order_Date, '%m/%d/%Y'),
    Ship_Date_new  = STR_TO_DATE(Ship_Date,  '%m/%d/%Y');

SET SQL_SAFE_UPDATES = 1;
SELECT 
    Order_Date, Order_Date_new,
    Ship_Date,  Ship_Date_new
FROM superstore
LIMIT 10;

ALTER TABLE superstore DROP COLUMN Order_Date;
ALTER TABLE superstore CHANGE Order_Date_new Order_Date DATE;
ALTER TABLE superstore DROP COLUMN Ship_Date;
ALTER TABLE superstore CHANGE Ship_Date_new Ship_Date DATE;

select * from superstore;
-- finding duplicate values 
SELECT
    Row_ID,
    Order_ID,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Postal_Code,
    Region,
    Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    Sales,
    Quantity,
    Discount,
    Profit,
    COUNT(*) AS cnt
FROM superstore
GROUP BY
    Row_ID,
    Order_ID,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Postal_Code,
    Region,
    Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    Sales,
    Quantity,
    Discount,
    Profit
HAVING COUNT(*) > 1;

-- count how many duplicate rows in the dataset 
SELECT SUM(cnt - 1) AS duplicate_rows
FROM (
    SELECT COUNT(*) AS cnt
    FROM superstore
    GROUP BY
        Row_ID,
        Order_ID,
        Order_Date,
        Ship_Date,
        Ship_Mode,
        Customer_ID,
        Customer_Name,
        Segment,
        Country,
        City,
        State,
        Postal_Code,
        Region,
        Product_ID,
        Category,
        Sub_Category,
        Product_Name,
        Sales,
        Quantity,
        Discount,
        Profit
    HAVING COUNT(*) > 1
) t;

SET SQL_SAFE_UPDATES = 0;
-- deleting sales which is below or equal to zero (incorrect data)
DELETE FROM superstore
WHERE Sales <= 0 OR Quantity <= 0;
