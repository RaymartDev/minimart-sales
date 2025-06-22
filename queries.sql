-- Total Sales Revenue

SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- Daily Revenue Report

SELECT order_date, SUM(total_amount) AS daily_revenue
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Top 5 Best-Selling Product Report

SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;


-- Customer Lifetime Value

SELECT c.name, SUM(o.total_amount) AS lifetime_value
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY lifetime_value DESC;


-- Average Order Value

SELECT AVG(total_amount) AS average_order_value
FROM orders;


-- Inventory Remaining per Product

SELECT 
    p.name,
    SUM(CASE WHEN i.action = 'IN' THEN i.quantity ELSE 0 END) -
    SUM(CASE WHEN i.action = 'OUT' THEN i.quantity ELSE 0 END) AS current_stock
FROM inventory i
JOIN products p ON i.product_id = p.id
GROUP BY p.name;


-- Most Frequent Customers ( by number of orders )

SELECT c.name, COUNT(o.id) AS total_orders
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_orders DESC;


-- Sales by category

SELECT cat.name AS category, SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
ORDER BY revenue DESC;


-- Products with Low Inventory ( Threshold: 20 units)

SELECT name, 
       SUM(CASE WHEN action = 'IN' THEN quantity ELSE 0 END) -
       SUM(CASE WHEN action = 'OUT' THEN quantity ELSE 0 END) AS current_stock
FROM inventory
JOIN products ON inventory.product_id = products.id
GROUP BY name
HAVING current_stock < 20;

-- Customers who ordered more than once

SELECT c.name, COUNT(o.id) AS orders_count
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING orders_count > 1;


-- Most Popular Product by Total Revenue

SELECT p.name, SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY total_revenue DESC
LIMIT 1;


-- Total Orders and Revenue by Month

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS order_count,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;


-- Top 3 Customers by Order Volume

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;


-- Product Sales Summary Table

SELECT 
    p.name,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.quantity) AS total_units,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY total_revenue DESC;


-- Order Items Breakdown (Joined View)

SELECT 
    o.id AS order_id,
    o.order_date,
    c.name AS customer,
    p.name AS product,
    oi.quantity,
    oi.price,
    (oi.quantity * oi.price) AS total_line_amount
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
ORDER BY o.order_date DESC;
