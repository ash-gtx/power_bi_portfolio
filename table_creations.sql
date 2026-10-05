-- Creating Tables for AMAZON Dataset 
use amazon_db;

create TABLE category (
category_id	INT PRIMARY KEY,
category_name VARCHAR(25)
);

create TABLE sellers (
seller_id INT PRIMARY KEY,
seller_name	VARCHAR(20),
origin VARCHAR(8)
);

create TABLE customers (
customer_ID	INT PRIMARY KEY,
first_name VARCHAR(15),
last_name VARCHAR(15),
state VARCHAR(18)
);

create TABLE inventory (
inventory_id INT PRIMARY KEY,
product_id INT, -- FK
stock INT,
warehouse_id INT,
last_stock_date DATE,
CONSTRAINT inventory_fk_product FOREIGN KEY (product_id) REFERENCES Product (product_id)
);

create TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT, -- FK
product_id INT, -- FK
quantity INT,
price_per_unit FLOAT,
CONSTRAINT orderitems_fk_order FOREIGN KEY (order_id) REFERENCES Orders (order_id),
CONSTRAINT orderitems_fk_product FOREIGN KEY (product_id) REFERENCES Product (product_id)
);

create TABLE orders (
order_id INT PRIMARY KEY,	
order_date DATE,
customer_id	INT, -- FK
seller_id INT, -- FK
order_status VARCHAR(15),
CONSTRAINT order_fk_customer FOREIGN KEY (customer_id) REFERENCES Customers (customer_id),
CONSTRAINT order_fk_seller FOREIGN KEY (seller_id) REFERENCES Sellers (seller_id)
);

create TABLE payments (
payment_id INT PRIMARY KEY,
order_id INT, -- FK
payment_date DATE,
payment_status VARCHAR (25),
CONSTRAINT payments_fk_order FOREIGN KEY (order_id) REFERENCES Orders (order_id)
);

create TABLE product (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price FLOAT,
cogs FLOAT,
category_id INT,
CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES Category (category_id)
);

create TABLE shipping(
shipping_id	INT PRIMARY KEY,
order_id INT, -- FK
shipping_date DATE,
return_date	DATE,
shipping_providers VARCHAR(18),
delivery_status VARCHAR(18),
CONSTRAINT shipping_fk_orders FOREIGN KEY (order_id) REFERENCES Orders (order_id)
);

select count(*) from shipping;