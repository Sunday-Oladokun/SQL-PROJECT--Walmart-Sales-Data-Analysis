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
-- -------------- General Questions

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

-- -------------- Product Related Questions
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

-- What
