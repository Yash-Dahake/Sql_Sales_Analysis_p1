--sql sales Analysis-p1

--create table
CREATE TABLE retails_sales
			(
				transactions_id	INT,
				sale_date	DATE,
				sale_time	TIME,
				customer_id	INT,
				gender	VARCHAR(10),
				age	INT,
				category VARCHAR(50),	
				quantiy	INT,
				price_per_unit NUMERIC(10,2),	
				cogs NUMERIC(10,2),	
				total_sale NUMERIC(12,2)
	);
SELECT * FROM retails_sales
limit 10;


SELECT COUNT(*) FROM retails_sales;

SELECT * FROM retails_sales
WHERE transactions_id is null;



SELECT * FROM retails_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
	
DELETE FROM retails_sales
where 
		transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

	
	-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retails_sales

-- How many uniuque customers we have ?

SELECT COUNT(DISTINCT customer_id) as total_sale FROM retails_sales



SELECT DISTINCT category FROM retails_sales;


-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM retails_sales
WHERE sale_date = '2022-11-05';


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT 
  *
FROM retails_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantiy >= 4


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retails_sales
GROUP BY 1

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT
    ROUND(AVG(age), 2 ) as avg_age
FROM retails_sales
WHERE category = 'Beauty'


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM retails_sales
where total_sale>1000


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select category,
		gender,
		count(*) as total_num_of_transactions
FROM retails_sales
group
		by category,
			gender
			ORDER BY 1
			
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
		year,
		month,
		avg_sale
FROM 
(
	select 
		EXTRACT(YEAR FROM sale_date)as year,
		EXTRACT(MONTH FROM sale_date)as month,
		avg(total_sale) as avg_sale,
		Rank() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date)ORDER BY AVG(total_sale) DESC )
	FROM retails_sales
	GROUP BY 1,2
) as T1
where rank=1

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
	customer_id,
	sum(total_sale)as total_sales
FROM retails_sales
group by 1
order by 2 desc
LIMIT 5


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
	category,
	COUNT(DISTINCT customer_id)as UNIQUE_CUST
FROM retails_sales
group by 1


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale
as
(
	SELECT *,
	  case
		WHEN EXTRACT (HOUR FROM sale_time)< 12 THEN 'Morning'
		WHEN EXTRACT (HOUR FROM sale_time)BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	  END AS shift 
	 
	FROM retails_sales
) SELECT 
	shift,
	count(*) as total_orders
	FROM hourly_sale
group by shift