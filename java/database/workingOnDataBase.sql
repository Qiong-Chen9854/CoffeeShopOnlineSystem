BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, category, menu_items, orders, order_items, product_views, recommendations;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE category (
	category_id SERIAL,
	name varchar(120) NOT NULL UNIQUE,
	CONSTRAINT PK_category PRIMARY KEY(category_id)
);

CREATE TABLE menu_items (
	item_id SERIAL,
	name varchar(120) NOT NULL UNIQUE,
	description varchar(225),
	price decimal,
	categoryId int,
	stock_quantity int,
	CONSTRAINT PK_menu_items PRIMARY KEY(item_id),
	CONSTRAINT FK_menu_items FOREIGN KEY(categoryId) REFERENCES category(category_id)
);

CREATE TABLE orders (
	order_id SERIAL,
	user_id int,
	total_amount decimal,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	preference varchar(50),
	status varchar(50),
	CONSTRAINT PK_orders PRIMARY KEY(order_id),
	CONSTRAINT FK_orders FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
	order_item_id SERIAL,
	order_id int,
	item_id int,
	quantity int,
	price decimal,
	CONSTRAINT PK_order_items PRIMARY KEY(order_item_id),
	CONSTRAINT FK_order_items_order FOREIGN KEY(order_id) REFERENCES orders(order_id),
	CONSTRAINT FK_order_items_item FOREIGN KEY(item_id) REFERENCES menu_items(item_id)
);

CREATE TABLE product_views (
	view_id SERIAL,
	user_id int,
	item_id int,
	view_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT PK_product_views PRIMARY KEY(view_id),
	CONSTRAINT FK_product_views_user FOREIGN KEY(user_id) REFERENCES users(user_id),
	CONSTRAINT FK_product_views_item FOREIGN KEY(item_id) REFERENCES menu_items(item_id)
);

CREATE TABLE recommendations (
	recommendation_id SERIAL,
	user_id int,
	item_id int,
	score decimal,
	CONSTRAINT PK_recommendations PRIMARY KEY(recommendation_id),
	CONSTRAINT FK_recommendations_user FOREIGN KEY(user_id) REFERENCES users(user_id),
	CONSTRAINT FK_recommendations_item FOREIGN KEY(item_id) REFERENCES menu_items(item_id)	
);

COMMIT TRANSACTION;