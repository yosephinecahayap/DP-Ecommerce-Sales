CREATE TABLE ecommerce_sales (
order_id INTEGER PRIMARY KEY,
order_date DATE,
customer_id INTEGER,
product_category VARCHAR(50),
region VARCHAR(50),
quantity INTEGER,
unit_price NUMERIC(10,2),
discount NUMERIC(5,2),
payment_method VARCHAR(50),
delivery_days INTEGER,
customer_rating NUMERIC(2,1),
revenue NUMERIC(12,2)
)

SELECT * FROM ecommerce_sales LIMIT 10;

SELECT COUNT(*) AS total_rows FROM ecommerce_sales;

SELECT 
COUNT(*) FILTER (WHERE order_id IS NULL) AS order_id_null,
COUNT(*) FILTER (WHERE order_date IS NULL) AS order_date_null,
COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_null,
COUNT(*) FILTER (WHERE product_category IS NULL) AS product_category_null,
COUNT(*) FILTER (WHERE region IS NULL) AS region_null,
COUNT(*) FILTER (WHERE quantity IS NULL) AS quantity_null,
COUNT(*) FILTER (WHERE unit_price IS NULL) AS unit_price_null,
COUNT(*) FILTER (WHERE discount IS NULL) AS discount_null,
COUNT(*) FILTER (WHERE payment_method IS NULL) AS payment_method_null,
COUNT(*) FILTER (WHERE delivery_days IS NULL) AS delivery_days_null,
COUNT(*) FILTER (WHERE customer_rating IS NULL) AS customer_rating_null,
COUNT(*) FILTER (WHERE revenue IS NULL) AS revenue_null
FROM ecommerce_sales;

SELECT order_id, COUNT(*) AS jumlah FROM ecommerce_sales GROUP BY order_id HAVING COUNT(*) > 1;

SELECT 
MIN(order_date) AS tanggal_awal,
MAX(order_date) AS tanggal_akhir
FROM ecommerce_sales;

SELECT DISTINCT product_category FROM ecommerce_sales ORDER BY product_category;

SELECT DISTINCT region FROM ecommerce_sales ORDER BY region;

SELECT * FROM ecommerce_sales
WHERE quantity <= 0
OR unit_price < 0
OR discount < 0
OR discount > 1
OR delivery_days < 0
OR customer_rating < 0
OR customer_rating > 5
OR revenue < 0;

SELECT 
order_id, 
quantity, 
unit_price, 
discount, 
revenue, 
ROUND(quantity * unit_price * (1 - discount), 2) AS calculated_revenue
FROM ecommerce_sales
WHERE revenue <> ROUND(quantity * unit_price * (1 - discount), 2)
LIMIT 20;

SELECT
MIN(revenue - ROUND(quantity * unit_price * (1 - discount), 2)) AS min_difference,
MAX(revenue - ROUND(quantity * unit_price * (1 - discount), 2)) AS max_difference,
AVG(revenue - ROUND(quantity * unit_price * (1 - discount), 2)) AS avg_difference
FROM ecommerce_sales;

SELECT 
MIN(quantity) AS min_quantity,
MAX(quantity) AS max_quantity,
AVG(quantity) AS avg_quantity,
MIN(unit_price) AS min_unit_price,
MAX(unit_price) AS max_unit_price,
MIN(discount) AS min_discount,
MAX(discount) AS max_discount,
MIN(revenue) AS min_revenue,
MAX(revenue) AS max_revenue
FROM ecommerce_sales;

SELECT product_category,
COUNT(*) AS total_transactions,
SUM(revenue) AS total_revenue,
AVG(revenue) AS avg_revenue
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

SELECT region,
COUNT(*) AS total_transactions,
SUM(revenue) AS total_revenue,
AVG(revenue) AS avg_revenue
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC;

SELECT discount,
COUNT(*) AS total_transactions,
SUM(revenue) AS total_revenue,
AVG(revenue) AS avg_revenue
FROM ecommerce_sales
GROUP BY discount
ORDER BY discount DESC;

SELECT 
CORR(quantity, revenue) AS corr_quantity_revenue,
CORR(unit_price, revenue) AS corr_unit_price_revenue,
CORR(discount, revenue) AS corr_discount_revenue
FROM ecommerce_sales;

SELECT payment_method,
COUNT(*) AS total_transactions,
SUM(revenue) AS total_revenue,
AVG(revenue) AS avg_revenue
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_revenue DESC;

SELECT delivery_days,
COUNT(*) AS total_orders,
ROUND(AVG(customer_rating), 2) AS avg_rating
FROM ecommerce_sales
GROUP BY delivery_days
ORDER BY delivery_days;

SELECT 
ROUND(CORR(delivery_days, customer_rating)::numeric, 3) AS corr_delivery_rating
FROM ecommerce_sales;

SELECT
EXTRACT(YEAR FROM order_date) AS year,
COUNT(*) AS total_orders,
SUM(revenue) AS total_revenue,
ROUND(AVG(revenue), 2) AS avg_revenue
FROM ecommerce_sales
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY year;

SELECT 
COUNT(*) AS total_rows,
COUNT(DISTINCT order_date) AS unique_dates,
COUNT(DISTINCT order_id) AS unique_orders,
MIN(order_date) AS min_date,
MAX(order_date) AS max_date
FROM ecommerce_sales;

WITH date_check AS (
SELECT order_date,
LAG(order_date) OVER (ORDER BY order_date) AS prev_date
FROM ecommerce_sales
)
SELECT prev_date, order_date, order_date - prev_date AS gap
FROM date_check
WHERE prev_date IS NOT NULL
AND order_date > prev_date + INTERVAL '1 day'
ORDER BY order_date;

SELECT DATE_TRUNC('month', order_date):: date AS month,
COUNT(*) AS total_orders,
ROUND(SUM(revenue), 2) AS total_revenue,
ROUND(AVG(revenue), 2) AS avg_revenue
FROM ecommerce_sales
GROUP BY 1
ORDER BY 1;

SELECT 
EXTRACT(MONTH FROM order_date) AS month_number,
TO_CHAR(order_date, 'Month') AS month_name,
COUNT(*) AS total_orders,
ROUND(SUM(revenue),2) AS total_revenue,
ROUND(AVG(revenue),2) AS avg_revenue
FROM ecommerce_sales
GROUP BY 
EXTRACT(MONTH FROM order_date),
TO_CHAR(order_date, 'Month')
ORDER BY month_number;

SELECT 
COUNT(DISTINCT customer_id) AS unique_customers,
COUNT(*) AS total_orders,
ROUND(
COUNT(*)::numeric / COUNT (DISTINCT customer_id),2
) AS avg_orders_per_customer
FROM ecommerce_sales;

SELECT CASE
WHEN order_count = 1 THEN 'One Time Customer'
ELSE 'Repeat Customer'
END AS customer_type,
COUNT(*) AS total_customers,
SUM(order_count) AS total_orders
FROM(
SELECT customer_id,
COUNT(*) AS order_count
FROM ecommerce_sales
GROUP BY customer_id
) AS customer_orders
GROUP BY customer_type
ORDER BY total_customers DESC;

SELECT customer_id,
COUNT(*) AS total_orders,
ROUND(SUM(revenue), 2) as total_revenue,
ROUND(AVG(revenue), 2) as avg_order_value
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;