CREATE DATABASE sales_data;
USE sales_data;

CREATE TABLE online_sales (
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

INSERT INTO online_sales VALUES(to_date('2024-01-15'), 1200.00, 101);
INSERT INTO online_sales VALUES(to_date('2024-01-20'), 800.50, 102);
INSERT INTO online_sales VALUES(to_date('2024-02-05'), 450.00, 103);
INSERT INTO online_sales VALUES(to_date('2024-02-28'), 1550.75, 104);
INSERT INTO online_sales VALUES(to_date('2024-03-10'), 600.00, 101);


SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT product_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT product_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;

-- Replace NULLs if necessary
SELECT 
    SUM(COALESCE(amount, 0)) 
FROM online_sales;