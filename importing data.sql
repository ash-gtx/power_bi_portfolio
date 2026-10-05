use amazon_db;

-- products data
LOAD DATA LOCAL INFILE 'F:/Ashish Work/amazon dataset/products.csv'
INTO TABLE product
FIELDS TERMINATED BY ','  -- Change if your delimiter is different (e.g., ';' or '\t')
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

-- removing data from orders table before reinserting entire data
SET FOREIGN_KEY_CHECKS = 1;
DROP TABLE orders; 

-- orders data
LOAD DATA LOCAL INFILE 'F:/Ashish Work/amazon dataset/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','  -- Change if your delimiter is different (e.g., ';' or '\t')
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- order items data
LOAD DATA LOCAL INFILE 'F:/Ashish Work/amazon dataset/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','  -- Change if your delimiter is different (e.g., ';' or '\t')
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- payments data
LOAD DATA LOCAL INFILE 'F:/Ashish Work/amazon dataset/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','  -- Change if your delimiter is different (e.g., ';' or '\t')
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- shipping data
LOAD DATA LOCAL INFILE 'F:/Ashish Work/amazon dataset/shipping.csv'
INTO TABLE shipping
FIELDS TERMINATED BY ','  -- Change if your delimiter is different (e.g., ';' or '\t')
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- inventory data
LOAD DATA LOCAL INFILE 'F:/Ashish Work/amazon dataset/inventory.csv'
INTO TABLE inventory
FIELDS TERMINATED BY ','  -- Change if your delimiter is different (e.g., ';' or '\t')
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'

IGNORE 1 LINES;