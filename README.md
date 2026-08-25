Retail Sales Data Analysis Using SQL
Project Overview

Project Title: Retail Sales Data Analysis
Database: PostgreSQL
Table: retail_sales

This project focuses on analyzing retail sales data using SQL. I used PostgreSQL to clean the data, explore sales information, and answer different business questions.

The project helped me practice SQL concepts such as filtering, grouping, aggregate functions, sorting, CASE WHEN, CTEs, and window functions.

Objectives
Create a retail sales database and table.
Check and clean the sales data.
Explore customers, categories, and transactions.
Analyze sales and customer behavior.
Identify useful business insights from the data.
Database and Data Cleaning

I created a PostgreSQL database and a retail_sales table containing transaction details such as:

Transaction ID
Sale Date
Sale Time
Customer ID
Gender
Age
Product Category
Quantity
Price per Unit
COGS
Total Sale

I checked the dataset for missing or null values and removed incomplete records before performing the analysis.

Sales Analysis
1. Sales on a Specific Date

Retrieved all transactions made on 5 November 2022.

2. Clothing Sales Analysis

Identified clothing transactions where the quantity sold was greater than 4 during November 2022.

3. Sales by Category

Calculated total sales and the number of orders for each product category.

4. Customer Age Analysis

Calculated the average age of customers who purchased products from the Beauty category.

5. High-Value Transactions

Identified transactions where the total sale amount was greater than 1000.

6. Transactions by Gender and Category

Analyzed the number of transactions for each gender across different product categories.

7. Monthly Sales Analysis

Analyzed average sales by month and identified the best-selling month for each year.

8. Top 5 Customers

Identified the top 5 customers based on their total sales amount.

9. Unique Customers by Category

Calculated the number of unique customers who purchased products from each category.

10. Sales by Time Shift

Divided transactions into three shifts:

Morning: Before 12 PM
Afternoon: 12 PM to 5 PM
Evening: After 5 PM

Then analyzed the number of orders in each shift.

Key Findings

Through this analysis, I was able to identify:

Total number of retail transactions.
Number of unique customers.
Sales performance by product category.
Average customer age by category.
High-value transactions.
Transaction distribution by gender.
Best-performing months.
Top customers based on total sales.
Unique customers for each category.
Order patterns across different time shifts.
Skills Used
PostgreSQL
SQL
Data Cleaning
Exploratory Data Analysis
Aggregate Functions
Filtering and Sorting
GROUP BY
CASE WHEN
CTEs
Window Functions
Customer Analysis
Sales Analysis
Conclusion

This project helped me understand how SQL can be used to analyze retail sales data and answer business-related questions.

Through this project, I gained practical experience in data cleaning, sales analysis, customer analysis, and writing SQL queries to extract meaningful insights from data.
