-- Insert users
INSERT INTO users (username, password_hash, role) VALUES
('alice', 'hashed_pw_1', 'customer'),
('bob', 'hashed_pw_2', 'customer'),
('admin', 'hashed_pw_admin', 'admin');

-- Insert categories
INSERT INTO categories (name) VALUES
('Coffee'),
('Bread'),
('Pastries');

-- Insert menu items
INSERT INTO menu_items (name, description, price, categoryId, stock_quantity) VALUES
('Espresso', 'Strong black coffee', 3.50, 1, 20),
('Latte', 'Coffee with steamed milk', 4.00, 1, 15),
('Baguette', 'Fresh French bread', 2.00, 2, 10),
('Croissant', 'Flaky pastry with butter', 2.50, 3, 8);

-- Insert orders
INSERT INTO orders (user_id, total_amount, preference, status) VALUES
(1, 7.50, 'Dine-in', 'preparing'),
(2, 6.00, 'Takeaway', 'completed');

-- Insert order_items
INSERT INTO order_items (order_id, item_id, quantity, price) VALUES
(1, 1, 1, 3.50),  -- Alice: Espresso
(1, 4, 1, 4.00),  -- Alice: Croissant
(2, 2, 1, 4.00),  -- Bob: Latte
(2, 3, 1, 2.00);  -- Bob: Baguette

-- Insert product views
INSERT INTO product_views (user_id, item_id) VALUES
(1, 2),  -- Alice viewed Latte
(1, 4),  -- Alice viewed Croissant
(2, 1),  -- Bob viewed Espresso
(2, 3);  -- Bob viewed Baguette

-- Insert recommendations
INSERT INTO recommendations (user_id, item_id, score) VALUES
(1, 2, 0.95),  -- Recommend Latte to Alice
(2, 4, 0.90);  -- Recommend Croissant to Bob
