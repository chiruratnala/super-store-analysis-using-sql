# 🛒 Retail Sales Analysis using SQL (Superstore Dataset)

[Report-link]: https://thread-roadrunner-2be.notion.site/Superstore-Performance-Analysis-Using-SQL-386e4d184dbf805b86e9eaeca61747cb#386e4d184dbf80b39bc2d773d6ae9058


## 📌 Project Overview

This project analyzes retail sales data using **SQL (MySQL)** to understand sales performance, profitability, customer behavior, discount impact, and seasonal trends. The goal is to extract clear business insights that can support better pricing, customer retention, and sales planning decisions.

---

## 🛠 Tools & Technologies

* **Language:** SQL (MySQL)
* **Environment:** MySQL Workbench
* **Dataset:** Sample Superstore Dataset

---

## 📂 Dataset Description

The dataset contains order-level retail data with the following key attributes:

* **Order Details:** Order ID, Order Date, Ship Date
* **Customer Information:** Customer ID, Customer Name, Segment
* **Product Information:** Category, Sub-Category, Product Name
* **Sales Metrics:** Sales, Profit, Discount

---

## 🔄 Project Workflow

1. **Data Ingestion:** Imported the dataset into MySQL.
2. **Data Cleaning:** Handled duplicates and fixed date formats for time-series analysis.
3. **Exploratory Data Analysis (EDA):** Performed initial queries to understand data distribution.
4. **Deep-Dive Analysis:** Conducted customer, product, discount, and time-based analysis.
5. **Insight Derivation:** Summarized business findings from query results.

---

## 📊 Key Analyses Performed

### 🔹 Sales & Profit Analysis

* Calculated total sales, total profit, and profit margin.
* Analyzed sales and profit distribution across different categories and regions.

### 🔹 Customer Analysis

* Counted total orders and unique customers.
* Identified top-tier customers by sales and profit contribution.
* Segmented customers into **One-time** and **Repeat Buyers**.
* Calculated **Customer Lifetime Value (CLV)**.

### 🔹 Product Analysis

* Identified top-selling products vs. most profitable products.
* Found products with high sales but negative profit ("Loss Leaders").

### 🔹 Discount Analysis

* Analyzed sales and profit by discount level.
* Identified the specific discount thresholds where profitability becomes negative.
* Evaluated how discounts impact different product categories.

### 🔹 Time-Based Analysis

* Analyzed monthly and yearly sales trends.
* Identified seasonal sales patterns and peak periods.

---

## 💡 Key Insights

* **Financials:** Generated **₹2.27M** in total sales with a **12.45%** profit margin.
* **Performance:** **Technology** is the strongest category; the **West and East** regions drive the most revenue.
* **Customers:** A small group of loyal customers contributes significantly to overall profit; repeat customers show higher long-term value.
* **The "Discount Trap":** Discounts above **30%** consistently lead to losses. High sales volume from high discounts does not translate to profit.
* **Seasonality:** Sales are lowest in Q1 and peak toward the end of the year (Q4).

---

## 📈 Sample SQL Query

> **Query Objective:** Identify discount levels that result in a net loss.

```sql
SELECT 
    Discount, 
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Discount
HAVING SUM(Profit) < 0
ORDER BY Discount;

```

---

## 🧠 Business Conclusion

Growth in sales volume is not a direct indicator of success. Profitability is heavily influenced by **discount strategy** and **product mix**. To improve stability, the business should:

1. Cap discounts at 30% for underperforming categories.
2. Focus marketing efforts on the "Technology" category.
3. Implement loyalty programs to nurture repeat buyers.

## 📎 Dataset Source
Sample Superstore Dataset (commonly used for retail analytics practice)
