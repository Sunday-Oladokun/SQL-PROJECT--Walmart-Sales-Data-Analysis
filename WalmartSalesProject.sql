-- Create a database for Walmart Sales Data and check if it does not already exist
CREATE DATABASE IF NOT EXISTS WalmartSalesData;

-- Create a table inside the database since it has been set as the default schema
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(35) NOT NULL PRIMARY KEY,
    branch VARCHAR(10) NOT NULL,
    city VARCHAR(35) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(8) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6, 4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cost_goods DECIMAL(10,2) NOT NULL,
    gross_margin_percent FLOAT(11,9),
    gross_income DECIMAL(12, 4) NOT NULL,
    rating FLOAT(2,1)
);

-- Upon loading data into the table already created, I discovered that the gender column is not actually designated with 'M' or 'F' so I had to alter it so it could take gender as 'Female' or 'Male'
ALTER TABLE sales
MODIFY COLUMN gender VARCHAR(8) NOT NULL;

SELECT * FROM walmartsalesdata.sales;

-- ---------- FEATURE ENGINEERING ------------------

-- Creating data for time of the day
SELECT 
    time,
    (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of_day
FROM sales;

-- Create column to take the data: time of the day data
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- Insert the time of date data into the column
UPDATE sales
SET time_of_day = (
	CASE
			WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
			WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
			ELSE 'Evening'
	END
);

-- Insert the day of the week as weekday
SELECT
	date, DAYNAME(date) AS weekday
    FROM sales;
    
ALTER TABLE sales
ADD COLUMN weekday VARCHAR(10);

UPDATE sales
SET weekday = DAYNAME(date);

-- Insert the month column as month
SELECT date,
	MONTHNAME(date) AS month
    FROM sales;
    
ALTER TABLE sales
ADD COLUMN month VARCHAR(10);

UPDATE sales
SET MONTH = MONTHNAME(date);

-- ---------------------- EXPLORATORY DATA ANALYSIS -----------------------------------------
-- -------------- General Questions ------------------------------

-- How many unique cities and branches does the data contain?
SELECT
	DISTINCT city
FROM sales;
    
SELECT
	DISTINCT branch
FROM sales;

-- In what branch are the unique cities located
SELECT 
	DISTINCT city, branch
FROM sales;

-- -------------- Product Related Questions --------------------------
-- Unique product lines the business operates and the count
SELECT
	DISTINCT product_line
FROM sales

SELECT
	COUNT(DISTINCT product_line)
FROM sales;

-- Number of payments made via and Most used payment method in descending order
SELECT COUNT(payment_method)
FROM sales;

SELECT payment_method, COUNT(payment_method) AS pay_count
FROM sales
GROUP BY payment_method
ORDER BY pay_count DESC;

-- The product line that sells the most
SELECT product_line, COUNT(product_line) AS product_count
FROM sales
GROUP BY product_line
ORDER BY product_count DESC;

-- Total revenue by month
SELECT month AS month,
	SUM(total) AS total_revenue
FROM sales
GROUP BY month
ORDER BY total_revenue DESC;

-- Which month has the highest cost of goods sold
SELECT month, SUM(cost_goods) AS cost_goods
FROM sales
GROUP BY month
ORDER BY cost_goods DESC
LIMIT 1;

-- Product line with the most revenue
SELECT product_line, SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC
LIMIT 1;

-- What is the city with the largest revenue?
SELECT city, SUM(total) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 1;

-- Product line with the higest Tax Payment (VAT)
-- We are using the average(AVG) value to calculate the tax as they vary from product to product. If it was a constant, we could use SUM
SELECT product_line, AVG(VAT) AS avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC
LIMIT 1;

-- Branch that sold more products compared to average product sold
SELECT branch, SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales)
ORDER BY qty DESC;

-- Most popular product line by gender
SELECT product_line, gender, COUNT(gender) AS gender
FROM sales
GROUP BY product_line, gender
ORDER BY gender DESC;

-- Average rating of each product line
SELECT ROUND(AVG(rating), 2) AS average_rating, product_line
FROM sales
GROUP BY product_line
ORDER BY average_rating DESC;

-- -------------- Sales Related Questions ------------------------------
-- Number of sales each time of the day per weekday
-- First approach where you can use WHERE and extract each of the day's information by entering the day
SELECT time_of_day, COUNT(*) AS total_sales
FROM sales
WHERE weekday = "Monday"
GROUP BY time_of_day
ORDER BY total_sales DESC;

-- Second method which returns all of the results at once for each of the days
SELECT weekday, time_of_day, COUNT(*) AS total_sales
FROM sales
GROUP BY weekday, time_of_day
ORDER BY weekday, total_sales DESC;
