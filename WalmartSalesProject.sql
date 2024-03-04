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

-- ---------- Feature Engineering ------------------

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

