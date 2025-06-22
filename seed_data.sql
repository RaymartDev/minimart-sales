-- 🚫 Clear tables (respect FK order)
DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM inventory;
DELETE FROM products;
DELETE FROM categories;
DELETE FROM customers;

-- 👥 Customers
INSERT INTO customers (name, email, phone) VALUES
('John Doe', 'john@example.com', '09171234567'),
('Jane Smith', 'jane@example.com', '09181234567'),
('Carlos Santos', 'carlos@example.com', '09191234567'),
('Maria Lopez', 'maria@example.com', '09201234567'),
('Ali Khan', 'ali@example.com', '09211234567'),
('Liza Reyes', 'liza.reyes@example.com', '09231234567'),
('Tommy Cruz', 'tommy.cruz@example.com', '09351234567'),
('Aileen Bautista', 'aileen.b@example.com', '09175554444'),
('Edward Lim', 'edward.lim@example.com', '09265557777'),
('Bea Santiago', 'bea.s@example.com', '09188889999');

-- 📁 Categories
INSERT INTO categories (name) VALUES
('Beverages'),
('Snacks'),
('Household');

-- 📦 Products
INSERT INTO products (name, category_id, price) VALUES
('Coca-Cola 1L', 1, 45.00),
('Pepsi 1L', 1, 42.00),
('Mineral Water 500ml', 1, 20.00),
('Potato Chips', 2, 35.00),
('Chocolate Bar', 2, 25.00),
('Dish Soap', 3, 55.00),
('Toilet Paper (4 rolls)', 3, 60.00),
('Laundry Detergent 1kg', 3, 95.00),
('Iced Tea 500ml', 1, 22.00),
('Gummy Bears', 2, 18.00),
('Paper Towels (2 rolls)', 3, 48.00),
('Bleach 500ml', 3, 45.00),
('Instant Noodles', 2, 12.00);

-- 📦 Inventory Logs
INSERT INTO inventory (product_id, quantity, action, date) VALUES
(1, 100, 'IN', NOW()),
(2, 100, 'IN', NOW()),
(3, 100, 'IN', NOW()),
(4, 50, 'IN', NOW()),
(5, 50, 'IN', NOW()),
(6, 30, 'IN', NOW()),
(7, 30, 'IN', NOW()),
(8, 30, 'IN', NOW()),
(9, 60, 'IN', NOW()),   -- Iced Tea
(10, 80, 'IN', NOW()),  -- Gummy Bears
(11, 40, 'IN', NOW()),  -- Paper Towels
(12, 50, 'IN', NOW()),  -- Bleach
(13, 100, 'IN', NOW()); -- Instant Noodles

-- 🧾 Orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-06-01', 150.00),
(2, '2024-06-02', 75.00),
(3, '2024-06-05', 120.00),
(4, '2024-06-08', 60.00),
(5, '2024-06-10', 90.00),
(1, '2024-06-12', 180.00),
(3, '2024-06-14', 55.00),
(6, '2024-06-15', 85.00),
(7, '2024-06-16', 122.00),
(8, '2024-06-17', 45.00),
(9, '2024-06-18', 55.00),
(10, '2024-06-18', 73.00);

-- 🧾 Order Items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 45.00), -- 90
(1, 4, 1, 35.00), -- 35
(1, 3, 1, 20.00), -- 20

(2, 5, 3, 25.00), -- 75

(3, 2, 2, 42.00), -- 84
(3, 6, 1, 55.00), -- 55

(4, 7, 1, 60.00), -- 60

(5, 3, 2, 20.00), -- 40
(5, 5, 2, 25.00), -- 50

(6, 1, 2, 45.00), -- 90
(6, 8, 1, 95.00), -- 95

(7, 4, 1, 35.00), -- 35
(7, 6, 1, 55.00), -- 55
(8, 9, 2, 22.00),   -- Iced Tea
(8, 5, 1, 25.00),   -- Chocolate

(9, 10, 3, 18.00),  -- Gummy Bears
(9, 3, 1, 20.00),   -- Water

(10, 11, 1, 48.00), -- Paper Towels
(10, 12, 1, 45.00), -- Bleach

(11, 4, 2, 35.00),  -- Chips
(11, 13, 3, 12.00), -- Instant Noodles

(12, 1, 1, 45.00),  -- Coke
(12, 5, 1, 25.00);  -- Chocolate