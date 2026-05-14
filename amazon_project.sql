






drop table if exists amazon_sales;
CREATE TABLE amazon_sales (
    order_id INT,
    order_date DATE,
    product_name TEXT,
    category TEXT,
    quantity INT,
    price INT,
    total_amount INT,
    region TEXT,
    payment_method TEXT
);
Select * from amazon_sales;
-- Total revenue generated 
Select sum(total_amount) AS Total_revenue from amazon_sales;
-- Total no. of orders
Select count(order_id) AS Total_orders from amazon_sales;
-- Average order value
SELECT ROUND(AVG(total_amount), 2) AS avg_order_value
FROM amazon_sales ; 
SELECT 
    ROUND(SUM(total_amount) * 1.0 / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM amazon_sales;

-- Total quantity sold
Select sum(quantity) AS Total_Quantites from amazon_sales;
-- List all quantity products
Select Distinct product_name  from amazon_sales  ;
-- Count of orders per region
Select count (order_id) , region from amazon_sales group by region ;
-- Count of orders per payment method
Select count(order_id) , payment_method from amazon_sales group by payment_method;


-- Total revenue by region
Select region ,sum(total_amount) from amazon_sales group by region ;
-- Total revenue by category
Select category, sum(total_amount) from amazon_sales group by category;
-- Top 5 products by revenue
Select product_name, SUM(total_amount) AS Revenue from amazon_sales Group by product_name order by revenue DESC limit 5;
-- Total quantity sold per product 
Select product_name, sum(quantity) AS total_quantity from amazon_sales Group by product_name;
-- Average price per category
Select round(Avg(price),2) AS avg_price , category from amazon_sales group by category ;
-- Revenue by payment method
Select payment_method ,Sum(total_amount) AS revenue  from amazon_sales group by payment_method ;
-- Orders per day 
Select order_date, count(order_id) AS orders from amazon_sales group by order_date order by orders ASC;

-- Monthly revenue trend 
Select Date_Trunc('month',order_date) AS monthly_trend, sum(total_amount) from amazon_sales group by Date_Trunc('month',order_date);
-- Which month has highest sales??
Select Date_Trunc('month',order_date) AS months , Sum(total_amount) AS revenue from amazon_sales group by Date_trunc('month',order_date) order by revenue DESC  LIMIT 1;






